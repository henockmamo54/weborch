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
    
    public partial class ParentCommentTable
    {
        public int ID { get; set; }
        public string Username { get; set; }
        public string CommentMessage { get; set; }
        public Nullable<System.DateTime> CommentDate { get; set; }
        public Nullable<int> PostID { get; set; }
    }
}
