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
            string username = inputEmail.Text;
            string password = inputPassword.Text;
            if (username.Length > 0 && password.Length > 0)
            {
                var users = ul.checkUserLoginInfo2(username, password);
                if (users.Count > 0)
                {
                    Session["User"] = users[0];
                    Response.Redirect("~/Views/HomeView");
                }
                else Label1_warnningmessage.Visible = true;
            }
        }

        protected void Button1_signin_Click1(object sender, EventArgs e)
        {
            string username = inputEmail.Text;
            string password = inputPassword.Text;
            var users = ul.checkUserLoginInfo2(username, password);
            if (users.Count>0)
            {
                Session["User"] = users[0];
                Response.Redirect("~/Views/HomeView");
            }
            else Label1_warnningmessage.Visible = true;
            

        }
    }
}