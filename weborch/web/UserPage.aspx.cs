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
    public partial class UserPage : System.Web.UI.Page
    {
        UserLogic ul = new UserLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            usergridview.DataSource = ul.getAllUser();
            usergridview.DataBind();
        }

        protected void btn_useradd_Click(object sender, EventArgs e)
        {
            try {
                User user = new User();
                user.EnglishName = txt_userenglishname.Text;
                user.KoreanName = txt_userkoreanname.Text;
                user.UserID = txt_user_userid.Text;
                user.Email = txt_useremail.Text;
                user.Address = txt_useraddress.Text;
                user.ZipCode = txt_userzipcode.Text;

                if (ul.addUser(user)) {
                    usergridview.DataSource = ul.getAllUser();
                    usergridview.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanUserTextBoxs();
                }
                else showMsg("Please check your inputs");

            }
            catch (Exception ee) {
                showMsg("Please check your inputs");
            }
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);            
        }


        public void cleanUserTextBoxs()
        {
            txt_userenglishname.Text = ""; ;
            txt_userkoreanname.Text = "";
            txt_user_userid.Text = "";
            txt_useremail.Text = "";
            txt_useraddress.Text = "";
            txt_userzipcode.Text = "";
        }

    }
}