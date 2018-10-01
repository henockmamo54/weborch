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
    
    public partial class Instrument
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Instrument()
        {
            this.Artist_Instrument = new HashSet<Artist_Instrument>();
            this.Orchestra_Instrument_Artist = new HashSet<Orchestra_Instrument_Artist>();
            this.PerformanceDetails = new HashSet<PerformanceDetail>();
            this.UserPersonalInfoes = new HashSet<UserPersonalInfo>();
            this.UserPersonalInfoes1 = new HashSet<UserPersonalInfo>();
            this.PerformanceDetail_Instrument_Artist = new HashSet<PerformanceDetail_Instrument_Artist>();
            this.Performances = new HashSet<Performance>();
        }
    
        public int ID { get; set; }
        public string EnglishName { get; set; }
        public string KoreanName { get; set; }
        public string Alias { get; set; }
        public string Player { get; set; }
        public string Group { get; set; }
        public string Explanation { get; set; }
        public string SoundClipLocation { get; set; }
        public string VideoClipLocation { get; set; }
        public string PhotoLocation { get; set; }
        public string Remarks { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Artist_Instrument> Artist_Instrument { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Orchestra_Instrument_Artist> Orchestra_Instrument_Artist { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PerformanceDetail> PerformanceDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserPersonalInfo> UserPersonalInfoes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<UserPersonalInfo> UserPersonalInfoes1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PerformanceDetail_Instrument_Artist> PerformanceDetail_Instrument_Artist { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Performance> Performances { get; set; }
    }
}
