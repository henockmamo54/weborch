using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Data;
using System.Net;
using System.Net.Mail;
using System.Globalization;

namespace web.Views.signupPages
{
    public partial class UserInformationRegistrationPage : System.Web.UI.Page
    {
        UserLogic ul = new UserLogic();
        bool iscompany = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            string pwd = upassword.Text;
            upassword.Attributes.Add("value", pwd);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);

            if (!IsPostBack)
            {
                //CompanyInfoFormContainer.Visible = false;
                //PersonInfoFormContainer.Visible = false;
                DropDownList1_mjInst1.SelectedIndex = -1;
                DropDownList1_mjInst2.SelectedIndex = -1;
            }
        }
        protected void btn_cancel_click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/HomeView.aspx");
        }

        protected void btn_useradd_Click(object sender, EventArgs e)
        {

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

            if (chk.ClientID == "MainContent_chk_Composer" || chk.ClientID == "MainContent_chk_Player" || chk.ClientID == "MainContent_chk_Conductor" || chk.ClientID == "MainContent_chk_tp" || chk.ClientID == "MainContent_chk_Student" || chk.ClientID == "MainContent_chk_Audience" || chk.ClientID == "MainContent_chk_userOther")
            //if (chk_Composer.Checked || chk_Conductor.Checked || chk_tp.Checked || chk_Student.Checked || chk_Audience.Checked || chk_userOther.Checked)
            {
                iscompany = false;
                chk_Orchestra.Checked = iscompany;
                chk_Promoter.Checked = iscompany;
                chk_Agent.Checked = iscompany;
                chk_shopOwner.Checked = iscompany;
                chk_companyOther.Checked = iscompany;
                if (CompanyInfoFormContainer.Visible) CompanyInfoFormContainer.Visible = false;
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
                chk_Player.Checked = !iscompany;
                if (PersonInfoFormContainer.Visible) PersonInfoFormContainer.Visible = false;
                if (chk_Orchestra.Checked) divforOrchestrainfo.Visible = true;
                else divforOrchestrainfo.Visible = false;
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
                    if (chk_Orchestra.Checked) divforOrchestrainfo.Visible = true;
                    else divforOrchestrainfo.Visible = false;
                }
                else
                {
                    CompanyInfoFormContainer.Visible = false; PersonInfoFormContainer.Visible = true;
                }
            }
            catch (Exception ee) { }
        }

        protected void btn_regCoompany_click(object sender, EventArgs e)
        {
            //get all user types
            List<int> usertypes = new List<int>();
            if (chk_Orchestra.Checked) usertypes.Add(18);
            if (chk_Promoter.Checked) usertypes.Add(19);
            if (chk_Agent.Checked) usertypes.Add(20);
            if (chk_shopOwner.Checked) usertypes.Add(21);
            if (chk_companyOther.Checked) usertypes.Add(22);

            /// first insert user email and password into user common table
            /// insert user types into userusertable
            /// finally insert company info
            /// 
            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        //register user
                        UserCommonTable user = new UserCommonTable();
                        user.Email = oemail.Text;
                        user.Password = opassword.Text;
                        user.isActive = true;
                        user.MobileNumber = omibile.Text;

                        context.UserCommonTables.Add(user);
                        context.SaveChanges();

                        // register  user types
                        foreach (int i in usertypes)
                        {
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

                        // register orchestra info
                        if (chk_Orchestra.Checked)
                        {
                            Orchestra orch = new Orchestra();
                            orch.OfficialName = txt_orchname.Text;
                            orch.Alias = txt_orchaliasname.Text;
                            orch.URL = txt_orchurl.Text;
                            orch.Address = company.Address;
                            orch.ZipCode = company.ZipCode;
                            orch.TelNO = company.TelephoneNo;
                            orch.FaxNo = company.FaxNo;
                            if(DropDownList2_conductor.SelectedValue.Count()>0)
                                orch.ConductorID = int.Parse(DropDownList2_conductor.SelectedValue);
                            orch.Since = int.Parse(txt_orchsince.Text);
                            orch.UserID = user.ID;

                            context.Orchestras.Add(orch);
                            context.SaveChanges();
                        }

                        dbContextTransaction.Commit();
                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }
                }

                if (isSuccess)
                {
                    showMsg("Data inserted succssfuly");
                    Response.Redirect("~/Views/HomeView.aspx");
                }
                else showMsg("Please check your inputs");


            }

        }

        protected void btn_regPersonalInfo_click(object sender, EventArgs e)
        {

            //get all user types
            List<int> usertypes = new List<int>();
            if (chk_Composer.Checked) usertypes.Add(12);
            if (chk_Conductor.Checked) usertypes.Add(13);
            if (chk_tp.Checked) usertypes.Add(14);
            if (chk_Student.Checked) usertypes.Add(15);
            if (chk_Audience.Checked) usertypes.Add(16);
            if (chk_userOther.Checked) usertypes.Add(17);

            /// first insert user email and password into user common table
            /// insert user types into userusertable
            /// finally insert company info
            /// 

            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        //register user
                        UserCommonTable user = new UserCommonTable();
                        user.Email = uemail.Text;
                        user.Password = upassword.Text;
                        user.isActive = true;
                        user.MobileNumber = umobileno1.Text + umobileno2.Text + umobileno3.Text;

                        context.UserCommonTables.Add(user);
                        context.SaveChanges();

                        // register  user types
                        foreach (int i in usertypes)
                        {
                            User_UserType type = new User_UserType();
                            type.UserID = user.ID;
                            type.UserTypeID = i;

                            context.User_UserType.Add(type);
                            context.SaveChanges();
                        }

                        // register personal info
                        UserPersonalInfo personalInfo = new UserPersonalInfo();
                        personalInfo.UserID = user.ID;

                        personalInfo.Name = uname.Text;
                        if (int.Parse(DropDownList1_Affilation.SelectedValue) == -1)
                            personalInfo.Affiliation = uaffilation.Text;
                        else personalInfo.Affiliation = DropDownList1_Affilation.SelectedItem.Text;
                        personalInfo.sex = DropDownList1_sex.SelectedItem.Text;
                        personalInfo.Birthday = DateTime.ParseExact(userBirthDate.Value, "dd/mm/yyyy", CultureInfo.InvariantCulture);
                        personalInfo.ZipCode = uzipcode.Text;
                        personalInfo.Address = uaddress.Text;
                        personalInfo.MobileNumber = umobileno1.Text + umobileno2.Text + umobileno3.Text;
                        personalInfo.FacebookAddress = ufacebookadd.Text;
                        personalInfo.TwitterAddress = utwitter.Text;
                        personalInfo.KakaoTalkAddress = ukakao.Text;
                        if (int.Parse(DropDownList1_mjInst1.SelectedValue) != -1) personalInfo.MajorInstrument1ID = int.Parse(DropDownList1_mjInst1.SelectedValue); //umajorinst1.Text;
                        if (int.Parse(DropDownList1_mjInst2.SelectedValue) != -1) personalInfo.MajorInstrument1ID = int.Parse(DropDownList1_mjInst2.SelectedValue); //umajorinst2.Text;
                        //personalInfo.Photo1 = uphoto1.Text;
                        //personalInfo.Photo2 = uphoto2.Text;
                        getPhoto(personalInfo, 1, FileUpload1);
                        getPhoto(personalInfo, 2, FileUpload2);

                        personalInfo.ProfilePage = uprofilepage.Text;
                        personalInfo.Repertory = urepertory.Text;

                        context.UserPersonalInfoes.Add(personalInfo);
                        context.SaveChanges();

                        #region insert user as an arits ==============================================================>

                        if (chk_Composer.Checked || chk_Conductor.Checked || chk_tp.Checked || chk_Student.Checked || chk_Player.Checked)
                        {
                            Artist artist = new Artist();
                            artist.FirstName = uname.Text;
                            artist.FamilyName = " ";
                            artist.BirthDate = DateTime.ParseExact(userBirthDate.Value, "dd/mm/yyyy", CultureInfo.InvariantCulture);
                            artist.Address = personalInfo.Address;
                            artist.ZipCode = personalInfo.ZipCode;
                            artist.TelNO = personalInfo.MobileNumber;
                            artist.MobileNO = personalInfo.MobileNumber;
                            artist.Affiliation = personalInfo.Affiliation;


                            artist.FacebookAddress = ufacebookadd.Text;
                            artist.TwitterAddress = utwitter.Text;
                            artist.KakaoTalkAddress = ukakao.Text;
                            artist.Photo1 = personalInfo.Photo1;
                            artist.Photo2 = personalInfo.Photo2;
                            artist.ProfilePage = uprofilepage.Text;
                            artist.Repertory = urepertory.Text;

                            artist.UserID = personalInfo.UserID;

                            context.Artists.Add(artist);
                            context.SaveChanges();

                            if (DropDownList1_mjInst1.SelectedIndex > 0)
                            {
                                Artist_Instrument artistInst = new Artist_Instrument();
                                artistInst.ArtistID = artist.ID;
                                artistInst.InstrumentID = int.Parse(DropDownList1_mjInst1.SelectedValue);
                                context.Artist_Instrument.Add(artistInst);
                                context.SaveChanges();
                            }
                            if (DropDownList1_mjInst2.SelectedIndex > 0)
                            {
                                Artist_Instrument artistInst = new Artist_Instrument();
                                artistInst.ArtistID = artist.ID;
                                artistInst.InstrumentID = int.Parse(DropDownList1_mjInst2.SelectedValue);
                                context.Artist_Instrument.Add(artistInst);
                                context.SaveChanges();
                            }


                            //get all Artist types
                            List<int> artisttypes = new List<int>();
                            if (chk_Composer.Checked) { artisttypes.Add(1); }
                            if (chk_Conductor.Checked) { artisttypes.Add(2); }
                            if (chk_tp.Checked) { artisttypes.Add(3); }
                            if (chk_Student.Checked) { artisttypes.Add(4); }
                            if (chk_Player.Checked) { artisttypes.Add(5); }

                            // register  user types
                            foreach (int i in artisttypes)
                            {
                                Artist_ArtistType type = new Artist_ArtistType();
                                type.Artist = artist.ID;
                                type.ArtistTypeID = i;

                                context.Artist_ArtistType.Add(type);
                                context.SaveChanges();
                            }

                            //register endorsers
                            if (Session["myendorsmentlist"] != null)
                            {
                                List<User_Endorser> mylist = (List<User_Endorser>)Session["myendorsmentlist"];
                                foreach (User_Endorser x in mylist)
                                {
                                    User_Endorser ue = new User_Endorser();
                                    ue.ArtistID = artist.ID;
                                    ue.UserID = user.ID;
                                    ue.Email = x.Email;
                                    ue.Name = x.Name;

                                    context.User_Endorser.Add(ue);
                                    context.SaveChanges();
                                    //sending message to endorsers
                                    sendEmailToEndorser(x.Email, artist, x);
                                }
                            }

                        }


                        #endregion

                        dbContextTransaction.Commit();
                        isSuccess = true;
                        //login in the user
                        Session["User"] = user;

                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();

                    }

                    if (isSuccess)
                    {
                        showMsg("Data inserted succssfuly");                        
                        Response.Redirect("~/Views/HomeView.aspx");
                    }
                    else showMsg("Please check your inputs");
                }
            }

        }

        public void sendEmailToEndorser(string to, Artist artist, User_Endorser e)
        {
            try
            {
                var fromAddress = new MailAddress("iijbiijb14@gmail.com");
                var fromPassword = "*****";
                //var toAddress = new MailAddress("henockmamo54@gmail.com");
                var toAddress = to;

                string subject = "Endorsement Request";
                string body = string.Format(@"<p><strong> Dear Mr. {0} we would like to request your endorsement in the behalf of Mr. {1}. please follow 
                            <a href='http://13.125.250.101/web/Views/FullEndorsementPage?UserID={2}&amp;EndID={3}'>http://13.125.250.101/web/Views/FullEndorsementPage?UserID={2}&amp;EndID={3}
                            </a> and fill the form <br /></strong></p> ", artist.FirstName, e.Name, artist.ID, e.ID);

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)

                };

                using (var message = new MailMessage(fromAddress.Address, toAddress)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                })
                    smtp.Send(message);
                Console.WriteLine("done");
            }
            catch (Exception eee)
            {
                //Response.Write(eee.Message + "\n" + eee.InnerException + "\n" + eee.StackTrace);
                //showMsg(eee.Message);
                Console.WriteLine(eee.Message);
            }
        }

        public void getPhoto(UserPersonalInfo info, int photonumber, FileUpload fileupload)
        {

            if (fileupload.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(fileupload.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    fileupload.SaveAs(path + fileupload.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                }
            }

            if (photonumber == 1)
                info.Photo1 = fileupload.FileName;
            else
                info.Photo2 = fileupload.FileName;


        }

        protected void btn_add_endorser_tolist(object sender, EventArgs e)
        {
            //Endorser endorser = new Endorser();
            //endorser.ID = int.Parse(DropDownList1_endorserlist.SelectedItem.Value);
            //endorser.Name = DropDownList1_endorserlist.SelectedItem.Text;
            //endorser.Email = ((DataView)SqlDataSource1_endorserList.Select(new DataSourceSelectArguments())).ToTable().Rows[DropDownList1_endorserlist.SelectedIndex]["Email"].ToString();

            //if (Session["myendorsmentlist"] != null)
            //{
            //    List<Endorser> mylist = (List<Endorser>)Session["myendorsmentlist"];
            //    mylist.Add(endorser);
            //    myendorsmentlist.DataSource = mylist;
            //    myendorsmentlist.DataBind();
            //    Session["myendorsmentlist"] = mylist;
            //}
            //else
            //{
            //    List<Endorser> endorserList = new List<Endorser>();
            //    endorserList.Add(endorser);

            //    myendorsmentlist.DataSource = endorserList;
            //    myendorsmentlist.DataBind();
            //    Session["myendorsmentlist"] = endorserList;
            //}
        }

        public void btn_remove_endorser_tolist(object sender, CommandEventArgs e)
        {
            if (Session["myendorsmentlist"] != null)
            {

                List<User_Endorser> mylist = (List<User_Endorser>)Session["myendorsmentlist"];

                mylist.RemoveAt(int.Parse(e.CommandArgument.ToString()));
                myendorsmentlist.DataSource = mylist;
                myendorsmentlist.DataBind();
                Session["myendorsmentlist"] = mylist;
            }
        }


        protected void btnAddEndorser_Click(object sender, EventArgs e)
        {
            User_Endorser endorser = new User_Endorser();
            endorser.Name = FormControlInput1_Name.Text;
            endorser.Email = FormControlTextarea1_email.Text;


            //if (el.insertEndorser(r))
            //{
            //    DropDownList1_endorserlist.DataBind();
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            //}
            //else showMsg("Please check your inputs!!!");

            if (Session["myendorsmentlist"] != null)
            {
                List<User_Endorser> mylist = (List<User_Endorser>)Session["myendorsmentlist"];
                mylist.Add(endorser);
                myendorsmentlist.DataSource = mylist;
                myendorsmentlist.DataBind();
                Session["myendorsmentlist"] = mylist;
            }
            else
            {
                List<User_Endorser> endorserList = new List<User_Endorser>();
                endorserList.Add(endorser);

                myendorsmentlist.DataSource = endorserList;
                myendorsmentlist.DataBind();
                Session["myendorsmentlist"] = endorserList;
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop2", "closeModal();", true);

        }

        protected void DropDownList1_Affilation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(DropDownList1_Affilation.SelectedValue) == -1) uaffilation.Visible = true;
            else uaffilation.Visible = false;
        }

    }
}