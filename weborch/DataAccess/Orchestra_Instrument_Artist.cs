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
    
    public partial class Orchestra_Instrument_Artist
    {
        public int ID { get; set; }
        public Nullable<int> OrchestraID { get; set; }
        public Nullable<int> ArtistID { get; set; }
        public Nullable<int> InstrumentID { get; set; }
    
        public virtual Instrument Instrument { get; set; }
        public virtual Orchestra Orchestra { get; set; }
        public virtual Artist Artist { get; set; }
    }
}
