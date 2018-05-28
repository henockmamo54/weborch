using BusinessLogic;
using DataAccess;
using System;
using System.Web.UI;

namespace web
{
    public partial class Contact : Page
    {
        InstrumentLogic insl = new InstrumentLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            //instrument grid
            GridView2.DataSource = insl.getAllInstruments();
            GridView2.DataBind();
        }


        protected void btn_instadd_Click(object sender, EventArgs e)
        {
            try
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

    }
}