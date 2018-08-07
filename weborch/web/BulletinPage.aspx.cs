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
        UserCommonTable user;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (UserCommonTable)Session["User"];
            if (!IsPostBack)
            {
                Repeater1.DataSource = bl.getAllMsg();
                Repeater1.DataBind();                
            }

        }

        protected List<ParentCommentTable> GetDetail(object item)
        {
            //var dept = (ParentCommentTable)item;
            // then do whatever is necessary to get the employees from dept
            return pc.getAllParentComments().Take(2).ToList();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
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
                bulletin.MSG = txt_bulmsg.Text;
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
            txt_bulmsg.Text = "";
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


            ParentCommentTable pt = new ParentCommentTable();
            pt.Username = "anonymous";
            pt.CommentMessage = message;
            pt.PostID = int.Parse(e.CommandArgument.ToString());

            pc.addParentComment(pt);

            var value = e.CommandArgument;

            System.Console.WriteLine("on btn click");

            Repeater1.DataSource = bl.getAllMsg();
            Repeater1.DataBind();

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
                var x = cl.getChildCommentByParentID(((ParentCommentTable)e.Item.DataItem).ID);
                detail.DataSource = x;
                detail.DataBind();

                string msg = ((ParentCommentTable)e.Item.DataItem).CommentMessage;
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
                var x = pc.getChildCommentByParentID(((BulletinModifiedModel)e.Item.DataItem).ID);

                repeater2.DataSource = x;
                repeater2.DataBind();

            }
        }

        protected void btnAddDetailComment_Click(object sender, CommandEventArgs e)
        {
            RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
            string message = (item.FindControl("txtCommentReplyParent") as TextBox).Text;


            ChildCommentTable ct = new ChildCommentTable();
            ct.Username = "anonymous";
            ct.CommentMessage = message;
            ct.ParentCommentID = int.Parse(e.CommandArgument.ToString());

            cl.addChildComment(ct);

            Repeater1.DataSource = bl.getAllMsg();
            Repeater1.DataBind();

        }
        
        public void LikeClicked(object sender, EventArgs e) {

        }

    }
}