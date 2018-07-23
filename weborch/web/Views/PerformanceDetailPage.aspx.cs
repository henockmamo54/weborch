using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace web.Views
{
    public partial class PerformanceDetailPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void addDetailClicked(object sender, EventArgs e) {

            try
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                PerformanceDetail pd = new PerformanceDetail();

                pd.PerformanceID = int.Parse(dropdown_performance.SelectedValue);
                pd.Title = txt_performancetitle.Text;
                pd.Orchestra = int.Parse(DropDownList1_orchestra.SelectedValue);
                pd.Instrument = int.Parse(DropDownList_instrumentlist.SelectedValue);
                pd.Conductor = int.Parse(DropDownList2_conductor.SelectedValue);
                pd.Player = int.Parse(DropDownList3_player.SelectedValue);
                pd.Composer = int.Parse(DropDownList4_composer.SelectedValue);

                entity.PerformanceDetails.Add(pd);
                entity.SaveChanges();
                ListView2.DataBind();
                showMsg("Data inserted succssfuly");
            }
            catch (Exception ee) {
                showMsg("Please check your inputs");
            }
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);            
        }
        
    }
}