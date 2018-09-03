using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;

namespace web.Views
{
    public partial class ArtistProfilePaage : System.Web.UI.Page
    {
        int userID = -1;
        OrchestraDBEntities entities = new OrchestraDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            userID= int.Parse(Request.QueryString["ID"]);
            Artist artist = entities.Artists.Where(x => x.ID == userID).FirstOrDefault();

            if (artist != null) {
                profileImage.ImageUrl = "../Document/" + artist.Photo1;
                artistnamecontainer.InnerText = artist.FamilyName + " " + artist.FirstName + " " + artist.MiddleName;
                birthday.Text = artist.BirthDate.ToShortDateString();
                address.Text = artist.Address;
                zipcode.Text = artist.ZipCode;
                teleno.Text = artist.ZipCode;
                mobilenumber.Text = artist.MobileNO;
                faxnumber.Text = artist.FaxNo;
                remarks.Text = artist.Remar;
                kakaoTalkID.Text = artist.KakaoTalkAddress;
                facebook.Text = artist.FacebookAddress;
                twitter.Text = artist.TwitterAddress;
                affilation.Text = artist.Affiliation;
                profilepage.Text = artist.ProfilePage;
                repertory.Text = artist.Repertory;

                var instruments = artist.Artist_Instrument.ToList();
                string listofInstruments = "";
                foreach (var i in instruments) {
                    listofInstruments += i.Instrument.EnglishName+ ", ";
                }
                instrumentslabel.Text = listofInstruments;

                var endorsers = entities.User_Endorser.Where(x => x.ArtistID == artist.ID).ToList();
                repeater_endorser.DataSource = endorsers;
                repeater_endorser.DataBind();

                var artisttypes = artist.Artist_ArtistType.ToList();
                var artisttypesstring = "";
                foreach (var type in artisttypes) {
                    artisttypesstring += type.ArtistType.Name;
                }
                artisttype.Text = artisttypesstring;

            }
        }
    }
}