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
    public partial class ArtistPageView : System.Web.UI.Page
    {
        ArtistLogic artl = new ArtistLogic();
        ArtistInstrumentLogic artInstLogic = new ArtistInstrumentLogic();
        List<Instrument> instrumentlist;

        protected void Page_Load(object sender, EventArgs e)
        {
            ////artist grid
            //GridView3.DataSource = artl.getAllArtists();
            //GridView3.DataBind();

            if (!IsPostBack)
            {
                instrumentlist = new List<Instrument>();
                Session["myinstlist"] = null;
                myinstrepeater.DataSource = null;
                myinstrepeater.DataBind();
            }

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
                var artistID = artl.addArtistReturnNewID(artist);
                if (artistID != -1)
                {

                    //GridView3.DataSource = artl.getAllArtists();
                    //GridView3.DataBind();
                    ListView1.DataBind();
                    if (Session["myinstlist"] != null)
                    {                        
                        List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                        foreach (Instrument i in mylist) {
                            Artist_Instrument artistInst = new Artist_Instrument();
                            artistInst.ArtistID = artistID;
                            artistInst.InstrumentID = i.ID;
                            artInstLogic.addArtistInstrument(artistInst);                            
                        }
                    }

                    DropDownList1_artistList.DataBind();
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

            if (artInstLogic.addArtistInstrument(artistInst))
            {
                ListView_instrumentsplayedbyartist.DataBind();
            }
        }

        protected void btn_add_Inst_Click(object sender, EventArgs e)
        {
            Instrument inst = new Instrument();
            inst.ID = int.Parse(DropDownList1_InstrumentInTheMain.SelectedItem.Value);
            inst.EnglishName = DropDownList1_InstrumentInTheMain.SelectedItem.Text;

            if (Session["myinstlist"] != null)
            {
                List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                mylist.Add(inst);
                myinstrepeater.DataSource = mylist;
                myinstrepeater.DataBind();
                Session["myinstlist"] = mylist;
            }
            else
            {
                if (instrumentlist == null) instrumentlist = new List<Instrument>();
                this.instrumentlist.Add(inst);
                myinstrepeater.DataSource = this.instrumentlist;
                myinstrepeater.DataBind();

                Session["myinstlist"] = instrumentlist;
            }
        }

        public void removeinstrumentfromList(object sender, EventArgs e) {

        }
        
        public void removeinstrumentfrommyMainList(object sender, EventArgs e)
        {
            if (Session["myinstlist"] != null)
            {
                Button btn = (Button)sender;
                int ID = int.Parse(btn.CommandArgument.ToString());
                List<Instrument> mylist = (List<Instrument>)Session["myinstlist"];
                mylist.RemoveAll(x => x.ID == ID);
                myinstrepeater.DataSource = mylist;
                myinstrepeater.DataBind();
                Session["myinstlist"] = mylist;
            }
        }

        public void serachTextValueChanged(object sender, EventArgs e) {
            ListView1.DataBind();
            DropDownList1_artistList.DataBind();
            ListView_instrumentsplayedbyartist.DataBind();
        }


    }
}