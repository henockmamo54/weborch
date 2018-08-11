<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BulletinPage.aspx.cs" Inherits="web.BulletinPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <br />
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                        <ItemTemplate>
                            <div class="rptr" style="width: 40em; box-shadow: 2px 2px 2px 2px #f5f5f5;">
                                <div class="panel panel-default" style="background-color: #f7f7f7;">
                                    <div style="padding-left: 10px; padding-right: 20px; width: 100%; margin-bottom: 1em; margin-top: 0.5em;">

                                        <asp:Image ID="Image2" runat="server"
                                            ImageUrl="https://myspace.com/common/images/user.png"
                                            Style="width: 30px; height: 30px; border-radius: 50%; margin-top: 0.2em;" />
                                        <%#Eval("Name") %><br />
                                        <%#Eval("TimeStamp") %>
                                    </div>
                                    <table style="margin-left: 0.2em;">
                                        <tr>
                                            <img src="Document/<%#Eval("ImageUrl") %>" style="width: 100%" />
                                        </tr>
                                        <%--<tr>
                                            <th colspan="2">ID <%#Eval("ID") %> </th>
                                        </tr>--%>
                                        <tr>
                                            <br />
                                            <%--<td>MSG</td>--%>
                                            <td style="width: 100%"><%#Eval("MSG") %></td>
                                        </tr>
                                        <tr>
                                            <%--<td>URL</td>--%>
                                            <%--<td><%#Eval("URL") %></td>--%>
                                            <td>
                                                <a href="//<%#Eval("URL") %>" target="_blank">Read More</a>
                                            </td>
                                        </tr>
                                        <%--<tr>
                                            <td>Image</td>
                                            <td><%#Eval("ImageUrl") %></td>
                                        </tr>--%>
                                        <%--<tr>
                                            <td>Date</td>
                                            <td><%#Eval("TimeStamp") %></td>
                                        </tr>--%>
                                        <%--<tr><td>Date of Examination</td><td><%#Eval("D_O_E") %></td></tr>
          <tr><td>Department</td><td><%#Eval("Department") %></td></tr>--%>
                                    </table>
                                    <%--<hr style="margin: 0.5em; border-top: 1px solid #dedada;" />--%>
                                    <%--<button class="social-like" style="margin-left: 0.3em;" runat="server"  onclick="LikeClicked">
                                        <span class="like" ><i class="glyphicon glyphicon-thumbs-up"></i></span>
                                        <span class="count">15</span>
                                    </button>
                                    &nbsp;
                                    <button class="social-dislike">
                                        <span class="dislike">10</span>
                                        <span class="like"><i class="glyphicon glyphicon-thumbs-down"></i></span>
                                    </button>--%>


                                    <hr style="margin: 0.5em; border-top: 1px solid #dedada;" />
                                    <button class="social-like" style="    margin-left: 1.2em;
    margin-right: 0.5em;" runat="server"  >
                                        <%--<asp:Button runat="server" ID="likebutton"  Text="Like" OnClick="LikeClicked" />--%>
                                        <span class="like" ><i class="glyphicon glyphicon-thumbs-up" onclick="testfunc(<%#Eval("ID") %>,1)"></i></span>
                                        <span class="count"><%#Eval("likecount") %></span>
                                    </button>
                                    &nbsp;
                                    <button class="social-dislike">
                                        <span class="dislike"><%#Eval("dislikecount") %></span>
                                        <%--<asp:Button runat="server" ID="dislikebutton" Text="DisLike" OnClick="LikeClicked"   />--%>
                                        <span class="like"><i class="glyphicon glyphicon-thumbs-down" onclick="testfunc(<%#Eval("ID") %>,-1)"></i></span>
                                    </button>


                                    <div style="padding-left: 20px; padding-right: 20px; width: 100%;">
                                        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"
                                            Width="100%" Style="border-radius: 5px; margin-bottom: 0.5em;"></asp:TextBox>
                                        <asp:Image ID="Image1" runat="server"
                                            ImageUrl="https://myspace.com/common/images/user.png"
                                            Style="width: 30px; height: 30px; border-radius: 50%; margin-top: 0.2em;" />
                                        <asp:Button ID="btnComment" Text="Comment" runat="server" OnCommand="btnComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("ID") %>'
                                            Style="background-color: #4a90ce; border: 1px solid #4a90ce; padding: 7px 25px; border-radius: 5px; color: #fff; float: right; margin-top: 0.2em; margin-bottom: 0.2em;" />
                                    </div>



                                    <%--=============================================================================--%>



                                    <div class="row">
                                        <asp:Repeater ID="Repeater2" runat="server" OnDataBinding="Repeater2_DataBinding" OnItemDataBound="Repeater2_ItemDataBound">
                                            <ItemTemplate>
                                                <div class="col-md-11">
                                                    <hr style="margin: 1em; border-top: 1px solid #dedada;" />
                                                    <table style="margin: 3px 5px; width: 100%;">
                                                        <tr>
                                                            <td style="width: 55px; vertical-align: text-top;">
                                                                <asp:Image ID="ImageParent" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                            </td>
                                                            <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                                <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("Username") %>'></asp:Label><br />
                                                                <asp:Label ID="Label1" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                                <a class="link" id='lnkReplyParent<%# Eval("ID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("ID") %>); return false;">Reply</a>&nbsp;
       <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("ID") %>); return false;">Cancel</a>

                                                                <asp:Repeater ID="detailRepeater" runat="server">

                                                                    <ItemTemplate>
                                                                        <div class="row">
                                                                            <hr style="margin: 1em;" />
                                                                            <table style="margin: 3px 5px; width: 100%;">
                                                                                <tr>
                                                                                    <td style="width: 55px; vertical-align: text-top;">
                                                                                        <asp:Image ID="ImageParent" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                                                    </td>
                                                                                    <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                                        <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                                                        <asp:Label ID="Label2" runat="server" Text='<% #Eval("Username") %>'></asp:Label><br />
                                                                                        <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                                        <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                                                        <a class="link" id='lnkReplyParent<%# Eval("ID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("ID") %>+'c'); return false;">Reply</a>
                                                                                        <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("ID") %>+'c'); return false;">Cancel</a>

                                                                                        <div id='divReply<%# Eval("ID") %>c' style="display: none; margin-top: 5px;">
                                                                                            <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Width="100%" Height="60px"></asp:TextBox>
                                                                                            <asp:Button ID="btnReplyParent" runat="server" Text="Reply" Style="float: right; margin: 5px;"
                                                                                                OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.ID") %>' />
                                                                                        </div>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </div>
                                                                    </ItemTemplate>



                                                                </asp:Repeater>

                                                                <div id='divReply<%# Eval("ID") %>' style="display: none; margin-top: 5px;">
                                                                    <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Width="100%" Height="60px"></asp:TextBox>
                                                                    <asp:Button ID="btnReplyParent" runat="server" Text="Reply" Style="float: right; margin: 5px;"
                                                                        OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("ID") %>' />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>


                                    <%--=============================================================================--%>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4 pull-right panel panel-default" style="padding: 1em; box-shadow: 2px 2px 2px 2px #f5f5f5;">

                    <div class="col-md-12">
                        <div class="col-md-2">
                            Type:
                        </div>
                        <div class="col-md-10" style="padding-bottom: 1em;">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1BulletinType" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1BulletinType" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM lookup.[BulletinType]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-2">
                            Msg:
                        </div>
                        <div class="col-md-10" style="padding-bottom: 1em;">

                            <asp:TextBox CssClass="form-control" ID="txt_bulmsg" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-2">
                            URL:
                        </div>
                        <div class="col-md-10" style="padding-bottom: 1em;">

                            <asp:TextBox CssClass="form-control" ID="txt_bulurl" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-2">
                            Image:                     
                                
                        </div>
                        <div class="col-md-10" style="padding-bottom: 1em;">
                            <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                            <asp:Button ID="addPost" CssClass="btn btn-info pull-right" runat="server" Text="Add" OnClick="Button1_Click" />
                        </div>
                    </div>


                </div>
            </div>


        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="addPost" />
        </Triggers>

    </asp:UpdatePanel>

    <script type="text/javascript">
        function showReply(n) {
            console.log(n);
            $("#divReply" + n).show();
            return false;
            return false;
        }
        function closeReply(n) {
            $("#divReply" + n).hide();
            return false;
        }

        function testfunc(id,status) {
            //console.log(id,status);
            ////PageMethods.test2();
            ////alert('test');
            //var params = '{{ id: 1 }, { islike: 1 }}' //'{ id: ' + id + ',islike:'+ status + '}';
            //var data = {
            //    id: 1,
            //    islike: 1,
            //};

            //params = JSON.stringify(data)
            //console.log(params)

            $.ajax({
                type: "POST",
                url: "BulletinPage.aspx/test2", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ id: id, isLike: status }), //{ },//data
                success: function (data) {
                    //alert('success')
                    console.log(data);
                    //alert(data.d);

                },
                error: function (result) {
                    console.log(result)
                    //alert("error")

                }
            });

        }
    </script>

    <style>
        .social-like,
        .social-dislike {
            margin-bottom: 1em;
            border: none;
            outline: none;
            font-size: 16px;
            width: 45%;
            background-color: #8dbd64;
            color: #fff;
        }

        .social-like {
            border-top-left-radius: 5px;
            text-align: right;
        }

        .social-dislike {
            border-top-right-radius: 5px;
            text-align: left;
        }

        .count,
        .like,
        .dislike {
            padding: 10px;

        }

        .count,
        .dislike {
            background-color: #5da25e;
            border-radius: 50%;
            font-size: 12px;
        }

        .dislike {
            margin-left: -13px;
        }

        .count {
            margin-right: -12px;
        }
    </style>

</asp:Content>

