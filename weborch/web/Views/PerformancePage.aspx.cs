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
    public partial class PerformancePage : System.Web.UI.Page
    {
        PerformanceLogic pl = new PerformanceLogic();
        UserCommonTable user;
        bool isUserCompany = false;
        OrchestraDBEntities entity = new OrchestraDBEntities();
        private int countOfShowMore;

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
            btn_MangePerformanceButton.Visible = isUserCompany;

            repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
            repeater_performanceList.DataBind();

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
                join Core.Orchestra o on p.OrchestraID = o.ID order by StartDate";

            repeater_performanceList.DataSource = SqlDataSource2_allPerformances;
            repeater_performanceList.DataBind();
        }

    }
}