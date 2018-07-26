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
                var user = (UserCommonTable)Session["User"];
                if (user == null) Response.Redirect("~/LoginPage.aspx");
                else
                {
                    mynameholder.Text = user.UserPersonalInfoes.FirstOrDefault().Name;
                    uemail.Text = user.Email;
                    upassword.Text = user.Password;
                    uname.Text = user.UserPersonalInfoes.FirstOrDefault().Name;
                    uaffilation.Text = user.UserPersonalInfoes.FirstOrDefault().Affiliation;
                    usersex.Text = user.UserPersonalInfoes.FirstOrDefault().sex;
                    userBirthDate.Text = user.UserPersonalInfoes.FirstOrDefault().Birthday.ToString();
                    uzipcode.Text = user.UserPersonalInfoes.FirstOrDefault().ZipCode;
                    uaddress.Text = user.UserPersonalInfoes.FirstOrDefault().Address;
                    umobileno.Text = user.MobileNumber;
                    ufacebookadd.Text = user.UserPersonalInfoes.FirstOrDefault().FacebookAddress;
                    utwitter.Text = user.UserPersonalInfoes.FirstOrDefault().TwitterAddress;
                    ukakao.Text = user.UserPersonalInfoes.FirstOrDefault().KakaoTalkAddress;

                    if (user.UserPersonalInfoes.FirstOrDefault().MajorInstrument1ID != null)
                    DropDownList1_mjInst1.SelectedValue = user.UserPersonalInfoes.FirstOrDefault().MajorInstrument1ID.ToString();
                    if(user.UserPersonalInfoes.FirstOrDefault().MajorInstrument2ID != null)
                    DropDownList1_mjInst2.SelectedValue= user.UserPersonalInfoes.FirstOrDefault().MajorInstrument2ID.ToString();

                    uprofilepage.Text = user.UserPersonalInfoes.FirstOrDefault().ProfilePage;
                    urepertory.Text = user.UserPersonalInfoes.FirstOrDefault().Repertory;

                    uedoremail1.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorEmailID1;
                    uendorname1.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorName1;
                    uendorcomm1.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorComments1;

                    uedoremail2.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorEmailID2;
                    uendorname2.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorName2;
                    uendorcomm2.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorComments2;

                    uedoremail3.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorEmailID3;
                    uendorname3.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorName3;
                    uendorcomm3.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorComments3;

                    uedoremail4.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorEmailID4;
                    uendorname4.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorName4;
                    uendorcomm4.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorComments4;

                    uedoremail5.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorEmailID5;
                    uendorname5.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorName5;
                    uendorcomm5.Text = user.UserPersonalInfoes.FirstOrDefault().EndorsorComments5;

                    //txt_useremail.Text = user.Email;
                    //txt_userPassword.Text = user.Password;
                    ////txt_userkoreanname.Text = user.KoreanName;
                    ////txt_userenglishname.Text = user.EnglishName;
                    //txt_usersex.Text = user.UserPersonalInfoes.FirstOrDefault().sex;
                    //txt_userBirthDate.Text = user.UserPersonalInfoes.FirstOrDefault().Birthday.ToString();
                    //txt_userZipCode.Text = user.UserPersonalInfoes.FirstOrDefault().ZipCode;
                    //txt_useraddress.Text = user.UserPersonalInfoes.FirstOrDefault().Address;
                    //txt_userPhoneNumber.Text = user.UserPersonalInfoes.FirstOrDefault().MobileNumber;
                    //switch (user.Category.ToString().Trim()) {
                    //    case "Player": radioOcupation.SelectedIndex = 0; break;
                    //    case "Composer": radioOcupation.SelectedIndex = 1; break;
                    //    case "Researcher": radioOcupation.SelectedIndex =2; break;
                    //    case "Conductor": radioOcupation.SelectedIndex = 3; break;
                    //    case "Promotor": radioOcupation.SelectedIndex = 4; break;
                    //    case "Audience": radioOcupation.SelectedIndex = 5; break;
                    //    case "Other": radioOcupation.SelectedIndex = 6; break;
                    //    default: { radioOcupation.SelectedIndex = 6; break; }
                    //}
                }
            }
        }

        protected void txt_addInstrument_click(object sender, EventArgs e)
        {
            //var user = new User();
            //user.Email = txt_useremail.Text;
            //user.Password = txt_userPassword.Text;
            //user.KoreanName = txt_userkoreanname.Text;
            //user.EnglishName = txt_userenglishname.Text;
            //user.sex = txt_usersex.Text;
            //user.Birthday = DateTime.Parse(txt_userBirthDate.Text);
            //user.ZipCode = txt_userZipCode.Text;
            //user.Address = txt_useraddress.Text;
            //user.PhoneNumber = txt_userPhoneNumber.Text;
            //user.Category = radioOcupation.SelectedValue.ToString();

            //UserLogic ul = new UserLogic();

            //if (ul.updateUser(user))
            //{
            //    showMsg("Information Updated");
            //    Session["User"] = user;
            //}
            //else {
            //    showMsg("please check your inputs again");
            //}
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}