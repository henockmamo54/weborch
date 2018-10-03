<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistProfilePaage.aspx.cs" Inherits="web.Views.ArtistProfilePaage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="row">
                <h3 runat="server" id="artistnamecontainer" style="font-weight: 800;"></h3>
                <div class="col-md-6 pull-center">
                    <div style="font-weight: 600; color: darkgreen;">
                        <%--<asp:Image runat="server" ID="profileImage" />--%>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Birth date: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="birthday"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Address: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="address"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">ZipCode: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="zipcode"></asp:Label>
                            </div>
                        </div>
                        <%--==================================================================--%>

                        <div class=" row col-md-12">
                            <div class="col-md-3">Tel No.: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="teleno"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Mobile No:: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="mobilenumber"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Fax No.: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="faxnumber"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Remarks: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="remarks"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Kakao Talk ID: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="kakaoTalkID"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Facebook Addr.: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="facebook"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Twitter Addr.: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="twitter"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Affiliation: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="affilation"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Profile: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="profilepage"></asp:Label>
                            </div>
                        </div>
                        <div class=" row col-md-12">
                            <div class="col-md-3">Repertory: </div>
                            <div class="col-md-8">
                                <asp:Label runat="server" ID="repertory"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <hr style="background-color: #5f755f; height: 0.2rem;" />
                    <div>
                        <h4>Instruments</h4>
                        <div>
                            <asp:Label runat="server" ID="instrumentslabel"></asp:Label>
                        </div>
                    </div>
                    <hr style="background-color: #5f755f; height: 0.2rem;" />
                    <div>
                        <h4>Artist Type:</h4>
                        <div>
                            <asp:Label runat="server" ID="artisttype"></asp:Label>
                        </div>
                    </div>

                    <hr style="background-color: #5f755f; height: 0.2rem;" />
                    <div>
                        <h4>Endorsers</h4>
                        <asp:Repeater runat="server" ID="repeater_endorser">
                            <ItemTemplate>
                                <div class="row col-md-12">
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><%# Eval("Name") %> :</asp:Label>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label runat="server"><%# Eval("Comment") %></asp:Label>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </div>

                <div class="col-md-6 pull-right">
                    <asp:Image runat="server" ID="profileImage" Width="100%" CssClass="shadowedPanel" />
                </div>

            </div>
        </ContentTemplate>

    </asp:UpdatePanel>

    <script type="text/javascript">
        document.getElementById("artisttab").style.backgroundColor = "white";
        document.getElementById("artisttab").style.borderBottom = "none";
    </script>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 10px;
            border-color: #dddddd;
            /*padding: 1em;*/
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>
</asp:Content>
