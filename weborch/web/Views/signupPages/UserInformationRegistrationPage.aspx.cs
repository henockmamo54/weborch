using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web.Views.signupPages
{
    public partial class UserInformationRegistrationPage : System.Web.UI.Page
    {
        UserLogic ul = new UserLogic();
        bool iscompany = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            CompanyInfoFormContainer.Visible = false;
            PersonInfoFormContainer.Visible = false;
        }
        protected void btn_cancel_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/HomeView.aspx");
        }

        protected void btn_useradd_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    User user = new User();
            //    //user.UserID = txt_user_userid.Text;
            //    user.Email = txt_useremail.Text;
            //    user.Password = txt_userPassword.Text;
            //    user.KoreanName = txt_userkoreanname.Text;
            //    user.EnglishName = txt_userenglishname.Text;
            //    user.sex = txt_usersex.Text;
            //    user.Birthday = DateTime.Parse(txt_userBirthDate.Text);
            //    user.ZipCode = txt_userZipCode.Text;
            //    user.Address = txt_useraddress.Text;
            //    user.PhoneNumber = txt_userPhoneNumber.Text;
            //    user.Category = radioOcupation.SelectedValue.ToString();


            //    if (ul.addUser(user))
            //    {
            //        //usergridview.DataSource = ul.getAllUser();
            //        //usergridview.DataBind();
            //        showMsg("Data inserted succssfuly");
            //        cleanUserTextBoxs();
            //        Response.Redirect("~/Views/HomeView.aspx");
            //    }
            //    else showMsg("Please check your inputs");

            //}
            //catch (Exception ee)
            //{
            //    showMsg("Please check your inputs");
            //}
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        public void cleanUserTextBoxs()
        {
            //txt_useremail.Text = "";
            //txt_userPassword.Text = "";
            //txt_userkoreanname.Text = "";
            //txt_userenglishname.Text = "";
            //txt_usersex.Text = "";
            //txt_userBirthDate.Text = "";
            //txt_userZipCode.Text = "";
            //txt_useraddress.Text = "";
            //txt_userPhoneNumber.Text = "";
        }

        public void chk_boxChanged(object sender, EventArgs e)
        {

            CheckBox chk = (CheckBox)sender;

            if (chk.ClientID == "MainContent_chk_Composer" || chk.ClientID == "MainContent_chk_Conductor" || chk.ClientID == "MainContent_chk_tp" || chk.ClientID == "MainContent_chk_Student" || chk.ClientID == "MainContent_chk_Audience" || chk.ClientID == "MainContent_chk_userOther")
            //if (chk_Composer.Checked || chk_Conductor.Checked || chk_tp.Checked || chk_Student.Checked || chk_Audience.Checked || chk_userOther.Checked)
            {
                iscompany = false;
                chk_Orchestra.Checked = iscompany;
                chk_Promoter.Checked = iscompany;
                chk_Agent.Checked = iscompany;
                chk_shopOwner.Checked = iscompany;
                chk_companyOther.Checked = iscompany;
            }
            else
            {
                iscompany = true;

                chk_Composer.Checked = !iscompany;
                chk_Conductor.Checked = !iscompany;
                chk_tp.Checked = !iscompany;
                chk_Student.Checked = !iscompany;
                chk_Audience.Checked = !iscompany;
                chk_userOther.Checked = !iscompany;
            }

            Session["iscompany"] = iscompany;
        }

        public void btn_continueClicked(object sender, EventArgs e)
        {
            try
            {
                iscompany = (bool)Session["iscompany"];
                if (iscompany)
                {
                    CompanyInfoFormContainer.Visible = true; PersonInfoFormContainer.Visible = false;
                }
                else
                {
                    CompanyInfoFormContainer.Visible = false; PersonInfoFormContainer.Visible = true;
                }
            }
            catch (Exception ee) { }
        }
    }
}