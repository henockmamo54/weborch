<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BulletinPage.aspx.cs" Inherits="web.BulletinPage" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <br />
                <div class="col-md-6 col-xs-6">
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemDataBound="Repeater1_ItemDataBound">
                        <ItemTemplate>
                            <div class="rptr" style="width: 40em; box-shadow: 1px 1px 1px 1px #ececec;">
                                <div class="panel panel-default" style="background-color: #f9f9f9;">
                                    <div style="padding-left: 10px; padding-right: 20px; width: 100%; margin-bottom: 0.3em; margin-top: 0.5em;">

                                        <asp:Image ID="Image2" runat="server"
                                            ImageUrl="https://myspace.com/common/images/user.png"
                                            Style="width: 30px; height: 30px; border-radius: 50%; margin-top: 0.2em;" />
                                        <%#Eval("Name") %><br />
                                        <%#Eval("TimeStamp") %>
                                    </div>
                                    <table style="margin-left: 0.2em;">

                                        <tr id="title" runat="server">
                                            <td style="width: 100%"><h4><strong><%#Server.HtmlDecode(Eval("Title").ToString()) %></strong></h4></td>
                                        </tr>

                                        <tr>
                                            <td>
                                            <asp:Image ID="imagecontainer" runat="server" ImageUrl='../Document/<%#Eval("ImageUrl") %>' style="width: 100%; padding-bottom:0.5em;" />
                                            </td>

                                            <%--<img  id="imagecontainer" src="Document/<%#Eval("ImageUrl") %>" style="width: 100%" />--%>
                                        </tr>

                                        <tr id="paddedMSG" runat="server">
                                            <td style="width: 100%; padding-left:1rem;"><%#Server.HtmlDecode(Eval("MSG").ToString()) %></td>
                                        </tr>

                                        <tr id="MSG" runat="server">
                                            <td style="width: 100%"><%#Server.HtmlDecode(Eval("MSG").ToString()) %></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <a href="//<%#Eval("URL") %>" target="_blank"><%= Resources.HomeView.aspx.ReadMore %></a>
                                            </td>
                                        </tr>
                                    </table>

                                    <hr style="margin: 0.5em; border-top: 1px solid #dedada;" />


                                    <div class="social-like testhover" style="margin-left: 1.2em; margin-right: 0.5em;" runat="server">

                                        <asp:ImageButton Visible='<%#Eval("isliked").ToString().Equals("0") ? false:true %>' ImageUrl="~/Document/l-c.png" Width="20px" runat="server" ID="ImageButton1" Text="Like"
                                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='<%#Eval("ID")  + "," +1 %>' />

                                        <asp:ImageButton Visible='<%#Eval("isliked").ToString().Equals("0") ? true:false %>' ImageUrl="~/Document/l.png" Width="20px" runat="server" ID="likebutton" Text="Like"
                                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='<%#Eval("ID")  + "," +1 %>' />
                                        <span class="count"><%#Eval("likecount") %></span>
                                    </div>
                                    &nbsp;
                                    <div class="social-dislike testhover ">

                                        <asp:ImageButton Visible='<%#Eval("disliked").ToString().Equals("0") ? false:true %>' ImageUrl="~/Document/dl-c.png" Width="20px" runat="server" ID="dislikebutton" Text="DisLike"
                                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='<%#Eval("ID")  + ", -1" %>' />

                                        <asp:ImageButton Visible='<%#Eval("disliked").ToString().Equals("0") ? true:false %>' ImageUrl="~/Document/dl.png" Width="20px" runat="server" ID="ImageButton2" Text="DisLike"
                                            OnCommand="LikeClicked" CommandName="MyUpdate" CommandArgument='<%#Eval("ID")  + ", -1" %>' />
                                        <span class="dislike"><%#Eval("dislikecount") %></span>
                                    </div>


                                    <div style="padding-left: 20px; padding-right: 20px; width: 100%;">
                                        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"
                                            Width="100%" Style="border-radius: 5px; margin-bottom: 0.5em;"></asp:TextBox>
                                        <asp:Image ID="Image1" runat="server"
                                            ImageUrl="https://myspace.com/common/images/user.png"
                                            Style="width: 30px; height: 30px; border-radius: 50%; margin-top: 0.2em;" />
                                        <asp:Button ID="btnComment" Text="<%$Resources:HomeView.aspx,Comment %>" runat="server" OnCommand="btnComment_Click" CommandName="MyUpdate" CommandArgument='<%#Eval("ID") %>'
                                            Style="background-color: #4a90ce; border: 1px solid #4a90ce; padding: 7px 25px; border-radius: 5px; color: #fff; float: right; margin-top: 0.2em; margin-bottom: 0.2em;" />
                                    </div>



                                    <%--=============================================================================--%>



                                    <div class="row">
                                        <asp:Repeater ID="Repeater2" runat="server" OnDataBinding="Repeater2_DataBinding" OnItemDataBound="Repeater2_ItemDataBound">
                                            <ItemTemplate>
                                                <div class="col-md-11">
                                                    <hr style="margin: 1em; border-top: 1px solid #dedada;" />
                                                    <table style="margin: 3px 5px; width: 100%;font-size: 1.3rem; font-family: Roboto, Arial, sans-serif;">
                                                        <tr>
                                                            <td style="width: 55px; vertical-align: text-top;">
                                                                <asp:Image ID="ImageParent" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                            </td>
                                                            <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                                <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("Username") %>'></asp:Label><br />
                                                                <asp:Label ID="Label1" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                                <a class="link" id='lnkReplyParent<%# Eval("ID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("ID") %>); return false;"><%= Resources.HomeView.aspx.Reply %></a>&nbsp;
       <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("ID") %>); return false;"><%= Resources.HomeView.aspx.Cancel %></a>

                                                                <asp:Repeater ID="detailRepeater" runat="server" OnItemDataBound="detailrepeater_onItemDataBound">

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
                                                                                        <a class="link" id='lnkReplyParent<%# Eval("ID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("ID") %>+'c'); return false;"><%= Resources.HomeView.aspx.Reply %></a>
                                                                                        <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("ID") %>+'c'); return false;"><%= Resources.HomeView.aspx.Cancel %></a>

                                                                                        <%--==========================================================================================================================================--%>

                                                                                        <asp:Repeater ID="detailRepeater3" runat="server">

                                                                                            <ItemTemplate>
                                                                                                <div class="row">
                                                                                                    <hr style="margin: 1em;" />
                                                                                                    <table style="margin: 3px 5px; width: 100%;">
                                                                                                        <tr>
                                                                                                            <td style="width: 55px; vertical-align: text-top;">
                                                                                                                <asp:Image ID="ImageParent3" runat="server" Style="width: 50px; height: 50px; border-radius: 50%; margin-top: 0.2em;" ImageUrl="https://storage.designcrowd.com/common/images/v3/no-profile-pic-tiny.png" />
                                                                                                            </td>
                                                                                                            <td style="padding: 0px 5px; text-align: left; vertical-align: top;">
                                                                                                                <asp:Label ID="lblCommentID" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:Label>
                                                                                                                <strong>
                                                                                                                    <asp:Label ID="Label3" runat="server" Text='<% #Eval("Username") %>'></asp:Label></strong><br />
                                                                                                                <asp:Label ID="lblCommentMessage" runat="server" Text='<% #Eval("CommentMessage") %>'></asp:Label><br />
                                                                                                                <asp:Label ID="lbldatetime" runat="server" Text='<% #Eval("CommentDate") %>'> date</asp:Label><br />
                                                                                                                <%--<a class="link" id='lnkReplyParent<%# Eval("ID") %>' href="javascript:void(0)" onclick="showReply(<%# Eval("ID") %>+'c'); return false;"><%= Resources.HomeView.aspx.Reply %></a>
                                                                                                    <a class="link" id="lnkCancel" href="javascript:void(0)" onclick="closeReply(<%# Eval("ID") %>+'c'); return false;"><%= Resources.HomeView.aspx.Cancel %></a>

                                                                                                    <div id='divReply<%# Eval("ID") %>c' style="display: none; margin-top: 5px;">
                                                                                                        <asp:TextBox ID="txtCommentReplyParent" runat="server" TextMode="MultiLine" Width="100%" Height="60px"></asp:TextBox>
                                                                                                        <asp:Button ID="btnReplyParent" runat="server" Text="Reply" Style="float: right; margin: 5px;"
                                                                                                            OnCommand="btnAddDetailComment_Click" CommandName="MyUpdate" CommandArgument='<%# DataBinder.Eval(Container.Parent.Parent, "DataItem.ID") %>' />
                                                                                                    </div>--%>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </div>
                                                                                            </ItemTemplate>



                                                                                        </asp:Repeater>


                                                                                        <%--===========================================================================================================================================--%>

                                                                                        <div id='divReply<%# Eval("ID") %>c' style="display: none; margin-top: 5px;">
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
                <div class="col-md-4 col-xs-4  col-xs-4 pull-right panel panel-default" style="padding: 1em; box-shadow: 1px 1px 1px 1px #ececec;">

                    <div class="col-md-12 col-xs-12   ">
                        <div class="col-md-4 col-xs-4  ">
                            <%= Resources.HomeView.aspx.Type %>:
                        </div>
                        <div class="col-md-8 col-xs-8" style="padding-bottom: 1em;">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1BulletinType" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1BulletinType" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM lookup.[BulletinType]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-12 ">
                        <div class="col-md-4 col-xs-4 ">
                            Title:
                        </div>
                        <div class="col-md-8 col-xs-8" style="padding-bottom: 1em;">

                            <asp:TextBox CssClass="form-control" ID="txt_title" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-12 ">
                        <div class="col-md-4 col-xs-4 ">
                            <%= Resources.HomeView.aspx.Msg %>:
                        </div>
                        <div class="col-md-8 col-xs-8" style="padding-bottom: 1em;">
                            <%--<div class="col-md-9"  ID="txt_bulmsg" >
                                My post content
                            </div>
                            <div class="col-md-3 btn btn-success" onclick="loadEditor()">change </div>--%>
                            <textbox rows="2" class="form-control" id="txt_bulmsg" onclick="loadEditor()" style="height: 100px; overflow-y: scroll;"></textbox>
                            <asp:HiddenField ID="HiddenField2" runat="server" Value="" />
                            <%--<asp:TextBox CssClass="form-control" ID="txt_bulmsg"  runat="server" TextMode="MultiLine"  onclick="loadEditor()"></asp:TextBox>--%>
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-12 ">
                        <div class="col-md-4 col-xs-4 ">
                            <%= Resources.HomeView.aspx.URL %>:
                        </div>
                        <div class="col-md-8 col-xs-8" style="padding-bottom: 1em;">

                            <asp:TextBox CssClass="form-control" ID="txt_bulurl" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-md-12 col-xs-12 ">
                        <div class="col-md-4 col-xs-4 ">
                            <%= Resources.HomeView.aspx.Image %>:                     
                                
                        </div>
                        <div class="col-md-8 col-xs-8" style="padding-bottom: 1em;">
                            <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                            <asp:Button ID="addPost" CssClass="btn btn-info pull-right" runat="server" Text="<%$Resources:HomeView.aspx,Add %>" OnClick="Button1_Click" />
                        </div>
                    </div>

                    <%--<div id="me" class="col-md-12 col-xs-12 "> <div class="col-md-4 col-xs-4 "> test </div></div>--%>
                </div>
            </div>

            <%--            <ajaxToolkit:HtmlEditorExtender  runat="server"  />--%>


            <!-- Modal -->
            <div class="modal fade" id="ProfileEditorModal" tabindex="-1" role="dialog" aria-labelledby="ProfileEditorModalTitle" aria-hidden="true">
                <div class="modal-dialog" role="document" style="width: 70%">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ProfileEditorModalTitle">Message</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <%--<div class="form-group">
                                <label for="exampleFormControlInput1"><%= Resources.HomeView.aspx.Name %></label>
                                <asp:TextBox runat="server" type="text" class="form-control" ID="TextBox1" placeholder="Name of the Endorser" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1"><%= Resources.HomeView.aspx.Email %></label>
                                <asp:TextBox runat="server" class="form-control" ID="TextBox2" TextMode="Email" placeholder="Email Address of the Endorser" />
                            </div>--%>


                            <div style="width: 100%" id="editorcontainer">
                                <!-- The toolbar will be rendered in this container. -->
                                <div id="toolbar-container"></div>

                                <!-- This container will become the editable. -->
                                <div id="editor" style="min-height: 200px;" onchange="editorchanged()">
                                    <p runat="server" id="editorcontent">This is the initial editor content.</p>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <%--<asp:Button type="button" runat="server" ID="hideEditor" OnClick="btnCloseProfileEditor_click" class="btn btn-secondary" Text="<%$Resources:HomeView.aspx,Close %>"/>--%>
                            <button type="button" class="btn btn-primary" id="Button7" onclick="hideEditor(false)">Cancel </button>
                            <button type="button" class="btn btn-primary" id="Button6" onclick="hideEditor(true)">Save</button>
                        </div>
                    </div>
                </div>
            </div>




        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="addPost" />
        </Triggers>

    </asp:UpdatePanel>

    <script src="https://cdn.ckeditor.com/ckeditor5/11.0.1/decoupled-document/ckeditor.js"></script>

    <script type="text/javascript">

        function showReply(n) {
            console.log(n);
            //$("#divReply" + n).show();

            // check for user login
            $.ajax({
                type: "POST",
                url: "BulletinPage.aspx/checkLoginStatus", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ n: 1 }), //{ },//data
                success: function (data) {
                    //alert('success')
                    //console.log(data);
                    //alert(data.d);

                    //if log in show the reply message 
                    if (data.d) {

                        $("#divReply" + n).show();
                        return false;
                        return false;
                    }

                    else {
                        alert('Please sign in to write comments!!!');
                    }

                },
                error: function (result) {
                    console.log(result)
                    //alert("error")

                }
            });

            return false;
        }
        function closeReply(n) {
            $("#divReply" + n).hide();
            return false;
        }

        $("#editor").change(function () {
            alert("Handler for .change() called.");
        });

        function testfunc(id, status) {
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

        function loadEditor() {

            //alert('load editor');
            $('#ProfileEditorModal').modal('show');
            var msgcontent = $('#txt_bulmsg')[0].innerHTML

            $('#editorcontainer').html('<div id="toolbar-container"></div> <div id="editor" style="min-height: 200px;" onchange="editorchanged()"> </div>')

            DecoupledEditor
            .create(document.querySelector('#editor'))
            .then(editor => {
                const toolbarContainer = document.querySelector('#toolbar-container');

                toolbarContainer.appendChild(editor.ui.view.toolbar.element);
            })
            .catch(error => {
                console.error(error);
            });

            $("#editor")[0].innerHTML = (msgcontent);


        }

        function hideEditor(update) {

            var x = $("#editor")[0].innerHTML;
            if (update)
                $("#txt_bulmsg")[0].innerHTML = $("#editor")[0].innerHTML;
            //alert(x);

            $('#txt_bulmsg')[0].innerHTML = x;
            document.getElementById('MainContent_HiddenField2').value = x
            //$('#HiddenField2').value = x;
            //$('#me').innerHTML = x;
            $('#editorcontainer').html("");


            $('#ProfileEditorModal').modal('hide');
            $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');
        }

        function closeProfileModal() {

            var x = $("#editor")[0].innerHTML;
            //$("#MainContent_uprofilepage")[0].innerHTML = x;
            //alert(x);

            $('#ProfileEditorModal').modal('hide');
            $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');
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
            /*background-color: #8dbd64;*/
            /*background-color: #e0e0e0;*/
            color: #fff;
            display: inline-table;
        }

        /*.social-like :hover,
        .social-dislike :hover {
            background-color: #8dbd64;
        }*/
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
            /*padding: 10px;*/
        }

        .count,
        .dislike {
            /*background-color: #5da25e;*/
            /*border-radius: 40%;*/
            font-size: 14px;
            color: black;
        }

        .testhover:hover {
            /*background-color: #cccaca;*/
        }

        .dislike {
            /*margin-left: -13px;*/
        }

        .count {
            /*margin-right: -12px;*/
        }


        ::-webkit-scrollbar {
            width: 3px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #eeeeee;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #d5d5d5;
            }
    </style>

</asp:Content>

