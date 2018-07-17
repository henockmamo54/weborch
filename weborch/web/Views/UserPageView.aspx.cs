using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class UserPageView : System.Web.UI.Page
    {
        UserLogic ul = new UserLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            //usergridview.DataSource = ul.getAllUser();
            //usergridview.DataBind();
        }

        protected void btn_cancel_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/HomeView.aspx");
        }

        protected void btn_useradd_Click(object sender, EventArgs e)
        {
            try
            {
                User user = new User();
                //user.UserID = txt_user_userid.Text;
                user.Email = txt_useremail.Text;
                user.Password = txt_userPassword.Text;
                user.KoreanName = txt_userkoreanname.Text;
                user.EnglishName = txt_userenglishname.Text;
                user.sex = txt_usersex.Text;
                user.Birthday = DateTime.Parse(txt_userBirthDate.Text);
                user.ZipCode = txt_userZipCode.Text;
                user.Address = txt_useraddress.Text;
                user.PhoneNumber = txt_userPhoneNumber.Text;

                if (ul.addUser(user))
                {
                    //usergridview.DataSource = ul.getAllUser();
                    //usergridview.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanUserTextBoxs();
                    Response.Redirect("~/Views/HomeView.aspx");
                }
                else showMsg("Please check your inputs");

            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public void cleanUserTextBoxs()
        {
            txt_useremail.Text = "";
            txt_userPassword.Text = "";
            txt_userkoreanname.Text = "";
            txt_userenglishname.Text = "";
            txt_usersex.Text = "";
            txt_userBirthDate.Text = "";
            txt_userZipCode.Text = "";
            txt_useraddress.Text = "";
            txt_userPhoneNumber.Text = "";
        }

    }
}