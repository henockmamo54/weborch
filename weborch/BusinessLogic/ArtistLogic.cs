using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class ArtistLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<Artist> getAllArtists() {
            return entity.Artists.ToList();
        }

        public bool addArtist(Artist artist) {
            try
            {
                entity.Artists.Add(artist);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }

        public int addArtistReturnNewID(Artist artist) {
            try
            {
                entity.Artists.Add(artist);
                entity.SaveChanges();
                return artist.ID;
            }
            catch (Exception e)
            {
                return -1;
            }
        }
    }
}
