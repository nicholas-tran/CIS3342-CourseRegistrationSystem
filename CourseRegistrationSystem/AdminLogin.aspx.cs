using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourseRegistrationSystem
{
    public partial class AdminLogin : System.Web.UI.Page
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
    }
}