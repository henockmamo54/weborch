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
    }
}
