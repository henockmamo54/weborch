using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web.Views
{
    public partial class InformationSpace : System.Web.UI.Page
    {
        ReviewLogic rl = new ReviewLogic();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddReview_Click(object sender, EventArgs e)
        {
            Review r = new Review();
            r.Title = FormControlInput1_Title.Text;
            r.Content = FormControlTextarea1_content.Text;
            r.Comment = FormControlTextarea1_comment.Text;
            r.Writer = FormControlInput1_writer.Text;

            var x= rl.insertReview(r);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);
            
        }
    }
}