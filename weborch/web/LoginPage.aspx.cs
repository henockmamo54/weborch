using BusinessLogic;
using System;
using System.Web;

namespace web
{
    public partial class LoginPage : System.Web.UI.Page
    {
        UserLogic ul = new UserLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_signin_Click1(object sender, EventArgs e)
        {
            string username = inputEmail.Text;
            string password = inputPassword.Text;

            if (ul.checkUserLoginInfo(username, password))
            {
                Response.Redirect("Default.aspx");
            }
            else Label1_warnningmessage.Visible = true;

            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ClearHeaders();
            Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");
            Response.AddHeader("Pragma", "no-cache");

            Page.ClientScript.RegisterStartupScript(this.GetType(), "clearHistory", "ClearHistory();", true);

        }
    }
}