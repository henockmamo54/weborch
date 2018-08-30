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
    
    public partial class Bulletin
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Bulletin()
        {
            this.BulletinLikeUnlikes = new HashSet<BulletinLikeUnlike>();
            this.BulletinCommentTables = new HashSet<BulletinCommentTable>();
        }
    
        public int ID { get; set; }
        public string MSG { get; set; }
        public string URL { get; set; }
        public string ImageUrl { get; set; }
        public Nullable<System.DateTime> TimeStamp { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> BulletinTypeID { get; set; }
        public string Title { get; set; }
    
        public virtual UserCommonTable UserCommonTable { get; set; }
        public virtual BulletinType BulletinType { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BulletinLikeUnlike> BulletinLikeUnlikes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BulletinCommentTable> BulletinCommentTables { get; set; }
    }
}
