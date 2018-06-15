using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class ArtistInstrumentLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public bool addArtistInstrument(Artist_Instrument artistInstrument) {
            try {
                entity.Artist_Instrument.Add(artistInstrument);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
