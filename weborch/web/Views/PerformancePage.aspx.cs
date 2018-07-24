using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace web.Views
{
    public partial class PerformancePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void btn_instadd_Click(object sender, EventArgs e)
        {
            try
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();

                Performance p = new Performance();
                p.UserID = 1;
                p.OrchestraID = int.Parse(DropDownList1.SelectedValue.ToString());
                p.PerformanceTitle = txt_title.Text;
                p.PerformanceDate = DateTime.Parse(txt_performancedate.Text);
                p.PerformanceDay = txt_performanceday.Text;
                //p.Orchestra = DropDownList1.SelectedItem.Text;
                p.Location = txt_location.Text;
                p.ConcertHall = txt_ConcertHall.Text;

                entity.Performances.Add(p);
                entity.SaveChanges();
                ListView1.DataBind();
                showMsg("Data inserted succssfuly");
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }

        }
        
        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

    }
}