using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace BloodDonation
{
    public partial class Account : System.Web.UI.Page
    {

        private SqlConnection con;
        private SqlDataReader reader;

        protected void Page_Load(object sender, EventArgs e)
        {

            if(Session["loggedIn"] == null)
            {
                Response.Redirect("/");
            }

            con = new SqlConnection(_Default.conString);
            con.Open();

            if (!IsPostBack)
            {

                SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE id=" + Session["userId"].ToString(), con);

                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblName.Text = reader.GetString(1);
                    txtFirstName.Text = reader.GetString(1);
                    txtMiddleName.Text = reader.GetString(2);
                    txtLastName.Text = reader.GetString(3);
                    txtEmail.Text = reader.GetString(4);
                    txtPhone.Text = reader.GetString(5);
                    txtBloodGroup.Text = reader.GetString(6);
                    txtAddress.Text = reader.GetString(7);
                }
                cmd.Dispose();
            }
            
        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE users SET mobno = '" + txtPhone.Text.Trim() + "' WHERE id=" + Session["userId"].ToString(), con);
            cmd.ExecuteNonQuery();
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE users SET email = '" + txtEmail.Text.Trim() + "' WHERE id=" + Session["userId"].ToString(), con);
            cmd.ExecuteNonQuery();
        }

        protected void txtAddress_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("UPDATE users SET address = '" + txtAddress.Text.Trim() + "' WHERE id=" + Session["userId"].ToString(), con);
            cmd.ExecuteNonQuery();
        }

        protected void btnDeleteAcc_Click(object sender, EventArgs e)
        {

            String delFromUsers = "DELETE FROM users WHERE id = " + Session["userId"];
            String delFromBanks = "DELETE FROM bloodbanks WHERE user_id = " + Session["userId"];

            //DELETE USER
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(delFromUsers, con);
                int deletedUser = cmd.ExecuteNonQuery();

                cmd.CommandText = delFromBanks;
                cmd.ExecuteNonQuery();

                if(deletedUser > 0)
                {
                    Session["loggedIn"] = null;
                    Response.Redirect("/");

                    Session.Abandon();
                }
                cmd.Dispose();
                con.Close();
            }

        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(_Default.conString)) {

                con.Open();

                String query = "SELECT password FROM users where id = " + Session["userId"];
                SqlCommand cmd = new SqlCommand(query,con);
                SqlDataReader reader = cmd.ExecuteReader();

                if(reader.Read())
                {
                    if (txtPrevPassword.Text.Trim().Equals(reader.GetString(0)))
                    {
                        cmd.CommandText = "UPDATE users " +
                            "SET password = '" + txtChangedPassword.Text.Trim() + "' " +
                            "WHERE id = " + Session["userId"];

                        reader.Close();

                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>alert('Password changed succefully.')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to Change Password.')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Wrong Current Password.')</script>");
                    }
                }


            }
        }
    }
}