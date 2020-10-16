using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BloodDonation.views;
using System.Data;
using System.Data.SqlClient;

namespace BloodDonation
{
    public partial class Bankboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null || Session["roleId"].ToString() != Roles.BANK)
            {
                Response.Redirect("/");
            }
            
        }

        protected void DeleteCamp_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "deleteCamp")
            {
                SqlConnection con = new SqlConnection(_Default.conString);
                con.Open();

                String query = "DELETE FROM camps WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

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