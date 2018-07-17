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
                User u = entity.Users.Where(x => x.Email == user.Email).First();
                u.Email = user.Email;
                u.Password = user.Password;
                u.KoreanName = user.KoreanName;
                u.EnglishName = user.EnglishName;
                u.sex = user.sex;
                u.Birthday = user.Birthday;
                u.ZipCode = user.ZipCode;
                u.Address = user.Address;
                u.PhoneNumber = user.PhoneNumber;
                u.Category = user.Category;
                entity.SaveChanges();

                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
