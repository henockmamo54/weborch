using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class ReviewLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<Review> getAllReviews() {
            return entity.Reviews.ToList();
        }

        public bool insertReview(Review r) {

            try
            {
                r.timestamp = DateTime.Now;
                entity.Reviews.Add(r);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }

        }
    }
}
