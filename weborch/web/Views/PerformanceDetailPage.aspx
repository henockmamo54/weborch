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
                            <asp:DropDownList ID="dropdown_performance" runat="server" DataSourceID="SqlDataSource1_performanceList" DataTextField="PerformanceTitle" DataValueField="ID" class="form-control" ></asp:DropDownList>
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
            <br />
        
            <div class="row"></div>
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
