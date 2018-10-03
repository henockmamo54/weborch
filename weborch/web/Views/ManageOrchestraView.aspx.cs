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
    public partial class ManageOrchestraView : Page
    {
        OrchestraLogic orl = new OrchestraLogic();
        OrchestraInstrumentArtistLogic oial = new OrchestraInstrumentArtistLogic();
        UserCommonTable user;
        OrchestraDBEntities entity = new OrchestraDBEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

            user = (UserCommonTable)Session["User"];
            if (user != null)
            {
                OrchestraDBEntities entity = new OrchestraDBEntities();
                var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                bool isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
            }
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
                orch.ConductorID = int.Parse(DropDownList2_conductor.SelectedValue);
                orch.Since = int.Parse(txt_orchsince.Text);

                if (orl.addOrchestra(orch))
                {

                    //GridView1.DataSource = orl.getAllOrchestra();
                    //GridView1.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanTextBox();
                    GridView1.DataBind();
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
            //txt_orchcondactername.Text = "";
            DropDownList2_conductor.SelectedValue = null;
            txt_orchsince.Text = "";
        }

        protected void Button1_addorchestraDetail_Click(object sender, EventArgs e)
        {
            //Orchestra_Instrument_Artist obj = new Orchestra_Instrument_Artist();
            //obj.OrchestraID = int.Parse(DropDownList1_orchestralist.SelectedValue);
            //obj.InstrumentID = int.Parse(DropDownList3_instrumentlist.SelectedValue);
            //obj.ArtistID = int.Parse(DropDownList2_artistlist.SelectedValue);

            //if (oial.AddOrchestraInstrumentArtist(obj)) ListView2_orchestraInstrumentArtist.DataBind();
        }

        protected void DropDownList1_orchestralist_SelectedIndexChanged(object sender, EventArgs e)
        {
            //SqlDataSource1_orchestraInstrumentArtist.DataBind();
            //ListView2_orchestraInstrumentArtist.DataBind();
        }

        public void serachTextValueChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_orchadd.Visible = false;
            btn_updateorch.Visible = true;

            Session["PerformanceDetailID"] = GridView1.SelectedRow.Cells[1].Text;
            int myid = (int.Parse(GridView1.SelectedRow.Cells[1].Text));
            Orchestra orch = entity.Orchestras.Where(x => x.ID == myid).FirstOrDefault();

            txt_orchname.Text = orch.OfficialName;
            txt_orchaliasname.Text = orch.Alias;
            txt_orchurl.Text = orch.URL;
            txt_orchaddress.Text = orch.Address;
            txt_orchzipcode.Text = orch.ZipCode;
            txt_orchtelno.Text = orch.TelNO;
            txt_orchfaxno.Text = orch.FaxNo;
            DropDownList2_conductor.SelectedValue = orch.ConductorID.ToString();
            txt_orchsince.Text = orch.Since + "";

        }

        protected void btn_cancelorch_Click(object sender, EventArgs e)
        {

            btn_orchadd.Visible = true;
            btn_updateorch.Visible = false;

            cleanTextBox();
        }

        protected void btn_updateorch_Click(object sender, EventArgs e)
        {
            Session["PerformanceDetailID"] = GridView1.SelectedRow.Cells[1].Text;
            int myid = (int.Parse(GridView1.SelectedRow.Cells[1].Text));
            Orchestra orch = entity.Orchestras.Where(x => x.ID == myid).FirstOrDefault();

            try
            {
                orch.OfficialName = txt_orchname.Text;
                orch.Alias = txt_orchaliasname.Text;
                orch.URL = txt_orchurl.Text;
                orch.Address = txt_orchaddress.Text;
                orch.ZipCode = txt_orchzipcode.Text;
                orch.TelNO = txt_orchtelno.Text;
                orch.FaxNo = txt_orchfaxno.Text;
                orch.ConductorID = int.Parse(DropDownList2_conductor.SelectedValue);
                orch.Since = int.Parse(txt_orchsince.Text);

                entity.SaveChanges();

                showMsg("Data inserted succssfuly");
                cleanTextBox();
                GridView1.DataBind();

            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs");
            }


        }

    }
}