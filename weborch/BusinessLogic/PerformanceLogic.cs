using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class PerformanceLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public bool insertPerformance(Performance p) {

            try
            {
                entity.Performances.Add(p);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
