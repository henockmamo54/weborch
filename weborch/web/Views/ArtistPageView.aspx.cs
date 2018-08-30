using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web
{
    public partial class ArtistPageView : System.Web.UI.Page
    {
        ArtistLogic artl = new ArtistLogic();
        ArtistInstrumentLogic artInstLogic = new ArtistInstrumentLogic();
        OrchestraDBEntities entity = new OrchestraDBEntities();
        UserCommonTable user;
        protected void Page_Load(object sender, EventArgs e)
        {
            ////artist grid
            //GridView3.DataSource = artl.getAllArtists();
            //GridView3.DataBind();

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "bindDateTime();", true);

            if (!IsPostBack)
            {
                artistsRepeater.DataSource = SqlDataSource3_ArtistListForAudience;
                artistsRepeater.DataBind();

                user = (UserCommonTable)Session["User"];
                if (user != null)
                {
                    OrchestraDBEntities entity = new OrchestraDBEntities();
                    var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                    bool isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
                    btn_MangeArtistButton.Visible = isUserCompany;
                }
            }

        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }
        protected void DropDownList1_artistType_SelectedIndexChanged(object sender, EventArgs e)
        {
            var filterQuery = "";
            if (DropDownList1_artistType.SelectedIndex != 0) filterQuery += " where ArtistType.NAME like '%" + DropDownList1_artistType.SelectedItem.Text + "%'";
            if (DropDownList1_instrumentTypeFilter.SelectedIndex != 0)
            {
                if (DropDownList1_artistType.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " inst.namevalues like '%" + DropDownList1_instrumentTypeFilter.SelectedItem.Text + "%'";
            }
            if (txtbox_namefilter.Text.ToString().Length > 0)
            {
                if (DropDownList1_artistType.SelectedIndex != 0 || DropDownList1_instrumentTypeFilter.SelectedIndex != 0) filterQuery += " And ";
                else filterQuery += " Where ";

                filterQuery += " core.artist.firstname like N'%" + txtbox_namefilter.Text + "%' or";
                filterQuery += " core.artist.middlename like N'%" + txtbox_namefilter.Text + "%' or";
                filterQuery += " core.artist.familyname like N'%" + txtbox_namefilter.Text + "%'";
            }

            SqlDataSource3_ArtistListForAudience.SelectCommand = string.Format(@"SELECT core.artist.firstname,
                                                                       core.artist.middlename,
                                                                       core.artist.familyname,
                                                                       core.artist.photo1,
                                                                       core.artist.affiliation,
                                                                       ArtistType.NAME AS ArtistType,
                                                                       inst.namevalues AS instruments
                                                                FROM   core.artist
                                                                       INNER JOIN (SELECT
                                                                       artist,
                                                                       Stuff((SELECT ', ' + NAME
                                                                              FROM   (SELECT at.artist,
                                                                                             al.NAME
                                                                                      FROM   drived.artist_artisttype at
                                                                                             JOIN lookup.artisttype al
                                                                                               ON at.artisttypeid = al.id)x
                                                                              WHERE  ( artist = Results.artist )
                                                                              FOR xml path(''), type).value('(./text())[1]', 'VARCHAR(MAX)'), 1
                                                                                                     , 2, '')
                                                                       AS NAME
                                                                                   FROM   drived.artist_artisttype Results
                                                                                   GROUP  BY artist) ArtistType
                                                                               ON core.artist.id = ArtistType.artist
                                                                       JOIN
                                                                              (SELECT
                                                                       artist,
                                                                                    Stuff((SELECT ', ' + englishname
                                                                                           FROM   (SELECT ai.artistid,
                                                                                                          i.englishname
                                                                                                   FROM   drived.artist_instrument ai
                                                                                                          JOIN core.instrument i
                                                                                                            ON ai.instrumentid = i.id)x
                                                                                           WHERE  ( artistid = Results.artist )
                                                                                           FOR xml
                                                                       path(''), type).value('(./text())[1]', 'VARCHAR(MAX)'), 1
                                                                                                           , 2, '')
                                                                                    AS NameValues
                                                                             FROM   drived.artist_artisttype Results
                                                                             GROUP  BY artist) inst
                                                                         ON inst.artist = core.artist.id  {0}", filterQuery);

            artistsRepeater.DataSource = SqlDataSource3_ArtistListForAudience;
            artistsRepeater.DataBind();
        }
    }
}