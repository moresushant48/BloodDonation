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
    public partial class BecomeBank : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null)
            {
                Response.Redirect("/");
            }
        }

        protected void btnApplyForBank_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(_Default.conString);
            con.Open();

            String exists = "SELECT * FROM bloodbanks WHERE user_id = '" + Session["userId"] + "'";
            SqlCommand cmd = new SqlCommand(exists, con);
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                result.Text = "";
                fails.Text = "You've already applied.";
            }
            else
            {
                reader.Close();
                String query = "INSERT INTO bloodbanks VALUES('" +
                txtBloodBankName.Text.Trim() + "','" +
                txtBloodBankAddress.Text.Trim() + "','false','" +
                Session["userId"].ToString() + "')";

                SqlCommand cmdin = new SqlCommand(query, con);

                if (cmdin.ExecuteNonQuery() > 0)
                {
                    fails.Text = "";
                    result.Text = "Applied Successfully. You will be contacted soon.";
                    txtBloodBankName.Text = "";
                    txtBloodBankName.Text = "";

                }
                cmdin.Dispose();
            }
            
            cmd.Dispose();
            con.Close();
        }
    }
}