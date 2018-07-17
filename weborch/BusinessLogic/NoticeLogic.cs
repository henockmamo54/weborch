using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic
{
    public class NoticeLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();

        public List<NoticeTable> getAllNoticeInfo() {
            return entity.NoticeTables.ToList();
        }

        public bool insetNoticeInfo(NoticeTable nt) {
            try
            {
                nt.timestamp = DateTime.Now;
                entity.NoticeTables.Add(nt);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }
    }
}
