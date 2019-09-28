using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CourseRegistrationSystem
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}