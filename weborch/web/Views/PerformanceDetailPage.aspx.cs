using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using BusinessLogic;

namespace web.Views
{
    public partial class PerformanceDetailPage : System.Web.UI.Page
    {
        int PDID = 0;
        UserCommonTable user;
        bool isUserCompany = false;
        PerformanceLogic pl = new PerformanceLogic();

        // later this will be removed
        int likecount = 10;
        int dislikecount = 7;

        bool isliked = false;
        bool isdisliked = false;
        ParentCommentLogic pc = new ParentCommentLogic();
        ChildCommentLogic cl = new ChildCommentLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null)
            {
                int idByStringQuery = int.Parse(Request.QueryString["ID"]);
                Session["PerformanceDetailID"] = idByStringQuery;
            }

            if (Session["PerformanceDetailID"] != null)
            {
                int PDID = int.Parse(Session["PerformanceDetailID"].ToString());
                dropdown_performance.SelectedValue = PDID.ToString();

                SqlDataSource1_performanceDetailList.SelectCommand = string.Format(@"
                            select pd.ID, p.PerformanceTitle,pd.Title,
                            (c.FirstName + ' '+ c.MiddleName + ' '+ c.FamilyName) as Conductor,
                            (co.FirstName + ' '+ co.MiddleName + ' '+ co.FamilyName) as Composer,
                            list.Artists,list.Instruments,
                            pd.Time from Main.PerformanceDetail pd
                            join Core.Orchestra o on pd.Orchestra=o.ID
                            join Main.Performance p on p.ID=pd.PerformanceID
                            join  (select a.* from Core.Artist a 
		                            join Drived.Artist_ArtistType at on a.ID= at.Artist
		                            join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		                            where al.Name like '%Conductor%') c on c.ID= pd.Conductor
                            join  (select a.* from Core.Artist a 
		                            join Drived.Artist_ArtistType at on a.ID= at.Artist
		                            join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		                            where al.Name like '%Composer%') co on co.ID= pd.Composer
                            join(
		                            SELECT
			                             PerformanceDetailID,
			                             STUFF(
				                             (SELECT ',' + Name
				                              FROM (
		                            select distinct pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		                             from Drived.PerformanceDetail_Instrument_Artist pia 
		                            join Core.Artist a on a.ID = pia.ArtistID
		                            join Core.Instrument i on i.ID = pia.InstrumentID
		                            ) x
		                            where x.PerformanceDetailID= a.PerformanceDetailID
				                              FOR XML PATH (''))
				                              , 1, 1, '')  AS Artists,

			                             STUFF(
				                             (SELECT ','+ instrument
				                              FROM (
		                            select distinct  pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		                             from Drived.PerformanceDetail_Instrument_Artist pia 
		                            join Core.Artist a on a.ID = pia.ArtistID
		                            join Core.Instrument i on i.ID = pia.InstrumentID
		                            ) x
		                            where x.PerformanceDetailID= a.PerformanceDetailID
				                              FOR XML PATH (''))
				                              , 1, 1, '')  AS Instruments

		                            FROM Drived.PerformanceDetail_Instrument_Artist AS a
		                            GROUP BY PerformanceDetailID

                            ) list on pd.ID = list.PerformanceDetailID
                                where pd.PerformanceID={0}", PDID);

            }

            user = (UserCommonTable)Session["User"];
            if (user != null)
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
            }

            showandhidebtnforthepanel.Visible = isUserCompany;
            forAudience.Visible = !isUserCompany;
            formanaging.Visible = isUserCompany;

            getHeaderPeformanceData();

            talbereplacingrepeater.DataSource = SqlDataSource1_performanceDetailList;
            talbereplacingrepeater.DataBind();

            likecountspan.InnerText = likecount.ToString();
            dislikecountspan.InnerText = dislikecount.ToString();

