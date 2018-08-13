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
                SqlDataSource1_bulletininfo.SelectCommand = @"SELECT [ID], [MSG], [URL], [ImageUrl], [TimeStamp],BulletinTypeID FROM core.Bulletin where BulletinTypeID=" + dropdownlist_bulletinType.SelectedValue;
                SqlDataSource1_bulletininfo.DataBind();
            }
            else {
                SqlDataSource1_bulletininfo.SelectCommand = @"SELECT [ID], [MSG], [URL], [ImageUrl], [TimeStamp],BulletinTypeID FROM core.Bulletin";
                SqlDataSource1_bulletininfo.DataBind();
            }
        }
    }
}