<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDetailPage.aspx.cs" Inherits="web.Views.PerformanceDetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />

            <div class="row shadowedPanel">
                <div class="row">
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Performance:</div>
                        <div class="col-md-8">
                            <asp:DropDownList ID="dropdown_performance" runat="server" DataSourceID="SqlDataSource1_performanceList" DataTextField="PerformanceTitle" DataValueField="ID" class="form-control" Enabled="false"  AutoPostBack="True"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_performanceList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, PerformanceTitle FROM Main.Performance"></asp:SqlDataSource>
                        </div>
                        <br />

                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Title:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_performancetitle" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Orchestra:</div>
                        <div class="col-md-8">
                            <%--<asp:TextBox ID="txt_performanceday" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1_orchestra" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>

                        </div>
                        <br />
                    </div>


                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Instrument:</div>
                        <div class="col-md-8">
                            <%--<asp:TextBox ID="txt_orchestra" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList_instrumentlist" runat="server" DataSourceID="SqlDataSource2_instrumentlist" DataTextField="EnglishName" DataValueField="ID" class="form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, EnglishName FROM Core.Instrument"></asp:SqlDataSource>
                        </div>
                        <br />

                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Conductor:</div>
                        <div class="col-md-8">
                            <%--<asp:TextBox ID="txt_location" runat="server" class="form-control"></asp:TextBox>--%>
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
                        <div class="col-md-4">Player:</div>
                        <div class="col-md-8">
                            <asp:DropDownList ID="DropDownList3_player" runat="server" DataSourceID="SqlDataSource4_player" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4_player" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select (FirstName + ' '+ MiddleName + ' '+ FamilyName) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name='Player'
) a"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Composer</div>
                        <div class="col-md-8">
                            <asp:DropDownList ID="DropDownList4_composer" runat="server" DataSourceID="SqlDataSource5_composer" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5_composer" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
