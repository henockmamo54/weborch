<%@ Page Title="Orchestra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orchestra.aspx.cs" Inherits="web.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>--%>


    <div class="row">
        <h3>Orchestra data</h3>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row">
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
                        <div class="col-md-6 ">
                            <asp:GridView ID="GridView1" CssClass="table-striped" runat="server" Height="174px" Width="743px">
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <hr />
                    <div class="row listviewwithedit">
                        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1_allOrchestraInfo" InsertItemPosition="FirstItem">
                            <AlternatingItemTemplate>
                                <tr style="background-color: #F9F9F9;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="AliasLabel" runat="server" Text='<%# Eval("Alias") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="URLLabel" runat="server" Text='<%# Eval("URL") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TelNOLabel" runat="server" Text='<%# Eval("TelNO") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="FaxNoLabel" runat="server" Text='<%# Eval("FaxNo") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ConductorNameLabel" runat="server" Text='<%# Eval("ConductorName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="SinceLabel" runat="server" Text='<%# Eval("Since") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <tr style="/*background-color: #008A8C;*/ color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="OfficialNameTextBox" runat="server" Text='<%# Bind("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AliasTextBox" runat="server" Text='<%# Bind("Alias") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TelNOTextBox" runat="server" Text='<%# Bind("TelNO") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="FaxNoTextBox" runat="server" Text='<%# Bind("FaxNo") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConductorNameTextBox" runat="server" Text='<%# Bind("ConductorName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="SinceTextBox" runat="server" Text='<%# Bind("Since") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="OfficialNameTextBox" runat="server" Text='<%# Bind("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AliasTextBox" runat="server" Text='<%# Bind("Alias") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TelNOTextBox" runat="server" Text='<%# Bind("TelNO") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="FaxNoTextBox" runat="server" Text='<%# Bind("FaxNo") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ConductorNameTextBox" runat="server" Text='<%# Bind("ConductorName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="SinceTextBox" runat="server" Text='<%# Bind("Since") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="/*background-color: #DCDCDC;*/ color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="AliasLabel" runat="server" Text='<%# Eval("Alias") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="URLLabel" runat="server" Text='<%# Eval("URL") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TelNOLabel" runat="server" Text='<%# Eval("TelNO") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="FaxNoLabel" runat="server" Text='<%# Eval("FaxNo") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ConductorNameLabel" runat="server" Text='<%# Eval("ConductorName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="SinceLabel" runat="server" Text='<%# Eval("Since") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="/*background-color: #DCDCDC;*/ color: #000000;">
                                                    <th runat="server"></th>
                                                    <th runat="server">ID</th>
                                                    <th runat="server">OfficialName</th>
                                                    <th runat="server">Alias</th>
                                                    <th runat="server">URL</th>
                                                    <th runat="server">Address</th>
                                                    <th runat="server">ZipCode</th>
                                                    <th runat="server">TelNO</th>
                                                    <th runat="server">FaxNo</th>
                                                    <th runat="server">ConductorName</th>
                                                    <th runat="server">Since</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: lightgray; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="/*background-color: #008A8C;*/ font-weight: bold; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="AliasLabel" runat="server" Text='<%# Eval("Alias") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="URLLabel" runat="server" Text='<%# Eval("URL") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="TelNOLabel" runat="server" Text='<%# Eval("TelNO") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="FaxNoLabel" runat="server" Text='<%# Eval("FaxNo") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ConductorNameLabel" runat="server" Text='<%# Eval("ConductorName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="SinceLabel" runat="server" Text='<%# Eval("Since") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1_allOrchestraInfo" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="delete from Core.Orchestra
where ID=@ID"
                            InsertCommand="insert into Core.Orchestra
(OfficialName, Alias, URL, Address, ZipCode, TelNO, FaxNo, ConductorName, Since)
values (@OfficialName, @Alias, @URL, @Address, @ZipCode, @TelNO, @FaxNo, @ConductorName, @Since)"
                            SelectCommand="SELECT ID, OfficialName, Alias, URL, Address, ZipCode, TelNO, FaxNo, ConductorName, Since FROM Core.Orchestra" UpdateCommand="Update Core.Orchestra
set
OfficialName=@OfficialName, 
Alias=@Alias, 
URL=@URL, 
Address=@Address, 
ZipCode=@ZipCode, 
TelNO=@TelNO, 
FaxNo=@FaxNo, 
ConductorName=@ConductorName, 
Since=@Since  
where 
ID=@ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="OfficialName" />
                                <asp:Parameter Name="Alias" />
                                <asp:Parameter Name="URL" />
                                <asp:Parameter Name="Address" />
                                <asp:Parameter Name="ZipCode" />
                                <asp:Parameter Name="TelNO" />
                                <asp:Parameter Name="FaxNo" />
                                <asp:Parameter Name="ConductorName" />
                                <asp:Parameter Name="Since" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="OfficialName" />
                                <asp:Parameter Name="Alias" />
                                <asp:Parameter Name="URL" />
                                <asp:Parameter Name="Address" />
                                <asp:Parameter Name="ZipCode" />
                                <asp:Parameter Name="TelNO" />
                                <asp:Parameter Name="FaxNo" />
                                <asp:Parameter Name="ConductorName" />
                                <asp:Parameter Name="Since" />
                                <asp:Parameter Name="ID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="row">
                    <hr />
                    <h3>Instruments and Members of the Orchestra</h3>
                    <br />

                    <div class="row ">
                        <div class="col-md-3 pull-right">
                            <asp:Button ID="Button1_addorchestraDetail" runat="server" Text="Add" OnClick="Button1_addorchestraDetail_Click" />
                        </div>
                        <div class="col-md-3 pull-right">
                            <label>Played by:</label>
                            <asp:DropDownList ID="DropDownList2_artistlist" runat="server" DataSourceID="SqlDataSource1_artistlist" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, Name= FamilyName+' '+ FirstName +' '+ MiddleName
