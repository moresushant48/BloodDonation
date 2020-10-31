using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace BloodDonation.views
{
    public partial class SignIn : System.Web.UI.Page
    {

        private String code;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loggedIn"] != null)
            {
                Response.Redirect("/");
            }

            if (!IsPostBack)
            {

            }
        }

        protected void btnSignin_Click(object sender, EventArgs e)
        {
            fails.Text = "";

            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();

                String existsLogin = "SELECT * FROM users WHERE email = '" + txtEmail.Text + "' AND password = '" + txtPassword.Text + "'";
                SqlCommand cmd = new SqlCommand(existsLogin, con);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    Session["loggedIn"] = true;
                    Session["userId"] = reader.GetInt32(0);
                    Session["userEmail"] = reader.GetString(4);
                    Session["roleId"] = reader.GetInt32(9);


                    if (reader.GetInt32(9).ToString() == Roles.BANK)
                    {
                        String uid = reader.GetInt32(0).ToString();
                        cmd.Dispose();
                        con.Close();
                        String getBankId = "SELECT id FROM bloodbanks WHERE user_id = '" + uid + "'";
                        using (SqlConnection sqlcon = new SqlConnection(_Default.conString))
                        {
                            sqlcon.Open();
                            SqlCommand bankId = new SqlCommand(getBankId, sqlcon);

                            SqlDataReader bankreader = bankId.ExecuteReader();

                            if (bankreader.Read())
                            {
                                Session["bankId"] = bankreader.GetInt32(0);
                            }
                            bankId.Dispose();
                            bankreader.Close();
                            sqlcon.Close();
                        }
                    }
                    redirectAfterLogin();
                }
                else
                {
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                    fails.Text = "Wrong credentials.";
                }

                reader.Close();
                con.Close();

            }

        }

        private void redirectAfterLogin()
        {
            Response.Redirect("/Default");
        }

        protected void btnSendSecurityCode_Click(object sender, EventArgs e)
        {

            Random random = new Random();

            using (SqlConnection con = new SqlConnection(_Default.conString))
            {
                con.Open();
                String exists = "SELECT * FROM users WHERE email = '" + txtForgotEmail.Text + "'";
                SqlCommand cmd = new SqlCommand(exists);

                cmd = new SqlCommand(exists, con);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    code = random.Next(000000, 999999).ToString();
                    Response.Cookies["secCode"].Value = code;
                    MailMessage message = new MailMessage("dhondesooraj@gmail.com", txtForgotEmail.Text.Trim());

                    message.Subject = "Reset Password at Blood Donation Management.";
                    message.IsBodyHtml = true;
                    message.Body = "Hello, Your <b>Security Code</b> is <br> <h1>" + code + "</h1>";

                    SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    NetworkCredential networkCredential = new NetworkCredential("dhondesooraj@gmail.com", "zgirxewitlyfuyla");
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = networkCredential;
                    try
                    {
                        client.Send(message);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }

                    lblEmailSent.Text = "Security code sent.";
                }
                else
                {
                    lblEmailExists.Text = "No such User exists.";
                }

                reader.Close();
                cmd.Dispose();
                con.Dispose();
            }
        }


        protected void btnResetPassword_Click(object sender, EventArgs e)
        {

            if (Request.Cookies["secCode"].Value != null)
            {

                if (Request.Cookies["secCode"].Value.Equals(txtSecurityCode.Text.Trim()))
                {

                    using (SqlConnection con = new SqlConnection(_Default.conString))
                    {
                        con.Open();
                        String updatePass = "UPDATE users SET password = '" + txtChangedPassword.Text.Trim()
                            + "' WHERE email = '" + txtForgotEmail.Text.Trim() + "'";
                        
                        SqlCommand cmd = new SqlCommand(updatePass, con);
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Write("<script>alert('Password Changed Succefully. Please login.')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to change password.')</script>");
                        }

                        txtForgotEmail.Text = "";
                        txtSecurityCode.Text = "";
                        lblEmailSent.Text = "";
                        lblInvalidCode.Text = "";

                        cmd.Dispose();
                        con.Dispose();
                    }

                }
                else
                {
                    lblInvalidCode.Text = "Invalid Security Code.";
                }
            }

        }

    }

}