select (FirstName + ' '+ MiddleName + ' '+ FamilyName) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name='Composer'
) a
"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>
                </div>
                <div class="row col-md-12">
                    <br />
                    <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary pull-right" runat="server" Text="Register" OnClick="addDetailClicked" />
                </div>
            </div>
            
            <hr />

            <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1_performanceDetailList" style="width:100%;">
                <AlternatingItemTemplate>
                    <tr style="background-color:#FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                       <%-- <td>
                            <asp:Label ID="PerformanceIDLabel" runat="server" Text='<%# Eval("PerformanceID") %>' />
                        </td>--%>
                        <td>
                            <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrchestraLabel" runat="server" Text='<%# Eval("Orchestra") %>' />
                        </td>
                        <td>
                            <asp:Label ID="instrumentLabel" runat="server" Text='<%# Eval("instrument") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ConductorLabel" runat="server" Text='<%# Eval("Conductor") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerLabel" runat="server" Text='<%# Eval("Composer") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlayerLabel" runat="server" Text='<%# Eval("Player") %>' />
                        </td>
                        <%--<td>
                            <asp:Label ID="conductorIDLabel" runat="server" Text='<%# Eval("conductorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerIDLabel" runat="server" Text='<%# Eval("ComposerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlayerIDLabel" runat="server" Text='<%# Eval("PlayerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrchestraIDLabel" runat="server" Text='<%# Eval("OrchestraID") %>' />--%>
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color:#008A8C;color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <%--<td>
                            <asp:TextBox ID="PerformanceIDTextBox" runat="server" Text='<%# Bind("PerformanceID") %>' />
                        </td>--%>
                        <td>
                            <asp:TextBox ID="PerformanceTitleTextBox" runat="server" Text='<%# Bind("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <%--<asp:TextBox ID="OrchestraTextBox" runat="server" Text='<%# Bind("Orchestra") %>' />--%>
                            <asp:DropDownList ID="DropDownList1_orchestrainthelistview" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID" selectedvalue='<%#Bind("OrchestraID")%>'></asp:DropDownList>
                          </td>
                        <td>
                            <%--<asp:TextBox ID="instrumentTextBox" runat="server" Text='<%# Bind("instrument") %>' />--%>
                            <asp:DropDownList ID="DropDownList_instrumentlist_listview" runat="server" DataSourceID="SqlDataSource2_instrumentlist" DataTextField="EnglishName" DataValueField="ID" class="form-control" selectedvalue='<%#Bind("InstrumentID")%>'></asp:DropDownList>

                        </td>
                        <td>
                            <%--<asp:TextBox ID="ConductorTextBox" runat="server" Text='<%# Bind("Conductor") %>' />--%>
                            <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control" selectedvalue='<%# Bind("ConductorID") %>'></asp:DropDownList>

                        </td>
                        <td>
                            <%--<asp:TextBox ID="ComposerTextBox" runat="server" Text='<%# Bind("Composer") %>' />--%>
                            <asp:DropDownList ID="DropDownList4_composer" runat="server" DataSourceID="SqlDataSource5_composer" DataTextField="Name" DataValueField="ID" class="form-control" selectedvalue='<%# Bind("ComposerID") %>'></asp:DropDownList>

                        </td>
                        <td>
                            <%--<asp:TextBox ID="PlayerTextBox" runat="server" Text='<%# Bind("Player") %>' />--%>
                            
                            <asp:DropDownList ID="DropDownList3_player" runat="server" DataSourceID="SqlDataSource4_player" DataTextField="Name" DataValueField="ID" class="form-control" selectedvalue='<%# Bind("PlayerID") %>'></asp:DropDownList>
                        </td>
                        <%--<td>
                            <asp:TextBox ID="conductorIDTextBox" runat="server" Text='<%# Bind("conductorID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ComposerIDTextBox" runat="server" Text='<%# Bind("ComposerID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PlayerIDTextBox" runat="server" Text='<%# Bind("PlayerID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="OrchestraIDTextBox" runat="server" Text='<%# Bind("OrchestraID") %>' />
                        </td>--%>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
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
                        <%--<td>
                            <asp:TextBox ID="PerformanceIDTextBox" runat="server" Text='<%# Bind("PerformanceID") %>' />
                        </td>--%>
                        <td>
                            <asp:TextBox ID="PerformanceTitleTextBox" runat="server" Text='<%# Bind("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="OrchestraTextBox" runat="server" Text='<%# Bind("Orchestra") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="instrumentTextBox" runat="server" Text='<%# Bind("instrument") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ConductorTextBox" runat="server" Text='<%# Bind("Conductor") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ComposerTextBox" runat="server" Text='<%# Bind("Composer") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PlayerTextBox" runat="server" Text='<%# Bind("Player") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="conductorIDTextBox" runat="server" Text='<%# Bind("conductorID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ComposerIDTextBox" runat="server" Text='<%# Bind("ComposerID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PlayerIDTextBox" runat="server" Text='<%# Bind("PlayerID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="OrchestraIDTextBox" runat="server" Text='<%# Bind("OrchestraID") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color:#DCDCDC;color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <%--<td>
                            <asp:Label ID="PerformanceIDLabel" runat="server" Text='<%# Eval("PerformanceID") %>' />
                        </td>--%>
                        <td>
                            <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrchestraLabel" runat="server" Text='<%# Eval("Orchestra") %>' />
                        </td>
                        <td>
                            <asp:Label ID="instrumentLabel" runat="server" Text='<%# Eval("instrument") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ConductorLabel" runat="server" Text='<%# Eval("Conductor") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerLabel" runat="server" Text='<%# Eval("Composer") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlayerLabel" runat="server" Text='<%# Eval("Player") %>' />
                        </td>
                        <%--<td>
                            <asp:Label ID="conductorIDLabel" runat="server" Text='<%# Eval("conductorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerIDLabel" runat="server" Text='<%# Eval("ComposerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlayerIDLabel" runat="server" Text='<%# Eval("PlayerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrchestraIDLabel" runat="server" Text='<%# Eval("OrchestraID") %>' />
                        </td>--%>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server" style="width:100%;">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;width:100%;">
                                    <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                        <th runat="server"></th>
                                        <th runat="server">ID</th>
                                        <%--<th runat="server">PerformanceID</th>--%>
                                        <th runat="server">PerformanceTitle</th>
                                        <th runat="server">Title</th>
                                        <th runat="server">Orchestra</th>
                                        <th runat="server">instrument</th>
                                        <th runat="server">Conductor</th>
                                        <th runat="server">Composer</th>
                                        <th runat="server">Player</th>
                                        <%--<th runat="server">conductorID</th>
                                        <th runat="server">ComposerID</th>
                                        <th runat="server">PlayerID</th>
                                        <th runat="server">OrchestraID</th>--%>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
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
                    <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF; width:100%;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <%--<td>
                            <asp:Label ID="PerformanceIDLabel" runat="server" Text='<%# Eval("PerformanceID") %>' />
                        </td>--%>
                        <td>
                            <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrchestraLabel" runat="server" Text='<%# Eval("Orchestra") %>' />
                        </td>
                        <td>
                            <asp:Label ID="instrumentLabel" runat="server" Text='<%# Eval("instrument") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ConductorLabel" runat="server" Text='<%# Eval("Conductor") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerLabel" runat="server" Text='<%# Eval("Composer") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlayerLabel" runat="server" Text='<%# Eval("Player") %>' />
                        </td>
                        <%--<td>
                            <asp:Label ID="conductorIDLabel" runat="server" Text='<%# Eval("conductorID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerIDLabel" runat="server" Text='<%# Eval("ComposerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PlayerIDLabel" runat="server" Text='<%# Eval("PlayerID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="OrchestraIDLabel" runat="server" Text='<%# Eval("OrchestraID") %>' />
                        </td>--%>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            <br />

            <div class="row">
                <asp:SqlDataSource ID="SqlDataSource1_performanceDetailList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="
