﻿using System;
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
        int PDID=0;
        UserCommonTable user;
        bool isUserCompany = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PerformanceDetailID"] != null)
            {
                int PDID = int.Parse(Session["PerformanceDetailID"].ToString());
                dropdown_performance.SelectedValue = PDID.ToString();
            }

            user = (UserCommonTable)Session["User"];
            if (user != null) {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
            }

            showandhidebtnforthepanel.Visible = isUserCompany;
        }

        public void addDetailClicked(object sender, EventArgs e) {

            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        PerformanceDetail pd = new PerformanceDetail();

                        pd.PerformanceID = int.Parse(dropdown_performance.SelectedValue);
                        pd.Title = txt_performancetitle.Text;
                        pd.Orchestra = int.Parse(DropDownList1_orchestra.SelectedValue);
                        //pd.Instrument = int.Parse(DropDownList_instrumentlist.SelectedValue);
                        pd.Conductor = int.Parse(DropDownList2_conductor.SelectedValue);
                        //pd.Player = int.Parse(DropDownList3_player.SelectedValue);
                        pd.Composer = int.Parse(DropDownList4_composer.SelectedValue);
                        pd.Time = DateTime.Now;

                        context.PerformanceDetails.Add(pd);
                        context.SaveChanges();

                        // register artist and instrument
                        if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
                        {
                            List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];
                            foreach (PerformanceDetail_Instrument_Artist x in mylist)
                            {
                                PerformanceDetail_Instrument_Artist detail = new PerformanceDetail_Instrument_Artist();
                                detail.PerformanceDetailID = pd.ID;
                                detail.ArtistID = x.ArtistID;
                                detail.InstrumentID = x.InstrumentID;

                                context.PerformanceDetail_Instrument_Artist.Add(detail);
                                context.SaveChanges();
                            }
                        }

                        dbContextTransaction.Commit();
                        isSuccess = true;                        
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }

                    if (isSuccess) {
                        GridView1.DataBind();
                        showMsg("Data inserted succssfuly");

                        showandhidebtnforthepanel.Visible = true;
                        AddNewEntryPanel.Visible = false;

                    }
                    else showMsg("Please check your inputs");
                }
            }
        }
        
        public void btn_ADD_ONClick_showAndHideTheDataEntryPanel(object sender, EventArgs e)
        {
            showandhidebtnforthepanel.Visible = false;
            btn_update.Visible = false;
            btn_register.Visible = true;
            AddNewEntryPanel.Visible = true;
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);            
        }
        
        protected void btn_add_ArtistInstrument_tolist(object sender, EventArgs e)
        {
            PerformanceDetail_Instrument_Artist detail = new PerformanceDetail_Instrument_Artist();
            

            detail.ArtistID = int.Parse(DropDownList2_artistlist.SelectedValue);
            detail.Artist = new Artist();
            detail.Artist.FirstName = DropDownList2_artistlist.SelectedItem.Text;

            detail.InstrumentID = int.Parse(DropDownList3_instrumentlist.SelectedValue);
            detail.Instrument = new Instrument();
            detail.Instrument.EnglishName = DropDownList3_instrumentlist.SelectedItem.Text;

            if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
            {
                List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];
                mylist.Add(detail);

                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();

                Session["myendorsmentlist"] = mylist;
            }
            else
            {
                List<PerformanceDetail_Instrument_Artist> mylist = new List<PerformanceDetail_Instrument_Artist>();
                mylist.Add(detail);

                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();

                Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
            }
        }

        public void btn_remove_ArtistInstrument_tolist(object sender, EventArgs e)
        {
            if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
            {
                Button btn = (Button)sender;
                var ids = btn.CommandArgument.ToString().Split(',');
                int artistID = int.Parse(ids[0]);
                int instrumentID = int.Parse(ids[1]);
                List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];

                mylist.RemoveAll(x => x.ArtistID==artistID & x.InstrumentID==instrumentID);
                myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
                myPerformanceDetailArtistInstrumentlist.DataBind();
                Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            OrchestraDBEntities entity = new OrchestraDBEntities();

            showandhidebtnforthepanel.Visible = false;
            AddNewEntryPanel.Visible = true;
            btn_update.Visible = true;
            btn_register.Visible = false;

            var cell = GridView1.SelectedRow.Cells[1];
            var mystring = cell.Text.ToString();
            int detailID= int.Parse(mystring);

            PerformanceDetail pd = entity.PerformanceDetails.Where(x => x.ID == detailID).FirstOrDefault();

            if (pd != null) {
                dropdown_performance.SelectedValue = pd.PerformanceID.ToString();
                txt_performancetitle.Text=pd.Title;
                DropDownList1_orchestra.SelectedValue = pd.Orchestra.ToString();
                DropDownList2_conductor.SelectedValue = pd.Conductor.ToString();
                DropDownList4_composer.SelectedValue = pd.Composer.ToString();
                txt_time.Text = pd.Time.ToString();               
            }


            List<PerformanceDetail_Instrument_Artist> mylist = entity.PerformanceDetail_Instrument_Artist.Where(x => x.PerformanceDetailID == detailID).ToList();
            myPerformanceDetailArtistInstrumentlist.DataSource = mylist;
            myPerformanceDetailArtistInstrumentlist.DataBind();
            Session["myPerformanceDetailArtistInstrumentlist"] = mylist;
        }

        public void cancelDetailClicked(object sender, EventArgs e)
        {
            AddNewEntryPanel.Visible = false;
            showandhidebtnforthepanel.Visible = true;
        }
        public void saveDetailClicked(object sender, EventArgs e)
        {
            bool isSuccess = false;
            using (var context = new OrchestraDBEntities())
            {
                using (var dbContextTransaction = context.Database.BeginTransaction())
                {
                    try
                    {
                        var cell = GridView1.SelectedRow.Cells[1];
                        var mystring = cell.Text.ToString();
                        int detailID = int.Parse(mystring);
                        PerformanceDetail pd = context.PerformanceDetails.Where(x => x.ID == detailID).FirstOrDefault();

                        pd.PerformanceID = int.Parse(dropdown_performance.SelectedValue);
                        pd.Title = txt_performancetitle.Text;
                        pd.Orchestra = int.Parse(DropDownList1_orchestra.SelectedValue);
                        pd.Conductor = int.Parse(DropDownList2_conductor.SelectedValue);
                        pd.Composer = int.Parse(DropDownList4_composer.SelectedValue);
                        pd.Time = DateTime.Now;

                        context.PerformanceDetails.Add(pd);
                        context.SaveChanges();

                        // remove the previous artist and instrument
                        context.PerformanceDetail_Instrument_Artist.RemoveRange(context.PerformanceDetail_Instrument_Artist.Where(x => x.PerformanceDetailID == detailID).ToList());

                        // register artist and instrument
                        if (Session["myPerformanceDetailArtistInstrumentlist"] != null)
                        {
                            List<PerformanceDetail_Instrument_Artist> mylist = (List<PerformanceDetail_Instrument_Artist>)Session["myPerformanceDetailArtistInstrumentlist"];
                            foreach (PerformanceDetail_Instrument_Artist x in mylist)
                            {
                                PerformanceDetail_Instrument_Artist detail = new PerformanceDetail_Instrument_Artist();
                                detail.PerformanceDetailID = pd.ID;
                                detail.ArtistID = x.ArtistID;
                                detail.InstrumentID = x.InstrumentID;

                                context.PerformanceDetail_Instrument_Artist.Add(detail);
                                context.SaveChanges();
                            }
                        }

                        dbContextTransaction.Commit();
                        isSuccess = true;
                    }
                    catch (Exception ee)
                    {
                        dbContextTransaction.Rollback();
                    }

                    if (isSuccess)
                    {
                        GridView1.DataBind();
                        showMsg("Data inserted succssfuly");

                        showandhidebtnforthepanel.Visible = true;
                        AddNewEntryPanel.Visible = false;
                        AddNewEntryPanel.Visible = false;

                    }
                    else showMsg("Please check your inputs");
                }
            }


           


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (!isUserCompany)
            {
                e.Row.Cells[0].Visible = false;
            }

        }
    }
}