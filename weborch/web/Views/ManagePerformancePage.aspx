<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePerformancePage.aspx.cs" EnableEventValidation="false" Inherits="web.Views.ManagePerformancePage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />

    <div class="row shadowedPanel" runat="server" id="AddNewEntryPanel" style="background: white; padding: 10px; margin-bottom: 10px; box-shadow: 1px 1px 1px 1px #d0d0d0;">

        <div class="col-md-6 col-xs-6" style="padding: 0px;">
            <div class="row " style="padding: 5px; margin: 10px; background-color: #f1f1f136; border-radius: 10px;">

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <h4>Musical Performance Information</h4>
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Main Title</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Sub Title </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_mainSubtitle" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Subject / Theme </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_mainsubjecttheme" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4"><%= Resources.HomeView.aspx.ConcertTeam %></div>
                                <div class="col-md-6 col-xs-6" style="margin-right: 5px;">
                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>
                                </div>
                                <div class="col-md-1">
                                    <asp:LinkButton runat="server" AutoPostBack="True" CssClass="btn btn-success pull-right" ID="showandhidebtnforthepanel" Text="+" Style="margin-bottom: 10px;" PostBackUrl="~/Views/ManageOrchestraView.aspx"></asp:LinkButton>
                                </div>
                                <br />
                            </div>
                            <br />

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Performance Type </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_mainPerformanceType" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <br />
                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Conductor</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:DropDownList ID="DropDownList2_mainConductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Main Title Composer </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:DropDownList ID="DropDownList2_maintitlecomposer" runat="server" DataSourceID="SqlDataSource5_composer" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                </div>
                                <br />
                            </div>
                            <br />
                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Main Instrument </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:DropDownList ID="DropDownList2_maininstrument" class="form-control" runat="server" DataSourceID="SqlDataSource1_Instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Organizer info*</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_organizerinfo" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Sponsor </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_mainsponser" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Language </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_mainLanguage" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Region </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_mainRegion" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">City </div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_mainCity" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4"><%= Resources.HomeView.aspx.StartDate %></div>
                                <div class="col-md-8 col-xs-8">
                                    <div class='input-group date' id='datetimepicker2' style="display: inline-flex;">
                                        <input type='text' class="form-control" runat="server" id="txt_performancestartdate" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 7px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4"><%= Resources.HomeView.aspx.EndDate %></div>
                                <div class="col-md-8 col-xs-8">
                                    <%--<asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker3' style="display: inline-flex;">
                                        <input type='text' class="form-control" runat="server" id="txt_performanceenddate" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 7px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <br />
                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Performance  Time</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_performanceTime" runat="server" class="form-control"></asp:TextBox>

                                    <%--<div class='input-group date' id='datetimepicker2_performancetime' style="display: inline-flex;">
                                                <input type='text' class="form-control" runat="server" id="txt_performanceTime" style="display: inline-block; border-right-width: 0px;" />
                                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 7px;">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>--%>
                                </div>
                                <br />
                            </div>
                            <br />
                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4"><%= Resources.HomeView.aspx.VideoAd %></div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_videolocation" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>

                <%--================================================--%>
                <div class="col-md-12 col-xs-12" style="padding: 0px;">
                    <br />
                    <div class="col-md-4 col-xs-4"><%= Resources.HomeView.aspx.Poster %></div>
                    <div class="col-md-8 col-xs-8">
                        <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                        <%--<asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>--%>
                    </div>
                    <br />
                </div>

                <div class="col-md-12 col-xs-12" style="padding: 0px;">
                    <br />
                    <div class="col-md-4 col-xs-4">Brochure</div>
                    <div class="col-md-8 col-xs-8">
                        <asp:FileUpload ID="FileUpload3" runat="server" Style="display: inline" />
                        <%--<asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>--%>
                    </div>
                    <br />
                </div>

                <%--===================================================================--%>

                <asp:UpdatePanel runat="server">
                    <ContentTemplate>

                        <div class="col-md-12 col-xs-12" style="padding: 0px;">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.HomeView.aspx.Venu %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_ConcertHall" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <%--<div class="col-md-12 col-xs-12">
                            <br />
                            <div class="col-md-4 col-xs-4"><%= Resources.HomeView.aspx.AreaCity %></div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_location" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                        </div>--%>
                        <%--========================================================================--%>

                        <div class="col-md-12 col-xs-12" style="padding: 0px;">
                            <br />
                            <div class="col-md-4 col-xs-4">Ticket box</div>
                            <div class="col-md-8 col-xs-8">
                                <asp:TextBox ID="txt_ticketbox" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                        </div>
                        <%--========================================================================--%>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="col-md-6 col-xs-6" style="padding: 0px;">
            <asp:UpdatePanel runat="server">

                <ContentTemplate>

                    <div class="" style="padding: 5px; margin: 10px; background-color: #f1f1f136; margin-top: 10px; border-radius: 10px;">
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <h4>Musical performance program</h4>
                            </div>

                            <div class="col-md-12 col-xs-12" runat="server" visible="false">
                                <br />
                                <div class="col-md-4 col-xs-4">Performance</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:DropDownList ID="dropdown_performance" runat="server" DataSourceID="SqlDataSource1_performanceList" DataTextField="PerformanceTitle" DataValueField="ID" class="form-control" Enabled="false" AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_performanceList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, PerformanceTitle FROM Main.Performance"></asp:SqlDataSource>
                                </div>
                                <br />

                            </div>

                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Music Title</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:TextBox ID="txt_performancetitle" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>


                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Orchestra</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:DropDownList ID="DropDownList1_orchestra" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>

                                </div>
                                <br />
                            </div>


                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Conductor</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3_conductor" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select (FirstName ) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name='Conductor'
) a"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Composer</div>
                                <div class="col-md-8 col-xs-8">
                                    <asp:DropDownList ID="DropDownList4_composer" runat="server" DataSourceID="SqlDataSource5_composer" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5_composer" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
