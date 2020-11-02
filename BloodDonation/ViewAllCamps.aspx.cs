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
    public partial class ViewAllCamps : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["todays_date"].DefaultValue = DateTime.Today.ToShortDateString();
        }

        protected void btnAttend_Click(object sender, EventArgs e)
        {
            if (Session["loggedIn"] != null)
            {
                Button btn = (Button)sender;
                if (btn.CommandName == "attend")
                {
                    SqlConnection con = new SqlConnection(_Default.conString);
                    con.Open();

                    String getVisitorCount = "SELECT visitors FROM camps WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

                    SqlCommand cmd = new SqlCommand(getVisitorCount, con);

                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        SqlConnection sqlcon = new SqlConnection(_Default.conString);
                        sqlcon.Open();

                        String query = "UPDATE camps SET visitors = " + (reader.GetInt32(0) + 1)
                            + " WHERE id = '" + btn.CommandArgument.Trim().ToString() + "'";

                        SqlCommand updateCmd = new SqlCommand(query, sqlcon);

                        updateCmd.ExecuteNonQuery();

                        updateCmd.Dispose();
                        sqlcon.Close();
                    }

                    cmd.Dispose();
                    con.Close();

                }
            }
        }

        public String convertToIndianDate(object obj)
        {

            return DateTime.Parse(obj.ToString()).ToString("dd/MM/yyyy");
        }

        public static string checkIsOld(object obj)
        {
            int res = DateTime.Parse(obj.ToString()).CompareTo(DateTime.Now);
            return res > 0 ? "border-left border-success" : "border-left border-danger";
        }
    }
}