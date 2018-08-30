using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using BusinessLogic;
using BusinessLogic.Model;
using System.Web.Services;

namespace web
{
    public partial class BulletinPage : System.Web.UI.Page
    {
        BulletinLogic bl = new BulletinLogic();
        ParentCommentLogic pc = new ParentCommentLogic();
        ChildCommentLogic cl = new ChildCommentLogic();
        static UserCommonTable user;
        public static UserCommonTable myuser;
        bool isUserCompany;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserCommonTable)Session["User"];
            myuser = (UserCommonTable)Session["User"];
            if (!IsPostBack)
            {
                //if (user == null) Response.Redirect("~/LoginPage.aspx");

                OrchestraDBEntities entity = new OrchestraDBEntities();
                if (user != null)
                {
                    Repeater1.DataSource = bl.getAllMsg(user.ID);
                    var val = user.User_UserType.FirstOrDefault().UserTypeID.Value;
                    isUserCompany = entity.UserTypes.Where(x => x.ID == val).FirstOrDefault().Iscompany;
                }
                else Repeater1.DataSource = bl.getAllMsg(null);
                Repeater1.DataBind();
            }

            Session["postRepeater"] = Repeater1;

        }

        protected List<ParentCommentTable> GetDetail(object item)
        {
            //var dept = (ParentCommentTable)item;
            // then do whatever is necessary to get the employees from dept
            return pc.getAllParentComments().Take(2).ToList();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var msg = Server.HtmlEncode(HiddenField2.Value);
            showMsg(msg);

            try
            {
                if (FileUpload1.HasFiles)
                {
                    string ext = System.IO.Path.GetExtension(FileUpload1.FileName);
                    if (ext == ".jpg" || ext == ".png" || ext == ".gif" || ext == ".jpeg")
                    {
                        string path = Server.MapPath("Document//");
                        FileUpload1.SaveAs(path + FileUpload1.FileName);
                    }
                    else
                    {
                        showMsg("you can upload only jpeg,jpg,png,gif file formats");
                    }
                }
                else
                {
                    showMsg("Please select an image to upload.");
                    return;
                }

                Bulletin bulletin = new Bulletin();
                //bulletin.MSG = txt_bulmsg.Text;
                bulletin.MSG = msg;
                bulletin.URL = txt_bulurl.Text;
                bulletin.TimeStamp = DateTime.Now;
                bulletin.ImageUrl = FileUpload1.FileName;
                bulletin.BulletinTypeID = int.Parse(DropDownList1.SelectedValue);
                bulletin.UserID = user.ID;
                if (bl.addBulletin(bulletin))
                {
                    Repeater1.DataSource = bl.getAllMsg();
                    Repeater1.DataBind();
                    showMsg("Data inserted succssfuly");
                    cleanPostText();
                }
                else showMsg("Please check your inputs. can't insert the info properly");
            }
            catch (Exception ee)
            {
                showMsg("Please check your inputs. related the server problem");
            }

        }

        private void cleanPostText()
        {
            //txtbulimage.Text = "";
            //txt_bulmsg.Text = "";
            txt_bulurl.Text = "";
        }

        public void showMsg(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + msg + "')", true);
        }

        protected void btn_browsdir_Click(object sender, EventArgs e)
        {

        }

        protected void btnComment_Click(object sender, CommandEventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtComment") as TextBox).Text;

            if (user == null)
            {
                showMsg("Please sign in to write comments!!!");
                return;
            }
            if (message.Length > 0)
            {
                BulletinCommentTable pt = new BulletinCommentTable();
                if (user != null)
                {
                    if (isUserCompany) pt.UserName = user.UserCompanies.FirstOrDefault().CompanyName.ToString();
                    else pt.UserName = user.UserPersonalInfoes.FirstOrDefault().Name.ToString();
                }
                else pt.UserName = "anonymous";
                pt.CommentMessage = message;
                pt.PostID = int.Parse(e.CommandArgument.ToString());

                pc.addBulletinComment(pt);

                var value = e.CommandArgument;

                System.Console.WriteLine("on btn click");

                Repeater1.DataSource = bl.getAllMsg();
                Repeater1.DataBind();
            }
        }

        protected void Repeater2_DataBinding(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
        }

        protected void Repeater2_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var detail = (Repeater)item.FindControl("detailRepeater");

                //pc.getAllParentComments().Take(2).ToList()
                var x = pc.getBulletinCommentByParent(((BulletinCommentTable)e.Item.DataItem).ID);
                detail.DataSource = x;
                detail.DataBind();

                string msg = ((BulletinCommentTable)e.Item.DataItem).CommentMessage;
                System.Console.WriteLine(msg);
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var repeater2 = (Repeater)item.FindControl("Repeater2");
                var x = pc.getcomments(((BulletinModifiedModel)e.Item.DataItem).ID);
                //var x = pc.getChildCommentByParentID(((BulletinModifiedModel)e.Item.DataItem).ID);

                repeater2.DataSource = x;
                repeater2.DataBind();

            }
        }


        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static bool checkLoginStatus(int n)
        {

            return user != null;
        }

        protected void btnAddDetailComment_Click(object sender, CommandEventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;


            BulletinCommentTable ct = new BulletinCommentTable();
            if (user != null)
            {
                if (isUserCompany) ct.UserName = user.UserCompanies.FirstOrDefault().CompanyName.ToString();
                else ct.UserName = user.UserPersonalInfoes.FirstOrDefault().Name.ToString();
            }else
            ct.UserName = "anonymous";
            ct.CommentMessage = message;
            ct.ParentCommentID = int.Parse(e.CommandArgument.ToString());

            pc.addBulletinComment(ct);

            Repeater1.DataSource = bl.getAllMsg();
            Repeater1.DataBind();

        }

        public void LikeClicked(object sender, CommandEventArgs e)
        {
            var value = e.CommandArgument.ToString().Split(',');
            int id = int.Parse(value[0]);
            int isLike = int.Parse(value[1]);
            OrchestraDBEntities entities = new OrchestraDBEntities();
            var myval = entities.BulletinLikeUnlikes.Where(x => x.PostID == id & x.UserID == myuser.ID).ToList();
            if (myval.Count > 0)
            {

                if (isLike == 1)
                {
                    if (myval.FirstOrDefault().islike == 1)
                        myval.FirstOrDefault().islike = 0;
                    else myval.FirstOrDefault().islike = 1;
                }
                else
                {
                    if (myval.FirstOrDefault().islike == -1)
                        myval.FirstOrDefault().islike = 0;
                    else myval.FirstOrDefault().islike = -1;
                }
                entities.SaveChanges();
            }
            else
            {
                BulletinLikeUnlike b = new BulletinLikeUnlike();
                b.PostID = id;
                b.UserID = myuser.ID;
                b.islike = isLike;
                b.timestamp = DateTime.Now;
                entities.BulletinLikeUnlikes.Add(b);
                entities.SaveChanges();
            }

            BulletinLogic bl = new BulletinLogic();

            Repeater1.DataSource = bl.getAllMsg(myuser.ID);
            Repeater1.DataBind();

        }

        [System.Web.Services.WebMethod]
        [System.Web.Script.Services.ScriptMethod()]
        public static void test2(int id, int isLike)
        {

            OrchestraDBEntities entities = new OrchestraDBEntities();
            var myval = entities.BulletinLikeUnlikes.Where(x => x.PostID == id & x.UserID == myuser.ID).ToList();
            if (myval.Count > 0)
            {

                if (isLike == 1)
                {
                    if (myval.FirstOrDefault().islike == 1)
                        myval.FirstOrDefault().islike = 0;
                    else myval.FirstOrDefault().islike = 1;
                }
                else
                {
                    if (myval.FirstOrDefault().islike == -1)
                        myval.FirstOrDefault().islike = 0;
                    else myval.FirstOrDefault().islike = -1;
                }
                entities.SaveChanges();
            }
            else
            {
                BulletinLikeUnlike b = new BulletinLikeUnlike();
                b.PostID = id;
                b.UserID = myuser.ID;
                b.islike = isLike;
                b.timestamp = DateTime.Now;
                entities.BulletinLikeUnlikes.Add(b);
                entities.SaveChanges();
            }

            BulletinLogic bl = new BulletinLogic();

            //Repeater repeater = new Repeater();
            //repeater = System.Web.HttpContext.Current.Session["postRepeater"] as Repeater;
            //Repeater1.DataSource = bl.getAllMsg(myuser.ID);
            //Repeater1.DataBind();

        }

        protected void btnsaveProfile_Click(object sender, EventArgs e)
        {

            ScriptManager.RegisterStartupScript(this, this.GetType(), "test", "closeProfileModal();", true);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "closeProfileModal();", true);
        }
        protected void btnCloseProfileEditor_click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideEditor", "hideEditor();", true);
        }

        public void detailrepeater_onItemDataBound(object sender, RepeaterItemEventArgs e ) {
            RepeaterItem item = e.Item;
            if ((item.ItemType == ListItemType.Item) ||
                (item.ItemType == ListItemType.AlternatingItem))
            {
                var detail = (Repeater)item.FindControl("detailRepeater3");

                //pc.getAllParentComments().Take(2).ToList()
                //var x = cl.getChildCommentByParentID(((ParentCommentTable)e.Item.DataItem).ID);
                var source = pc.getBulletinCommentByParent(((BulletinCommentTable)e.Item.DataItem).ID);
                detail.DataSource = source;
                detail.DataBind();

            }
        }


    }
}