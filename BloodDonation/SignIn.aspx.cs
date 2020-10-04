using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BloodDonation.views
{
    public partial class SignIn : System.Web.UI.Page
    {
        private SqlConnection con;
        private SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            con = new SqlConnection(_Default.conString);
            con.Open();
        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            fails.Text = "";

            String existsLogin = "SELECT * FROM users WHERE email = '" + txtEmail.Text + "' AND password = '" + txtPassword.Text + "'";
            cmd = new SqlCommand(existsLogin, con);
            
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                Timer1.Enabled = true;

                Session["loggedIn"] = true;
                Session["userId"] = reader.GetInt32(0);
                Session["userEmail"] = reader.GetString(4);
                Session["roleId"] = reader.GetInt32(9);

            }
            else
            {
                txtEmail.Text = "";
                txtPassword.Text = "";
                fails.Text = "Wrong credentials.";
            }

            reader.Close();
            con.Close();

        }

        private void redirectAfterLogin()
        {
            Response.Redirect("/Default");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            redirectAfterLogin();
        }
    }
}