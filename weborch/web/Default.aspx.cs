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
    public partial class _Default : Page
    {
            OrchestraLogic orl = new OrchestraLogic();
            InstrumentLogic insl = new InstrumentLogic();
            ArtistLogic artl = new ArtistLogic();
        protected void Page_Load(object sender, EventArgs e)
        {

            //orchestra grid
            GridView1.DataSource = orl.getAllOrchestra();
            GridView1.DataBind();

            //instrument grid
            GridView2.DataSource = insl.getAllInstruments();
            GridView2.DataBind();

            //artist grid
            GridView3.DataSource = artl.getAllArtists();
            GridView3.DataBind();
        }

        protected void btn_orchadd_Click(object sender, EventArgs e)
        {
            Orchestra orch = new Orchestra();
            orch.OfficialName = txt_orchname.Text;
            orch.Alias = txt_orchaliasname.Text;
            orch.URL = txt_orchurl.Text;
            orch.Address = txt_orchaddress.Text;
            orch.ZipCode = txt_orchzipcode.Text;
            orch.TelNO = txt_orchtelno.Text;
            orch.FaxNo = txt_orchfaxno.Text;
            orch.ConductorName = txt_orchcondactername.Text;
            orch.Since = int.Parse(txt_orchname.Text);

            if (orl.addOrchestra(orch))
            {

                GridView1.DataSource = orl.getAllOrchestra();
                GridView1.DataBind();
                showMsg("Data inserted succssfuly");
            }
            else showMsg("Please check your inputs");
        }

        protected void btn_instadd_Click(object sender, EventArgs e)
        {
            Instrument inst = new Instrument();
            inst.EnglishName = txt_inst_engname.Text;
            inst.KoreanName = txt_inst_korean_name.Text;
            inst.Alias = txt_inst_alias.Text;
            inst.Player = txt_inst_player.Text;
            inst.Group = txt_inst_group.Text;
            inst.Explanation = txt_inst_explanation.Text;
            inst.SoundClipLocation = txt_inst_soundcliplocation.Text;
            inst.VideoClipLocation = txt_inst_videocliplocation.Text;
            inst.PhotoLocation = txt_inst_photolocation.Text;
            inst.Remarks = txt_inst_remarks.Text;

            if (insl.addInstrument(inst))
            {

                GridView2.DataSource = insl.getAllInstruments();
                GridView2.DataBind();
                showMsg("Data inserted succssfuly");
            }
            else showMsg("Please check your inputs");
        }

        public void showMsg(string msg)
        {
            string script = "alert(\"" + msg + "\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", msg, true);
        }

        protected void btn_artistadd_Click(object sender, EventArgs e)
        {
            Artist artist = new Artist();
            artist.FirstName = txt_artist_firstname.Text;
            artist.MiddleName = txt_artist_middlename.Text;
            artist.FamilyName = txt_artist_familyname.Text;
            artist.BirthDate = DateTime.Parse(txt_artist_birthdate.Text);
            artist.Address = txt_artist_address.Text;
            artist.ZipCode = txt_artist_zipcode.Text;
            artist.TelNO = txt_artist_zipcode.Text;
            artist.MobileNO = txt_artist_mobileno.Text;
            artist.FaxNo = txt_aritist_faxno.Text;
            artist.Remar = txt_artist_remark.Text;

            if (artl.addArtist(artist))
            {

                GridView3.DataSource = artl.getAllArtists();
                GridView3.DataBind();
                showMsg("Data inserted succssfuly");
            }
            else showMsg("Please check your inputs");
        }
    }
}