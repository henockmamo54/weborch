using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
   public class OrchestraInstrumentArtistLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public bool AddOrchestraInstrumentArtist(Orchestra_Instrument_Artist obj) {
            try {
                entity.Orchestra_Instrument_Artist.Add(obj);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
