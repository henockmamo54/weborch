using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class FreeBoardLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public List<FreeBoard> getAllFreeBoardInfo() {
            return entity.FreeBoards.ToList();
        }

        public bool insertFreeboard(FreeBoard b) {
            try
            {
                b.timestamp = DateTime.Now;
                entity.FreeBoards.Add(b);
                entity.SaveChanges();

                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