select ( isnull(FirstName,'') + ' '+ isnull(MiddleName,'') + ' '+ isnull(FamilyName,'') ) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name like '%Composer%'
) a
"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12 col-xs-12">
                                <br />
                                <div class="col-md-4 col-xs-4">Time</div>
                                <div class="col-md-8 col-xs-8">
                                    <%--<asp:TextBox ID="txt_time" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker4' style="display: inline-flex;">
                                        <input type='text' class="form-control" runat="server" id="txt_time" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 7px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <br />
                            </div>

                        </div>

                        <div class="row col-md-12 col-xs-12">
                            <hr />
                            <div class="col-md-5">
                                Instrument:
                        <asp:DropDownList ID="DropDownList3_instrumentlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_Instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_Instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT EnglishName, ID FROM Core.Instrument order by englishname"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-5">
                                Played by:
                        <asp:DropDownList ID="DropDownList2_artistlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_artistlist" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, Name= FirstName
FROM Core.Artist"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-2 col-xs-2">
                                <br />
                                <asp:Button ID="Button1_addArtistInstrumentpair" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btn_add_ArtistInstrument_tolist" />
                            </div>

                        </div>

                        <br />

                        <div class="row col-md-12 col-xs-12">

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


                        <div class="row col-md-12 col-xs-12">
                            <%--<asp:Button ID="btn_cancel" CssClass="btn btn-danger pull-right" Style="margin-right: 5px;" runat="server" Text="Cancel" OnClick="cancelDetailClicked" />--%>
                            <asp:Button ID="btn_addDetail" CssClass="btn btn-success pull-right" Style="margin-right: 5px;" runat="server" Text="Add Detail" OnClick="saveDetailClicked" />
                            <%--<asp:Button ID="btn_register" CssClass="btn btn-primary pull-right" Style="margin-right: 5px;" runat="server" Text="Register" OnClick="addDetailClicked" />--%>
                        </div>

                        <hr />

                        <div class="row col-md-12 col-xs-12">
                            <div class="row">
                                <asp:Repeater runat="server" ID="repeaterDetailMusicArtist">

                                    <ItemTemplate>
                                        <div class="col-md-6 col-xs-6 " style="max-height: 200px; margin-top: 10px;">
                                            <div class="shadowedPanel " style="border: none; font-family: Roboto, Arial, sans-serif; box-shadow: 1px 1px 1px 1px #b3b3b3; padding: 3px; margin-bottom: 10px;">
                                                <asp:Button runat="server" CssClass="btn btn-danger pull-right" Text="x" CommandArgument='<%#Eval("ID")%>' OnClick="btn_remove_ItemDetailData" />
                                                <asp:Image ImageUrl="data:image/jpeg;base64,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"
                                                    runat="server" Width="25px" />
                                                <strong>Title: <%#Eval("Title") %></strong><br />
                                                <ul>
                                                    <li>Conductor: <%#Eval("Conductor") %></li>
                                                    <li>Composer: <%#Eval("Composer") %></li>
                                                    <li>Artists: <%#Eval("Artists") %></li>
                                                    <li>Instruments: <%#Eval("Instruments") %></li>
                                                    <li>Time: <%#DataBinder.Eval(Container.DataItem,"Time","{0:t}") %></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </ItemTemplate>

                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <br />



                </ContentTemplate>

                <Triggers>
                    <asp:PostBackTrigger ControlID="btnsaveimagechange" />
                    <asp:PostBackTrigger ControlID="btnsaveimagechange2" />
                    <%--<asp:PostBackTrigger ControlID="btn_addDetail" />
            <asp:PostBackTrigger ControlID="Button1_addArtistInstrumentpair" />--%>
                </Triggers>

            </asp:UpdatePanel>
        </div>


        <div class="row">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>

                    <div class="row" style="text-align: center; margin-top: 10px; margin-bottom: 10px;">
                        <asp:Button ID="btn_addPerformance" CssClass="btn btn-primary " runat="server" Text="<%$Resources:HomeView.aspx,Register %>" OnClick="saveAllPerformanceInformation" />
                        <asp:Button ID="btn_updatePerformance" CssClass="btn btn-success " Visible="false" runat="server" Text="Update" OnClick="updatePerformanceinfo" />
                        <asp:Button ID="btn_cancelupdatePerformance" CssClass="btn btn-danger " runat="server" Text="Cancel" OnClick="cancelupdatePerformanceinfo" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_updatePerformance" />
                    <asp:PostBackTrigger ControlID="btn_addPerformance" />
                </Triggers>
            </asp:UpdatePanel>
        </div>


    </div>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <%--<div class="row col-md-12 col-xs-12 " style="overflow-x: scroll;">--%>
            <div class="row shadowedPanel " runat="server" id="Div1" style="background: white; box-shadow: 1px 1px 1px 1px #d0d0d0; overflow-x: scroll; padding-left: 20px;">
                <asp:SqlDataSource ID="SqlDataSource2_allPerformances" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
