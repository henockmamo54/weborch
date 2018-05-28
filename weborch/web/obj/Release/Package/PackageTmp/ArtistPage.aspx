<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistPage.aspx.cs" Inherits="web.ArtistPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row">
        <h3>Artist data</h3>

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="col-md-12">
                    <div class="col-md-5">
                        <div>
                            <div class="col-md-12">
                                <div class="col-md-4">First Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_firstname" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Family Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_familyname" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Middle Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_middlename" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Birth date:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_birthdate" runat="server" ToolTip="dd/mm/yyyy"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <%--<div class="col-md-12">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Visible="True" Width="350px">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                </div>--%>

                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Address:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_address" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Zip Code:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_zipcode" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Tel. No:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_teleno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Mobile No:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_mobileno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Fax No:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_aritist_faxno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Remarks:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_remark" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="btn_artist_add" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_artistadd_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="GridView3" runat="server" Width="745px">
                        </asp:GridView>
                    </div>
                </div>
                <hr />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
   
</asp:Content>
