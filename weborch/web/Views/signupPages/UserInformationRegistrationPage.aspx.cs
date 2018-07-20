using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace web.Views.signupPages
{
    public partial class UserInformationRegistrationPage : System.Web.UI.Page
    {
        UserLogic ul = new UserLogic();
        bool iscompany = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CompanyInfoFormContainer.Visible = false;
                PersonInfoFormContainer.Visible = false;
            }
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

        protected void btn_regCoompany_click(object sender, EventArgs e) {

            if(Session["iscompany"]!=null)
            iscompany = (bool)Session["iscompany"];

            //get all user types
            List<int> usertypes = new List<int>();
            if (iscompany)
            {
                if(chk_Orchestra.Checked) usertypes.Add(18);
                if (chk_Promoter.Checked) usertypes.Add(19);
                if (chk_Agent.Checked) usertypes.Add(20);
                if (chk_shopOwner.Checked) usertypes.Add(21);
                if (chk_companyOther.Checked) usertypes.Add(22);
            }
            else {
                if (chk_Composer.Checked) usertypes.Add(12);
                if (chk_Conductor.Checked) usertypes.Add(13);
                if (chk_tp.Checked) usertypes.Add(14);
                if (chk_Student.Checked) usertypes.Add(15);
                if (chk_Audience.Checked) usertypes.Add(16);
                if (chk_userOther.Checked) usertypes.Add(17);                
            }

            /// first insert user email and password into user common table
            /// insert user types into userusertable
            /// finally insert company info
            /// 

            using (var context = new OrchestraDBEntities()) {
                using (var dbContextTransaction = context.Database.BeginTransaction()) {
                    try
                    {
                        //register user
                        UserCommonTable user = new UserCommonTable();
                        user.Email = oemail.Text;
                        user.Password = oemail.Text;
                        user.isActive = true;
                        user.MobileNumber = omibile.Text;

                        context.UserCommonTables.Add(user);
                        context.SaveChanges();
                        
                        // register  user types
                        foreach (int i in usertypes) {
                            User_UserType type = new User_UserType();
                            type.UserID = user.ID;
                            type.UserTypeID = i;

                            context.User_UserType.Add(type);
                            context.SaveChanges();
                        }

                        // register company info
                        UserCompany company = new UserCompany();
                        company.UserID = user.ID;
                        company.CompanyName = ocompanyname.Text;
                        company.BussinessNo = obussinessno.Text;
                        company.ZipCode = ozipcode.Text;
                        company.Address = oaddress.Text;
                        company.TelephoneNo = ophonenumber.Text;
                        company.FaxNo = ofaxnumber.Text;
                        company.CEOName = oceoname.Text;
                        company.AdminEmail = oadminemail.Text;
                        company.AdminName = oadminname.Text;
                        company.AdminMobileNo = oadminmobno.Text;
                        company.CompanyHomeUrl = ocompanyurl.Text;
                        company.OtherInfo = ootherinof.Text;

                        context.UserCompanies.Add(company);
                        context.SaveChanges();

                        dbContextTransaction.Commit();

                        showMsg("Data inserted succssfuly");
                        Response.Redirect("~/Views/HomeView.aspx");
                    }
                    catch (Exception)
                    {
                        dbContextTransaction.Rollback();
                        showMsg("Please check your inputs");
                    }
                }
            }

        }
    }
}