SELECT p.*, OfficialName  FROM Main.Performance p
join Core.Orchestra o on p.OrchestraID=o.ID
order by p.TimeStamp desc"
                    DeleteCommand="Delete Main.Performance
where id = @ID"
                    UpdateCommand="update Main.Performance
set OrchestraID=@OrchestraID,
StartDate=@StartDate,
EndDate=@EndDate,
PerformanceTitle=@PerformanceTitle,
Location=@Location,
--PhotoAddLocation=@PhotoAddLocation,
VideoLocation=@VideoLocation,
ConcertHall=@ConcertHall,
PerformanceTime = @PerformanceTime, 
OrganizerInfo = @OrganizerInfo , 
--MainTitle = @MainTitle,
TicketBox = @TicketBox
where ID=@ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <%--<asp:Parameter Name="MainTitle" />--%>
                        <asp:Parameter Name="OrchestraID" />
                        <asp:Parameter Name="StartDate" />
                        <asp:Parameter Name="EndDate" />
                        <asp:Parameter Name="PerformanceTitle" />
                        <asp:Parameter Name="Location" />
                        <asp:Parameter Name="PhotoAddLocation" />
                        <asp:Parameter Name="VideoLocation" />
                        <asp:Parameter Name="ConcertHall" />

                        <asp:Parameter Name="PerformanceTime" />
                        <asp:Parameter Name="OrganizerInfo" />
                        <asp:Parameter Name="MainTitle" />

                        <asp:Parameter Name="TicketBox" />
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" CssClass="row" Style="overflow-x: scroll; width: 2000px;" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2_allPerformances" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ItemStyle-Width="90px" ShowDeleteButton="True" ShowSelectButton="True"
                            ButtonType="Image" ControlStyle-Height="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                            EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                            SelectImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                            CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                            UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png">
                            <ControlStyle Height="20px" />
                            <ItemStyle Width="90px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="ID" HeaderText="<%$Resources:HomeView.aspx,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="PerformanceTitle" HeaderText="<%$Resources:HomeView.aspx,PerformanceTitle %>" SortExpression="PerformanceTitle" />
                        <%--<asp:BoundField DataField="MainTitle" HeaderText="<%$Resources:HomeView.aspx,MainTitleTheme %>" SortExpression="MainTitle" />--%>
                        <asp:BoundField DataField="StartDate" HeaderText="<%$Resources:HomeView.aspx,StartDate %>" SortExpression="StartDate" DataFormatString="{0:d/M/yyyy}" />
                        <asp:BoundField DataField="EndDate" HeaderText="<%$Resources:HomeView.aspx,EndDate %>" SortExpression="EndDate" DataFormatString="{0:d/M/yyyy}" />
                        <asp:BoundField DataField="PerformanceTime" HeaderText="Performance  Time" SortExpression="PerformanceTime" DataFormatString="{0:t}" />
                        <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,PhotoAdLocation %>" SortExpression="PhotoAddLocation">
                            <EditItemTemplate>
                                <asp:Button ID="editButton" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#exampleModalLong" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PhotoAddLocation") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Brochure" SortExpression="Brochure">
                            <EditItemTemplate>
                                <asp:Button ID="editButton3" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#exampleModalLong2" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Brochure") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="VideoLocation" HeaderText="<%$Resources:HomeView.aspx,VideoLocation %>" SortExpression="VideoLocation" />
                        <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,Orchestra %>" SortExpression="OfficialName">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID" SelectedValue='<%#Bind("OrchestraID")%>'></asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("OfficialName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ConcertHall" HeaderText="<%$Resources:HomeView.aspx,Venu %>" SortExpression="ConcertHall" />
                        <asp:BoundField DataField="Location" HeaderText="<%$Resources:HomeView.aspx,AreaCity %>" SortExpression="Location" />
                        <asp:BoundField DataField="TicketBox" HeaderText="Ticket Box" SortExpression="TicketBox" />
                        <asp:BoundField DataField="OrganizerInfo" HeaderText="Organizer Info" SortExpression="OrganizerInfo" />
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

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle"><%= Resources.HomeView.aspx.PhotoAd %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group" style="text-align: center;">
                                <asp:Image runat="server" ID="modalImageContainer" Width="20em" Height="20em" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1"><%= Resources.HomeView.aspx.Change %></label>
                                <asp:FileUpload ID="FileUpload2" runat="server" Style="display: inline" />
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><%= Resources.HomeView.aspx.Close %></button>
                            <asp:Button runat="server" type="button" class="btn btn-primary" Text="<%$Resources:HomeView.aspx,Save %>" OnClick="buttonChangeImage" ID="btnsaveimagechange" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle2"><%= Resources.HomeView.aspx.PhotoAd %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group" style="text-align: center;">
                                <asp:Image runat="server" ID="modalImageContainer2" Width="20em" Height="20em" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1"><%= Resources.HomeView.aspx.Change %></label>
                                <asp:FileUpload ID="FileUpload4" runat="server" Style="d" />
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><%= Resources.HomeView.aspx.Close %></button>
                            <asp:Button runat="server" type="button" class="btn btn-primary" Text="<%$Resources:HomeView.aspx,Save %>" OnClick="buttonChangeImage2" ID="btnsaveimagechange2" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


    <script type="text/javascript">

        document.getElementById("performancetab").style.backgroundColor = "white";
        document.getElementById("performancetab").style.borderBottom = "none";


        $(function () {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker2_performancetime').datetimepicker({
                format: "HH:mm A"
            });

            $('#datetimepicker4').datetimepicker({
                format: "HH:mm A"
            });

        });

        function showdatetime() {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker2_performancetime').datetimepicker({
                format: "HH:mm A"
            });
            $('#datetimepicker4').datetimepicker({
                format: "HH:mm A"
            });
        }

        function binddatetimecomps() {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker3').datetimepicker({
                format: 'DD/MM/YYYY'
            });
            $('#datetimepicker2_performancetime').datetimepicker({
                format: "HH:mm A"
            });
            $('#datetimepicker4').datetimepicker({
                format: "HH:mm A"
            });
        }

        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
            //alert('test');
        }

        function scrolltothetop() {
            $("html, body").animate({ scrollTop: 0 }, "slow");
            return false;
        }

        function UploadFile(fileupload) {
            alert('test');
            //sessionStorage.setItem("FileUpload1", fileupload);

            //$.ajax({
            //    type: "POST",
            //    url: "ManagePerformancePage.aspx/uploadFileChanged", //Pagename/Functionname
            //    contentType: "application/json;charset=utf-8",
            //    dataType: "json",
            //    data: JSON.stringify({ f: 1 }),
            //    //data: JSON.stringify({ id: id, isLike: status }), //{ },//data
            //    success: function (data) {
            //        //alert('success')
            //        console.log(data);
            //        //alert(data.d);

            //    },
            //    error: function (result) {
            //        console.log(result)
            //        //alert("error")

            //    }
            //});

        }

    </script>

    <style>
        .shadowedPane border: px oli trnsprent; 4px; border-color: d
        /* adding
                   box-
            x 2px 2 x #f5
             }

            
                  .G
             input[ty e=tex
                display: bock;
          widt: 100%;
      34px;
          pading: 6px 1px
             font-sze: 4px;
            line-height  1 425714 clo:  #55555 -aig: midle;
        colr: #ffffff er 1x soli
                      b rder-aus 4x;
          ebkit-bx-s adow: set 0 1x 1x rba0, 0, , 0 bx-shado: i set
        r

         0.05);
         kt-ran -olo ease in
            -shadow ase--out .15s tan r s-n-out 0.15, se-n-o t  05s;
        
        anel {
            1px solid tra sparent;
            border-r dius borde -coor: #ddddd i box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>
</asp:Content>
