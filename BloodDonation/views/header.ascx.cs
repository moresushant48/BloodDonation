using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonation.views
{
    public partial class header : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] != null)
            {
                /*
                  When the normal user is Logged in.
                 */
                liSignin.Visible = false;
                liSignup.Visible = false;
                liDashboard.Visible = false;

                btnLogout.Visible = true;
                // liMyAccount.Visible = true;
                // 8liUserEmail.Visible = true;
                
                /*
                 Admin Navigation
                 */
                if (Session["roleId"].ToString() == Roles.ADMIN)
                {
                    liDashboard.Visible = true;
                }

                /*
                    Fetch username and set into liUserName. 
                */
                //liUserEmail.InnerText = Session["userEmail"].ToString();
            }
            else
            {
                /*
                  When the user is Not Logged in.
                 */

                liSignin.Visible = true;
                liSignup.Visible = true;

                btnLogout.Visible = false;
                //liMyAccount.Visible = false;
                
                liDashboard.Visible = false;
                
                //liUserEmail.Visible = false;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["loggedIn"] = null;
            Response.Redirect("/");

            Session.Abandon();

        }

    }
}