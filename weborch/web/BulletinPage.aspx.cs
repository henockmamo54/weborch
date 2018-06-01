using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using BusinessLogic;

namespace web
{
    public partial class BulletinPage : System.Web.UI.Page
    {
        BulletinLogic bl = new BulletinLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            Repeater1.DataSource = bl.getAllMsg();
            Repeater1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Bulletin bulletin = new Bulletin();
                bulletin.MSG = txt_bulmsg.Text;
                bulletin.URL = txt_bulurl.Text;
                bulletin.ImageUrl = txtbulimage.Text;
                if (bl.addBulletin(bulletin))
                {
                    Repeater1.DataSource = bl.getAllMsg();
                    Repeater1.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanPostText();
                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }

        }

        private void cleanPostText()
        {
            txtbulimage.Text = "";
            txt_bulmsg.Text = "";
            txt_bulurl.Text = "";
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
    }
}