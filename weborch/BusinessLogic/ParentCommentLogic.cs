using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
namespace BusinessLogic
{
    public class ParentCommentLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public List<ParentCommentTable> getAllParentComments() {
            return entity.ParentCommentTables.ToList();
        }

        public bool addParentComment(ParentCommentTable pt) {
            try
            {
                pt.CommentDate = DateTime.UtcNow;
                entity.ParentCommentTables.Add(pt);
                entity.SaveChanges();
                return true;
            }
            catch (Exception ee) {
                return false;
            }
        }

        public List<ParentCommentTable> getChildCommentByParentID(int ID)
        {
            return entity.ParentCommentTables.Where(x => x.PostID == ID).ToList();
        }
    }
}
