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
    
    public partial class Artist
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Artist()
        {
            this.Artist_Instrument = new HashSet<Artist_Instrument>();
            this.Orchestra_Instrument_Artist = new HashSet<Orchestra_Instrument_Artist>();
        }
    
        public int ID { get; set; }
        public string FirstName { get; set; }
        public string FamilyName { get; set; }
        public string MiddleName { get; set; }
        public System.DateTime BirthDate { get; set; }
        public string Address { get; set; }
        public string ZipCode { get; set; }
        public string TelNO { get; set; }
        public string MobileNO { get; set; }
        public string FaxNo { get; set; }
        public string Remar { get; set; }
        public string FacebookAddress { get; set; }
        public string TwitterAddress { get; set; }
        public string KakaoTalkAddress { get; set; }
        public string Photo1 { get; set; }
        public string Photo2 { get; set; }
        public string ProfilePage { get; set; }
        public string Repertory { get; set; }
        public string EndorsorEmailID1 { get; set; }
        public string EndorsorName1 { get; set; }
        public string EndorsorComments1 { get; set; }
        public string EndorsorEmailID2 { get; set; }
        public string EndorsorName2 { get; set; }
        public string EndorsorComments2 { get; set; }
        public string EndorsorEmailID3 { get; set; }
        public string EndorsorName3 { get; set; }
        public string EndorsorComments3 { get; set; }
        public string EndorsorEmailID4 { get; set; }
        public string EndorsorName4 { get; set; }
        public string EndorsorComments4 { get; set; }
        public string EndorsorEmailID5 { get; set; }
        public string EndorsorName5 { get; set; }
        public string EndorsorComments5 { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Artist_Instrument> Artist_Instrument { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Orchestra_Instrument_Artist> Orchestra_Instrument_Artist { get; set; }
    }
}
