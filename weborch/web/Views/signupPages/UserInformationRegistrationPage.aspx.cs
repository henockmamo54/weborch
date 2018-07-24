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
                //CompanyInfoFormContainer.Visible = false;
                //PersonInfoFormContainer.Visible = false;
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
                        user.MobileNumber = umobileno.Text;

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
                        personalInfo.Affiliation = uaffilation.Text;
                        personalInfo.sex = usersex.Text;
                        personalInfo.Birthday = DateTime.Parse(userBirthDate.Text);
                        personalInfo.ZipCode = uzipcode.Text;
                        personalInfo.Address = uaddress.Text;
                        personalInfo.MobileNumber = umobileno.Text;
                        personalInfo.FacebookAddress = ufacebookadd.Text;
                        personalInfo.TwitterAddress = utwitter.Text;
                        personalInfo.KakaoTalkAddress = ukakao.Text;
                        personalInfo.MajorInstrument1 = umajorinst1.Text;
                        personalInfo.MajorInstrument2 = umajorinst2.Text;
                        //personalInfo.Photo1 = uphoto1.Text;
                        //personalInfo.Photo2 = uphoto2.Text;
                        getPhoto(personalInfo, 1, FileUpload1);
                        getPhoto(personalInfo, 2, FileUpload2);

                        personalInfo.ProfilePage = uprofilepage.Text;
                        personalInfo.Repertory = urepertory.Text;
                        personalInfo.EndorsorEmailID1 = uedoremail1.Text;
                        personalInfo.EndorsorName1 = uendorname1.Text;
                        personalInfo.EndorsorComments1 = uendorcomm1.Text;

                        personalInfo.EndorsorEmailID2 = uedoremail2.Text;
                        personalInfo.EndorsorName2 = uendorname2.Text;
                        personalInfo.EndorsorComments2 = uendorcomm2.Text;

                        personalInfo.EndorsorEmailID3 = uedoremail3.Text;
                        personalInfo.EndorsorName3 = uendorname3.Text;
                        personalInfo.EndorsorComments3 = uendorcomm3.Text;

                        personalInfo.EndorsorEmailID4 = uedoremail4.Text;
                        personalInfo.EndorsorName4 = uendorname4.Text;
                        personalInfo.EndorsorComments4 = uendorcomm4.Text;

                        personalInfo.EndorsorEmailID5 = uedoremail5.Text;
                        personalInfo.EndorsorName5 = uendorname5.Text;
                        personalInfo.EndorsorComments5 = uendorcomm5.Text;

                        context.UserPersonalInfoes.Add(personalInfo);
                        context.SaveChanges();

                        #region insert user as an arits ==============================================================>

                        Artist artist = new Artist();
                        artist.FirstName = uname.Text;
                        artist.FamilyName = " ";                       
                        artist.BirthDate = DateTime.Parse(userBirthDate.Text);
                        artist.Address = personalInfo.Address;
                        artist.ZipCode = personalInfo.ZipCode;
                        artist.TelNO = personalInfo.MobileNumber;
                        artist.MobileNO = personalInfo.MobileNumber;
                        

                        artist.FacebookAddress = ufacebookadd.Text;
                        artist.TwitterAddress = utwitter.Text;
                        artist.KakaoTalkAddress = ukakao.Text;
                        artist.Photo1 = personalInfo.Photo1;
                        artist.Photo2 = personalInfo.Photo2;
                        artist.ProfilePage = uprofilepage.Text;
                        artist.Repertory = urepertory.Text;
                        artist.EndorsorEmailID1 = uedoremail1.Text;
                        artist.EndorsorName1 = uendorname1.Text;
                        artist.EndorsorComments1 = uendorcomm1.Text;

                        artist.EndorsorEmailID2 = uedoremail2.Text;
                        artist.EndorsorName2 = uendorname2.Text;
                        artist.EndorsorComments2 = uendorcomm2.Text;

                        artist.EndorsorEmailID3 = uedoremail3.Text;
                        artist.EndorsorName3 = uendorname3.Text;
                        artist.EndorsorComments3 = uendorcomm3.Text;

                        artist.EndorsorEmailID4 = uedoremail4.Text;
                        artist.EndorsorName4 = uendorname4.Text;
                        artist.EndorsorComments4 = uendorcomm4.Text;

                        artist.EndorsorEmailID5 = uedoremail5.Text;
                        artist.EndorsorName5 = uendorname5.Text;
                        artist.EndorsorComments5 = uendorcomm5.Text;

                        context.Artists.Add(artist);
                        context.SaveChanges();
                        
                        //if (Session["myinstlist"] != null)
                        //{
                        //    List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                        //    foreach (Instrument i in mylist)
                        //    {
                        //        Artist_Instrument artistInst = new Artist_Instrument();
                        //        artistInst.ArtistID = artistID;
                        //        artistInst.InstrumentID = i.ID;
                        //        artInstLogic.addArtistInstrument(artistInst);
                        //    }
                        //}

                        //get all Artist types
                        List<int> artisttypes = new List<int>();
                        if (chk_Composer.Checked) usertypes.Add(1);
                        if (chk_Conductor.Checked) usertypes.Add(2);
                        if (chk_tp.Checked) usertypes.Add(3);
                        if (chk_Student.Checked) usertypes.Add(4);
                        if (chk_Player.Checked) usertypes.Add(5);

                        // register  user types
                        foreach (int i in artisttypes)
                        {
                            Artist_ArtistType type = new Artist_ArtistType();
                            type.Artist = artist.ID;
                            type.ArtistTypeID = i;

                            context.Artist_ArtistType.Add(type);
                            context.SaveChanges();
                        }
                        #endregion

                        dbContextTransaction.Commit();
                        isSuccess = true;

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

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (FileUpload1.HasFiles)
        //        {
        //            string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
        //            if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
        //            {
        //                string path = Server.MapPath("~//Document//");
        //                FileUpload1.SaveAs(path + FileUpload1.FileName);
        //            }
        //            else
        //            {
        //                showMsg("you can upload only jpeg,jpg,png,gif file formats");
        //            }
        //        }
        //        else
        //        {
        //            showMsg("Please select an image to upload.");
        //            return;
        //        }

        //        BulletinLogic bl = new BulletinLogic();
        //        Bulletin bulletin = new Bulletin();
        //        bulletin.MSG = txt_bulmsg.Text;
        //        bulletin.URL = txt_bulurl.Text;
        //        bulletin.TimeStamp = DateTime.Now;
        //        bulletin.ImageUrl = FileUpload1.FileName;
        //        if (bl.addBulletin(bulletin))
        //        {
        //            showMsg("Data inserted succssfuly");
        //        }
        //        else showMsg("Please check your inputs. can't insert the info properly");
        //    }
        //    catch (Exception ee)
        //    {
        //        showMsg("Please check your inputs. related the server problem");
        //    }

        //}

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
    }
}