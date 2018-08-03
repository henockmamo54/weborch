<%@ Page Title="Orchestra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrchestraView.aspx.cs" Inherits="web.OrchestraView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <h3>Orchestra data</h3>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="row shadowedPanel">
                    <div class="col-md-12 ">
                        <div class="col-md-12  form-group">
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Name:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchname" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Alias:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchaliasname" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">URL:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchurl" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Address:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchaddress" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">ZipCode:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchzipcode" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">TelNO:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchtelno" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">FaxNo:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchfaxno" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Conductor:</div>
                                <div class="col-md-8">
                                    <%--<asp:TextBox ID="txt_orchcondactername" runat="server" class="form-control"></asp:TextBox>--%>
                                    <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3_conductor" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select (FirstName + ' '+ MiddleName + ' '+ FamilyName) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name='Conductor'
) a"></asp:SqlDataSource>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Since:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_orchsince" runat="server" OnClick="dummybtnclick" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                        </div>
                        <br />
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <asp:Button ID="btn_orchadd" CssClass="btn btn-primary pull-right" Style="margin: 1em;" runat="server" Text="Register" OnClick="btn_orchadd_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <hr />
                <div class="row">

                    <div class="row">
                        <div class="col-md-12 form-group" style="margin-bottom: 0px;">
                            <span class='input-group-addon'>
                                <asp:Label runat="server" Style="padding: 5px;">Name:</asp:Label>
                                <asp:TextBox ID="TextBox1_serach" class="form-control" Style="display: inline;" runat="server" AutoPostBack="True" OnTextChanged="serachTextValueChanged"></asp:TextBox>
                                <i class='glyphicon glyphicon-search' style="padding: 5px;"></i>
                            </span>

                        </div>

                        <div class="col-md-12">
                            <asp:SqlDataSource ID="SqlDataSource1_allOrchestraInfo" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="delete from Core.Orchestra
where ID=@ID"
                                InsertCommand="insert into Core.Orchestra
(OfficialName, Alias, URL, Address, ZipCode, TelNO, FaxNo, ConductorName, Since)
values (@OfficialName, @Alias, @URL, @Address, @ZipCode, @TelNO, @FaxNo, @ConductorName, @Since)"
                                SelectCommand="SELECT o.ID, OfficialName, Alias, URL, o.Address, o.ZipCode, o.TelNO,o.FaxNo, ConductorID, Since,  ConductorName= FirstName + ' '+ MiddleName+ ' ' + FamilyName
FROM Core.Orchestra o
join core.artist a on o.ConductorID = a. ID" UpdateCommand="Update Core.Orchestra
set
OfficialName=@OfficialName, 
Alias=@Alias, 
URL=@URL, 
Address=@Address, 
ZipCode=@ZipCode, 
TelNO=@TelNO, 
FaxNo=@FaxNo, 
ConductorID=@ConductorID, 
Since=@Since  
where 
ID=@ID"
                                FilterExpression="( '{0}'='') or (OfficialName like '%{0}%')">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" />
                                </DeleteParameters>
                                <FilterParameters>
                                    <asp:ControlParameter ControlID="TextBox1_serach" Name="name" PropertyName="Text" />
                                </FilterParameters>
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
                                    <asp:Parameter Name="ConductorID" />
                                    <asp:Parameter Name="Since" />
                                    <asp:Parameter Name="ID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1_allOrchestraInfo" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                                        ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                                        EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                        SelectImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-arrow-right-icon.png"
                                        CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                                        UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png">
                                        <ControlStyle Height="20px" Width="20px" />
                                        <ItemStyle Wrap="False" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="OfficialName" HeaderText="OfficialName" SortExpression="OfficialName" />
                                    <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                                    <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                                    <asp:BoundField DataField="TelNO" HeaderText="TelNO" SortExpression="TelNO" />
                                    <asp:BoundField DataField="FaxNo" HeaderText="FaxNo" SortExpression="FaxNo" />
                                    <asp:TemplateField HeaderText="ConductorName" SortExpression="ConductorName">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ConductorName") %>'></asp:TextBox>--%>
                                             <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control" SelectedValue='<%#Bind("ConductorID")%>'></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3_conductor" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select (FirstName + ' '+ MiddleName + ' '+ FamilyName) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name='Conductor'
) a"></asp:SqlDataSource>

                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ConductorName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Since" HeaderText="Since" SortExpression="Since" />
                                </Columns>
                                <EditRowStyle BackColor="#e2e2e2" CssClass="GridViewEditRow" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                        </div>
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
                                <tr style="/*background-color: #008A8C; */ color: #FFFFFF;">
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
                                <tr style="/*background-color: #DCDCDC; */ color: #000000;">
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
                                                <tr runat="server" style="/*background-color: #DCDCDC; */ color: #000000;">
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
                                <tr style="/*background-color: #008A8C; */ font-weight: bold; color: #FFFFFF;">
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

        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }

        .GridViewEditRow {
            /*width: 200px;*/
        }

            .GridViewEditRow input[type=text] {
                /*display: block;*/
                width: 100%;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.428571429;
                color: #555555;
                vertical-align: middle;
                background-color: #ffffff;
                border: 1px solid #cccccc;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
                transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            }
    </style>
</asp:Content>
