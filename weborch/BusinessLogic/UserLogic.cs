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

        public bool checkUserLoginInfo(string username, string password)
        {

            try
            {
                var user = entity.Users.Where(x => x.Email == username.Trim() && x.Password == password.Trim()).ToList();

                if (user.Count == 0) return false;
                else return true;
            }
            catch (Exception ee)
            {
                return false;
            }
        }
        public List<User> checkUserLoginInfo2(string username, string password)
        {
            return entity.Users.Where(x => x.Email == username.Trim() && x.Password == password.Trim()).ToList();
        }

        public bool updateUser(User user) {
            try
            {
                User u = entity.Users.Where(x => x.UserID == user.UserID).First();
                u.EnglishName = user.EnglishName;
                u.KoreanName = user.KoreanName;
                u.UserID = user.KoreanName;
                u.Password = user.Password;
                u.Email = user.Email;
                u.Address = user.Address;
                u.ZipCode = user.ZipCode;

                entity.SaveChanges();

                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
