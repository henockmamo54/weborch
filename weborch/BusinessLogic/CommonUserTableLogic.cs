using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class CommonUserTableLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<UserCommonTable> getAllUsers() {
            return entity.UserCommonTables.ToList();
        }

        public bool addUser(UserCommonTable user) {
            try {
                entity.UserCommonTables.Add(user);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
