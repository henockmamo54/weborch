<%@ Page Title="Orchestra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orchestra.aspx.cs" Inherits="web.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>

    
    <div class="row">
        <h3>Orchestra data</h3>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="col-md-12">
                    <div class="col-md-5">
                        <div>
                            <div class="col-md-12">
                                <div class="col-md-4">Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchname" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Alias:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchaliasname" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">URL:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchurl" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Address:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchaddress" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">ZipCode:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchzipcode" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">TelNO:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchtelno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">FaxNo:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchfaxno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Conductor:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchcondactername" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Since:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchsince" runat="server" OnClick="dummybtnclick"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12 offset-4">
                                <asp:Button ID="btn_orchadd" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_orchadd_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="GridView1" runat="server" Height="174px" Width="743px">
                        </asp:GridView>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>


    </div>

    <div class="row">


    </div>

</asp:Content>
