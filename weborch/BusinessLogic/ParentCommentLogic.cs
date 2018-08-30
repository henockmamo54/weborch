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

        public List<BulletinCommentTable> getcomments(int ID) {
            return entity.BulletinCommentTables.Where(x => x.PostID == ID && x.ParentCommentID==null).OrderByDescending(x=>x.CommentDate ).ToList();
        }

        public bool addBulletinComment(BulletinCommentTable bt) {

            try {
                bt.CommentDate = DateTime.Now;
                entity.BulletinCommentTables.Add(bt);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e) {
                return false;
            }
        }

        public List<BulletinCommentTable> getBulletinCommentByParent(int parentID) {
            return entity.BulletinCommentTables.Where(x => x.ParentCommentID == parentID).OrderByDescending(x => x.CommentDate).ToList();
        }
    }
}
