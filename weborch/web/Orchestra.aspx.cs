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
                orch.Since = int.Parse(txt_orchname.Text);

                if (orl.addOrchestra(orch))
                {

                    GridView1.DataSource = orl.getAllOrchestra();
                    GridView1.DataBind();
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