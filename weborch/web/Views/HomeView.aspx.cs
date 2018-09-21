using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;
using DataAccess;
using System.Data;

namespace web
{
    public partial class HomeView : System.Web.UI.Page
    {
        int countOfShowMore = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
                repeater_performanceList.DataBind();
                Session["countOfShowMore"] = null;
            }
        }

        //protected override void InitializeCulture() {
        //    //string culture = "en-US";
        //    string culture = "en-US";
        //    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(culture);
        //    Thread.CurrentThread.CurrentUICulture = new CultureInfo(culture);
        //    base.InitializeCulture();
        //}

        protected void dropdownlist_bulletinType_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine(dropdownlist_bulletinType.SelectedValue + "===================>");
            if (int.Parse(dropdownlist_bulletinType.SelectedValue) != -1)
            {
                SqlDataSource1_bulletininfo.SelectCommand = @"SELECT b.[ID], Title, [MSG], [URL], [ImageUrl], [TimeStamp],BulletinTypeID,bt.Name 
FROM core.Bulletin  b
join Lookup.BulletinType bt on bt.ID=b.BulletinTypeID where BulletinTypeID=" + dropdownlist_bulletinType.SelectedValue + " order by TimeStamp desc";
                SqlDataSource1_bulletininfo.DataBind();
            }
            else
            {
                SqlDataSource1_bulletininfo.SelectCommand = @"SELECT b.[ID], Title, [MSG], [URL], [ImageUrl], [TimeStamp],BulletinTypeID,bt.Name 
FROM core.Bulletin  b
join Lookup.BulletinType bt on bt.ID=b.BulletinTypeID
order by TimeStamp desc";
                SqlDataSource1_bulletininfo.DataBind();
            }
        }

        public void loadMorePerformances(object sender, EventArgs e)
        {
            if (Session["countOfShowMore"] == null) { Session["countOfShowMore"] = 3; countOfShowMore = 3; }
            else
            {
                countOfShowMore = (int) Session["countOfShowMore"] + 1;
                Session["countOfShowMore"] = countOfShowMore;
            }
            var count = countOfShowMore * 3;
            SqlDataSource2_allPerformances.SelectCommand = @"SELECT top " + count +
                @" p.*, OfficialName  FROM Main.Performance p 
                join Core.Orchestra o on p.OrchestraID = o.ID order by StartDate";

            repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
            repeater_performanceList.DataBind();
        }

        public void RepeaterbulletinMsg_onItemDataBound(object sender, RepeaterItemEventArgs e)
        {


            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var msgbox = (System.Web.UI.HtmlControls.HtmlTableCell)item.FindControl("bulletinMsgContainer");
                var imagecontainer = (System.Web.UI.HtmlControls.HtmlTableCell)item.FindControl("photoaddcontainerForBulletin");
                var imagelocationStringcount = ((System.Data.DataRowView)e.Item.DataItem)[3].ToString().Length;

                if (!(imagelocationStringcount > 0))
                {
                    //msgbox.Style["width"] = "100%";
                    imagecontainer.InnerHtml = "";
                }
                //else
                //{
                //    msgbox.Style["width"] = "70%";
                //    imagecontainer.Visible = true;
                //    imagecontainer.Style["width"] = "30%";
                //}
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
}