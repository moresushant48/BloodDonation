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
    public partial class RequestBlood : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            using(SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();

                String query = "INSERT INTO bloodreq VALUES ('" +
                   txtFirstName.Text.Trim() + "','" +
                   txtMiddleName.Text.Trim() + "','" +
                   txtLastName.Text.Trim() + "','" +
                   txtEmail.Text.Trim() + "','" +
                   txtMobNo.Text.Trim()  + "','" +
                   txtBloodGroup.SelectedValue.Trim() + "','" +
                   "UNCHECKED" + "')";

                SqlCommand cmd = new SqlCommand(query,con);

                if(cmd.ExecuteNonQuery() > 0)
                {
                    result.Text = "Request Submitted. Wait for Approval. We might contact your for details.";
                }
                else
                {
                    fails.Text = "Failed to submit request. Try again later.";
                }
            }
        }
    }
}