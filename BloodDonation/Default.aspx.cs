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
    public partial class _Default : Page
    {
        public static String conString = "Data Source=.;Initial Catalog=blood;Integrated Security=True";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["todays_date"].DefaultValue = DateTime.Today.ToShortDateString();
        }

        public String convertToIndianDate(object obj) {

            return DateTime.Parse(obj.ToString()).ToString("dd/MM/yyyy");
        }
    }
}