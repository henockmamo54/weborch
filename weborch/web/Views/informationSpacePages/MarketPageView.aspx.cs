﻿using BusinessLogic;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web.Views.informationSpacePages
{
    public partial class MarketPageView : System.Web.UI.Page
    {
        MarketLogic ml = new MarketLogic();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAddReview_Click(object sender, EventArgs e)
        {
            Market r = new Market();

            r.Title = FormControlInput1_Title.Text;
            r.Content = FormControlTextarea1_content.Text;
            r.Comment = FormControlTextarea1_comment.Text;
            r.Writer = FormControlInput1_writer.Text;

            if (ml.insetMarketInfo(r)) GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeModal();", true);

        }

    }
}