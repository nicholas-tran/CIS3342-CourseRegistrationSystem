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
    public partial class ModifySection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateCourseForAddSection";
            ddlSelectCourse.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            ddlSelectCourse.DataValueField = "CourseID";
            ddlSelectCourse.DataTextField = "CourseDescription";
            ddlSelectCourse.DataBind();

            objDB = new DBConnect();
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateCourseForAddSection";
            ddlSelectCourseAdd.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            ddlSelectCourseAdd.DataValueField = "CourseID";
            ddlSelectCourseAdd.DataTextField = "CourseDescription";
            ddlSelectCourseAdd.DataBind();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);

        }
        protected void btnManageStudent_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyStudent.aspx", false);

        }

        protected void btnManageCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyCourse.aspx", false);

        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx", false);
        }

        protected void btnManageSection_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifySection.aspx", false);
        }

        protected void btnManagePrerequisite_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyPrerequisite.aspx", false);
        }

        protected void btnBeginModifySection_Click(object sender, EventArgs e)
        {
            gvSections.Visible = true;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateSectionsFromSelectedCourse";
            objCommand.Parameters.AddWithValue("@courseID", ddlSelectCourse.SelectedValue);
            gvSections.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvSections.DataBind();
        }

        protected void gvSections_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSections.EditIndex = e.NewEditIndex;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateSectionsFromSelectedCourse";
            objCommand.Parameters.AddWithValue("@courseID", ddlSelectCourse.SelectedValue);
            gvSections.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvSections.DataBind();
        }

        protected void gvSections_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            GridViewRow row = (GridViewRow)gvSections.Rows[e.RowIndex];
            string sectionID = row.Cells[0].Text;
            DropDownList ddlDayCode = (DropDownList)row.Cells[3].Controls[1];
            DropDownList ddlTimeInterval = (DropDownList)row.Cells[4].Controls[1];
            DropDownList ddlProfessor = (DropDownList)row.Cells[5].Controls[1];
            DropDownList ddlSemester = (DropDownList)row.Cells[7].Controls[1];

            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminUpdateSection";
            objCommand.Parameters.AddWithValue("@sectionID", sectionID);
            objCommand.Parameters.AddWithValue("@dayCode", ddlDayCode.SelectedValue);
            objCommand.Parameters.AddWithValue("@timeInterval", ddlTimeInterval.SelectedValue);
            objCommand.Parameters.AddWithValue("@professorID", ddlProfessor.SelectedValue);
            objCommand.Parameters.AddWithValue("@SemesterID", ddlSemester.SelectedValue);
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
            if (returnValue == -1)
            {
                lblModifySectionMessage.Text = "An error has occurred.";
                return;
            }

            gvSections.EditIndex = -1;
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateSectionsFromSelectedCourse";
            objCommand.Parameters.AddWithValue("@courseID", ddlSelectCourse.SelectedValue);
            gvSections.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvSections.DataBind();
        }

        protected void gvSections_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            GridViewRow row = (GridViewRow)gvSections.Rows[e.RowIndex];
            string courseID = ddlSelectCourse.SelectedValue;
            string sectionID = row.Cells[0].Text;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminDeleteSection";
            objCommand.Parameters.AddWithValue("@courseID", courseID);
            objCommand.Parameters.AddWithValue("@sectionID", sectionID);
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
            if (returnValue == -1)
            {
                lblModifySectionMessage.Text = "An error has occurred.";
                return;
            }
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateSectionsFromSelectedCourse";
            objCommand.Parameters.AddWithValue("@courseID", ddlSelectCourse.SelectedValue);
            gvSections.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvSections.DataBind();
        }

        protected void gvSections_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSections.EditIndex = -1;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateSectionsFromSelectedCourse";
            objCommand.Parameters.AddWithValue("@courseID", ddlSelectCourse.SelectedValue);
            gvSections.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvSections.DataBind();
        }

        protected void gvSections_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DBConnect objDB = new DBConnect();
                    SqlCommand objCommand = new SqlCommand();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "AdminGetDayCode";
                    DropDownList ddList = (DropDownList)e.Row.FindControl("ddlDayCode");
                    ddList.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                    ddList.DataTextField = "DayCode";
                    ddList.DataValueField = "DayCode";
                    ddList.DataBind();
                    DataRowView dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["DayCode"].ToString();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "AdminGetTimeInterval";
                    ddList = (DropDownList)e.Row.FindControl("ddlTimeInterval");
                    ddList.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                    ddList.DataTextField = "TimeInterval";
                    ddList.DataValueField = "TimeInterval";
                    ddList.DataBind();
                    dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["TimeInterval"].ToString();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "AdminGetProfessorID";
                    ddList = (DropDownList)e.Row.FindControl("ddlProfessorID");
                    ddList.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                    ddList.DataTextField = "ProfessorName";
                    ddList.DataValueField = "ProfessorID";
                    ddList.DataBind();
                    dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["ProfessorID"].ToString();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "AdminGetSemesterID";
                    ddList = (DropDownList)e.Row.FindControl("ddlSemesterID");
                    ddList.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                    ddList.DataTextField = "SemesterDescription";
                    ddList.DataValueField = "SemesterID";
                    ddList.DataBind();
                    dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["SemesterID"].ToString();
                }
            }
        }

        protected void btnCreateSection_Click(object sender, EventArgs e)
        {
            tblCreateSection.Visible = true;
            btnCreateSection.Visible = false;
            ddlSelectCourseAdd.Visible = false;
        }

        protected void btnCreateSectionEnd_Click(object sender, EventArgs e)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            int isNum;
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminCreateSection";
            objCommand.Parameters.AddWithValue("@courseID", ddlSelectCourseAdd.SelectedValue);
            objCommand.Parameters.AddWithValue("@dayCode", ddlAddDayCode.SelectedValue);
            objCommand.Parameters.AddWithValue("@timeInterval", ddlAddTime.SelectedValue);
            objCommand.Parameters.AddWithValue("@professorID", ddlAddProfessor.SelectedValue);
            if (int.TryParse(txtAddCRN.Text, out isNum) == false)
            {
                lblCreateSectionMessage.Text = "CRN is not a number.";
                return;
            }
            objCommand.Parameters.AddWithValue("@CRN", txtAddCRN.Text);
            objCommand.Parameters.AddWithValue("@semesterID", ddlAddSemesterID.SelectedValue);
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
            if (returnValue == -1)
            {
                lblCreateSectionMessage.Text = "Error occurred while creating section.";
                return;
            }
            else
            {
                lblCreateSectionMessage.Text = "Section successfully added.";
                objCommand = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "AdminGenerateSectionsFromSelectedCourse";
                objCommand.Parameters.AddWithValue("@courseID", ddlSelectCourse.SelectedValue);
                gvSections.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                gvSections.DataBind();
                btnCreateSection.Visible = true;
                ddlSelectCourseAdd.Visible = true;
                ddlAddDayCode.SelectedIndex = 0;
                ddlAddTime.SelectedIndex = 0;
                ddlAddProfessor.SelectedIndex = 0;
                txtAddCRN.Text = "";
                ddlAddSemesterID.SelectedIndex = 0;
                tblCreateSection.Visible = false;
                return;
            }
        }
        protected void btnCancelSection_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifySection.aspx");
        }
    }
}