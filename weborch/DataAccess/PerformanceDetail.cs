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
    
    public partial class PerformanceDetail
    {
        public int ID { get; set; }
        public Nullable<int> PerformanceID { get; set; }
        public string Title { get; set; }
        public Nullable<int> Orchestra { get; set; }
        public Nullable<int> Instrument { get; set; }
        public Nullable<int> Conductor { get; set; }
        public Nullable<int> Player { get; set; }
        public Nullable<int> Composer { get; set; }
    
        public virtual Artist Artist { get; set; }
        public virtual Artist Artist1 { get; set; }
        public virtual Artist Artist2 { get; set; }
        public virtual Instrument Instrument1 { get; set; }
        public virtual Orchestra Orchestra1 { get; set; }
        public virtual Performance Performance { get; set; }
    }
}
