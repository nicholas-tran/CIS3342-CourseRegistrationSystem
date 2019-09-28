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
    public partial class ModifyPrerequisite : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateCourseForAddPrequisite";
            ddlSelectCoursePrerequisite.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            ddlSelectCoursePrerequisite.DataValueField = "CourseID";
            ddlSelectCoursePrerequisite.DataTextField = "CourseDescription";
            ddlSelectCoursePrerequisite.DataBind();
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

        protected void btnBeginAddPrerequisite_Click(object sender, EventArgs e)
        {
            tblAddPrerequisite.Visible = true;
            string courseID = ddlSelectCoursePrerequisite.SelectedValue;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateCourseAsPrerequisite";
            objCommand.Parameters.AddWithValue("@courseID", courseID);
            ddlCourseAsPrerequisite.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            ddlCourseAsPrerequisite.DataTextField = "courseDescription";
            ddlCourseAsPrerequisite.DataValueField = "courseID";
            ddlCourseAsPrerequisite.DataBind();
        }

        protected void btnAddPrerequisite_Click(object sender, EventArgs e)
        {
            string courseID = ddlSelectCoursePrerequisite.SelectedValue;
            string prerequisiteID = ddlCourseAsPrerequisite.SelectedValue;
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminCreatePrerequisite";
            objCommand.Parameters.AddWithValue("@courseID", courseID);
            objCommand.Parameters.AddWithValue("@prerequisiteID", prerequisiteID);
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
            if (returnValue == -1)
            {
                lblAddPrerequisiteMessage.Text = "An error occurred when adding prerequisite.";
                return;
            }

            objDB = new DBConnect();
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminGenerateCourseForAddPrequisite";
            ddlSelectCoursePrerequisite.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            ddlSelectCoursePrerequisite.DataValueField = "CourseID";
            ddlSelectCoursePrerequisite.DataTextField = "CourseDescription";
            ddlSelectCoursePrerequisite.DataBind();
            tblAddPrerequisite.Visible = false;
        }

        protected void btnCancelPrerequisite_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModifyPrerequisite.aspx");
        }
    }
}