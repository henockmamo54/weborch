using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Model
{
   public class BulletinModifiedModel
    {
        public int ID { get; set; }
        public string MSG { get; set; }
        public string URL { get; set; }
        public string ImageUrl { get; set; }
        public Nullable<System.DateTime> TimeStamp { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> BulletinTypeID { get; set; }
        public string Name { get; set; }
        public int likecount { get; set; }
        public int dislikecount { get; set; }
        public int isliked { get; set; }
        public int disliked { get; set; }
    }

}
