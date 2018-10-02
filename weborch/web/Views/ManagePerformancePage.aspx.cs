using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Globalization;
using BusinessLogic;
using System.Data;

namespace web.Views
{
    public partial class ManagePerformancePage : System.Web.UI.Page
    {
        PerformanceLogic pl = new PerformanceLogic();
        UserCommonTable user;
        bool isUserCompany = false;
        OrchestraDBEntities entity = new OrchestraDBEntities();
        List<PerformanceDetail> myperformanceDetailList = new List<PerformanceDetail>();
        List<List<PerformanceDetail_Instrument_Artist>> myinstrumentdetailList = new List<List<PerformanceDetail_Instrument_Artist>>();
        static Page page;

        protected void Page_Load(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "PopPerformance", "showdatetime();", true);
            page = HttpContext.Current.Handler as Page;

            if (!IsPostBack)
            {
                //var user = (UserCommonTable)Session["User"];
                //if (user == null) Response.Redirect("~/LoginPage.aspx");
                user = (UserCommonTable)Session["User"];
                if (user != null)
                {
                    OrchestraDBEntities entity = new OrchestraDBEntities();
                    var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                    isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;

                    if (isUserCompany)
                    {
                        var performanceFilteredQuery = string.Format(@"SELECT p.*, OfficialName  FROM Main.Performance p
                                                join Core.Orchestra o on p.OrchestraID=o.ID
                                                where P.UserID={0} order by p.TimeStamp desc", user.ID);
                        SqlDataSource2_allPerformances.SelectCommand = performanceFilteredQuery;
                        GridView2.DataBind();
                    }
                    else Response.Redirect("~/Views/HomeView.aspx");

                }
                else Response.Redirect("~/Views/HomeView.aspx");

            }


            //// mamage file uploads

            //{
            //    if (Session["FileUpload1"] == null && FileUpload1.HasFile)
            //    {
            //        Session["FileUpload1"] = FileUpload1;
            //    }
            //    // This condition will occur on next postbacks        
            //    else if (Session["FileUpload1"] != null && (!FileUpload1.HasFile))
            //    {
            //        FileUpload1 = (FileUpload)Session["FileUpload1"];
            //    }
            //    //  when Session will have File but user want to change the file 
            //    // i.e. wants to upload a new file using same FileUpload control
            //    // so update the session to have the newly uploaded file
            //    else if (FileUpload1.HasFile)
            //    {
            //        Session["FileUpload1"] = FileUpload1;
            //        FileUpload1 = (FileUpload)Session["FileUpload1"];
            //    }
            //    else Session["FileUpload1"] = FileUpload1;
            //}
        }

        //[System.Web.Services.WebMethod]
        //[System.Web.Script.Services.ScriptMethod()]
        //public static void uploadFileChanged(int f) {
        //    //System.Web.HttpContext.Current.Session["FileUpload1"] = f;  
        //    if (HttpContext.Current != null)
        //    {
        //        //myfunc();
        //        //Page page = HttpContext.Current.Handler as Page;
        //        //var y = (FileUpload)page.FindControl("FileUpload1");
        //        //var x = y.HasFile;
        //        //System.Web.HttpContext.Current.Session["FileUpload1"] = (FileUpload)page.FindControl("FileUpload1");
        //    }
        //}

        //public static void myfunc() {

        //    if (HttpContext.Current != null)
        //    {
        //        //Page page = HttpContext.Current.Handler as Page;
        //        var y = (FileUpload)page.FindControl("FileUpload1");
        //    }

        //}
        public void btn_remove_ArtistInstrument_tolist(object sender, EventArgs e)
        {
            if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
            {
                Button btn = (Button)sender;
                var ids = btn.CommandArgument.ToString().Split(',');
                int artistID = int.Parse(ids[0]);
                int instrumentID = int.Parse(ids[1]);
                List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];

                mylist.RemoveAll(x => x.ArtistID == artistID & x.InstrumentID == instrumentID);
                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();
                Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
            }
        }


