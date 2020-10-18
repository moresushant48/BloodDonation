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
    public partial class Users : System.Web.UI.Page
    {

        private SqlConnection con;

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

        protected void DeleteUser_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if(btn.CommandName == "deleteUser")
            {
                con = new SqlConnection(_Default.conString);
                con.Open();

                String query = "DELETE FROM users WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

                SqlCommand cmd = new SqlCommand(query, con);

                if (cmd.ExecuteNonQuery() > 0)
                {
                    ListView1.DataBind();
                }
                
                cmd.Dispose();
                con.Close();

            }
        }

        protected void UpdateRole_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if(btn.CommandName == "updateRole")
            {
                con = new SqlConnection(_Default.conString);
                con.Open();

                String query = "UPDATE users SET role_id = '2' WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

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