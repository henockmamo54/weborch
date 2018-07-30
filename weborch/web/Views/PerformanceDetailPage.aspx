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
                            <asp:DropDownList ID="dropdown_performance" runat="server" DataSourceID="SqlDataSource1_performanceList" DataTextField="PerformanceTitle" DataValueField="ID" class="form-control" Enabled="false" AutoPostBack="True"></asp:DropDownList>
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


                    <%--<div class="col-md-4">
                        <br />
                        <div class="col-md-4">Instrument:</div>
                        <div class="col-md-8">
                            <asp:DropDownList ID="DropDownList_instrumentlist" runat="server" DataSourceID="SqlDataSource2_instrumentlist" DataTextField="EnglishName" DataValueField="ID" class="form-control"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, EnglishName FROM Core.Instrument"></asp:SqlDataSource>
                        </div>
                        <br />
                    </div>--%>

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
                    <%--<div class="col-md-4">
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
                    </div>--%>
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
                    
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Time</div>
                        <div class="col-md-8">

                          <asp:TextBox ID="txt_time" runat="server" class="form-control"></asp:TextBox>

                        </div>
                        <br />
                    </div>

                </div>



                <div class="row col-md-12">
                    <hr />
                    <div class="col-md-4">
                        Instrument:
                        <asp:DropDownList ID="DropDownList3_instrumentlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_Instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_Instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT EnglishName, ID FROM Core.Instrument"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-4">
                        Played by:
                        <asp:DropDownList ID="DropDownList2_artistlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_artistlist" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, Name= FamilyName+' '+ FirstName +' '+ MiddleName
FROM Core.Artist"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-3">
                        <br />
                        <asp:Button ID="Button1_addorchestraDetail" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btn_add_ArtistInstrument_tolist" />
                    </div>

                </div>

                <br />

                <div class="row col-md-12">
                    <hr />
                    <asp:Repeater runat="server" ID="myPerformanceDetailArtistInstrumentlist">
                        <ItemTemplate>
                            <tr style="margin-bottom: 3px;">

                                <td>
                                    <asp:Button runat="server" AutoPostBack="True" CssClass="btn btn-warning" CommandArgument='<%#Eval("ArtistID")+","+ Eval("InstrumentID")%>' Text="Delete" OnClick="btn_remove_ArtistInstrument_tolist"></asp:Button>
                                </td>

                                <td>
                                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("Artist.FirstName") %>' />
                                    - 
                                </td>
                                <td>
                                    <asp:Label runat="server" ID="Label2" Text='<%# Eval("Instrument.EnglishName") %>' />
                                </td>

                            </tr>
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="row col-md-12">
                    <br />
                    <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary pull-right" runat="server" Text="Register" OnClick="addDetailClicked" />
                </div>

            </div>

            <hr />

            <asp:ListView ID="ListView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1_performanceDetailList" Style="width: 100%;">
                <AlternatingItemTemplate>
                    <tr style="background-color: #FFF8DC;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ConductorLabel" runat="server" Text='<%# Eval("Conductor") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerLabel" runat="server" Text='<%# Eval("Composer") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ArtistsLabel" runat="server" Text='<%# Eval("Artists") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InstrumentsLabel" runat="server" Text='<%# Eval("Instruments") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                        </td>
                    </tr>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <tr style="background-color: #008A8C; color: #FFFFFF;">
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="PerformanceTitleTextBox" runat="server" Text='<%# Bind("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ConductorTextBox" runat="server" Text='<%# Bind("Conductor") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ComposerTextBox" runat="server" Text='<%# Bind("Composer") %>' />

                        </td>
                        <td>
                            <asp:TextBox ID="ArtistsTextBox" runat="server" Text='<%# Bind("Artists") %>' />

                        </td>
                        <td>
                            <asp:TextBox ID="InstrumentsTextBox" runat="server" Text='<%# Bind("Instruments") %>' />

                        </td>
                        <td>
                            <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
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
                            <asp:TextBox ID="PerformanceTitleTextBox" runat="server" Text='<%# Bind("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ConductorTextBox" runat="server" Text='<%# Bind("Conductor") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ComposerTextBox" runat="server" Text='<%# Bind("Composer") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="ArtistsTextBox" runat="server" Text='<%# Bind("Artists") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="InstrumentsTextBox" runat="server" Text='<%# Bind("Instruments") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr style="background-color: #DCDCDC; color: #000000;">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ConductorLabel" runat="server" Text='<%# Eval("Conductor") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerLabel" runat="server" Text='<%# Eval("Composer") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ArtistsLabel" runat="server" Text='<%# Eval("Artists") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InstrumentsLabel" runat="server" Text='<%# Eval("Instruments") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif; ">
                                    <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                        <th runat="server"></th>
                                        <th runat="server">ID</th>
                                        <th runat="server">PerformanceTitle</th>
                                        <th runat="server">Title</th>
                                        <th runat="server">Conductor</th>
                                        <th runat="server">Composer</th>
                                        <th runat="server">Artists</th>
                                        <th runat="server">Instruments</th>
                                        <th runat="server">Time</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
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
                    <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF; ">
                        <td>
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                        <td>
                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                        </td>
                        <td>
                            <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ConductorLabel" runat="server" Text='<%# Eval("Conductor") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ComposerLabel" runat="server" Text='<%# Eval("Composer") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ArtistsLabel" runat="server" Text='<%# Eval("Artists") %>' />
                        </td>
                        <td>
                            <asp:Label ID="InstrumentsLabel" runat="server" Text='<%# Eval("Instruments") %>' />
                        </td>
                        <td>
                            <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>

            <br />

            <div class="row">
                <asp:SqlDataSource ID="SqlDataSource1_performanceDetailList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="
delete  
Main.PerformanceDetail 
where ID= @ID" SelectCommand="
select pd.ID, p.PerformanceTitle,pd.Title,
(c.FirstName + ' '+ c.MiddleName + ' '+ c.FamilyName) as Conductor,
(co.FirstName + ' '+ co.MiddleName + ' '+ co.FamilyName) as Composer,
list.Artists,list.Instruments,
pd.Time from Main.PerformanceDetail pd
join Core.Orchestra o on pd.Orchestra=o.ID
join Main.Performance p on p.ID=pd.PerformanceID
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Conductor%') c on c.ID= pd.Conductor
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Composer%') co on co.ID= pd.Composer
join(
		SELECT
			 PerformanceDetailID,
			 STUFF(
				 (SELECT ',' + Name
				  FROM (
		select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		 from Drived.PerformanceDetail_Instrument_Artist pia 
		join Core.Artist a on a.ID = pia.ArtistID
		join Core.Instrument i on i.ID = pia.InstrumentID
		) x
		where x.PerformanceDetailID= a.PerformanceDetailID
				  FOR XML PATH (''))
				  , 1, 1, '')  AS Artists,

			 STUFF(
				 (SELECT ','+ instrument
				  FROM (
		select pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		 from Drived.PerformanceDetail_Instrument_Artist pia 
		join Core.Artist a on a.ID = pia.ArtistID
		join Core.Instrument i on i.ID = pia.InstrumentID
		) x
		where x.PerformanceDetailID= a.PerformanceDetailID
				  FOR XML PATH (''))
				  , 1, 1, '')  AS Instruments

		FROM Drived.PerformanceDetail_Instrument_Artist AS a
		GROUP BY PerformanceDetailID

) list on pd.ID = list.PerformanceDetailID
 ">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <FilterParameters>
                        <asp:ControlParameter ControlID="dropdown_performance" DefaultValue="-1" Name="performanceID" PropertyName="SelectedValue" />
                    </FilterParameters>
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