        public void btn_remove_ItemDetailData(object sender, EventArgs e)
        {
            if (Session["myperformanceDetailList"] != null)
            {
                Button btn = (Button)sender;
                var id = btn.CommandArgument.ToString();
                //int listindex = int.Parse(id);

                var artistinstdetailvalues = (List<List<PerformanceDetail_Instrument_Artist>>)Session["myinstrumentdetailList"];
                var myperformanceDetailList = (List<PerformanceDetail>)Session["myperformanceDetailList"];
                var myDetailObjlist = (List<detailviewModel>)Session["myDetailObjlist"];

                int index = myDetailObjlist.FindIndex(x => x.ID == int.Parse(id));

                artistinstdetailvalues.RemoveAt(index);
                myperformanceDetailList.RemoveAt(index);
                myDetailObjlist.RemoveAt(index);

                repeaterDetailMusicArtist.DataSource = myDetailObjlist;
                repeaterDetailMusicArtist.DataBind();

                Session["myinstrumentdetailList"] = artistinstdetailvalues;
                Session["myperformanceDetailList"] = myperformanceDetailList;
                Session["myDetailObjlist"] = myDetailObjlist;

                //int instrumentID = int.Parse(ids[1]);
                //List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];

                //mylist.RemoveAll(x => x.ArtistID == artistID & x.InstrumentID == instrumentID);
                //myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                //myPerformanceDetailArtistInstrumentlist.DataBind();
                //Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
            }
        }


