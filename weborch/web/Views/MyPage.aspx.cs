using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web.Views
{
    public partial class MyPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (User)Session["User"];
            if (user == null) Response.Redirect("~/LoginPage.aspx");
            else
            {
                mynameholder.Text = user.EnglishName;
                txt_userenglishname.Text = user.EnglishName;
                txt_userkoreanname.Text = user.KoreanName;
                txt_user_userid.Text = user.UserID;
                txt_userPassword.Text = user.Password;
                txt_useremail.Text = user.Email;
                txt_useraddress.Text = user.Address;
                txt_userzipcode.Text = user.ZipCode;
            }
        }
    }
}