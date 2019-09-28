using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace CourseRegistrationSystem
{
    public partial class CourseRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentCourseRegistration.aspx", false);

        }

        protected void btnRoster_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentRoster.aspx", false);

        }

        protected void btnStudentLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentLogin.aspx", false);

        }

        protected void btnSearchCourses_Click(object sender, EventArgs e)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "StudentSearchCourses";
            gvSearchCourses.Visible = true;
            objCommand.Parameters.AddWithValue("@departmentID", Convert.ToInt32(ddlDepartment.SelectedValue));
            objCommand.Parameters.AddWithValue("@semesterID", Convert.ToInt32(ddlSemester.SelectedValue));
            gvSearchCourses.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvSearchCourses.DataBind();
        }

        protected void btnSearchRegister_Click(object sender, EventArgs e)
        {
            int student = Convert.ToInt32(Session["StudentID"].ToString());
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "StudentSearchToRegister";
            gvSearchRegister.Visible = true;
            objCommand.Parameters.AddWithValue("@studentID", student);
            objCommand.Parameters.AddWithValue("@department", Convert.ToInt32(ddlDepartmentRegister.SelectedValue));
            objCommand.Parameters.AddWithValue("@daycode", ddlDayCode.SelectedValue);
            gvSearchRegister.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvSearchRegister.DataBind();
            btnRegister.Visible = true;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            int student = Convert.ToInt32(Session["StudentID"].ToString());
            CheckBox CBox = new CheckBox();
            for (int i = 0; i < gvSearchRegister.Rows.Count; i++)
            {
                CBox = (CheckBox)gvSearchRegister.Rows[i].FindControl("chkSelected");
                if (CBox.Checked)
                {
                    DBConnect objDB = new DBConnect();
                    SqlCommand objCommand = new SqlCommand();
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "StudentCheckPrerequisite";
                    int course = Convert.ToInt32(gvSearchRegister.DataKeys[i].Values["CourseID"]);
                    student = Convert.ToInt32(Session["StudentID"].ToString());
                    objCommand.Parameters.AddWithValue("@courseID", course);
                    objCommand.Parameters.AddWithValue("@studentID", student);
                    try
                    {
                        int returnValue = Convert.ToInt32(objDB.GetDataSetUsingCmdObj(objCommand).Tables[0].Rows[0]["CourseID"]);
                        if (returnValue != 0)
                        {
                            lblRegisterMessage.Text = "Prerequisite met for " + gvSearchRegister.Rows[i].Cells[3].Text;
                        }
                    }
                    catch (IndexOutOfRangeException)
                    {
                        lblRegisterMessage.Text = "Prerequisite not met for " + gvSearchRegister.Rows[i].Cells[3].Text;
                        return;
                    }
                    objDB = new DBConnect();
                    objCommand = new SqlCommand();
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "StudentCheckAlreadyRegisteredCourse";
                    course = Convert.ToInt32(gvSearchRegister.DataKeys[i].Values["CourseID"]);
                    int section = Convert.ToInt32(gvSearchRegister.DataKeys[i].Values["CourseID"]);
                    student = Convert.ToInt32(Session["StudentID"].ToString());
                    objCommand.Parameters.AddWithValue("@courseID", course);
                    objCommand.Parameters.AddWithValue("@studentID", student);
                    objCommand.Parameters.AddWithValue("@sectionID", section);
                    try
                    {
                        int returnValue = Convert.ToInt32(objDB.GetDataSetUsingCmdObj(objCommand).Tables[0].Rows[0]["RegistrationID"]);
                        if (returnValue != 0)
                        {
                            lblRegisterMessage.Text = "Already registered in a different section for " + gvSearchRegister.Rows[i].Cells[3].Text;
                            return;
                        }
                    }
                    catch (IndexOutOfRangeException)
                    {
                        lblRegisterMessage.Text = "";
                    }
                    objDB = new DBConnect();
                    objCommand = new SqlCommand();
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "StudentRegistrationCheckTimeConflict";
                    student = Convert.ToInt32(Session["StudentID"].ToString());
                    section = Convert.ToInt32(gvSearchRegister.DataKeys[i].Values["CourseID"]);
                    string dayCode = gvSearchRegister.DataKeys[i].Values["DayCode"].ToString();
                    string timeInterval = gvSearchRegister.DataKeys[i].Values["TimeInterval"].ToString();
                    objCommand.Parameters.AddWithValue("@studentID", student);
                    objCommand.Parameters.AddWithValue("@sectionID", section);
                    objCommand.Parameters.AddWithValue("@daycode", dayCode);
                    objCommand.Parameters.AddWithValue("@timeInterval", timeInterval);
                    try
                    {
                        int returnValue = Convert.ToInt32(objDB.GetDataSetUsingCmdObj(objCommand).Tables[0].Rows[0]["SectionID"]);
                        if (returnValue != 0)
                        {
                            lblRegisterMessage.Text = "Time Conflict for " + gvSearchRegister.Rows[i].Cells[3].Text;
                            return;
                        }
                    }
                    catch (IndexOutOfRangeException)
                    {
                        lblRegisterMessage.Text = "";
                    }
                    objDB = new DBConnect();
                    objCommand = new SqlCommand();
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "StudentRegisterCourse";
                    section = Convert.ToInt32(gvSearchRegister.DataKeys[i].Values["SectionID"]);
                    objCommand.Parameters.AddWithValue("@studentID", student);
                    objCommand.Parameters.AddWithValue("@courseID", course);
                    objCommand.Parameters.AddWithValue("@sectionID", section);
                    if (objDB.DoUpdateUsingCmdObj(objCommand) == -1)
                    {
                        lblRegisterMessage.Text = "Course registration for " + gvSearchRegister.Rows[i].Cells[3].Text + " unsuccessful.";
                        return;
                    }
                    else
                    {
                        lblRegisterMessage.Text = "Course registration for " + gvSearchRegister.Rows[i].Cells[3].Text + " successful.";
                    }
                    objDB = new DBConnect();
                    objCommand = new SqlCommand();
                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "StudentUpdateTuition";
                    objCommand.Parameters.AddWithValue("@studentID", student);
                    if (objDB.DoUpdateUsingCmdObj(objCommand) == -1)
                    {
                        lblRegisterMessage.Text = "Tuition calculation failed";
                        return;
                    }
                    else
                    {
                        lblRegisterMessage.Text = "Tuition calculation success.";
                    }
                }
            }
            DBConnect objDB2 = new DBConnect();
            SqlCommand objCommand2 = new SqlCommand();
            objCommand2.CommandType = CommandType.StoredProcedure;
            objCommand2.CommandText = "StudentSearchToRegister";
            gvSearchRegister.Visible = true;
            objCommand2.Parameters.AddWithValue("@studentID", student);
            objCommand2.Parameters.AddWithValue("@department", Convert.ToInt32(ddlDepartmentRegister.SelectedValue));
            objCommand2.Parameters.AddWithValue("@daycode", ddlDayCode.SelectedValue);
            gvSearchRegister.DataSource = objDB2.GetDataSetUsingCmdObj(objCommand2);
            gvSearchRegister.DataBind();
            btnRegister.Visible = true;
        }

        protected void gvSearchRegister_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Normal) == 0)
                {
                    DataRowView dr = e.Row.DataItem as DataRowView;
                    if (Convert.ToInt32(e.Row.Cells[5].Text) == 0)
                    {
                        e.Row.FindControl("chkSelected").Visible = false;
                        Label lbl = (Label)e.Row.FindControl("lblOpenOrClosed");
                        lbl.Text = "Closed";
                    }
                }
            }
        }
        protected void gvSearchRegister_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Insert);
                TableCell HeaderCell = new TableCell();
                DBConnect objDB = new DBConnect();
                SqlCommand objCommand = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "StudentGetName";
                int student = Convert.ToInt32(Session["StudentID"].ToString());
                objCommand.Parameters.AddWithValue("@studentID", student);
                DataSet ds = objDB.GetDataSetUsingCmdObj(objCommand);
                HeaderCell.Text = ds.Tables[0].Rows[0]["StudentName"].ToString();
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = ds.Tables[0].Rows[0]["DepartmentName"].ToString();
                HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                gvSearchRegister.Controls[0].Controls.AddAt(0, HeaderGridRow);

            }
        }
    }
}