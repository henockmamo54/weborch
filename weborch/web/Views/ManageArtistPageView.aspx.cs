using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class ManageArtistPageView : System.Web.UI.Page
    {
        ArtistLogic artl = new ArtistLogic();
        ArtistInstrumentLogic artInstLogic = new ArtistInstrumentLogic();
        List<Instrument> instrumentlist;
        OrchestraDBEntities entity = new OrchestraDBEntities();
        UserCommonTable user;
        protected void Page_Load(object sender, EventArgs e)
        {
            ////artist grid
            //GridView3.DataSource = artl.getAllArtists();
            //GridView3.DataBind();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);

            if (!IsPostBack)
            {
                instrumentlist = new List<Instrument>();
                Session["myinstlist"] = null;
                myinstrepeater.DataSource = null;
                myinstrepeater.DataBind();

                user = (UserCommonTable)Session["User"];
                if (user != null)
                {
                    OrchestraDBEntities entity = new OrchestraDBEntities();
                    var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                    bool isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
                    if (!isUserCompany) Response.Redirect("~/Views/HomeView.aspx");
                }
                else Response.Redirect("~/Views/HomeView.aspx");
            }

        }
        public void btn_artistcancel_Click(object sender, EventArgs e) {
            btn_artist_add.Visible = true;
            btn_artist_cancel.Visible = false;
            btn_artist_save.Visible = false;
            cleanArtistTextBoxs();
        }
        public void btn_artistsave_Click(object sender, EventArgs e) {
            updateArtistInfo();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_artist_add.Visible = false;
            btn_artist_cancel.Visible = true;
            btn_artist_save.Visible = true;

            OrchestraDBEntities entity = new OrchestraDBEntities();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ToggleScript", "showdattime();", true);

            //showandhidebtnforthepanel.Visible = false;
            //AddNewEntryPanel.Visible = true;
            //btn_update.Visible = true;
            //btn_register.Visible = false;

            var cell = GridView1.SelectedRow.Cells[1];
            var mystring = cell.Text.ToString();
            int artistID = int.Parse(mystring);
            Session["ArtistID"] = artistID;
            Artist pd = entity.Artists.Where(x => x.ID == artistID).FirstOrDefault();

            if (pd != null)
            {
                txt_artist_firstname.Text = pd.FirstName;
                txt_artist_familyname.Text = pd.FamilyName;
                txt_artist_middlename.Text = pd.MiddleName;
                txt_artist_address.Text = pd.Address;
                txt_artist_birthdate.Value = pd.BirthDate.ToShortDateString();
                txt_artist_zipcode.Text = pd.ZipCode;
                txt_artist_teleno.Text = pd.TelNO;
                txt_artist_mobileno.Text = pd.MobileNO;
                txt_aritist_faxno.Text = pd.FaxNo;
                txt_artist_remark.Text = pd.Remar;
                ukakao.Text = pd.KakaoTalkAddress;
                ufacebookadd.Text = pd.FacebookAddress;
                utwitter.Text = pd.TwitterAddress;
                //DropDownList1_Affilation.SelectedValue = pd.Affiliation;

                if (pd.Affiliation.ToString() == "Other")
                {
                    DropDownList1_Affilation.SelectedIndex = -1;
                    uaffilation.Text = "Other";
                }
                else
                {
                    DataSourceSelectArguments args = new DataSourceSelectArguments();
                    DataView data = (DataView)(SqlDataSource1_allOrchestra.Select(args));
                    DataTable dt = data.ToTable();

                    int affilationIndex = -1;
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        // your index is in i
                        if (dt.Rows[i][0].ToString().Equals(pd.Affiliation))
                        {
                            affilationIndex = int.Parse(dt.Rows[i][1].ToString());
                            break;
                        }
                    }

                    if (affilationIndex == -1) DropDownList1_Affilation.SelectedValue = "-1";
                    else DropDownList1_Affilation.SelectedValue = affilationIndex.ToString();
                }

                uprofilepage.Text = pd.ProfilePage;
                urepertory.Text = pd.Repertory;

                List<User_Endorser> endorserList = pd.User_Endorser.ToList();
                myendorsmentlist.DataSource = endorserList;
                myendorsmentlist.DataBind();
                Session["myendorsmentlist"] = endorserList;

                var userinst = pd.Artist_Instrument.Select(y => y.InstrumentID).ToList();
                List<Instrument> mylist = entity.Instruments.Where(x => userinst.Contains(x.ID)).ToList();
                myinstrepeater.DataSource = mylist;
                myinstrepeater.DataBind();
                Session["myinstlist"] = mylist;

                var usertype = pd.Artist_ArtistType.ToList();//pd.UserCommonTable.User_UserType.ToList();
                var lookupusertypes = entity.ArtistTypes.ToList();

                chk_Composer.Checked = usertype.Where(x => x.ArtistTypeID == (lookupusertypes.Where(z => z.Name == "Composer").FirstOrDefault()).ID).Count() > 0;
                chk_Conductor.Checked = usertype.Where(x => x.ArtistTypeID == (lookupusertypes.Where(z => z.Name == "Conductor").FirstOrDefault()).ID).Count() > 0;
                chk_tp.Checked = usertype.Where(x => x.ArtistTypeID == (lookupusertypes.Where(z => z.Name == "Teacher/Professor").FirstOrDefault()).ID).Count() > 0;
                chk_Student.Checked = usertype.Where(x => x.ArtistTypeID == (lookupusertypes.Where(z => z.Name == "Student").FirstOrDefault()).ID).Count() > 0;
                chk_player.Checked = usertype.Where(x => x.ArtistTypeID == (lookupusertypes.Where(z => z.Name == "Player").FirstOrDefault()).ID).Count() > 0;

            }


            txt_artist_birthdate.Value = DateTime.Now.ToShortDateString();


        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);

            //string script = "alert(\"Hello\");";
            //ScriptManager.RegisterStartupScript(this, GetType(),
            //                      "ServerControlScript", msg, true);
        }

        protected void btn_artistadd_Click(object sender, EventArgs e)
        {
            try
            {
                Artist artist = new Artist();
                artist.FirstName = txt_artist_firstname.Text;
                artist.MiddleName = txt_artist_middlename.Text;
                artist.FamilyName = txt_artist_familyname.Text;
                artist.BirthDate = DateTime.ParseExact(txt_artist_birthdate.Value, "dd/mm/yyyy", CultureInfo.InvariantCulture);
                artist.Address = txt_artist_address.Text;
                artist.ZipCode = txt_artist_zipcode.Text;
                artist.TelNO = txt_artist_teleno.Text;
                artist.MobileNO = txt_artist_mobileno.Text;
                artist.FaxNo = txt_aritist_faxno.Text;
                artist.Remar = txt_artist_remark.Text;
                if (int.Parse(DropDownList1_Affilation.SelectedValue) == -1)
                    artist.Affiliation = uaffilation.Text;
                else artist.Affiliation = DropDownList1_Affilation.SelectedItem.Text;

                artist.FacebookAddress = ufacebookadd.Text;
                artist.TwitterAddress = utwitter.Text;
                artist.KakaoTalkAddress = ukakao.Text;
                if (!getPhoto(artist, 1, FileUpload5)) return;
                if (getPhoto(artist, 2, FileUpload6)) return;

                artist.ProfilePage = uprofilepage.Text;
                artist.Repertory = urepertory.Text;



                var artistID = artl.addArtistReturnNewID(artist);
                if (artistID != -1)
                {

                    //GridView3.DataSource = artl.getAllArtists();
                    //GridView3.DataBind();
                    GridView1.DataBind();
                    if (Session["myinstlist"] != null)
                    {
                        List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                        foreach (Instrument i in mylist)
                        {
                            Artist_Instrument artistInst = new Artist_Instrument();
                            artistInst.ArtistID = artistID;
                            artistInst.InstrumentID = i.ID;
                            artInstLogic.addArtistInstrument(artistInst);
                        }
                    }

                    //get all Artist types
                    List<int> usertypes = new List<int>();
                    if (chk_Composer.Checked) usertypes.Add(1);
                    if (chk_Conductor.Checked) usertypes.Add(2);
                    if (chk_tp.Checked) usertypes.Add(3);
                    if (chk_Student.Checked) usertypes.Add(4);
                    if (chk_player.Checked) usertypes.Add(5);

                    OrchestraDBEntities entity = new OrchestraDBEntities();

                    // register  user types
                    foreach (int i in usertypes)
                    {
                        Artist_ArtistType type = new Artist_ArtistType();
                        type.Artist = artistID;
                        type.ArtistTypeID = i;


                        entity.Artist_ArtistType.Add(type);
                        entity.SaveChanges();
                    }

                    // register endorsers

                    //register endorsers
                    if (Session["myendorsmentlist"] != null)
                    {
                        List<User_Endorser> mylist = (List<User_Endorser>)Session["myendorsmentlist"];
                        foreach (User_Endorser x in mylist)
                        {
                            User_Endorser ue = new User_Endorser();
                            ue.ArtistID = artist.ID;
                            //ue.UserID = user.ID;
                            ue.Email = x.Email;
                            ue.Name = x.Name;

                            entity.User_Endorser.Add(ue);
                            entity.SaveChanges();
                            //sending message to endorsers
                            sendEmailToEndorser(x.Email, artist, x);
                        }
                    }


                    DropDownList1_artistList.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanArtistTextBoxs();
                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }
        }

        public void updateArtistInfo()
        {
            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        int artistID = int.Parse(Session["ArtistID"].ToString());
                        Artist artist = context.Artists.Where(x => x.ID == artistID).FirstOrDefault();
                        artist.FirstName = txt_artist_firstname.Text;
                        artist.MiddleName = txt_artist_middlename.Text;
                        artist.FamilyName = txt_artist_familyname.Text;
                        artist.BirthDate = DateTime.ParseExact(txt_artist_birthdate.Value, "dd/mm/yyyy", CultureInfo.InvariantCulture);
                        artist.Address = txt_artist_address.Text;
                        artist.ZipCode = txt_artist_zipcode.Text;
                        artist.TelNO = txt_artist_teleno.Text;
                        artist.MobileNO = txt_artist_mobileno.Text;
                        artist.FaxNo = txt_aritist_faxno.Text;
                        artist.Remar = txt_artist_remark.Text;
                        if (int.Parse(DropDownList1_Affilation.SelectedValue) == -1)
                            artist.Affiliation = uaffilation.Text;
                        else artist.Affiliation = DropDownList1_Affilation.SelectedItem.Text;

                        artist.FacebookAddress = ufacebookadd.Text;
                        artist.TwitterAddress = utwitter.Text;
                        artist.KakaoTalkAddress = ukakao.Text;
                        if (FileUpload5.HasFile)
                            getPhoto(artist, 1, FileUpload5);
                        if (FileUpload6.HasFile)
                            getPhoto(artist, 2, FileUpload6);

                        artist.ProfilePage = uprofilepage.Text;
                        artist.Repertory = urepertory.Text;
                        context.SaveChanges();

                        // remove the previous artist and instrument
                        context.Artist_Instrument.RemoveRange(context.Artist_Instrument.Where(x => x.ArtistID == artistID).ToList());
                        
                        if (Session["myinstlist"] != null)
                        {
                            List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                            foreach (Instrument i in mylist)
                            {
                                Artist_Instrument artistInst = new Artist_Instrument();
                                artistInst.ArtistID = artist.ID;
                                artistInst.InstrumentID = i.ID;
                                context.Artist_Instrument.Add(artistInst);
                                context.SaveChanges();
                            }
                        }

                        //get all Artist types
                        List<int> usertypes = new List<int>();
                        if (chk_Composer.Checked) usertypes.Add(1);
                        if (chk_Conductor.Checked) usertypes.Add(2);
                        if (chk_tp.Checked) usertypes.Add(3);
                        if (chk_Student.Checked) usertypes.Add(4);
                        if (chk_player.Checked) usertypes.Add(5);

                        // remove the previous user types
                        context.Artist_ArtistType.RemoveRange(context.Artist_ArtistType.Where(x => x.Artist == artistID).ToList());

                        // register  user types
                        foreach (int i in usertypes)
                        {
                            Artist_ArtistType type = new Artist_ArtistType();
                            type.Artist = artist.ID;
                            type.ArtistTypeID = i;
                            
                            context.Artist_ArtistType.Add(type);
                            context.SaveChanges();
                        }

                        //// remove the previous endorsers
                        //context.User_Endorser.RemoveRange(context.User_Endorser.Where(x => x.ArtistID == artistID).ToList());

                        ////register endorsers
                        //if (Session["myendorsmentlist"] != null)
                        //{
                        //    List<User_Endorser> mylist = (List<User_Endorser>)Session["myendorsmentlist"];
                        //    foreach (User_Endorser x in mylist)
                        //    {
                        //        User_Endorser ue = new User_Endorser();
                        //        ue.ArtistID = artist.ID;
                        //        //ue.UserID = user.ID;
                        //        ue.Email = x.Email;
                        //        ue.Name = x.Name;

                        //        context.User_Endorser.Add(ue);
                        //        context.SaveChanges();
                        //        //sending message to endorsers
                        //        sendEmailToEndorser(x.Email, artist, x);
                        //    }
                        //}

                        //showMsg("Data inserted succssfuly");
                        cleanArtistTextBoxs();
                        dbContextTransaction.Commit();
                        isSuccess = true;

                    }
                    catch (Exception ee)
                    {
                        showMsg("Please check your inputs");
                        dbContextTransaction.Rollback();

                    }

                    if (isSuccess)
                    {
                        showMsg("Data inserted succssfuly");
                        cleanArtistTextBoxs();
                    }
                    else showMsg("Please check your inputs");


                    DropDownList1_artistList.DataBind();
                    GridView1.DataBind();

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


        public bool getPhoto(Artist info, int photonumber, FileUpload fileupload)
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
                    return false;
                }
            }

            if (photonumber == 1)
                info.Photo1 = fileupload.FileName;
            else
                info.Photo2 = fileupload.FileName;

            return true;
        }

        public void chk_boxChanged(object sender, EventArgs e)
        {

        }

        public void cleanArtistTextBoxs()
        {
            txt_artist_firstname.Text = "";
            txt_artist_middlename.Text = "";
            txt_artist_familyname.Text = "";
            txt_artist_birthdate.Value = "";
            txt_artist_address.Text = "";
            txt_artist_zipcode.Text = "";
            txt_artist_teleno.Text = "";
            txt_artist_mobileno.Text = "";
            txt_aritist_faxno.Text = "";
            txt_artist_remark.Text = "";
            ukakao.Text = "";
            ufacebookadd.Text = "";
            utwitter.Text = "";
            uprofilepage.Text = "";
            urepertory.Text = "";
            Session["myendorsmentlist"] = null;
            Session["myinstlist"] = null;

            myinstrepeater.DataSource = null;
            myinstrepeater.DataBind();

            myendorsmentlist.DataSource = null;
            myendorsmentlist.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //showMsg(DropDownList1.SelectedValue);
        }

        protected void btn_addInstrument_Click(object sender, EventArgs e)
        {
            Artist_Instrument artistInst = new Artist_Instrument();
            artistInst.ArtistID = int.Parse(DropDownList1_artistList.SelectedValue);
            artistInst.InstrumentID = int.Parse(DropDownList1_Instrument.SelectedValue);

            if (artInstLogic.addArtistInstrument(artistInst))
            {
                ListView_instrumentsplayedbyartist.DataBind();
            }
        }

        protected void btn_add_Inst_Click(object sender, EventArgs e)
        {
            Instrument inst = new Instrument();
            inst.ID = int.Parse(DropDownList1_InstrumentInTheMain.SelectedItem.Value);
            inst.EnglishName = DropDownList1_InstrumentInTheMain.SelectedItem.Text;

            if (Session["myinstlist"] != null)
            {
                List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                mylist.Add(inst);
                myinstrepeater.DataSource = mylist;
                myinstrepeater.DataBind();
                Session["myinstlist"] = mylist;
            }
            else
            {
                if (instrumentlist == null) instrumentlist = new List<Instrument>();
                this.instrumentlist.Add(inst);
                myinstrepeater.DataSource = this.instrumentlist;
                myinstrepeater.DataBind();

                Session["myinstlist"] = instrumentlist;
            }
        }

        public void removeinstrumentfromList(object sender, EventArgs e)
        {

        }

        public void removeinstrumentfrommyMainList(object sender, EventArgs e)
        {
            if (Session["myinstlist"] != null)
            {
                Button btn = (Button)sender;
                int ID = int.Parse(btn.CommandArgument.ToString());
                List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                mylist.RemoveAll(x => x.ID == ID);
                myinstrepeater.DataSource = mylist;
                myinstrepeater.DataBind();
                Session["myinstlist"] = mylist;
            }
        }

        public void serachTextValueChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            DropDownList1_artistList.DataBind();
            ListView_instrumentsplayedbyartist.DataBind();
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

        protected void buttonChangeImage(object sender, EventArgs e)
        {




            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            if (Session["SelectedArtistID"] != null)
            {

                int id = int.Parse(Session["SelectedArtistID"].ToString());

                var x = entity.Artists.Where(inst => inst.ID == id).FirstOrDefault();
                if (x != null)
                {


                    // photo #1
                    if (FileUpload3.HasFiles)
                    {
                        string ext = System.IO.Path.GetExtension(FileUpload3.FileName);
                        if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                        {
                            string path = Server.MapPath("~//Document//");
                            FileUpload3.SaveAs(path + FileUpload3.FileName);
                            x.Photo1 = FileUpload3.FileName;
                        }
                        else
                        {
                            showMsg("you can upload only jpeg,jpg,png,gif file formats, please check phot #2!");
                            return;
                        }
                    }

                    // photo #2
                    if (FileUpload4.HasFiles)
                    {
                        string ext = System.IO.Path.GetExtension(FileUpload4.FileName);
                        if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                        {
                            string path = Server.MapPath("~//Document//");
                            FileUpload4.SaveAs(path + FileUpload4.FileName);
                            x.Photo2 = FileUpload4.FileName;
                        }
                        else
                        {
                            showMsg("you can upload only jpeg,jpg,png,gif file formats, please check phot #2!");
                            return;
                        }
                    }

                    entity.SaveChanges();
                    GridView1.DataBind();
                }
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int id = int.Parse(GridView1.Rows[e.NewEditIndex].Cells[1].Text);
            Artist a = entity.Artists.Where(x => x.ID == id).FirstOrDefault();

            modalImageContainer.ImageUrl = "~/Document/" + a.Photo1;
            modalImageContainer2.ImageUrl = "~/Document/" + a.Photo2;
            Session["SelectedArtistID"] = GridView1.Rows[e.NewEditIndex].Cells[1].Text;
        }
        protected void DropDownList1_Affilation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (int.Parse(DropDownList1_Affilation.SelectedValue) == -1) uaffilation.Visible = true;
            else uaffilation.Visible = false;
        }
    }
}