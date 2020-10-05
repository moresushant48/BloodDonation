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
            con = new SqlConnection(_Default.conString);
            con.Open();

            if (!IsPostBack)
            {

                SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE id=" + Session["userId"].ToString(), con);

                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
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
    }
}