using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;

namespace BusinessLogic
{
    public class PromotionAndRecruitmentLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public List<PromotionAndRecruitment> getAllInfo() {
            return entity.PromotionAndRecruitments.ToList();
        }

        public bool addNewInfo(PromotionAndRecruitment pr) {
            try
            {
                pr.timestamp = DateTime.Now;
                entity.PromotionAndRecruitments.Add(pr);
                entity.SaveChanges();

                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }

}
