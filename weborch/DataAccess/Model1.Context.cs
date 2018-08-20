﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class OrchestraDBEntities : DbContext
    {
        public OrchestraDBEntities()
            : base("name=OrchestraDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Artist> Artists { get; set; }
        public virtual DbSet<Instrument> Instruments { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Bulletin> Bulletins { get; set; }
        public virtual DbSet<ChildCommentTable> ChildCommentTables { get; set; }
        public virtual DbSet<ParentCommentTable> ParentCommentTables { get; set; }
        public virtual DbSet<Artist_Instrument> Artist_Instrument { get; set; }
        public virtual DbSet<Orchestra_Instrument_Artist> Orchestra_Instrument_Artist { get; set; }
        public virtual DbSet<FreeBoard> FreeBoards { get; set; }
        public virtual DbSet<Market> Markets { get; set; }
        public virtual DbSet<NoticeTable> NoticeTables { get; set; }
        public virtual DbSet<PromotionAndRecruitment> PromotionAndRecruitments { get; set; }
        public virtual DbSet<Review> Reviews { get; set; }
        public virtual DbSet<User_UserType> User_UserType { get; set; }
        public virtual DbSet<UserType> UserTypes { get; set; }
        public virtual DbSet<UserCommonTable> UserCommonTables { get; set; }
        public virtual DbSet<UserCompany> UserCompanies { get; set; }
        public virtual DbSet<Artist_ArtistType> Artist_ArtistType { get; set; }
        public virtual DbSet<ArtistType> ArtistTypes { get; set; }
        public virtual DbSet<PerformanceDetail> PerformanceDetails { get; set; }
        public virtual DbSet<UserPersonalInfo> UserPersonalInfoes { get; set; }
        public virtual DbSet<Endorser> Endorsers { get; set; }
        public virtual DbSet<User_Endorser> User_Endorser { get; set; }
        public virtual DbSet<Artist_Endorser> Artist_Endorser { get; set; }
        public virtual DbSet<Performance> Performances { get; set; }
        public virtual DbSet<PerformanceDetail_Instrument_Artist> PerformanceDetail_Instrument_Artist { get; set; }
        public virtual DbSet<Orchestra> Orchestras { get; set; }
        public virtual DbSet<BulletinType> BulletinTypes { get; set; }
        public virtual DbSet<BulletinLikeUnlike> BulletinLikeUnlikes { get; set; }
        public virtual DbSet<PerformanceParentCommentTable> PerformanceParentCommentTables { get; set; }
        public virtual DbSet<PerformanceLikeUnlike> PerformanceLikeUnlikes { get; set; }
    }
}
