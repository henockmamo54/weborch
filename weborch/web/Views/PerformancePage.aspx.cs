﻿using System;
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
    public partial class PerformancePage : System.Web.UI.Page
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
            }
            PanelPerformanceRegiter.Visible = isUserCompany;
            forAudience.Visible = !isUserCompany;
            formanaging.Visible = isUserCompany;

            repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
            repeater_performanceList.DataBind();
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
                p.StartDate = DateTime.Parse(txt_performancestartdate.Value); //,"dd/mm/yyyy", new CultureInfo("en-US"));
                p.EndDate = DateTime.Parse(txt_performanceenddate.Value); //,"dd/mm/yyyy", new CultureInfo("en-US"));
                //p.PerformanceDay = txt_performanceday.Text;
                p.OrchestraID = int.Parse(DropDownList1.SelectedItem.Value);
                p.Location = txt_location.Text;
                p.ConcertHall = txt_ConcertHall.Text;
                p.PerformanceHour = txt_peformancehour.Text;
                p.TicketBox = txt_ticketbox.Text;
                p.OrganizerInfo = txt_organizerinfo.Text;
                p.VideoLocation = txt_videolocation.Text;
                //p.PerformanceDay = "Sunday";
                getPhoto(p, FileUpload1, 1);
                getPhoto(p, FileUpload3, 2);

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


        public void getPhoto(Performance p, FileUpload fileupload, int photonumber)
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
            if (photonumber == 1)
                p.PhotoAddLocation = fileupload.FileName;
            if (photonumber == 2)
                p.Brochure = fileupload.FileName;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //GridViewRow row = GridView1.SelectedRow;
            //var x = row.Cells[1].Text;
            Session["PerformanceDetailID"] = GridView1.SelectedRow.Cells[1].Text;
            Response.Redirect("PerformanceDetailPage.aspx");
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