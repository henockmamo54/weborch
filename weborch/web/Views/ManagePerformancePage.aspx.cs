using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using System.Globalization;
using BusinessLogic;
using System.Data;

namespace web.Views
{
    public partial class ManagePerformancePage : System.Web.UI.Page
    {
        PerformanceLogic pl = new PerformanceLogic();
        UserCommonTable user;
        bool isUserCompany = false;
        OrchestraDBEntities entity = new OrchestraDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //var user = (UserCommonTable)Session["User"];
                //if (user == null) Response.Redirect("~/LoginPage.aspx");
            }

            user = (UserCommonTable)Session["User"];
            if (user != null)
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;

                if (isUserCompany)
                {
                    var performanceFilteredQuery = string.Format(@"SELECT p.*, OfficialName  FROM Main.Performance p
                                                join Core.Orchestra o on p.OrchestraID=o.ID
                                                where P.UserID={0}", user.ID);
                    SqlDataSource2_allPerformances.SelectCommand = performanceFilteredQuery;
                    GridView1.DataBind();
                }
                else Response.Redirect("~/Views/HomeView.aspx");

            }
            else Response.Redirect("~/Views/HomeView.aspx");

            PanelPerformanceRegiter.Visible = isUserCompany;
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
                p.MainTitle = txt_mainTitleTheme.Text;
                //p.PerformanceDate= DateTime.Parse(txt_performancedate.Text);
                p.StartDate = DateTime.ParseExact(txt_performancestartdate.Value,"dd/mm/yyyy", new CultureInfo("en-US"));
                p.EndDate = DateTime.ParseExact(txt_performanceenddate.Value ,"dd/mm/yyyy", new CultureInfo("en-US"));
                //p.PerformanceDay = txt_performanceday.Text;
                p.OrchestraID = int.Parse(DropDownList1.SelectedItem.Value);
                p.Location = txt_location.Text;
                p.ConcertHall = txt_ConcertHall.Text;
                p.PerformanceHour = txt_peformancehour.Text;
                p.TicketBox = txt_ticketbox.Text;
                p.OrganizerInfo = txt_organizerinfo.Text;
                p.VideoLocation = txt_videolocation.Text;
                //p.PerformanceDay = "Sunday";
                if(!getPhoto(p, FileUpload1, 1)) return;
                if (!getPhoto(p, FileUpload3, 2)) return;

                if (pl.insertPerformance(p))
                {
                    //ListView1.DataBind();
                    GridView1.DataBind();
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


        public bool getPhoto(Performance p, FileUpload fileupload, int photonumber)
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
                    return false;
                }
            }
            if (photonumber == 1)
                p.PhotoAddLocation = fileupload.FileName;
            if (photonumber == 2)
                p.Brochure = fileupload.FileName;
            return true;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow row = GridView1.SelectedRow;
            //var x = row.Cells[1].Text;
            Session["PerformanceDetailID"] = GridView1.SelectedRow.Cells[1].Text;
            Response.Redirect("ManagePerformanceDetailPage.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (!isUserCompany)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    {
                        Button btnEdit = (Button)e.Row.FindControl("btnEdit");
                        ((CommandField)((DataControlFieldCell)(e.Row.Cells[0])).ContainingField).ShowEditButton = false;
                        ((CommandField)((DataControlFieldCell)(e.Row.Cells[0])).ContainingField).ShowDeleteButton = false;

                    }
                }



            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int id = int.Parse(GridView1.Rows[e.NewEditIndex].Cells[1].Text);
            Performance a = entity.Performances.Where(x => x.ID == id).FirstOrDefault();

            modalImageContainer.ImageUrl = "~/Document/" + a.PhotoAddLocation;
            modalImageContainer2.ImageUrl = "~/Document/" + a.Brochure;
            Session["SelectedPerformanceID"] = id;
        }

        protected void buttonChangeImage(object sender, EventArgs e)
        {
            if (FileUpload2.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(FileUpload2.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    FileUpload2.SaveAs(path + FileUpload2.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return;
                }
            }


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            if (Session["SelectedPerformanceID"] != null)
            {

                int id = int.Parse(Session["SelectedPerformanceID"].ToString());
                OrchestraDBEntities entity = new OrchestraDBEntities();

                var x = entity.Performances.Where(inst => inst.ID == id).FirstOrDefault();
                if (x != null)
                {
                    x.PhotoAddLocation = FileUpload2.FileName;
                    entity.SaveChanges();
                    GridView1.DataBind();
                }
            }

        }


        protected void buttonChangeImage2(object sender, EventArgs e)
        {
            if (FileUpload4.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(FileUpload4.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    FileUpload4.SaveAs(path + FileUpload4.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return;
                }
            }


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            if (Session["SelectedPerformanceID"] != null)
            {

                int id = int.Parse(Session["SelectedPerformanceID"].ToString());
                OrchestraDBEntities entity = new OrchestraDBEntities();

                var x = entity.Performances.Where(inst => inst.ID == id).FirstOrDefault();
                if (x != null)
                {
                    x.Brochure = FileUpload4.FileName;
                    entity.SaveChanges();
                    GridView1.DataBind();
                }
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