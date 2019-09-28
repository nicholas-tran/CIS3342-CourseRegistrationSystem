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
    public partial class ModifyCourses : System.Web.UI.Page
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

        protected void btnBeginModifyCourse_Click(object sender, EventArgs e)
        {
            gvCourses.Visible = true;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminRetrieveCourse";
            gvCourses.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvCourses.DataBind();
        }

        protected void gvCourses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCourses.EditIndex = e.NewEditIndex;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminRetrieveCourse";
            gvCourses.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvCourses.DataBind();
        }

        protected void gvCourses_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int isNum;
            int rowIndex = e.RowIndex;
            GridViewRow row = (GridViewRow)gvCourses.Rows[e.RowIndex];
            string courseID = row.Cells[0].Text;
            TextBox courseTitle = (TextBox)row.Cells[1].Controls[0];
            if (int.TryParse(courseTitle.Text, out isNum) == false)
            {
                lblModifyCourseMessage.Text = "Course Title is not a number.";
                return;
            }
            DropDownList ddlCreditHours = (DropDownList)row.Cells[2].Controls[1];
            DropDownList ddlDepartmentID = (DropDownList)row.Cells[3].Controls[1];
            TextBox courseDescription = (TextBox)row.Cells[4].Controls[0];

            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminUpdateCourse";
            objCommand.Parameters.AddWithValue("@courseID", courseID);
            objCommand.Parameters.AddWithValue("@courseTitle", courseTitle.Text);
            objCommand.Parameters.AddWithValue("@creditHours", ddlCreditHours.SelectedValue);
            objCommand.Parameters.AddWithValue("@departmentID", ddlDepartmentID.SelectedValue);
            objCommand.Parameters.AddWithValue("@courseDescription", courseDescription.Text);
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
            if (returnValue == -1)
            {
                lblModifyCourseMessage.Text = "An error has occurred.";
                return;
            }
            gvCourses.EditIndex = -1;
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminRetrieveCourse";
            gvCourses.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvCourses.DataBind();
        }

        protected void gvCourses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            GridViewRow row = (GridViewRow)gvCourses.Rows[e.RowIndex];
            string courseID = row.Cells[0].Text;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminDeleteCourse";
            objCommand.Parameters.AddWithValue("@courseID", courseID);
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
            if (returnValue == -1)
            {
                lblModifyCourseMessage.Text = "An error has occurred.";
                return;
            }
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminRetrieveCourse";
            gvCourses.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvCourses.DataBind();
        }

        protected void gvCourses_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCourses.EditIndex = -1;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminRetrieveCourse";
            gvCourses.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvCourses.DataBind();
        }

        protected void gvCourses_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if ((e.Row.RowState & DataControlRowState.Edit) > 0)
                {
                    DBConnect objDB = new DBConnect();
                    SqlCommand objCommand = new SqlCommand();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "AdminGetCreditHours";
                    DropDownList ddList = (DropDownList)e.Row.FindControl("ddlCreditHours");
                    ddList.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                    ddList.DataTextField = "CreditHours";
                    ddList.DataValueField = "CreditHours";
                    ddList.DataBind();
                    DataRowView dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["CreditHours"].ToString();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "AdminGetDepartmentID";
                    ddList = (DropDownList)e.Row.FindControl("ddlDepartmentID");
                    ddList.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                    ddList.DataTextField = "DepartmentID";
                    ddList.DataValueField = "DepartmentID";
                    ddList.DataBind();
                    dr = e.Row.DataItem as DataRowView;
                    ddList.SelectedValue = dr["DepartmentID"].ToString();
                }
            }
        }
        protected void btnCreateCourse_Click(object sender, EventArgs e)
        {
            tblCreateCourse.Visible = true;
            btnCreateCourse.Visible = false;
        }

        protected void btnCreateCourseEnd_Click(object sender, EventArgs e)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminCreateCourse";
            int isNum = 0;
            if(int.TryParse(txtAddCourseTitle.Text, out isNum) == false)
            {
                lblCreateCourseMessage.Text = "Must be only integers.";
                lblCreateCourseMessage.Focus();
                return;
            }
            objCommand.Parameters.AddWithValue("@courseTitle", txtAddCourseTitle.Text);
            objCommand.Parameters.AddWithValue("@creditHours", ddlAddCreditHours.SelectedValue);
            objCommand.Parameters.AddWithValue("@departmentID", ddlAddDepartmentID.SelectedValue);
            objCommand.Parameters.AddWithValue("@courseDescription", txtAddCourseDescription.Text);
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
            if (returnValue == -1)
            {
                lblCreateCourseMessage.Text = "Error occurred while creating course.";
                return;
            }
            else
            {
                lblCreateCourseMessage.Text = "Course successfully added.";
                gvCourses.Visible = true;
                objDB = new DBConnect();
                objCommand = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "AdminRetrieveCourse";
                gvCourses.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                gvCourses.DataBind();
                tblCreateCourse.Visible = false;
                txtAddCourseTitle.Text = "";
                ddlAddCreditHours.SelectedIndex = 0;
                ddlAddDepartmentID.SelectedIndex = 0;
                txtAddCourseDescription.Text = "";
                lblCreateCourseMessage.Text = "";
                btnCreateCourse.Visible = true;
                return;
            }
        }
        protected void btnCancelCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyCourse.aspx");
        }
    }     
}