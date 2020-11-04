using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BloodDonation.views;

namespace BloodDonation.admin
{
    public partial class BloodRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null || Session["roleId"].ToString() != Roles.ADMIN)
            {
                Response.Redirect("/");
            }

            if (!IsPostBack)
            {

            }
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "approve")
            {
                using (SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();

                    String query = "UPDATE bloodreq SET status = 'APPROVED' WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";
                    
                    SqlCommand cmd = new SqlCommand(query, con);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                    }

                    cmd.Dispose();
                    con.Close();
                }
            }
        }

        protected void Deny_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "deny")
            {
                using (SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();

                    String query = "UPDATE bloodreq SET status = 'DENIED' WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                    }

                    cmd.Dispose();
                    con.Close();
                }

            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "delete")
            {
                using (SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();

                    String query = "DELETE FROM bloodreq WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

                    SqlCommand cmd = new SqlCommand(query, con);

                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                    }

                    cmd.Dispose();
                    con.Close();
                }
            }
        }
    }
}