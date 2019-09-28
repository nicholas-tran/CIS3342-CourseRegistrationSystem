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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }
         protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx", false);
        }

        protected void btnStudentLogin_Click(object sender, EventArgs e)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "CheckStudentValid";
            objCommand.Parameters.AddWithValue("@studentId", Convert.ToInt32(txtStudentIDLogin.Text));
            try
            {
                int returnValue = Convert.ToInt32(objDB.GetDataSetUsingCmdObj(objCommand).Tables[0].Rows[0]["StudentID"]);
                if (returnValue == Convert.ToInt32(txtStudentIDLogin.Text))
                {
                    Response.Redirect("StudentLogin.aspx", false);
                    Session["StudentID"] = txtStudentIDLogin.Text;
                }
            }
            catch (IndexOutOfRangeException)
            {
                lblModifyMessage.Text = "Student Login Not Correct";
                return;
            }
        }
    }
}