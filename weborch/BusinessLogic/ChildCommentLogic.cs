using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
namespace BusinessLogic
{
    public class ChildCommentLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public List<ChildCommentTable> getChildCommentByParentID(int id) {
            return entity.ChildCommentTables.Where(x => x.ParentCommentID == id).ToList();
        }
    }
}
