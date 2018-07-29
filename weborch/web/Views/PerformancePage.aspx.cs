using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Globalization;
using BusinessLogic;

namespace web.Views
{
    public partial class PerformancePage : System.Web.UI.Page
    {
        PerformanceLogic pl = new PerformanceLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var user = (UserCommonTable)Session["User"];
                if (user == null) Response.Redirect("~/LoginPage.aspx");
            }
        }

        public void btn_performance_Click(object sender, EventArgs e)
        {
            try
            {
                var user = (UserCommonTable)Session["User"];
                

                Performance p = new Performance();
                p.UserID = user.ID;
                p.OrchestraID = int.Parse(DropDownList1.SelectedValue.ToString());
                p.PerformanceTitle = txt_title.Text;
                //p.PerformanceDate= DateTime.Parse(txt_performancedate.Text);
                p.StartDate = DateTime.Parse(txt_performancedate.Text); //,"dd/mm/yyyy", new CultureInfo("en-US"));
                p.EndDate = DateTime.Parse(txt_performancedate.Text); //,"dd/mm/yyyy", new CultureInfo("en-US"));
                //p.PerformanceDay = txt_performanceday.Text;
                p.OrchestraID = int.Parse(DropDownList1.SelectedItem.Value);
                p.Location = txt_location.Text;
                p.ConcertHall = txt_ConcertHall.Text;
                //p.PerformanceDay = "Sunday";
                getPhoto(p, FileUpload1);

                if (pl.insertPerformance(p))
                {
                    //ListView1.DataBind();
                    showMsg("Data inserted succssfuly");
                }
                else showMsg("Please check your inputs"); 
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


        public void getPhoto(Performance p, FileUpload fileupload)
        {

            if (fileupload.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(fileupload.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    fileupload.SaveAs(path + fileupload.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                }
            }

            p.PhotoAddLocation = fileupload.FileName;
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow row = GridView1.SelectedRow;
            //var x = row.Cells[1].Text;
            Session["PerformanceDetailID"] = GridView1.SelectedRow.Cells[1].Text;
            Response.Redirect("PerformanceDetailPage.aspx");
        }
    }
}