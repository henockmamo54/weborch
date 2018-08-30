using BusinessLogic.Model;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessLogic
{
    public class BulletinLogic
    {
        OrchestraDBEntities entity = new OrchestraDBEntities();
        public List<BulletinModifiedModel> getAllMsg()
        {
            //return entity.Bulletins.OrderByDescending(x => x.TimeStamp).ToList();
            //var x = entity.Bulletins.SqlQuery(@"select ID, MSG,URL,ImageUrl,TimeStamp,UserID, BulletinTypeID, ISNULL(companyName,Name) Name
            //                                    from(
            //                                    select b.ID,MSG,URL,ImageUrl,TimeStamp,b.UserID, BulletinTypeID, p.Name,c.CompanyName 
            //                                    from core.bulletin b
            //                                    join Main.UserCommonTable u on u.id = b.UserID
            //                                    Left join Main.UserPersonalInfo p on p.userID=u.id
            //                                    Left join Main.UserCompany c on c.userid=u.id)x").ToList<Bulletin>();

            var y = entity.Database.SqlQuery<BulletinModifiedModel>(@"select ID, MSG,URL,ImageUrl,TimeStamp,UserID, BulletinTypeID, ISNULL(companyName,Name) Name
                                                from(
                                                select b.ID,MSG,URL,ImageUrl,TimeStamp,b.UserID, BulletinTypeID, p.Name,c.CompanyName 
                                                from core.bulletin b
                                                join Main.UserCommonTable u on u.id = b.UserID
                                                Left join Main.UserPersonalInfo p on p.userID=u.id
                                                Left join Main.UserCompany c on c.userid=u.id)x").ToList<BulletinModifiedModel>();


            return y;
        }
        public List<BulletinModifiedModel>  getAllMsg(int? userID)
        {
            OrchestraDBEntities entity = new OrchestraDBEntities();
            var query = string.Format(@"
                                            select ID, MSG,URL,ImageUrl,TimeStamp,UserID, BulletinTypeID, ISNULL(companyName,Name) Name,isnull(likecount,0)likecount, ISNULL(dislikecount,0)dislikecount,ISNULL(isliked,0) isliked,ISNULL(disliked,0) disliked
                                                from(
		                                            select b.ID,MSG,URL,ImageUrl,b.TimeStamp,b.UserID, BulletinTypeID, p.Name,c.CompanyName,likecount, dislikecount, ld.IsLike as isliked, uld.IsLike as disliked 
		                                            from core.bulletin b
		                                            join Main.UserCommonTable u on u.id = b.UserID
		                                            Left join Main.UserPersonalInfo p on p.userID=u.id
		                                            Left join Main.UserCompany c on c.userid=u.id
		                                            --Left join Core.BulletinLikeUnlike bl on bl.UserID= u.ID
		                                            Left join (
			                                            select COUNT(distinct UserID) likecount,PostID 
			                                            from Core.BulletinLikeUnlike
			                                            where IsLike=1 
			                                            group by PostID) l on b.ID=l.PostID
		                                            Left join (
			                                            select COUNT(distinct UserID) dislikecount,PostID 
			                                            from Core.BulletinLikeUnlike
			                                            where IsLike=-1  
			                                            group by PostID
			                                            )ul on ul.PostID=b.ID
		                                            Left join(
			                                            select PostID,UserID,IsLike from Core.BulletinLikeUnlike
			                                            where IsLike=1 and UserID={0}) ld on b.ID=ld.PostID
		                                            Left join(
			                                            select PostID,UserID,IsLike from Core.BulletinLikeUnlike
			                                            where IsLike=-1 and UserID={0}) uld on b.ID=uld.PostID
	                                            )x", (userID==null ? "null":userID.ToString()));
            var y = entity.Database.SqlQuery<BulletinModifiedModel>(query).ToList<BulletinModifiedModel>();


            return y;
        }
        public bool addBulletin(Bulletin bulletin)
        {
            try
            {
                entity.Bulletins.Add(bulletin);
                entity.SaveChanges();
                return true;
            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