FROM Core.Artist"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label>Instrument:</label>
                            <asp:DropDownList ID="DropDownList3_instrumentlist" runat="server" DataSourceID="SqlDataSource1_Instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_Instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT EnglishName, ID FROM Core.Instrument"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3 pull-right">
                            <label>Orchestra:</label>
                            <asp:DropDownList ID="DropDownList1_orchestralist" runat="server" DataSourceID="SqlDataSource1_allOrchestraInfo" DataTextField="OfficialName" DataValueField="ID" OnSelectedIndexChanged="DropDownList1_orchestralist_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row mylistview">
                        <asp:ListView ID="ListView2_orchestraInstrumentArtist" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1_orchestraInstrumentArtist">
                            <AlternatingItemTemplate>
                                <tr style="background-color: #F9F9F9;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="InstrumentLabel" runat="server" Text='<%# Eval("Instrument") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ArtistLabel" runat="server" Text='<%# Eval("Artist") %>' />
                                    </td>
                                </tr>
                            </AlternatingItemTemplate>
                            <EditItemTemplate>
                                <tr style="/*background-color: #008A8C;*/ color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="OfficialNameTextBox" runat="server" Text='<%# Bind("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="InstrumentTextBox" runat="server" Text='<%# Bind("Instrument") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ArtistTextBox" runat="server" Text='<%# Bind("Artist") %>' />
                                    </td>
                                </tr>
                            </EditItemTemplate>
                            <EmptyDataTemplate>
                                <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                    <tr>
                                        <td>No data was returned.</td>
                                    </tr>
                                </table>
                            </EmptyDataTemplate>
                            <InsertItemTemplate>
                                <tr style="">
                                    <td>
                                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                    </td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:TextBox ID="OfficialNameTextBox" runat="server" Text='<%# Bind("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="InstrumentTextBox" runat="server" Text='<%# Bind("Instrument") %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="ArtistTextBox" runat="server" Text='<%# Bind("Artist") %>' />
                                    </td>
                                </tr>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <tr style="/*background-color: #DCDCDC;*/ color: #000000;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="InstrumentLabel" runat="server" Text='<%# Eval("Instrument") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ArtistLabel" runat="server" Text='<%# Eval("Artist") %>' />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table runat="server">
                                    <tr runat="server">
                                        <td runat="server">
                                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <tr runat="server" style="/*background-color: #DCDCDC;*/ color: #000000;">
                                                    <th runat="server"></th>
                                                    <th runat="server">ID</th>
                                                    <th runat="server">OfficialName</th>
                                                    <th runat="server">Instrument</th>
                                                    <th runat="server">Artist</th>
                                                </tr>
                                                <tr id="itemPlaceholder" runat="server">
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr runat="server">
                                        <td runat="server" style="text-align: center; background-color: lightgray; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                    <asp:NumericPagerField />
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                                </Fields>
                                            </asp:DataPager>
                                        </td>
                                    </tr>
                                </table>
                            </LayoutTemplate>
                            <SelectedItemTemplate>
                                <tr style="/*background-color: #008A8C;*/ font-weight: bold; color: #FFFFFF;">
                                    <td>
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    </td>
                                    <td>
                                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="InstrumentLabel" runat="server" Text='<%# Eval("Instrument") %>' />
                                    </td>
                                    <td>
                                        <asp:Label ID="ArtistLabel" runat="server" Text='<%# Eval("Artist") %>' />
                                    </td>
                                </tr>
                            </SelectedItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="SqlDataSource1_orchestraInstrumentArtist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="delete 
from Drived.Orchestra_Instrument_Artist
where ID=@ID"
                            SelectCommand="select a.ID,o.OfficialName,Instrument=i.EnglishName,Artist=aa.FamilyName+' '+aa.FirstName+' '+aa.MiddleName
,OrchestraID
from Drived.Orchestra_Instrument_Artist a
join Core.Orchestra o on o.ID= a.OrchestraID
join Core.Instrument i on i.ID= a.InstrumentID
join.Core.Artist aa on aa.ID=a.ArtistID"
                            FilterExpression="OrchestraID={0}">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" />
                            </DeleteParameters>
                            <FilterParameters>
                                <asp:ControlParameter ControlID="DropDownList1_orchestralist" DefaultValue="0" Name="OrchestraID" PropertyName="SelectedValue" />
                            </FilterParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>


    </div>


    <style>
        .listviewwithedit tr td :not(#listviewpager) {
            word-wrap: break-word;
            max-width: 10em;
        }

        #MainContent_ListView1_listviewpager {
            max-width: 100%;
        }

        .listviewwithedit tr td input {
            /*width: 10px;*/
            max-width: 9em !important;
        }

        .shadowedbox {
            padding: 0.5em;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
            border-color: #dddddd;
        }

        .mylistview tr td :not(#listviewpager) {
            word-wrap: break-word;
            padding: 0.2em;
        }

        .table-striped td, tr, th {
            border-color: lightgray;
            padding: 2px;
        }
    </style>
</asp:Content>
