//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class BulletinCommentTable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BulletinCommentTable()
        {
            this.BulletinCommentTable1 = new HashSet<BulletinCommentTable>();
        }
    
        public int ID { get; set; }
        public string CommentMessage { get; set; }
        public System.DateTime CommentDate { get; set; }
        public Nullable<int> PostID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> ParentCommentID { get; set; }
        public string UserName { get; set; }
    
        public virtual Bulletin Bulletin { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BulletinCommentTable> BulletinCommentTable1 { get; set; }
        public virtual BulletinCommentTable BulletinCommentTable2 { get; set; }
        public virtual UserCommonTable UserCommonTable { get; set; }
    }
}