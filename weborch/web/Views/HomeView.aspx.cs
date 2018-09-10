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

namespace web
{
    public partial class HomeView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                SqlDataSource1_bulletininfo.SelectCommand = @"SELECT  [ID], [MSG], [URL], [ImageUrl], [TimeStamp],BulletinTypeID FROM core.Bulletin where BulletinTypeID=" + dropdownlist_bulletinType.SelectedValue + " order by TimeStamp desc";
                SqlDataSource1_bulletininfo.DataBind();
            }
            else
            {
                SqlDataSource1_bulletininfo.SelectCommand = @"SELECT  [ID], [MSG], [URL], [ImageUrl], [TimeStamp],BulletinTypeID FROM core.Bulletin order by TimeStamp desc";
                SqlDataSource1_bulletininfo.DataBind();
            }
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


    }
}