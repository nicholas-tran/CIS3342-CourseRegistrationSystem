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
    public partial class StudentRoster : System.Web.UI.Page
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

        protected void btnShowRoster_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(ddlRosterSemester.SelectedValue) != 3)
            {
                gvStudentNextRoster.Visible = false;
                btnDropClass.Visible = false;
                DBConnect objDB = new DBConnect();
                SqlCommand objCommand = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "StudentViewRoster";
                gvStudentRoster.Visible = true;
                objCommand.Parameters.AddWithValue("@studentID", Convert.ToInt32(Session["StudentID"].ToString()));
                objCommand.Parameters.AddWithValue("@semesterID", ddlRosterSemester.SelectedValue);
                gvStudentRoster.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                gvStudentRoster.DataBind();
            }
            else
            {
                gvStudentRoster.Visible = false;
                btnDropClass.Visible = false;
                DBConnect objDB = new DBConnect();
                SqlCommand objCommand = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "StudentViewNextRoster";
                gvStudentNextRoster.Visible = true;
                objCommand.Parameters.AddWithValue("@studentID", Convert.ToInt32(Session["StudentID"].ToString()));
                objCommand.Parameters.AddWithValue("@semesterID", ddlRosterSemester.SelectedValue);
                gvStudentNextRoster.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
                gvStudentNextRoster.Columns[0].FooterText = "Totals";
                objDB = new DBConnect();
                objCommand = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "StudentGetTotalTuition";
                objCommand.Parameters.AddWithValue("@studentID", Convert.ToInt32(Session["StudentID"].ToString()));
                DataSet ds = objDB.GetDataSetUsingCmdObj(objCommand);
                gvStudentNextRoster.Columns[8].FooterText = ds.Tables[0].Rows[0]["TuitionOwed"].ToString();
                btnDropClass.Visible = true;
                gvStudentNextRoster.DataBind();
            }
        }

        protected void btnDropClass_Click(object sender, EventArgs e)
        {
            CheckBox CBox = new CheckBox();
            for (int i = 0; i < gvStudentNextRoster.Rows.Count; i++)
            {
                CBox = (CheckBox)gvStudentNextRoster.Rows[i].FindControl("chkSelected");
                if (CBox.Checked)
                {
                    int student = Convert.ToInt32(Session["StudentID"].ToString());
                    int course = Convert.ToInt32(gvStudentNextRoster.DataKeys[i].Values["CourseID"]);
                    int section = Convert.ToInt32(gvStudentNextRoster.DataKeys[i].Values["SectionID"]);
                    DBConnect objDB2 = new DBConnect();
                    SqlCommand objCommand2 = new SqlCommand();
                    objCommand2.CommandType = CommandType.StoredProcedure;
                    objCommand2.CommandText = "StudentRegistrationDrop";
                    objCommand2.Parameters.AddWithValue("@studentID", student);
                    objCommand2.Parameters.AddWithValue("@courseID", course);
                    objCommand2.Parameters.AddWithValue("@sectionID", section);
                    if (objDB2.DoUpdateUsingCmdObj(objCommand2) == -1)
                    {
                        lblRosterMessage.Text = "Could not remove course from roster.";
                        return;
                    }
                }
            }
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "StudentViewNextRoster";
            gvStudentNextRoster.Visible = true;
            objCommand.Parameters.AddWithValue("@studentID", Convert.ToInt32(Session["StudentID"].ToString()));
            objCommand.Parameters.AddWithValue("@semesterID", 3);
            gvStudentNextRoster.DataSource = objDB.GetDataSetUsingCmdObj(objCommand);
            gvStudentNextRoster.DataBind();
            btnDropClass.Visible = false;
        }
    }
}