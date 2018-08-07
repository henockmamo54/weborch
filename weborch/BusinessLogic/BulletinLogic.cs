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
