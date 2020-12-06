using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BloodDonation.views;
using System.Data;
using System.Data.SqlClient;

namespace BloodDonation.banks
{
    public partial class ViewCampDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["loggedIn"] == null || Session["roleId"].ToString() != Roles.BANK)
            {
                Response.Redirect("/");
            }
            else
            {
                if (Request["campId"] == null)
                {
                    Response.Redirect("/");
                }
            }

        }

        protected void btnAddDonor_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                String query = "INSERT INTO visitdetails VALUES (" +
                    "'" + txtFirstName.Text.Trim() + "'," +
                    "'" + txtMiddleName.Text.Trim() + "'," +
                    "'" + txtLastName.Text.Trim() + "'," +
                    txtAge.Text.Trim() + "," +
                    "'" + txtGender.SelectedValue.Trim().ToString() + "'," +
                    "'" + txtAddress.Text.Trim() + "'," +
                    "'" + txtMobNo.Text.Trim() + "'," +
                    "'" + txtBloodGroup.Text.Trim() + "'," +
                    Request["campId"] + "," +
                    txtBloodQuantity.Text.Trim() + ")";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        Response.Write("<script>alert('Donor Added.');</script>");
                        ListView1.DataBind();
                    }
                    else
                    {
                        Response.Write("<script>alert('Couldn't add donor, please try again.');</script>");
                    }
                }
            }
        }

        protected void DeleteDonor_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandName == "deleteDonor")
            {
                using(SqlConnection con = new SqlConnection(_Default.conString))
                {
                    con.Open();

                    String query = "DELETE FROM visitdetails WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

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