using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;
using System.Configuration;

using MySql.Data.MySqlClient;

namespace Pluralsight.ShapeStore
{
    public partial class CreateAccount1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            //get user id, email for newly created user
            MembershipUser user = Membership.GetUser(CreateUserWizard1.UserName);
            string userId = user.ProviderUserKey.ToString();
            string email = user.Email;

            //make sure user is logged in after account created
            FormsAuthentication.SetAuthCookie(user.UserName, false);

            //connection string for MySQL
            string connString = ConfigurationManager.ConnectionStrings["StoreSqlDb"].ConnectionString;

            //connect to MySQL to add user record separately from MembershipProvider DB
            using (MySqlConnection conn = new MySqlConnection(connString))
            {
                conn.Open();
                string commString = "INSERT INTO users (UserId, FirstName, LastName, Email, MailingStreet, MailingCity, MailingState, MailingPostal, DateCreated) VALUES (@UserId, @FirstName, @LastName, @Email, @MailingStreet, @MailingCity, @MailingState, @MailingPostal, @DateCreated)";

                using (MySqlCommand comm = new MySqlCommand(commString, conn))
                {
                    comm.Parameters.AddWithValue("@UserId", userId);
                    comm.Parameters.AddWithValue("@FirstName", ((TextBox)CreateUserWizardStep0.FindControl("FirstName")).Text);
                    comm.Parameters.AddWithValue("@LastName", ((TextBox)CreateUserWizardStep0.FindControl("LastName")).Text);
                    comm.Parameters.AddWithValue("@Email", email);
                    comm.Parameters.AddWithValue("@MailingStreet", ((TextBox)CreateUserWizardStep0.FindControl("MailingAddress")).Text);
                    comm.Parameters.AddWithValue("@MailingCity", ((TextBox)CreateUserWizardStep0.FindControl("MailingCity")).Text);
                    comm.Parameters.AddWithValue("@MailingState", ((TextBox)CreateUserWizardStep0.FindControl("MailingState")).Text);
                    comm.Parameters.AddWithValue("@MailingPostal", ((TextBox)CreateUserWizardStep0.FindControl("MailingPostalCode")).Text);
                    comm.Parameters.AddWithValue("@DateCreated", System.DateTime.Now);

                    comm.ExecuteNonQuery();
                }
            }

            Response.Redirect(CreateUserWizard1.ContinueDestinationPageUrl);
        }
    }
}