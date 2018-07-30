<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformanceDetailPage.aspx.cs" Inherits="web.Views.PerformanceDetailPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />

            
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1_performanceDetailList" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="PerformanceTitle" HeaderText="PerformanceTitle" SortExpression="PerformanceTitle" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Conductor" HeaderText="Conductor" ReadOnly="True" SortExpression="Conductor" />
                    <asp:BoundField DataField="Composer" HeaderText="Composer" ReadOnly="True" SortExpression="Composer" />
                    <asp:BoundField DataField="Artists" HeaderText="Artists" ReadOnly="True" SortExpression="Artists" />
                    <asp:BoundField DataField="Instruments" HeaderText="Instruments" ReadOnly="True" SortExpression="Instruments" />
                    <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
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
            
            <div class="row" style="text-align: center !important;" >
                <asp:Button runat="server" AutoPostBack="True" CssClass="btn btn-warning" ID="showandhidebtnforthepanel"  Text="ADD" OnClick="btn_ADD_ONClick_showAndHideTheDataEntryPanel"></asp:Button>
            </div>

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
		select distinct pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
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
		select distinct  pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
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
           
             <hr />

            <div class="row shadowedPanel" visible="false" runat="server" ID="AddNewEntryPanel">
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
                            <asp:DropDownList ID="DropDownList1_orchestra" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>

                        </div>
                        <br />
                    </div>


                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Conductor:</div>
                        <div class="col-md-8">
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
                    <asp:Button ID="btn_cancel" CssClass="btn btn-danger pull-right" style="margin-right: 5px;" runat="server" Text="Cancel" OnClick="cancelDetailClicked" />
                    <asp:Button ID="btn_update" CssClass="btn btn-success pull-right" style="margin-right: 5px;" runat="server" Text="Save" OnClick="saveDetailClicked" />
                    <asp:Button ID="btn_register" CssClass="btn btn-primary pull-right" style="margin-right: 5px;" runat="server" Text="Register" OnClick="addDetailClicked" />
                </div>

            </div>


            <br />

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
