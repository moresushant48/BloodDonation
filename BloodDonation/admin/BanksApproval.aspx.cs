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
    public partial class BanksApproval : System.Web.UI.Page
    {
        private SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null || Session["roleId"].ToString() != Roles.ADMIN)
            {
                Response.Redirect("/");
            }
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "approve")
            {
                con = new SqlConnection(_Default.conString);
                con.Open();

                String query = "UPDATE bloodbanks SET status = 'true' WHERE user_id = '" + btn.CommandArgument.Trim().ToString() + "'";
                String setRole = "UPDATE users SET role_id = 2 WHERE id= '" + btn.CommandArgument.Trim().ToString() + "'";

                SqlCommand cmd = new SqlCommand(query, con);

                if (cmd.ExecuteNonQuery() > 0)
                {   
                    if(new SqlCommand(setRole, con).ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                    }
                }

                cmd.Dispose();
                con.Close();

            }
        }

        protected void Deny_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "deny")
            {
                con = new SqlConnection(_Default.conString);
                con.Open();

                String query = "UPDATE bloodbanks SET status = 'false' WHERE user_id = '" + btn.CommandArgument.Trim().ToString() + "'";
                String setRole = "UPDATE users SET role_id = 3 WHERE id= '" + btn.CommandArgument.Trim().ToString() + "'";

                SqlCommand cmd = new SqlCommand(query, con);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    if (new SqlCommand(setRole, con).ExecuteNonQuery() > 0)
                    {
                        ListView1.DataBind();
                    }
                }

                cmd.Dispose();
                con.Close();

            }
        }
    }
}