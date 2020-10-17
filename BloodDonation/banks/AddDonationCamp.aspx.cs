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
    public partial class AddDonationCamp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] == null || Session["roleId"].ToString() != Roles.BANK)
            {
                Response.Redirect("/");
            }
            if (!Page.IsPostBack)
            {
                Calendar1.SelectedDate = DateTime.Now.Date;
            }
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date < DateTime.Now.Date)
            {
                e.Day.IsSelectable = false;
                e.Cell.ForeColor = System.Drawing.Color.Gray;
            }
        }

        protected void btnAddCamp_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(_Default.conString);
            con.Open();

            String query = "INSERT INTO camps VALUES('" + Calendar1.SelectedDate.Date.ToShortDateString() + "'," +
                "'"+ txtAddress.Text.Trim() +"'," +
                "'"+ hour.SelectedValue + " " + meridiem.SelectedValue +"'," +
                Session["bankId"].ToString() + "," +
                0 +")";

            SqlCommand cmd = new SqlCommand(query, con);

            if(cmd.ExecuteNonQuery() > 0)
            {
                result.Text = "New Blood Donation Camp has been added.";
            }
            else
            {
                fails.Text = "Error adding camp.";
            }

        }
    }
}