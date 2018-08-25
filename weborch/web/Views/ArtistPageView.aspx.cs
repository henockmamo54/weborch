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
    public partial class ArtistPageView : System.Web.UI.Page
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

                artistsRepeater.DataSource = SqlDataSource3_ArtistListForAudience;
                artistsRepeater.DataBind();

                user = (UserCommonTable)Session["User"];
                if (user != null)
                {
                    OrchestraDBEntities entity = new OrchestraDBEntities();
                    var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                    bool isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
                    foraudience.Visible = !isUserCompany;
                    formanaging.Visible = isUserCompany;
                }
            }

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
                getPhoto(artist, 1, FileUpload1);
                getPhoto(artist, 2, FileUpload2);

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


        public void getPhoto(Artist info, int photonumber, FileUpload fileupload)
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

        protected void DropDownList1_artistType_SelectedIndexChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (DropDownList1_artistType.SelectedIndex != -1) filterQuery = " where ArtistType.NAME like '%"+DropDownList1_artistType.SelectedItem.Text+"%'";

            SqlDataSource3_ArtistListForAudience.SelectCommand = string.Format(@"SELECT core.artist.firstname,
       core.artist.middlename,
       core.artist.familyname,
       core.artist.photo1,
       core.artist.affiliation,
       ArtistType.NAME AS ArtistType,
       inst.namevalues AS instruments
FROM   core.artist
       INNER JOIN (SELECT
       artist,
       Stuff((SELECT ', ' + NAME
              FROM   (SELECT at.artist,
                             al.NAME
                      FROM   drived.artist_artisttype at
                             JOIN lookup.artisttype al
                               ON at.artisttypeid = al.id)x
              WHERE  ( artist = Results.artist )
              FOR xml path(''), type).value('(./text())[1]', 'VARCHAR(MAX)'), 1
                                     , 2, '')
       AS NAME
                   FROM   drived.artist_artisttype Results
                   GROUP  BY artist) ArtistType
               ON core.artist.id = ArtistType.artist
       JOIN
              (SELECT
       artist,
                    Stuff((SELECT ', ' + englishname
                           FROM   (SELECT ai.artistid,
                                          i.englishname
                                   FROM   drived.artist_instrument ai
                                          JOIN core.instrument i
                                            ON ai.instrumentid = i.id)x
                           WHERE  ( artistid = Results.artist )
                           FOR xml
       path(''), type).value('(./text())[1]', 'VARCHAR(MAX)'), 1
                                           , 2, '')
                    AS NameValues
             FROM   drived.artist_artisttype Results
             GROUP  BY artist) inst
         ON inst.artist = core.artist.id  {0}", filterQuery);

            artistsRepeater.DataSource = SqlDataSource3_ArtistListForAudience;
            artistsRepeater.DataBind();
        }
    }
}