using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web.Views
{
    public partial class BulletinViewPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var user = (UserCommonTable)Session["User"];
                if (user == null) Response.Redirect("~/LoginPage.aspx");
            }
        }
    }
}