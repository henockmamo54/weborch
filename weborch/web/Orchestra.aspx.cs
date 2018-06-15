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
    public partial class About : Page
    {
        OrchestraLogic orl = new OrchestraLogic();
        OrchestraInstrumentArtistLogic oial = new OrchestraInstrumentArtistLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            //orchestra grid
            GridView1.DataSource = orl.getAllOrchestra();
            GridView1.DataBind();
        }

        protected void btn_orchadd_Click(object sender, EventArgs e)
        {
            try
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
                orch.Since = int.Parse(txt_orchsince.Text);

                if (orl.addOrchestra(orch))
                {

                    GridView1.DataSource = orl.getAllOrchestra();
                    GridView1.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanTextBox();
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

            //string script = "alert(\"Hello\");";
            //ScriptManager.RegisterStartupScript(this, GetType(),
            //                      "ServerControlScript", msg, true);
        }

        public void cleanTextBox()
        {
            txt_orchname.Text = "";
            txt_orchaliasname.Text = "";
            txt_orchurl.Text = "";
            txt_orchaddress.Text = "";
            txt_orchzipcode.Text = "";
            txt_orchtelno.Text = "";
            txt_orchfaxno.Text = "";
            txt_orchcondactername.Text = "";
            txt_orchsince.Text = "";
        }

        protected void Button1_addorchestraDetail_Click(object sender, EventArgs e)
        {
            Orchestra_Instrument_Artist obj = new Orchestra_Instrument_Artist();
            obj.OrchestraID = int.Parse( DropDownList1_orchestralist.SelectedValue);
            obj.InstrumentID = int.Parse(DropDownList3_instrumentlist.SelectedValue);
            obj.ArtistID = int.Parse(DropDownList2_artistlist.SelectedValue);

            if (oial.AddOrchestraInstrumentArtist(obj)) ListView2_orchestraInstrumentArtist.DataBind();
        }
    }
}