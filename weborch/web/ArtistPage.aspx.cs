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
    public partial class ArtistPage : System.Web.UI.Page
    {
        ArtistLogic artl = new ArtistLogic();
        ArtistInstrumentLogic artInstLogic = new ArtistInstrumentLogic();

        protected void Page_Load(object sender, EventArgs e)
        {
            //artist grid
            GridView3.DataSource = artl.getAllArtists();
            GridView3.DataBind();
                                   
        }


        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);

            //string script = "alert(\"Hello\");";
            //ScriptManager.RegisterStartupScript(this, GetType(),
            //                      "ServerControlScript", msg, true);
        }

        protected void btn_artistadd_Click(object sender, EventArgs e)
        {
            try
            {
                Artist artist = new Artist();
                artist.FirstName = txt_artist_firstname.Text;
                artist.MiddleName = txt_artist_middlename.Text;
                artist.FamilyName = txt_artist_familyname.Text;
                artist.BirthDate = DateTime.Parse(txt_artist_birthdate.Text);
                artist.Address = txt_artist_address.Text;
                artist.ZipCode = txt_artist_zipcode.Text;
                artist.TelNO = txt_artist_teleno.Text;
                artist.MobileNO = txt_artist_mobileno.Text;
                artist.FaxNo = txt_aritist_faxno.Text;
                artist.Remar = txt_artist_remark.Text;

                if (artl.addArtist(artist))
                {

                    GridView3.DataSource = artl.getAllArtists();
                    GridView3.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanArtistTextBoxs();
                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }
        }


        public void cleanArtistTextBoxs()
        {
            txt_artist_firstname.Text = "";
            txt_artist_middlename.Text = "";
            txt_artist_familyname.Text = "";
            txt_artist_birthdate.Text = "";
            txt_artist_address.Text = "";
            txt_artist_zipcode.Text = "";
            txt_artist_teleno.Text = "";
            txt_artist_mobileno.Text = "";
            txt_aritist_faxno.Text = "";
            txt_artist_remark.Text = "";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //showMsg(DropDownList1.SelectedValue);
        }

        protected void btn_addInstrument_Click(object sender, EventArgs e)
        {
            Artist_Instrument artistInst = new Artist_Instrument();
            artistInst.ArtistID = int.Parse(DropDownList1_artistList.SelectedValue);
            artistInst.InstrumentID = int.Parse(DropDownList1_Instrument.SelectedValue);

            if (artInstLogic.addArtistInstrument(artistInst)) {
                ListView_instrumentsplayedbyartist.DataBind();
            }
        }
    }
}