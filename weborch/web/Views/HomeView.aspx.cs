using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class HomeView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //var fromAddress = new MailAddress("iijbiijb14@gmail.com");
            //var fromPassword = "";
            //var toAddress = new MailAddress("henockmamo54@gmail.com");

            //string subject = "subject";
            //string body = "body";

            //System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient
            //{
            //    Host = "smtp.gmail.com",
            //    Port = 587,
            //    EnableSsl = true,
            //    DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network,
            //    UseDefaultCredentials = false,
            //    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)

            //};

            //using (var message = new MailMessage(fromAddress, toAddress)
            //{
            //    Subject = subject,
            //    Body = body
            //})
            //smtp.Send(message);

        }

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