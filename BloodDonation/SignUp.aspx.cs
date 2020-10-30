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
    public partial class SignUp : System.Web.UI.Page
    {
        private SqlConnection con;
        private int USER_ROLE_ID = 3;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["loggedIn"] != null)
            {
                Response.Redirect("/");
            }

            con = new SqlConnection(_Default.conString);
            con.Open();
        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {

            String exists = "SELECT * FROM users WHERE email = '" + txtEmail.Text + "'";
            SqlCommand cmd = new SqlCommand(exists);

            cmd = new SqlCommand(exists, con);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                result.Text = "";
                fails.Text = "Email is already registered.";
                
            }
            else
            {
                reader.Close();

                // if email is not registered already then create an account.
                String query = "INSERT INTO users VALUES('" +
                txtFirstName.Text.Trim() + "','" +
                txtMiddleName.Text.Trim() + "','" +
                txtLastName.Text.Trim() + "','" +
                txtEmail.Text.Trim() + "','" +
                txtMobNo.Text.Trim() + "','" +
                txtBloodGroup.Text + "','" +
                txtAddress.Text.Trim() + "','" +
                txtPassword.Text.Trim() + "'," +
                USER_ROLE_ID + ",'" +
                txtGender.SelectedValue + "'," +
                txtAge.Text.Trim() + ")";

                cmd = new SqlCommand(query, con);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    fails.Text = "";
                    result.Text = "Registered Successfully. Please Login.";
                    txtFirstName.Text = "";
                    txtMiddleName.Text = "";
                    txtLastName.Text = "";
                    txtEmail.Text = "";
                    txtMobNo.Text = "";
                    txtBloodGroup.Text = "";
                    txtAddress.Text = "";
                    txtPassword.Text = "";

                    Timer1.Enabled = true;

                }
            }
            cmd.Dispose();
            con.Close();
            
        }

        private void redirectLogin()
        {
            Response.Redirect("/SignIn");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            redirectLogin();
        }
    }
}