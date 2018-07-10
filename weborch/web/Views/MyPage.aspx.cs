using BusinessLogic;
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
            if (!IsPostBack)
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

        protected void txt_addInstrument_click(object sender, EventArgs e)
        {
            var user = new User();
            user.EnglishName = txt_userenglishname.Text;
            user.KoreanName = txt_userkoreanname.Text;
            user.UserID = txt_user_userid.Text;
            user.Password = txt_userPassword.Text;
            user.Email = txt_useremail.Text;
            user.Address = txt_useraddress.Text;
            user.ZipCode = txt_userzipcode.Text;

            UserLogic ul = new UserLogic();

            if (ul.updateUser(user))
            {
                showMsg("Information Updated");
                Session["User"] = user;
            }
            else {
                showMsg("please check your inputs again");
            }
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}