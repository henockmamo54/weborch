using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class OrchestraView : Page
    {
        OrchestraLogic orl = new OrchestraLogic();
        OrchestraInstrumentArtistLogic oial = new OrchestraInstrumentArtistLogic();
        UserCommonTable user;
        int countOfShowMore = 3;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                repeater_orchestraList.DataSource = SqlDataSource1_allOrchestraInfo;
                repeater_orchestraList.DataBind();
                Session["countOfShowMore"] = null;
            }

            user = (UserCommonTable)Session["User"];
            if (user != null)
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                bool isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
                btn_MangeOrchestraButton.Visible = isUserCompany;
            }

            if (Session["countOfShowMore"] == null) { Session["countOfShowMore"] = 12; countOfShowMore = 12; }

        }
        protected void filterOrchestraDataByName(object sender, EventArgs e)
        {

            //if (Session["countOfShowMore"] == null) { Session["countOfShowMore"] = 3; countOfShowMore = 3; }
            if (Session["countOfShowMore"] == null) { Session["countOfShowMore"] = 12; countOfShowMore = 12; }
            else
            {
                countOfShowMore = (int)Session["countOfShowMore"] + 8;
                Session["countOfShowMore"] = countOfShowMore;
            }
            var count = countOfShowMore;
            //var count = countOfShowMore * 4;


            if (txtbox_namefilter.Text.ToString().Length > 0)
            {
                var query = string.Format(@"SELECT top "+ count + @" o.ID, OfficialName, Alias, URL, o.Address, o.ZipCode, o.TelNO,o.FaxNo, ConductorID, Since,
                                            ConductorName= FirstName + ' '+ MiddleName+ ' ' + FamilyName
                                            FROM Core.Orchestra o
                                            join core.artist a on o.ConductorID = a. ID where OfficialName like N'%{0}%' or Alias like N'%{0}%' ", txtbox_namefilter.Text);
                SqlDataSource1_allOrchestraInfo.SelectCommand = query;
                repeater_orchestraList.DataSource = SqlDataSource1_allOrchestraInfo;
                repeater_orchestraList.DataBind();
            }
            else
            {
                var query = string.Format(@"SELECT top " + count + @" o.ID, OfficialName, Alias, URL, o.Address, o.ZipCode, o.TelNO,o.FaxNo, ConductorID, Since,
                                            ConductorName= FirstName + ' '+ MiddleName+ ' ' + FamilyName
                                            FROM Core.Orchestra o
                                            join core.artist a on o.ConductorID = a. ID ");
                SqlDataSource1_allOrchestraInfo.SelectCommand = query;
                repeater_orchestraList.DataSource = SqlDataSource1_allOrchestraInfo;
                repeater_orchestraList.DataBind();

            }
        }
        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);

            //string script = "alert(\"Hello\");";
            //ScriptManager.RegisterStartupScript(this, GetType(),
            //                      "ServerControlScript", msg, true);
        }

        public void loadMore(object sender, EventArgs e) {


        }


    }
}