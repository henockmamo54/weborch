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
    
    public partial class UserCompany
    {
        public int ID { get; set; }
        public Nullable<int> UserID { get; set; }
        public string CompanyName { get; set; }
        public string BussinessNo { get; set; }
        public string ZipCode { get; set; }
        public string Address { get; set; }
        public string TelephoneNo { get; set; }
        public string FaxNo { get; set; }
        public string CEOName { get; set; }
        public string AdminEmail { get; set; }
        public string AdminName { get; set; }
        public string AdminMobileNo { get; set; }
        public string CompanyHomeUrl { get; set; }
        public string OtherInfo { get; set; }
    
        public virtual UserCommonTable UserCommonTable { get; set; }
    }
}