using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using System.Data.Entity.Validation;

namespace BusinessLogic
{
   public class OrchestraLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<Orchestra> getAllOrchestra() {
            return entity.Orchestras.ToList();            
        }

        public bool addOrchestra(Orchestra orchestra) {

            try
            {
                entity.Orchestras.Add(orchestra);
                entity.SaveChanges();
            }
            catch (DbEntityValidationException e) {
                foreach (var eve in e.EntityValidationErrors)
                {
                    string msg= String.Format("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
            eve.Entry.Entity.GetType().Name, eve.Entry.State);

                    foreach (var ve in eve.ValidationErrors)
                    {
                        string msg2 = String.Format("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }

                    return false;
            }

            return true;
        }

        

    }
}
