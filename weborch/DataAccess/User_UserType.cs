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
    
    public partial class User_UserType
    {
        public int ID { get; set; }
        public Nullable<int> UserID { get; set; }
        public Nullable<int> UserTypeID { get; set; }
        public string UserTypeName { get; set; }
    
        public virtual UserCommonTable UserCommonTable { get; set; }
        public virtual UserType UserType { get; set; }
    }
}