using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class BulletinLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public List<Bulletin> getAllMsg()
        {
            return entity.Bulletins.OrderByDescending(x => x.TimeStamp).ToList();
        }
        public bool addBulletin(Bulletin bulletin)
        {
            try
            {
                entity.Bulletins.Add(bulletin);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
