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
using System.Data.Entity.SqlServer;

namespace web.Views
{
    public partial class PerformancePage : System.Web.UI.Page
    {
        PerformanceLogic pl = new PerformanceLogic();
        UserCommonTable user;
        bool isUserCompany = false;
        OrchestraDBEntities entity = new OrchestraDBEntities();
        private int countOfShowMore;
        List<locationModel> locations = new List<locationModel>();
        Button previousSelectedLocation;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                //var user = (UserCommonTable)Session["User"];
                //if (user == null) Response.Redirect("~/LoginPage.aspx");


                repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
                repeater_performanceList.DataBind();

                repeater_thisweekPerformanceInfo.DataSource = entity.Performances.Where(x => SqlFunctions.DatePart("ISO_WEEK", x.StartDate) == SqlFunctions.DatePart("ISO_WEEK", DateTime.Today)).ToList();
                repeater_thisweekPerformanceInfo.DataBind();
                label_countofitems.Text = repeater_performanceList.Items.Count + "";

                var locationlist = entity.Performances.Select(x => x.Location).Distinct().ToList();
                for (int i = 0; i < locationlist.Count; i++)
                {
                    locations.Add(new locationModel(1, locationlist[i]));
                }

                Session["locations"] = locations;
                repeater_location.DataSource = locations;
                repeater_location.DataBind();

                dateselectorcalendar.SelectedDates.Clear();

                Session["PreviousSelectedDate"] = null;
                Session["PreviousSelectedDate"] = null;

            }

            user = (UserCommonTable)Session["User"];
            if (user != null)
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;

                //if (isUserCompany)
                //{
                //    var performanceFilteredQuery = string.Format(@"SELECT p.*, OfficialName  FROM Main.Performance p
                //                                join Core.Orchestra o on p.OrchestraID=o.ID
                //                                where P.UserID={0}", user.ID);
                //    SqlDataSource2_allPerformances.SelectCommand = performanceFilteredQuery;
                //}

            }
            //forAudience.Visible = !isUserCompany;
            //formanaging.Visible = isUserCompany;
            //btn_MangePerformanceButton.Visible = isUserCompany;


        }

        //PostBackUrl="~/Views/ManagePerformancePage.aspx" 

        public void onBtnManagePerformanceButtonClick(object sender, EventArgs e)
        {
            if (user != null && isUserCompany) Response.Redirect("~/Views/ManagePerformancePage.aspx");
            else showMsg("Please login as a company user!!!");

        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
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


        public void loadMorePerformances(object sender, EventArgs e)
        {
            if (Session["countOfShowMore"] == null) { Session["countOfShowMore"] = 4; countOfShowMore = 4; }
            else
            {
                countOfShowMore = (int)Session["countOfShowMore"] + 1;
                Session["countOfShowMore"] = countOfShowMore;
            }
            var count = countOfShowMore * 3;
            SqlDataSource2_allPerformances.SelectCommand = @"SELECT top " + count +
                @" p.*, OfficialName  FROM Main.Performance p 
                join Core.Orchestra o on p.OrchestraID = o.ID order by timestamp desc";

            repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
            repeater_performanceList.DataBind();
            label_countofitems.Text = repeater_performanceList.Items.Count + "";
        }

        protected void dateselectorcalendar_SelectionChanged(object sender, EventArgs e)
        {
            if (Session["PreviousSelectedDate"] != null)
            {
                DateTime previousdate = (DateTime)Session["PreviousSelectedDate"];
                if (previousdate == dateselectorcalendar.SelectedDate) dateselectorcalendar.SelectedDates.Clear();

            }
            else Session["PreviousSelectedDate"] = dateselectorcalendar.SelectedDate;

            filterPerformance();
        }

        public class locationModel
        {
            public locationModel(int id, string location)
            {
                this.ID = id;
                this.Location = location;
            }
            public int ID { get; set; }
            public string Location { get; set; }
        }

        public void test(object sender, EventArgs e)
        {
            Button pb = null;
            Button b = (Button)sender;
            b.BackColor = System.Drawing.Color.RosyBrown;

            if (Session["previousSelectedLocation"] != null)
            {
                pb = (Button)Session["previousSelectedLocation"];
                pb.BackColor = System.Drawing.Color.White;

            }

            if (pb != null)
            {
                if (b.Text == pb.Text) Session["previousSelectedLocation"] = null;
                else Session["previousSelectedLocation"] = sender;
            }
            else Session["previousSelectedLocation"] = sender;

            locations = (List<locationModel>)Session["locations"];
            repeater_location.DataSource = locations;
            repeater_location.DataBind();

            filterPerformance();

        }

        public void repeater_locationOnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                if (Session["previousSelectedLocation"] != null)
                {
                    Button pb = (Button)Session["previousSelectedLocation"];
                    var detail = (Button)item.FindControl("location");
                    if (detail.Text == pb.Text) detail.BackColor = System.Drawing.Color.RosyBrown;
                }
            }

        }

        public void filterPerformance() {

            DateTime selectedDate = dateselectorcalendar.SelectedDate;
            Button pb = (Button)Session["previousSelectedLocation"];
            var null_date= DateTime.Parse("1/1/0001 12:00:00 AM", System.Globalization.CultureInfo.InvariantCulture);

            string filter = "";
            if (pb != null && selectedDate != null_date) filter = @"where startdate='" + selectedDate.ToShortDateString() + "' and location = N'"+ pb.Text+"' ";
            else if (pb == null && selectedDate != null_date) filter = @"where startdate='" + selectedDate.ToShortDateString() + "' ";
            else if (pb != null && selectedDate == null_date) filter = @"where location = N'" + pb.Text + "' ";


            SqlDataSource2_allPerformances.SelectCommand = @"SELECT  p.*, OfficialName  FROM Main.Performance p
                                                            join Core.Orchestra o on p.OrchestraID=o.ID "+filter+" order by timestamp desc";
            repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
            repeater_performanceList.DataBind();
            label_countofitems.Text = repeater_performanceList.Items.Count + "";


        }
    }
}