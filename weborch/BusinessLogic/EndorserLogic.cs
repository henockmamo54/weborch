using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class EndorserLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<Endorser> getAllEndorser() {
            return entity.Endorsers.ToList();
        }

        public bool insertEndorser(Endorser e)
        {
            try
            {
                entity.Endorsers.Add(e);
                entity.SaveChanges();
                return true;
            }
            catch (Exception exception)
            {
                return false;
            }
        }
        public bool insertUserEndorser(User_Endorser e)
        {
            try
            {
                entity.User_Endorser.Add(e);
                entity.SaveChanges();
                return true;
            }
            catch (Exception exception)
            {
                return false;
            }
        }
    }
}
