using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Globalization;

namespace web.Views
{
    public partial class PerformancePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var user = (UserCommonTable)Session["User"];
                if (user == null) Response.Redirect("~/LoginPage.aspx");
            }
        }

        public void btn_instadd_Click(object sender, EventArgs e)
        {
            try
            {
                var user = (UserCommonTable)Session["User"];

                OrchestraDBEntities entity = new OrchestraDBEntities();

                Performance p = new Performance();
                p.UserID = user.ID;
                p.OrchestraID = int.Parse(DropDownList1.SelectedValue.ToString());
                p.PerformanceTitle = txt_title.Text;
                p.PerformanceDate = DateTime.ParseExact(txt_performancedate.Text,"dd/mm/yyyy", new CultureInfo("en-US"));
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