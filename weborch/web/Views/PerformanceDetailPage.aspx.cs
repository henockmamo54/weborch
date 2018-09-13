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
        static UserCommonTable user;
        bool isUserCompany = false;
        PerformanceLogic pl = new PerformanceLogic();

        // later this will be removed
        int likecount = 10;
        int dislikecount = 7;

        bool isliked = false;
        bool isdisliked = false;
        ParentCommentLogic pc = new ParentCommentLogic();
        ChildCommentLogic cl = new ChildCommentLogic();
        OrchestraDBEntities entity = new OrchestraDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            OrchestraDBEntities entity = new OrchestraDBEntities();

            user = (UserCommonTable)Session["User"];

            if (Request.QueryString["ID"] != null)
            {
                int idByStringQuery = int.Parse(Request.QueryString["ID"]);
                Session["PerformanceDetailID"] = idByStringQuery;
            }

            if (Session["PerformanceDetailID"] != null)
            {
                PDID = int.Parse(Session["PerformanceDetailID"].ToString());

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
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
            }

            //showandhidebtnforthepanel.Visible = isUserCompany;
            //forAudience.Visible = !isUserCompany;
            //formanaging.Visible = isUserCompany;

            getHeaderPeformanceData();

            getLikeUnlikeStatusForUser();

            talbereplacingrepeater.DataSource = SqlDataSource1_performanceDetailList;
            talbereplacingrepeater.DataBind();

            likecountspan.InnerText = likecount.ToString();
            dislikecountspan.InnerText = dislikecount.ToString();

            //var parcomm = pc.getChildCommentByParentID(3);
            //Repeater2.DataSource = parcomm;
            Repeater2.DataSource = entity.PerformanceParentCommentTables.ToList().Where(x => x.PerformanceID == PDID && x.ParentCommentID == null)
                .OrderByDescending(x=>x.CommentDate)
                .ToList();

            Repeater2.DataBind();

        }


        public void LikeClicked(object sender, CommandEventArgs e)
        {
            var value = e.CommandArgument.ToString().Split(',');
            int id = int.Parse(value[0]);
            int isLike = int.Parse(value[1]);

            if (user == null)
            {
                showMsg("Please sign in to Like Posts!!!");
                return;
            }

            else if (user != null)
            {
                // islike 1= liked, 0= nither liked nor disliked, -1 disliked 
                OrchestraDBEntities entities = new OrchestraDBEntities();
                var myval = entities.PerformanceLikeUnlikes.Where(x => x.PerformanceID == PDID & x.UserID == user.ID).ToList();
                if (myval.Count > 0)
                {

                    if (isLike == 1)
                    {
                        if (myval.FirstOrDefault().islike == 1)
                            myval.FirstOrDefault().islike = 0;
                        else myval.FirstOrDefault().islike = 1;
                    }
                    else
                    {
                        if (myval.FirstOrDefault().islike == -1)
                            myval.FirstOrDefault().islike = 0;
                        else myval.FirstOrDefault().islike = -1;
                    }
                    entities.SaveChanges();
                }
                else
                {
                    PerformanceLikeUnlike b = new PerformanceLikeUnlike();
                    b.PerformanceID = PDID;
                    b.UserID = user.ID;
                    b.islike = isLike;
                    b.timestamp = DateTime.Now;
                    entities.PerformanceLikeUnlikes.Add(b);
                    entities.SaveChanges();
                }

                getLikeUnlikeStatusForUser();
                likecountspan.InnerText = likecount.ToString();
                dislikecountspan.InnerText = dislikecount.ToString();


                //BulletinLogic bl = new BulletinLogic();
                //Repeater1.DataSource = bl.getAllMsg(myuser.ID);
                //Repeater1.DataBind();
            }

        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool checkLoginStatus(int n)
        {
           
            return user!=null;
        }

        protected void btnComment_Click(object sender, CommandEventArgs e)
        {
            if (user == null) {
                showMsg("Please sign in to write comments!!!");
                return;
            }
            if (txtComment.Text.Length > 0)
            {
                btnComment.Enabled = false;
                OrchestraDBEntities entity = new OrchestraDBEntities();

                PerformanceParentCommentTable pt = new PerformanceParentCommentTable();
                if (user != null)
                {
                    if (isUserCompany) pt.UserName = user.UserCompanies.FirstOrDefault().CompanyName.ToString();
                    else pt.UserName = user.UserPersonalInfoes.FirstOrDefault().Name.ToString();
                }
                else pt.UserName = "anonymous";
                pt.CommentMessage = txtComment.Text;
                pt.PerformanceID = PDID;
                pt.CommentDate = DateTime.Now;

                entity.PerformanceParentCommentTables.Add(pt);
                entity.SaveChanges();


                var value = e.CommandArgument;

                System.Console.WriteLine("on btn click");

                //var parcomm = pc.getChildCommentByParentID(3);
                //Repeater2.DataSource = parcomm;
                Repeater2.DataSource = entity.PerformanceParentCommentTables.ToList().Where(x => x.PerformanceID == PDID && x.ParentCommentID == null)
                    .OrderByDescending(x => x.CommentDate)
                    .ToList();

                Repeater2.DataBind();

                btnComment.Enabled = true;
                txtComment.Text = "";
            }
        }

        protected void btnAddDetailComment_Click(object sender, CommandEventArgs e)
        {
            OrchestraDBEntities entity = new OrchestraDBEntities();
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;


            PerformanceParentCommentTable pt = new PerformanceParentCommentTable();
            if (user != null)
            {
                if (isUserCompany) pt.UserName = user.UserCompanies.FirstOrDefault().CompanyName.ToString();
                else pt.UserName = user.UserPersonalInfoes.FirstOrDefault().Name.ToString();
            }
            else pt.UserName = "anonymous";
            pt.CommentMessage = message;
            pt.PerformanceID = PDID;
            pt.CommentDate = DateTime.Now;
            pt.ParentCommentID = int.Parse(e.CommandArgument.ToString());


            entity.PerformanceParentCommentTables.Add(pt);
            entity.SaveChanges();


            //var parcomm = pc.getChildCommentByParentID(3);
            //Repeater2.DataSource = parcomm;
            Repeater2.DataSource = entity.PerformanceParentCommentTables.ToList().Where(x => x.PerformanceID == PDID && x.ParentCommentID == null)
                .OrderByDescending(x => x.CommentDate)
                .ToList();
            Repeater2.DataBind();

        }

        protected void detailrepeater_onItemDatabound(object sender, RepeaterItemEventArgs e) {

            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var detail = (Repeater)item.FindControl("detailRepeater3");

                //pc.getAllParentComments().Take(2).ToList()
                //var x = cl.getChildCommentByParentID(((ParentCommentTable)e.Item.DataItem).ID);
                var source = entity.PerformanceParentCommentTables.Where(x => x.ParentCommentID == ((PerformanceParentCommentTable)e.Item.DataItem).ID).OrderByDescending(x => x.CommentDate).ToList();
                detail.DataSource = source;
                detail.DataBind();

            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var detail = (Repeater)item.FindControl("detailRepeater");

                //pc.getAllParentComments().Take(2).ToList()
                //var x = cl.getChildCommentByParentID(((ParentCommentTable)e.Item.DataItem).ID);
                var source = entity.PerformanceParentCommentTables.Where(x => x.ParentCommentID == ((PerformanceParentCommentTable)e.Item.DataItem).ID).OrderByDescending(x => x.CommentDate).ToList();
                detail.DataSource = source;
                detail.DataBind();

            }
        }


        public void getHeaderPeformanceData()
        {
            if (Session["PerformanceDetailID"] != null)
            {
                try
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
                    orchestra.InnerText = p.Orchestra.OfficialName;
                    startingdate.InnerText = (p.StartDate).ToString();
                    enddate.InnerText = p.EndDate.ToString();
                    ticketbox.InnerText = p.TicketBox;
                    performancetime.InnerText = ((DateTime)p.PerformanceTime).ToShortTimeString();
                }
                catch (Exception ee) { }


            }
        }

        public void getLikeUnlikeStatusForUser() {
            List<PerformanceLikeUnlike> performancelikeunlike = entity.PerformanceLikeUnlikes.Where(x => x.PerformanceID == PDID).ToList();
            likecount = performancelikeunlike.Where(x => x.islike == 1).Count();
            dislikecount = performancelikeunlike.Where(x => x.islike == -1).Count();

            if (user != null) {
                var detail = entity.PerformanceLikeUnlikes.Where(x => x.UserID == user.ID && x.PerformanceID == PDID).FirstOrDefault();
                if (detail != null)
                {
                    isliked = detail.islike == 1;
                    isdisliked = detail.islike == -1;

                    likebutton.Visible = detail.islike != 1;
                    likebuttonliked.Visible = detail.islike == 1;

                    dislikebutton.Visible = detail.islike != -1;
                    dislikebuttondisliked.Visible = detail.islike == -1;
                }
            }
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
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