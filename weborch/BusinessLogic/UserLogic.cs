using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class UserLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public List<User> getAllUser()
        {
            return entity.Users.ToList();
        }
        public bool addUser(User user)
        {
            try
            {
                entity.Users.Add(user);
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