delete  
Main.PerformanceDetail 
where ID= @ID"
                    FilterExpression="PerformanceID={0}" SelectCommand="



select  pd.ID, CAST(pr.PerformanceID as nvarchar) PerformanceID,
 pr.PerformanceTitle ,pd.Title,o.OfficialName Orchestra, i.EnglishName instrument,  
(c.FirstName + ' '+ c.MiddleName + ' '+ c.FamilyName) as Conductor,
(co.FirstName + ' '+ co.MiddleName + ' '+ co.FamilyName) as Composer,
(pl.FirstName + ' '+ pl.MiddleName + ' '+ pl.FamilyName) as Player,
cast(c.ID as nvarchar) conductorID,
cast(co.ID as nvarchar) ComposerID,
cast(pl.ID as nvarchar) PlayerID,
cast(o.ID as nvarchar) OrchestraID,
cast(i.ID as nvarchar) InstrumentID


from [Main].[PerformanceDetail] pd
join  (select ID as PerformanceID, PerformanceTitle from Main.Performance) pr on pr.PerformanceID=pd.PerformanceID
join Core.Orchestra o on pd.Orchestra=o.ID
join  Core.Instrument i on pd.Instrument=i.ID
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Conductor%') c on c.ID= pd.Conductor
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Composer%') co on co.ID= pd.Composer
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Player%') pl on pl.ID= pd.Player" UpdateCommand="
Update [Main].[PerformanceDetail]
set Title=@Title,
Orchestra=@OrchestraID,
Instrument=@InstrumentID,
Conductor=@ConductorID,
Composer=@ComposerID,
Player=@PlayerID
where id =@ID
">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <FilterParameters>
                        <asp:ControlParameter ControlID="dropdown_performance" DefaultValue="-1" Name="performanceID" PropertyName="SelectedValue" />
                    </FilterParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Title" />
                        <asp:Parameter Name="OrchestraID" />
                        <asp:Parameter Name="InstrumentID" />
                        <asp:Parameter Name="ConductorID" />
                        <asp:Parameter Name="ComposerID" />
                        <asp:Parameter Name="PlayerID" />
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>

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
