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
        protected void Page_Load(object sender, EventArgs e)
        {
            //instrument grid
            //GridView2.DataSource = insl.getAllInstruments();
            //GridView2.DataBind();
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
                //inst.PhotoLocation = txt_inst_photolocation.Text;
                getPhoto(inst, FileUpload1);
                inst.Remarks = txt_inst_remarks.Text;

                if (insl.addInstrument(inst))
                {

                    //GridView2.DataSource = insl.getAllInstruments();
                    //GridView2.DataBind();
                    GridView1.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanInstTextBoxs();
                }
                else showMsg("Please check your inputs");
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }
        }


        public void getPhoto(Instrument info, FileUpload fileupload)
        {

            if (fileupload.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(fileupload.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    fileupload.SaveAs(path + fileupload.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return;
                }
            }            
                info.PhotoLocation = fileupload.FileName;
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);

            //string script = "alert(\"Hello\");";
            //ScriptManager.RegisterStartupScript(this, GetType(),
            //                      "ServerControlScript", msg, true);
        }


        public void cleanInstTextBoxs()
        {
            txt_inst_engname.Text = ""; ;
            txt_inst_korean_name.Text = "";
            txt_inst_alias.Text = "";
            txt_inst_player.Text = "";
            txt_inst_group.Text = "";
            txt_inst_explanation.Text = "";
            txt_inst_soundcliplocation.Text = "";
            txt_inst_videocliplocation.Text = "";
            //txt_inst_photolocation.Text = "";
            txt_inst_remarks.Text = "";
        }

        protected void buttonChangeImage(object sender, EventArgs e)
        {
            if (FileUpload2.HasFiles)
            {
                string ext = System.IO.Path.GetExtension(FileUpload2.FileName);
                if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                {
                    string path = Server.MapPath("~//Document//");
                    FileUpload2.SaveAs(path + FileUpload2.FileName);
                }
                else
                {
                    showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    return;
                }
            }


            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            if (Session["SelectedInstrumentID"] != null) {

                int id = int.Parse(Session["SelectedInstrumentID"].ToString());
                OrchestraDBEntities entity = new OrchestraDBEntities();

                var x = entity.Instruments.Where(inst => inst.ID == id).FirstOrDefault();
                if (x != null) {
                    x.PhotoLocation = FileUpload2.FileName;
                    entity.SaveChanges();
                    GridView1.DataBind();
                }
            }

        }


        protected void TextBox1_serachinstrument_TextChanged(object sender, EventArgs e)
        {
            if (TextBox1_serachinstrument.Text.Length == 0) GridView1.DataBind();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            modalImageContainer.ImageUrl = "~/Document/" + ((Label)GridView1.Rows[e.NewEditIndex].Cells[10].Controls[1]).Text;
            Session["SelectedInstrumentID"] = GridView1.Rows[e.NewEditIndex].Cells[1].Text;
        }
        
    }
}