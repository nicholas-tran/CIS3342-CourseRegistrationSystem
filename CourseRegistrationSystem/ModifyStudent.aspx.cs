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
    public partial class ModifyStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btnManageStudentStart_Click(object sender, EventArgs e)
        {
            tblCreateStudent.Visible = true;
            btnManageStudentStart.Visible = false;
        }
        protected void btnManageStudentEnd_Click(object sender, EventArgs e)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "AdminAddStudent";

            objCommand.Parameters.AddWithValue("@studentId", Convert.ToInt32(txtStudentID.Text));
            objCommand.Parameters.AddWithValue("@name", txtName.Text);
            objCommand.Parameters.AddWithValue("@major", ddlMajor.SelectedValue.ToString());
            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);

            if (returnValue == -1)
            {
                lblModifyMessage.Text = "Insertion Error.";
                txtStudentID.Focus();
                return;
            }
            else if(returnValue == 0)
            {
                lblModifyMessage.Text = "Student Already Exists.";
                txtStudentID.Focus();
                return;
            }
            else
            {
                lblModifyMessage.Text = "Success.";    
                objCommand.CommandText = "AdminDisplayStudent";
                objCommand.Parameters.Clear();
                objCommand.Parameters.AddWithValue("@studentId", Convert.ToInt32(txtStudentID.Text));
                gvCreatedStudent.Visible = true;
                gvCreatedStudent.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                gvCreatedStudent.DataBind();
            }
        }
    }
}