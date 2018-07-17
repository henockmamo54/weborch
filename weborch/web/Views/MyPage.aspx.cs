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
                    txt_useremail.Text = user.Email;
                    txt_userPassword.Text = user.Password;
                    txt_userkoreanname.Text = user.KoreanName;
                    txt_userenglishname.Text = user.EnglishName;
                    txt_usersex.Text = user.sex;
                    txt_userBirthDate.Text = user.Birthday.ToString();
                    txt_userZipCode.Text = user.ZipCode;
                    txt_useraddress.Text = user.Address;
                    txt_userPhoneNumber.Text = user.PhoneNumber;
                    
                }
            }
        }

        protected void txt_addInstrument_click(object sender, EventArgs e)
        {
            var user = new User();
            user.Email = txt_useremail.Text;
            user.Password = txt_userPassword.Text;
            user.KoreanName = txt_userkoreanname.Text;
            user.EnglishName = txt_userenglishname.Text;
            user.sex = txt_usersex.Text;
            user.Birthday = DateTime.Parse(txt_userBirthDate.Text);
            user.ZipCode = txt_userZipCode.Text;
            user.Address = txt_useraddress.Text;
            user.PhoneNumber = txt_userPhoneNumber.Text;

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