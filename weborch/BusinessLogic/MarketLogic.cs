using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class MarketLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<Market> getAllMarketdata() {
            return entity.Markets.ToList();
        }

        public bool insetMarketInfo(Market m) {
            try
            {
                m.timestamp = DateTime.Now;
                entity.Markets.Add(m);
                entity.SaveChanges();
                return true;
            }
            catch (Exception ee) {
                return false;
            }
        }
    }
}
