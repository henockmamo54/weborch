using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class InstrumentLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<Instrument> getAllInstruments()
        {
            return entity.Instruments.ToList();
        }

        public bool addInstrument(Instrument instrument)
        {
            try
            {
                entity.Instruments.Add(instrument); entity.SaveChanges();
                return true;
            }
            catch (Exception e) { return false; }
        }
    }
}