        protected void btn_add_ArtistInstrument_tolist(object sender, EventArgs e)
        {
            PerformanceDetail_Instrument_Artist detail = new PerformanceDetail_Instrument_Artist();


            detail.ArtistID = int.Parse(DropDownList2_artistlist.SelectedValue);
            detail.Artist = new Artist();
            detail.Artist.FirstName = DropDownList2_artistlist.SelectedItem.Text;

            detail.InstrumentID = int.Parse(DropDownList3_instrumentlist.SelectedValue);
            detail.Instrument = new Instrument();
            detail.Instrument.EnglishName = DropDownList3_instrumentlist.SelectedItem.Text;

            if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
            {
                List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];
                mylist.Add(detail);

                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();

                Session["myendorsmentlist"] = mylist;
            }
            else
            {
                List<PerformanceDetail_Instrument_Artist> mylist = new List<PerformanceDetail_Instrument_Artist>();
                mylist.Add(detail);

                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();

                Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
            }
        }

        public void saveDetailClicked(object sender, EventArgs e)
        {
            bool isSuccess = false;

            {

                {
                    try
                    {
                        PerformanceDetail pd = new PerformanceDetail();
                        pd.Title = txt_performancetitle.Text;
                        pd.Orchestra = int.Parse(DropDownList1_orchestra.SelectedValue);
                        pd.Conductor = int.Parse(DropDownList2_conductor.SelectedValue);
                        pd.Composer = int.Parse(DropDownList4_composer.SelectedValue);
                        pd.Time = DateTime.Now;

                        // check the detial header 
                        if (Session["myperformanceDetailList"] == null)
                        {
                            myperformanceDetailList.Add(pd);
                            Session["myperformanceDetailList"] = myperformanceDetailList;
                        }
                        else
                        {
                            myperformanceDetailList = (List<PerformanceDetail>)Session["myperformanceDetailList"];
                            myperformanceDetailList.Add(pd);
                            Session["myperformanceDetailList"] = myperformanceDetailList;
                        }

                        // check detail instrument artist data
                        if (Session["myinstrumentdetailList"] == null)
                        {
                            if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
                                myinstrumentdetailList.Add((List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"]);
                            else
                                myinstrumentdetailList.Add(null);

                            Session["myinstrumentdetailList"] = myinstrumentdetailList;
                        }
                        else
                        {
                            myinstrumentdetailList = (List<List<PerformanceDetail_Instrument_Artist>>)Session["myinstrumentdetailList"];
                            if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
                                myinstrumentdetailList.Add((List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"]);
                            else
                                myinstrumentdetailList.Add(null);

                            Session["myinstrumentdetailList"] = myinstrumentdetailList;
                        }



                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        //dbContextTransaction.Rollback();
                    }

                    if (isSuccess)
                    {
                        //showMsg("Data inserted succssfuly");
                        Session["myPerformanceDetailArtistInstrumentlist"] = null;
                        //clear textbox

                        // mangage displayable objects
                        List<detailviewModel> myobjlist = new List<detailviewModel>();
                        if (Session["myperformanceDetailList"] != null)
                        {
                            var detail = (List<PerformanceDetail>)Session["myperformanceDetailList"];
                            for (int i = 0; i < detail.Count; i++)
                            {
                                detailviewModel d = new detailviewModel();
                                d.ID = i;
                                d.Title = detail[i].Title;
                                int cond = (int)detail[i].Conductor;
                                int comp = (int)detail[i].Composer;
                                d.Conductor = entity.Artists.Where(x => x.ID == cond).FirstOrDefault().FirstName;
                                d.Composer = entity.Artists.Where(x => x.ID == comp).FirstOrDefault().FirstName;
                                d.Time = detail[i].Time.ToString();

                                // if it has artist insturment list
                                if (Session["myinstrumentdetailList"] != null)
                                {
                                    var t = (List<List<PerformanceDetail_Instrument_Artist>>)Session["myinstrumentdetailList"];
                                    List<PerformanceDetail_Instrument_Artist> td = t[i];
                                    if (td != null)
                                    {
                                        for (int j = 0; j < td.Count; j++)
                                        {
                                            d.Artists += td[j].Artist.FirstName + ", ";
                                            d.Instruments += td[j].Instrument.EnglishName + ", ";
                                        }
                                    }
                                }

                                myobjlist.Add(d);
                            }
                        }

                        Session["myDetailObjlist"] = myobjlist;
                        myPerformanceDetailArtistInstrumentlist.DataBind();
                        repeaterDetailMusicArtist.DataSource = myobjlist;
                        repeaterDetailMusicArtist.DataBind();


                    }
                    else showMsg("Please check your inputs");
                }
            }


        }

        public void updatePerformanceinfo(object sender, EventArgs e)
        {
            bool isSuccess = false;
            OrchestraDBEntities context2 = entity;
            using (context2)
            {
                var dbContextTransaction = context2.Database.BeginTransaction();
                using (dbContextTransaction)
                {
                    try
                    {
                        var user = (UserCommonTable)Session["User"];

                        int myid = (int.Parse(GridView2.SelectedRow.Cells[1].Text));
                        Performance p = entity.Performances.Where(x => x.ID == myid).FirstOrDefault();
                        context2.PerformanceDetails.RemoveRange(context2.PerformanceDetails.Where(x => x.PerformanceID == p.ID));
                        context2.PerformanceDetail_Instrument_Artist.RemoveRange(context2.PerformanceDetail_Instrument_Artist.Where(x => x.PerformanceDetail.PerformanceID == p.ID));
                        
                        p.UserID = user.ID;
                        p.OrchestraID = int.Parse(DropDownList1.SelectedValue.ToString());
                        p.PerformanceTitle = txt_title.Text;
                        p.subtitle = txt_mainSubtitle.Text;
                        p.Theme = txt_mainsubjecttheme.Text;
                        p.OrchestraID = int.Parse(DropDownList1.SelectedItem.Value);
                        p.Type = txt_mainPerformanceType.Text;
                        p.ConductorID = int.Parse(DropDownList2_mainConductor.SelectedItem.Value);
                        p.MainTitleComposer = int.Parse(DropDownList2_maintitlecomposer.SelectedItem.Value);
                        p.MainInstrument = int.Parse(DropDownList2_maininstrument.SelectedItem.Value);
                        p.OrganizerInfo = txt_organizerinfo.Text;
                        p.Sponsor = txt_mainsponser.Text;
                        p.Language = txt_mainLanguage.Text;
                        p.Region = txt_mainRegion.Text;
                        p.City = txt_mainCity.Text;
                        p.Location = p.City;
                        p.StartDate = DateTime.ParseExact(txt_performancestartdate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
                        p.EndDate = DateTime.ParseExact(txt_performanceenddate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
                        p.PerformanceTime = txt_performanceTime.Text;
                        p.VideoLocation = txt_videolocation.Text;
                        if (!getPhoto(p, FileUpload1, 1)) return; // poseter
                        if (!getPhoto(p, FileUpload3, 2)) return; // brocher
                        p.ConcertHall = txt_ConcertHall.Text;
                        //p.Location = txt_location.Text;
                        p.TicketBox = txt_ticketbox.Text;

                        //p.UserID = user.ID;
                        //p.OrchestraID = int.Parse(DropDownList1.SelectedValue.ToString());
                        //p.PerformanceTitle = txt_title.Text;
                        //p.MainTitle = txt_mainTitleTheme.Text;
                        //p.StartDate = DateTime.ParseExact(txt_performancestartdate.Value, "dd/MM/yyyy", new CultureInfo("en-US"));
                        //p.EndDate = DateTime.ParseExact(txt_performanceenddate.Value, "dd/MM/yyyy", new CultureInfo("en-US"));
                        //p.OrchestraID = int.Parse(DropDownList1.SelectedItem.Value);
                        //p.Location = txt_location.Text;
                        //p.ConcertHall = txt_ConcertHall.Text;
                        //p.PerformanceTime = txt_performanceTime.Text;
                        //p.TicketBox = txt_ticketbox.Text;
                        //p.OrganizerInfo = txt_organizerinfo.Text;
                        //p.VideoLocation = txt_videolocation.Text;
                        //if (!getPhoto(p, FileUpload1, 1)) return;
                        //if (!getPhoto(p, FileUpload3, 2)) return;


                        context2.SaveChanges();

                        var myperformancedetail = (List<PerformanceDetail>)Session["myperformanceDetailList"];
                        var artistinstlist = (List<List<PerformanceDetail_Instrument_Artist>>)Session["myinstrumentdetailList"];

                        context2.SaveChanges();

                        for (int i = 0; i < myperformancedetail.Count; i++)
                        {
                            var previousPD = myperformancedetail[i];
                            PerformanceDetail pd = new PerformanceDetail();
                            pd.PerformanceID = p.ID;
                            pd.Performance = p;
                            pd.Conductor = previousPD.Conductor;
                            pd.Composer = previousPD.Composer;
                            pd.Title = previousPD.Title;
                            pd.Orchestra = previousPD.Orchestra;
                            pd.Time = previousPD.Time;


                            context2.PerformanceDetails.Add(pd);
                            context2.SaveChanges();


                            // register artist and instrument
                            if (artistinstlist[i] != null)
                            {
                                List<PerformanceDetail_Instrument_Artist> mylist = artistinstlist[i];
                                foreach (PerformanceDetail_Instrument_Artist x in mylist)
                                {
                                    PerformanceDetail_Instrument_Artist detail = new PerformanceDetail_Instrument_Artist();
                                    detail.PerformanceDetailID = pd.ID;
                                    detail.PerformanceDetail = pd;
                                    detail.PerformanceDetail.Performance = p;
                                    detail.PerformanceDetail.PerformanceID = p.ID;
                                    detail.ArtistID = x.ArtistID;
                                    detail.InstrumentID = x.InstrumentID;

                                    context2.PerformanceDetail_Instrument_Artist.Add(detail);
                                    context2.SaveChanges();
                                }
                            }

                        }

                        dbContextTransaction.Commit();
                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }

                    if (isSuccess)
                    {
                        //ListView1.DataBind();
                        GridView2.DataBind();
                        showMsg("Data inserted succssfuly");
                        cleanInputs();
                        btn_addPerformance.Visible = true;
                        btn_updatePerformance.Visible = false;
                    }
                    else showMsg("Please check your inputs");

                }
            }
        }

        public void cancelupdatePerformanceinfo(object sender, EventArgs e)
        {
            cleanInputs();
            Session["FileUpload1"] = null;
            btn_addPerformance.Visible = true;
            btn_updatePerformance.Visible = false;
        }
        public void saveAllPerformanceInformation(object sender, EventArgs e)
        {

            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        var user = (UserCommonTable)Session["User"];

                        Performance p = new Performance();
                        p.UserID = user.ID;
                        p.OrchestraID = int.Parse(DropDownList1.SelectedValue.ToString());
                        p.PerformanceTitle = txt_title.Text;
                        p.subtitle = txt_mainSubtitle.Text;
                        p.Theme = txt_mainsubjecttheme.Text;
                        p.OrchestraID = int.Parse(DropDownList1.SelectedItem.Value);
                        p.Type = txt_mainPerformanceType.Text;
                        p.ConductorID = int.Parse(DropDownList2_mainConductor.SelectedItem.Value);
                        p.MainTitleComposer = int.Parse(DropDownList2_maintitlecomposer.SelectedItem.Value);
                        p.MainInstrument = int.Parse(DropDownList2_maininstrument.SelectedItem.Value);
                        p.OrganizerInfo = txt_organizerinfo.Text;
                        p.Sponsor = txt_mainsponser.Text;
                        p.Language = txt_mainLanguage.Text;
                        p.Region = txt_mainRegion.Text;
                        p.City = txt_mainCity.Text;
                        p.Location = p.City;
                        p.StartDate = DateTime.ParseExact(txt_performancestartdate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
                        p.EndDate = DateTime.ParseExact(txt_performanceenddate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
                        p.PerformanceTime = txt_performanceTime.Text;
                        p.VideoLocation = txt_videolocation.Text;
                        if (!getPhoto(p, FileUpload1, 1)) return; // poseter
                        if (!getPhoto(p, FileUpload3, 2)) return; // brocher
                        p.ConcertHall = txt_ConcertHall.Text;
                        //p.Location = txt_location.Text;
                        p.TicketBox = txt_ticketbox.Text;
                        p.TimeStamp = DateTime.Now;
                        context.Performances.Add(p);
                        context.SaveChanges();

                        var myperformancedetail = (List<PerformanceDetail>)Session["myperformanceDetailList"];
                        var artistinstlist = (List<List<PerformanceDetail_Instrument_Artist>>)Session["myinstrumentdetailList"];

                        for (int i = 0; i < myperformancedetail.Count; i++)
                        {

                            PerformanceDetail pd = myperformancedetail[i];
                            pd.Performance = p;
                            pd.PerformanceID = p.ID;

                            context.PerformanceDetails.Add(pd);
                            context.SaveChanges();

                            // register artist and instrument
                            if (artistinstlist[i] != null)
                            {
                                List<PerformanceDetail_Instrument_Artist> mylist = artistinstlist[i];
                                foreach (PerformanceDetail_Instrument_Artist x in mylist)
                                {
                                    PerformanceDetail_Instrument_Artist detail = new PerformanceDetail_Instrument_Artist();
                                    detail.PerformanceDetailID = pd.ID;
                                    detail.ArtistID = x.ArtistID;
                                    detail.InstrumentID = x.InstrumentID;

                                    context.PerformanceDetail_Instrument_Artist.Add(detail);
                                    context.SaveChanges();
                                }
                            }

                        }

                        dbContextTransaction.Commit();
                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }

                    if (isSuccess)
                    {
                        //ListView1.DataBind();
                        GridView2.DataBind();
                        showMsg("Data inserted succssfuly");
                        cleanInputs();
                    }
                    else showMsg("Please check your inputs");

                }
            }
        }

        public void cleanInputs()
        {

            
            txt_title.Text = "";
            txt_mainSubtitle.Text = "";
            txt_mainsubjecttheme.Text = "";
            DropDownList1.SelectedItem.Value = "";
            txt_mainPerformanceType.Text = "";
            DropDownList2_mainConductor.SelectedItem.Value = "";
            DropDownList2_maintitlecomposer.SelectedItem.Value = "";
            DropDownList2_maininstrument.SelectedItem.Value = "";
            txt_organizerinfo.Text = "";
            txt_mainsponser.Text = "";
            txt_mainLanguage.Text = "";
            txt_mainRegion.Text = "";
            txt_mainCity.Text = "";
            txt_performancestartdate.Value = "";
            txt_performanceenddate.Value = "";
            txt_performanceTime.Text = "";
            txt_videolocation.Text = "";
            txt_ConcertHall.Text = "";
            txt_ticketbox.Text = "";
            

            Session["myperformanceDetailList"] = null;
            Session["myinstrumentdetailList"] = null;
            Session["myDetailObjlist"] = null;

            repeaterDetailMusicArtist.DataSource = null;
            repeaterDetailMusicArtist.DataBind();
            myPerformanceDetailArtistInstrumentlist.DataSource = null;
            myPerformanceDetailArtistInstrumentlist.DataBind();



        }

        public void btn_performance_Click(object sender, EventArgs e)
        {
            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {

                    try
                    {
                        var user = (UserCommonTable)Session["User"];


                        Performance p = new Performance();
                        p.UserID = user.ID;
                        p.OrchestraID = int.Parse(DropDownList1.SelectedValue.ToString());
                        p.PerformanceTitle = txt_title.Text;
                        //p.MainTitle = txt_mainTitleTheme.Text;
                        //p.PerformanceDate= DateTime.Parse(txt_performancedate.Text);
                        p.StartDate = DateTime.ParseExact(txt_performancestartdate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
                        p.EndDate = DateTime.ParseExact(txt_performanceenddate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
                        //p.PerformanceDay = txt_performanceday.Text;
                        p.OrchestraID = int.Parse(DropDownList1.SelectedItem.Value);
                        //p.Location = txt_location.Text;
                        p.ConcertHall = txt_ConcertHall.Text;
                        //p.PerformanceHour = txt_peformancehour.Text;  
                        p.PerformanceTime = txt_performanceTime.Text;
                        p.TicketBox = txt_ticketbox.Text;
                        p.OrganizerInfo = txt_organizerinfo.Text;
                        p.VideoLocation = txt_videolocation.Text;
                        //p.PerformanceDay = "Sunday";
                        if (!getPhoto(p, FileUpload1, 1)) return;
                        if (!getPhoto(p, FileUpload3, 2)) return;
                        context.Performances.Add(p);
                        context.SaveChanges();

                        var myperformancedetail = (List<PerformanceDetail>)Session["myperformanceDetailList"];
                        var artistinstlist = (List<List<PerformanceDetail_Instrument_Artist>>)Session["myinstrumentdetailList"];
                        for (int i = 0; i < myperformancedetail.Count; i++)
                        {

                            PerformanceDetail pd = myperformancedetail[i];
                            pd.PerformanceID = p.ID;
                            //pd.Title = txt_performancetitle.Text;
                            //pd.Orchestra = int.Parse(DropDownList1_orchestra.SelectedValue);
                            ////pd.Instrument = int.Parse(DropDownList_instrumentlist.SelectedValue);
                            //pd.Conductor = int.Parse(DropDownList2_conductor.SelectedValue);
                            ////pd.Player = int.Parse(DropDownList3_player.SelectedValue);
                            //pd.Composer = int.Parse(DropDownList4_composer.SelectedValue);
                            //pd.Time = DateTime.Parse(txt_time.Value);

                            context.PerformanceDetails.Add(pd);
                            context.SaveChanges();

                            //// register artist and instrument
                            //if (artistinstlist[i] != null)
                            //{
                            //    List<PerformanceDetail_Instrument_Artist> mylist = artistinstlist[i];
                            //    foreach (PerformanceDetail_Instrument_Artist x in mylist)
                            //    {
                            //        PerformanceDetail_Instrument_Artist detail = new PerformanceDetail_Instrument_Artist();
                            //        detail.PerformanceDetailID = pd.ID;
                            //        detail.ArtistID = x.ArtistID;
                            //        detail.InstrumentID = x.InstrumentID;

                            //        context.PerformanceDetail_Instrument_Artist.Add(detail);
                            //        context.SaveChanges();
                            //    }
                            //}

                        }

                        dbContextTransaction.Commit();
                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }

                    if (isSuccess)
                    {
                        //ListView1.DataBind();
                        GridView2.DataBind();
                        showMsg("Data inserted succssfuly");
                    }
                    else showMsg("Please check your inputs");



                }
            }


        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }


        public bool getPhoto(Performance p, FileUpload fileupload, int photonumber)
        {
            //if (Session["FileUpload1"] != null && (!fileupload.HasFile))
            //{
            //    fileupload = (FileUpload)Session["FileUpload1"];
            //}

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

                if (photonumber == 1)
                    p.PhotoAddLocation = fileupload.FileName;
                if (photonumber == 2)
                    p.Brochure = fileupload.FileName;
            }

            return true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_addPerformance.Visible = false;
            btn_updatePerformance.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "scrolltothetop", "scrolltothetop();", true);

            //GridViewRow row = GridView1.SelectedRow;
            //var x = row.Cells[1].Text;

            Session["PerformanceDetailID"] = GridView2.SelectedRow.Cells[1].Text;
            int myid = (int.Parse(GridView2.SelectedRow.Cells[1].Text));
            Performance p = entity.Performances.Where(x => x.ID == myid).FirstOrDefault();
            //Response.Redirect("ManagePerformanceDetailPage.aspx");

            ////=====================================================================

            DropDownList1.SelectedValue = p.OrchestraID.ToString();
            txt_title.Text = p.PerformanceTitle;
            txt_mainSubtitle.Text = p.subtitle;
            txt_mainsubjecttheme.Text = p.Theme;
            DropDownList1.SelectedItem.Value = p.OrchestraID.ToString();
            txt_mainPerformanceType.Text = p.Type;
            DropDownList2_mainConductor.SelectedItem.Value = p.ConductorID.ToString();
            DropDownList2_maintitlecomposer.SelectedItem.Value = p.MainTitleComposer.ToString();
            DropDownList2_maininstrument.SelectedItem.Value = p.MainInstrument.ToString();
            txt_organizerinfo.Text = p.OrganizerInfo.ToString();
            txt_mainsponser.Text = p.Sponsor.ToString();
            txt_mainLanguage.Text = p.Language.ToString();
            txt_mainRegion.Text = p.Region.ToString();
            txt_mainCity.Text = p.City;
            txt_performancestartdate.Value = String.Format("{0:dd/MM/yy}", p.StartDate);
            txt_performanceenddate.Value = String.Format("{0:dd/MM/yy}", p.EndDate);
            //p.StartDate = DateTime.ParseExact(txt_performancestartdate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
            //p.EndDate = DateTime.ParseExact(txt_performanceenddate.Value, "dd/mm/yyyy", new CultureInfo("en-US"));
            txt_performanceTime.Text = p.PerformanceTime;
            txt_videolocation.Text = p.VideoLocation;
            txt_ConcertHall.Text = p.ConcertHall;
            txt_ticketbox.Text = p.TicketBox;


            //=================================================================================

            ////DropDownList1.SelectedValue = p.OrchestraID.ToString();
            ////txt_title.Text = p.PerformanceTitle;
            //////txt_mainTitleTheme.Text = p.MainTitle;
            ////txt_performancestartdate.Value = String.Format("{0:DD/MM/YYYY}", p.StartDate);
            ////txt_performanceenddate.Value = String.Format("{0:DD/MM/YYYY}", p.EndDate);
            ////DropDownList1.SelectedItem.Value = p.OrchestraID.ToString();
            //////txt_location.Text = p.Location;
            ////txt_ConcertHall.Text = p.ConcertHall;
            ////txt_performanceTime.Text = p.PerformanceTime.ToString();
            ////txt_ticketbox.Text = p.TicketBox.ToString();
            ////txt_organizerinfo.Text = p.OrganizerInfo;
            ////txt_videolocation.Text = p.VideoLocation;


            // details
            var pd = p.PerformanceDetails.ToList();
            Session["myperformanceDetailList"] = pd;

            var myinslist = new List<List<PerformanceDetail_Instrument_Artist>>();
            foreach (var a in pd) myinslist.Add(a.PerformanceDetail_Instrument_Artist.ToList());

            Session["myinstrumentdetailList"] = myinslist;
            //var d1 = pd[0].PerformanceDetail_Instrument_Artist.ToList();

            // mangage displayable objects
            List<detailviewModel> myobjlist = new List<detailviewModel>();
            if (Session["myperformanceDetailList"] != null)
            {
                var detail = (List<PerformanceDetail>)Session["myperformanceDetailList"];
                for (int i = 0; i < detail.Count; i++)
                {
                    detailviewModel d = new detailviewModel();
                    d.ID = i;
                    d.Title = detail[i].Title;
                    int cond = (int)detail[i].Conductor;
                    int comp = (int)detail[i].Composer;
                    d.Conductor = entity.Artists.Where(x => x.ID == cond).FirstOrDefault().FirstName;
                    d.Composer = entity.Artists.Where(x => x.ID == comp).FirstOrDefault().FirstName;
                    d.Time = detail[i].Time.ToString();

                    // if it has artist insturment list
                    if (Session["myinstrumentdetailList"] != null)
                    {
                        var t = (List<List<PerformanceDetail_Instrument_Artist>>)Session["myinstrumentdetailList"];
                        List<PerformanceDetail_Instrument_Artist> td = t[i];
                        if (td != null)
                        {
                            for (int j = 0; j < td.Count; j++)
                            {
                                d.Artists += td[j].Artist.FirstName + ", ";
                                d.Instruments += td[j].Instrument.EnglishName + ", ";
                            }
                        }
                    }

                    myobjlist.Add(d);
                }
            }

            Session["myDetailObjlist"] = myobjlist;
            repeaterDetailMusicArtist.DataSource = myobjlist;
            repeaterDetailMusicArtist.DataBind();

            entity.Dispose();


        }


        public Performance getHeaderPeformanceData(int performanceID)
        {
            return pl.getPerformanceById(performanceID);
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            //if (!isUserCompany)
            //{
            //    if (e.Row.RowType == DataControlRowType.DataRow)
            //    {
            //        {
            //            Button btnEdit = (Button)e.Row.FindControl("btnEdit");
            //            ((CommandField)((DataControlFieldCell)(e.Row.Cells[0])).ContainingField).ShowEditButton = false;
            //            ((CommandField)((DataControlFieldCell)(e.Row.Cells[0])).ContainingField).ShowDeleteButton = false;

            //        }
            //    }
            //}
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            int id = int.Parse(GridView2.Rows[e.NewEditIndex].Cells[1].Text);
            Performance a = entity.Performances.Where(x => x.ID == id).FirstOrDefault();

            modalImageContainer.ImageUrl = "~/Document/" + a.PhotoAddLocation;
            modalImageContainer2.ImageUrl = "~/Document/" + a.Brochure;
            Session["SelectedPerformanceID"] = id;
        }

        protected void buttonChangeImage(object sender, EventArgs e)
        {
            if (FileUpload2.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(FileUpload2.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    FileUpload2.SaveAs(path + FileUpload2.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return;
                }
            }


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            if (Session["SelectedPerformanceID"] != null)
            {

                int id = int.Parse(Session["SelectedPerformanceID"].ToString());
                OrchestraDBEntities entity = new OrchestraDBEntities();

                var x = entity.Performances.Where(inst => inst.ID == id).FirstOrDefault();
                if (x != null)
                {
                    x.PhotoAddLocation = FileUpload2.FileName;
                    entity.SaveChanges();
                    GridView2.DataBind();
                }
            }

        }

        protected void buttonChangeImage2(object sender, EventArgs e)
        {
            if (FileUpload4.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(FileUpload4.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    FileUpload4.SaveAs(path + FileUpload4.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return;
                }
            }


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            if (Session["SelectedPerformanceID"] != null)
            {

                int id = int.Parse(Session["SelectedPerformanceID"].ToString());
                OrchestraDBEntities entity = new OrchestraDBEntities();

                var x = entity.Performances.Where(inst => inst.ID == id).FirstOrDefault();
                if (x != null)
                {
                    x.Brochure = FileUpload4.FileName;
                    entity.SaveChanges();
                    GridView2.DataBind();
                }
            }

        }

        protected void repeater_performanceList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView drv = (DataRowView)e.Item.DataItem;
                int ID = Convert.ToInt32(drv["ID"]);

                LinkButton lnkt = (LinkButton)e.Item.FindControl("tumbinallink");
                lnkt.PostBackUrl = "PerformanceDetailPage.aspx?ID=" + ID.ToString();

            }
        }

    }

    public class detailviewModel
    {
        public int ID { get; set; }
        public string Title { get; set; }
        public string Conductor { get; set; }
        public string Composer { get; set; }
        public string Artists { get; set; }
        public string Instruments { get; set; }
        public string Time { get; set; }

    }
}