using BusinessLogic;
using DataAccess;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class InstrumentView : Page
    {
        InstrumentLogic insl = new InstrumentLogic();
        UserCommonTable user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                instrumentrepeater.DataSource = SqlDataSource1_Instrumentlist;
                instrumentrepeater.DataBind();
            }


            user = (UserCommonTable)Session["User"];
            if (user != null)
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                bool isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
                btn_InstrumentViewButton.Visible = isUserCompany;


            }
        }

        protected void filterArtistDataByName(object sender, EventArgs e)
        {
            var query = "";
            if (txtbox_namefilter.Text.ToString().Length > 0)
            {
                query = string.Format(@"SELECT ID, EnglishName, KoreanName, Alias, Player, [Group], Explanation, 
                            SoundClipLocation, VideoClipLocation, PhotoLocation, Remarks FROM Core.Instrument where EnglishName like N'%{0}%'
                            order by ID desc", txtbox_namefilter.Text);
            }
            else query = string.Format(@"SELECT ID, EnglishName, KoreanName, Alias, Player, [Group], Explanation, SoundClipLocation, VideoClipLocation, PhotoLocation, Remarks FROM Core.Instrument
order by ID desc");

            SqlDataSource1_Instrumentlist.SelectCommand = query;
            instrumentrepeater.DataSource = SqlDataSource1_Instrumentlist;
            instrumentrepeater.DataBind();
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
    }
}