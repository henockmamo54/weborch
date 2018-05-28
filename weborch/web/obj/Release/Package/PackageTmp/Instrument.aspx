<%@ Page Title="Instrument" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Instrument.aspx.cs" Inherits="web.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>
    <h3>Your contact page.</h3>
    <address>
        One Microsoft Way<br />
        Redmond, WA 98052-6399<br />
        <abbr title="Phone">P:</abbr>
        425.555.0100
    </address>

    <address>
        <strong>Support:</strong>   <a href="mailto:Support@example.com">Support@example.com</a><br />
        <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
    </address>--%>
    
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
                                    <asp:TextBox ID="txt_inst_engname" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">KoreanName:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_korean_name" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Alias:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_alias" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Player:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_player" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Group:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_group" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Explanation:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_explanation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Sound Clip Location:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_soundcliplocation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Video Clip Location:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_videocliplocation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Photo Location:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_photolocation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Remarks:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_remarks" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_instadd_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="GridView2" runat="server" Width="745px">
                        </asp:GridView>
                    </div>
                </div>
                <hr />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

</asp:Content>
