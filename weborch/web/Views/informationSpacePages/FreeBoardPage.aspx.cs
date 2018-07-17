using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web.Views.informationSpacePages
{
    public partial class FreeBoardPage : System.Web.UI.Page
    {
        FreeBoardLogic fl = new FreeBoardLogic();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAddReview_Click(object sender, EventArgs e)
        {
            FreeBoard r = new FreeBoard();
            r.Title = FormControlInput1_Title.Text;
            r.Content = FormControlTextarea1_content.Text;
            r.Comment = FormControlTextarea1_comment.Text;
            r.Writer = FormControlInput1_writer.Text;

            if (fl.insertFreeboard(r)) GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);

        }
    }
}