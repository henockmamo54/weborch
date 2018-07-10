<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPage.aspx.cs" Inherits="web.Views.MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div>

                <center>
                    <img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRbezqZpEuwGSvitKy3wrwnth5kysKdRqBW54cAszm_wiutku3R" name="aboutme" width="140" height="140" border="0" class="img-circle"></a>
                    <h3 class="media-heading"> <asp:Label ID="mynameholder" runat="server"></asp:Label> <small>KR</small></h3>
                    
                        <asp:Label runat="server" class="label label-warning">Attended 48 Times</asp:Label>
                        <asp:Label runat="server" class="label label-info">12 Posts</asp:Label>
                        <asp:Label runat="server" class="label label-info">42 comments</asp:Label>
                        <asp:Label runat="server" class="label label-success">Active since Oct 2017</asp:Label>
                    </center>
                <hr>
                <center>
                    <p class="text-left"><strong>Bio: </strong><br>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sem dui, tempor sit amet commodo a, vulputate vel tellus.</p>
                    <br>
                    </center>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-5">
                    <div>
                    <strong>Edit Personal Info: </strong>
                    </div>
                    <div>
                        <div class="col-md-12">
                            <div class="col-md-4">EnglishName:</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_userenglishname" runat="server"></asp:TextBox>
                            </div>
                            <br />

                        </div>
                        <div class="col-md-12">
                            <br />
                            <div class="col-md-4">KoreanName:</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_userkoreanname" runat="server"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <div class="col-md-12">
                            <br />
                            <div class="col-md-4">User ID:</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_user_userid" runat="server"></asp:TextBox>
                            </div>
                            <br />

                        </div>
                        <div class="col-md-12">
                            <br />
                            <div class="col-md-4">Password:</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_userPassword" runat="server" AutoPostBack="True"></asp:TextBox>
                            </div>
                            <br />

                        </div>
                        <div class="col-md-12">
                            <br />
                            <div class="col-md-4">Email:</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_useremail" TextMode="Email" runat="server"></asp:TextBox>
                            </div>
                            <br />

                        </div>
                        <div class="col-md-12">
                            <br />
                            <div class="col-md-4">Address:</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_useraddress" runat="server"></asp:TextBox>
                            </div>
                            <br />

                        </div>
                        <div class="col-md-12">
                            <br />
                            <div class="col-md-4">ZipCode:</div>
                            <div class="col-md-6">
                                <asp:TextBox ID="txt_userzipcode" runat="server"></asp:TextBox>
                            </div>
                            <br />

                        </div>
                        <br />

                        <div class="col-md-12 pull-right" style="text-align: center;">
                            <%--<asp:Button ID="btn_cancel" CssClass="btn btn-danger " runat="server" Text="Cancel"  />--%>
                            <asp:Button ID="txt_addInstrument" CssClass="btn btn-success " runat="server" Text="Update" OnClick="txt_addInstrument_click" />
                        </div>

                    </div>
                </div>
            </div>
            <hr />
            <div class="rwo">
                <strong>Message Box: </strong>
            </div>
             <hr />
            <div class="rwo">
                <strong> 1:1 Communication: </strong>
            </div>
             <hr />
            <div class="rwo">
                <strong> Check or Cancel ticket </strong>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
