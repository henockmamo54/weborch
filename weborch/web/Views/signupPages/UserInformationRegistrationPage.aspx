<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInformationRegistrationPage.aspx.cs" Inherits="web.Views.signupPages.UserInformationRegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>
            <h4>Sign Up</h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <a class="list-group-item list-group-item-action" href="TermsOfUsePage.aspx">Accept Terms</a>
                        <a class="list-group-item list-group-item-action active">User Info.</a>
                    </ul>
                </div>
                <div class="col-md-10 shadowedPanel" style="height: 700px;">
                    <div class="row">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="col-md-12">
                                    <div class="col-md-5">
                                        <div>
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
                                                <div class="col-md-4">Password:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txt_userPassword" TextMode="Password" runat="server"></asp:TextBox>
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
                                                <div class="col-md-4">EnglishName:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txt_userenglishname" runat="server"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Sex:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txt_usersex" runat="server"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Birth date:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txt_userBirthDate" runat="server" placeholder="dd/mm/yyyy" ToolTip="dd/mm/yyyy"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Zip Code:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txt_userZipCode" runat="server"></asp:TextBox>
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
                                                <div class="col-md-4">Phone Num.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="txt_userPhoneNumber" runat="server"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">occupation:</div>
                                                <div class="col-md-6">
                                                    <asp:RadioButtonList ID="radioOcupation" runat="server" CssClass="radio">
                                                        <asp:ListItem>Player </asp:ListItem>
                                                        <asp:ListItem>Composer </asp:ListItem>
                                                        <asp:ListItem>Researcher </asp:ListItem>
                                                        <asp:ListItem>Conductor </asp:ListItem>
                                                        <asp:ListItem>Promotor </asp:ListItem>
                                                        <asp:ListItem>Audience </asp:ListItem>
                                                        <asp:ListItem>Other </asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </div>
                                                <br />

                                            </div>
                                            <br />

                                            <div class="col-md-12 pull-right" style="text-align: center;">
                                                <asp:Button ID="btn_cancel" CssClass="btn btn-danger " runat="server" Text="Cancel" OnClick="btn_cancel_click" />
                                                <asp:Button ID="txt_addInstrument" CssClass="btn btn-success " runat="server" Text="Add" OnClick="btn_useradd_Click" />
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>

</asp:Content>