            var parcomm = pc.getChildCommentByParentID(3);
            Repeater2.DataSource = parcomm;
            Repeater2.DataBind();

        }


        public void LikeClicked(object sender, CommandEventArgs e)
        {
            var value = e.CommandArgument.ToString().Split(',');
            int id = int.Parse(value[0]);
            int isLike = int.Parse(value[1]);

            if (isLike == 1) {
                if (isliked)
                {
                    isliked = false;
                    likecount--;
                    likebutton.Visible = true;
                    likebuttonliked.Visible = false;
                }
                else {
                    isliked = true;
                    likecount++;
                    likebutton.Visible = false;
                    likebuttonliked.Visible = true;

                    dislikebutton.Visible = true;
                    dislikebuttondisliked.Visible = false;
                    if (isdisliked) {
                        dislikecount--;
                        isdisliked = false;
                    }

                }
                likecountspan.InnerText = likecount.ToString();
            }
            else{
                if (isdisliked)
                {
                    isdisliked = false;
                    dislikecount--;
                    dislikebutton.Visible = true;
                    dislikebuttondisliked.Visible = false;
                }
                else
                {
                    isdisliked = true;
                    dislikecount++;
                    dislikebutton.Visible = false;
                    dislikebuttondisliked.Visible = true;


                    likebutton.Visible = true;
                    likebuttonliked.Visible = false;
                    if (isliked)
                    {
                        likecount--;
                        isliked = false;
                    }
                }
                dislikecountspan.InnerText = dislikecount.ToString();
            }

            //OrchestraDBEntities entities = new OrchestraDBEntities();
            //var myval = entities.BulletinLikeUnlikes.Where(x => x.PostID == id & x.UserID == myuser.ID).ToList();
            //if (myval.Count > 0)
            //{

            //    if (isLike == 1)
            //    {
            //        if (myval.FirstOrDefault().islike == 1)
            //            myval.FirstOrDefault().islike = 0;
            //        else myval.FirstOrDefault().islike = 1;
            //    }
            //    else
            //    {
            //        if (myval.FirstOrDefault().islike == -1)
            //            myval.FirstOrDefault().islike = 0;
            //        else myval.FirstOrDefault().islike = -1;
            //    }
            //    entities.SaveChanges();
            //}
            //else
            //{
            //    BulletinLikeUnlike b = new BulletinLikeUnlike();
            //    b.PostID = id;
            //    b.UserID = myuser.ID;
            //    b.islike = isLike;
            //    b.timestamp = DateTime.Now;
            //    entities.BulletinLikeUnlikes.Add(b);
            //    entities.SaveChanges();
            //}

            //BulletinLogic bl = new BulletinLogic();

            //Repeater1.DataSource = bl.getAllMsg(myuser.ID);
            //Repeater1.DataBind();

        }


        protected void btnComment_Click(object sender, CommandEventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtComment") as TextBox).Text;


            ParentCommentTable pt = new ParentCommentTable();
            pt.Username = "anonymous";
            pt.CommentMessage = message;
            pt.PostID = int.Parse(e.CommandArgument.ToString());

            pc.addParentComment(pt);

            var value = e.CommandArgument;

            System.Console.WriteLine("on btn click");

            var parcomm = pc.getChildCommentByParentID(3);
            Repeater2.DataSource = parcomm;
            Repeater2.DataBind();

        }

        protected void btnAddDetailComment_Click(object sender, CommandEventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;


            ChildCommentTable ct = new ChildCommentTable();
            ct.Username = "anonymous";
            ct.CommentMessage = message;
            ct.ParentCommentID = int.Parse(e.CommandArgument.ToString());
            cl.addChildComment(ct);

            var parcomm = pc.getChildCommentByParentID(3);
            Repeater2.DataSource = parcomm;
            Repeater2.DataBind();

        }


        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var detail = (Repeater)item.FindControl("detailRepeater");

                //pc.getAllParentComments().Take(2).ToList()
                var x = cl.getChildCommentByParentID(((ParentCommentTable)e.Item.DataItem).ID);
                detail.DataSource = x;
                detail.DataBind();

                string msg = ((ParentCommentTable)e.Item.DataItem).CommentMessage;
                System.Console.WriteLine(msg);
            }
        }
        

        public void getHeaderPeformanceData()
        {
            if (Session["PerformanceDetailID"] != null)
            {
                int PDID = int.Parse(Session["PerformanceDetailID"].ToString());
                Performance p = pl.getPerformanceById(PDID);
                performancePosterImage.ImageUrl = "~/Document/" + p.PhotoAddLocation;
                organizer.InnerText = p.OrganizerInfo;
                location.InnerText = p.Location;
                startingdate.InnerText = ((DateTime)(p.StartDate)).ToShortDateString();
                enddate.InnerText = ((DateTime)(p.EndDate)).ToShortDateString();
                concerthall.InnerText = p.ConcertHall;
                performanceTitle.InnerText = p.PerformanceTitle;
                

            }
        }

        public void addDetailClicked(object sender, EventArgs e)
        {

            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        PerformanceDetail pd = new PerformanceDetail();

                        pd.PerformanceID = int.Parse(dropdown_performance.SelectedValue);
                        pd.Title = txt_performancetitle.Text;
                        pd.Orchestra = int.Parse(DropDownList1_orchestra.SelectedValue);
                        //pd.Instrument = int.Parse(DropDownList_instrumentlist.SelectedValue);
                        pd.Conductor = int.Parse(DropDownList2_conductor.SelectedValue);
                        //pd.Player = int.Parse(DropDownList3_player.SelectedValue);
                        pd.Composer = int.Parse(DropDownList4_composer.SelectedValue);
                        pd.Time = DateTime.Parse(txt_time.Value);

                        context.PerformanceDetails.Add(pd);
                        context.SaveChanges();

                        // register artist and instrument
                        if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
                        {
                            List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];
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

                        dbContextTransaction.Commit();
                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }

                    if (isSuccess)
                    {
                        GridView1.DataBind();
                        showMsg("Data inserted succssfuly");

                        showandhidebtnforthepanel.Visible = true;
                        AddNewEntryPanel.Visible = false;

                    }
                    else showMsg("Please check your inputs");
                }
            }
        }

        public void btn_ADD_ONClick_showAndHideTheDataEntryPanel(object sender, EventArgs e)
        {
            showandhidebtnforthepanel.Visible = false;
            btn_update.Visible = false;
            btn_register.Visible = true;
            AddNewEntryPanel.Visible = true;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ToggleScript", "showdattime();", true);
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            OrchestraDBEntities entity = new OrchestraDBEntities();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ToggleScript", "showdattime();", true);

            showandhidebtnforthepanel.Visible = false;
            AddNewEntryPanel.Visible = true;
            btn_update.Visible = true;
            btn_register.Visible = false;

            var cell = GridView1.SelectedRow.Cells[1];
            var mystring = cell.Text.ToString();
            int detailID = int.Parse(mystring);

            PerformanceDetail pd = entity.PerformanceDetails.Where(x => x.ID == detailID).FirstOrDefault();

            if (pd != null)
            {
                dropdown_performance.SelectedValue = pd.PerformanceID.ToString();
                txt_performancetitle.Text = pd.Title;
                DropDownList1_orchestra.SelectedValue = pd.Orchestra.ToString();
                DropDownList2_conductor.SelectedValue = pd.Conductor.ToString();
                DropDownList4_composer.SelectedValue = pd.Composer.ToString();
                txt_time.Value = pd.Time.ToString();
            }


            List<PerformanceDetail_Instrument_Artist> mylist = entity.PerformanceDetail_Instrument_Artist.Where(x => x.PerformanceDetailID == detailID).ToList();
            myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
            myPerformanceDetailArtistInstrumentlist.DataBind();
            Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
        }

        public void cancelDetailClicked(object sender, EventArgs e)
        {
            AddNewEntryPanel.Visible = false;
            showandhidebtnforthepanel.Visible = true;
        }
        public void saveDetailClicked(object sender, EventArgs e)
        {
            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        var cell = GridView1.SelectedRow.Cells[1];
                        var mystring = cell.Text.ToString();
                        int detailID = int.Parse(mystring);
                        PerformanceDetail pd = context.PerformanceDetails.Where(x => x.ID == detailID).FirstOrDefault();

                        pd.PerformanceID = int.Parse(dropdown_performance.SelectedValue);
                        pd.Title = txt_performancetitle.Text;
                        pd.Orchestra = int.Parse(DropDownList1_orchestra.SelectedValue);
                        pd.Conductor = int.Parse(DropDownList2_conductor.SelectedValue);
                        pd.Composer = int.Parse(DropDownList4_composer.SelectedValue);
                        pd.Time = DateTime.Now;

                        context.PerformanceDetails.Add(pd);
                        context.SaveChanges();

                        // remove the previous artist and instrument
                        context.PerformanceDetail_Instrument_Artist.RemoveRange(context.PerformanceDetail_Instrument_Artist.Where(x => x.PerformanceDetailID == detailID).ToList());

                        // register artist and instrument
                        if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
                        {
                            List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];
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

                        dbContextTransaction.Commit();
                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }

                    if (isSuccess)
                    {
                        GridView1.DataBind();
                        showMsg("Data inserted succssfuly");

                        showandhidebtnforthepanel.Visible = true;
                        AddNewEntryPanel.Visible = false;
                        AddNewEntryPanel.Visible = false;

                    }
                    else showMsg("Please check your inputs");
                }
            }





        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (!isUserCompany)
            {
                e.Row.Cells[0].Visible = false;
            }

        }
    }
}