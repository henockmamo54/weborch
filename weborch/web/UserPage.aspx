<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="web.UserPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <h3>Instrument data</h3>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="col-md-12">
                    <div class="col-md-5">
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
                                <div class="col-md-4">Email:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_useremail" runat="server"></asp:TextBox>
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
                            
                            <div class="col-md-12">
                                <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_useradd_Click" />
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="usergridview" runat="server" Width="745px">
                        </asp:GridView>
                    </div>
                </div>
                <hr />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>
