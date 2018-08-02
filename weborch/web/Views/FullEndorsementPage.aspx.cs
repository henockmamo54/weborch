using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace web.Views
{
    public partial class FullEndorsementPage : System.Web.UI.Page
    {
        Artist artist;
        Endorser endorser;
        Artist_Endorser ae;
        OrchestraDBEntities entity = new OrchestraDBEntities();
        int userID = -1;
        int endID = -1;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var mylist = entity.Artist_Endorser.ToList();

                int.TryParse(Request.QueryString["UserID"], out userID);
                int.TryParse(Request.QueryString["EndID"], out endID);

                if (userID != null && userID > 0) artist = entity.Artists.Where(x => x.ID == userID).FirstOrDefault();
                if (endID != null && endID > 0) endorser = entity.Endorsers.Where(x => x.ID == endID).FirstOrDefault();

                if (artist != null && endorser != null)
                {
                    ArtistName.Text = artist.FirstName;
                    EndorserName.Text = endorser.Name;
                    ae = entity.Artist_Endorser.Where(x => x.ArtistID == userID && x.EndorserID == endID).FirstOrDefault();
                    if (ae != null) endorserComment.Text = ae.Comment;
                    Session["ae"] = ae;
                }
            }
        }

        public void saveComment(object sender, EventArgs e) {

            if (Session["ae"] != null) {
                ae = (Artist_Endorser)Session["ae"];
                ae.Comment = endorserComment.Text;
                entity.SaveChanges();

                Response.Redirect("~/Views/HomeView");
            }

        }
    }
}