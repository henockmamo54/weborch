<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomeView.aspx.cs" Inherits="web.HomeView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>
            <div>
                <div class="row " style="width: 100%; padding: 0; margin: 0; padding-top: 0em; height: 380px;">
                    <div class="col-md-8" style="padding-left: 0;">

                        <div id="myCarousel" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="../Document/1.jpg" alt="1" />
                                </div>

                                <div class="item">
                                    <img src="../Document/2.jpg" alt="2" />
                                </div>

                                <div class="item">
                                    <img src="../Document/3.jpg" alt="3" />
                                </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                    </div>
                    <div class="col-md-4" style="padding-right: 0; padding-left: 0;">
                        <div class="container" style="padding: 0; padding-top: 0em;">
                            <div class="panel panel-default" style="overflow-y: scroll; height: 380px;">
                                <div class="panel-heading" style="text-align: right; padding-top: 3px; padding-bottom: 3px; background-color: ghostwhite;">
                                    <%-- <%= Resources.HomeView.aspx.Notice %>--%> Bulletin
                                    <asp:DropDownList runat="server" CssClass="form-control" Style="width: auto; display: inline;"
                                        ID="dropdownlist_bulletinType" DataSourceID="SqlDataSource1_bulletinType" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="dropdownlist_bulletinType_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_bulletinType" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [ID]= -1 , [Name] ='All' FROM lookup.[BulletinType]
union
SELECT [ID], [Name] FROM lookup.[BulletinType]"></asp:SqlDataSource>
                                </div>

                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1_bulletininfo" OnItemDataBound="RepeaterbulletinMsg_onItemDataBound">
                                    <HeaderTemplate>
                                        <table style="margin: 3px;" class="table-striped">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr style="border-bottom: 1px #ececec; border-color: lightgray; border-radius: 10rem; padding-top: 5px; margin-bottom: 10px !important; padding: 10px !important;">


                                            <%--<td runat="server" style='width: 30%;' id="photoaddcontainerForBulletin">
                                                <img src="../Document/<%#Eval("ImageUrl") %>" style="width: 100%" />
                                            </td>--%>
                                            <%--<td><%#Eval("Name") %> </td>--%>
                                            <td style="width: 100%" runat="server" id="bulletinMsgContainer">
                                                 <asp:Label Style="color: darkgrey; font-size: 0.8em;" runat="server" ID="Label3"><strong>[<%#Eval("Name") %>] </strong>Posted on:<%# DataBinder.Eval(Container.DataItem,"TimeStamp","{0:d/M/yyyy}") %></asp:Label>
                                                
                                                <br />

                                                <asp:Label runat="server" ID="Label1"
                                                    Text='<%# Server.HtmlDecode(Eval("Title").ToString()) %>' />
                                                <a href="//<%#Eval("URL") %>" target="_blank" style="width: 100%;"><%= Resources.HomeView.aspx.ReadMore %></a>
                                               
                                            </td>

                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="SqlDataSource1_bulletininfo" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT b.[ID], Title, [MSG], [URL], [ImageUrl], [TimeStamp],BulletinTypeID,bt.Name 
FROM core.Bulletin  b
join Lookup.BulletinType bt on bt.ID=b.BulletinTypeID
order by TimeStamp desc">
                                    <FilterParameters>
                                        <asp:ControlParameter ControlID="dropdownlist_bulletinType" DefaultValue="-1" Name="bulletinType" PropertyName="SelectedValue" />
                                    </FilterParameters>
                                </asp:SqlDataSource>
                                <%--<div class="panel-footer">Panel Footer</div>--%>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <br />
                    <hr style="border-top: 1px solid #ccc9c9;" />

                    <div class=" col-md-12">
                        <h2 style="margin-top: 0px; padding-top: 0px; display: inline-block;">Musical Performance Information</h2>
                        <asp:LinkButton CssClass="btn btn-success pull-right" runat="server" Style="display: inline-block;" ID="btn_MangePerformanceButton" Text="Add / Manage Performance" Visible="false" PostBackUrl="~/Views/ManagePerformancePage.aspx" />
                    </div>

                    <asp:Repeater runat="server" ID="repeater_performanceList" OnItemDataBound="repeater_performanceList_ItemDataBound">

                        <ItemTemplate>
                            <div class="col-md-4" style="margin-bottom: 1em;">
                                <div class="thumbnail shadowedbox" style="box-shadow: 2px 2px 2px #d0d0d0;">
                                    <asp:LinkButton runat="server" ID="tumbinallink" Style="text-decoration: none;">

                                            <img src="../Document/<%#Eval("PhotoAddLocation") %>" class="shadowedbox" alt="Lights" style="width: 100%; height: 300px;">

                                            <div class="caption" style="padding-bottom:3px;">
                                                <h4><%# (Eval("PerformanceTitle")) .ToString().Length>15?
                                                           (Eval("PerformanceTitle")) .ToString().Substring(0,15)+ " ....":
                                                           (Eval("PerformanceTitle")) .ToString()%></h4>
                                                <p style="font-family: Roboto, Arial, sans-serif; margin-bottom:0px;">
                                                    <%# ( Eval("Location")+","+ Eval("ConcertHall") +","+  DataBinder.Eval(Container.DataItem,"PerformanceTime","{0:t}")) .ToString().Length>40?
                                                           (Eval("Location")+","+ Eval("ConcertHall") +","+ DataBinder.Eval(Container.DataItem,"PerformanceTime","{0:t}")) .ToString().Substring(0,40)+ " ....See More":
                                                            (Eval("Location")+","+ Eval("ConcertHall") +","+ DataBinder.Eval(Container.DataItem,"PerformanceTime","{0:t}")) .ToString() +"<br/>"
                                                            + " .... See More" %>
                                                </p>
                                            </div>
                                    </asp:LinkButton>
                                    &nbsp;&nbsp;&nbsp;
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="SqlDataSource2_allPerformances" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
SELECT top 6 p.*, OfficialName  FROM Main.Performance p
join Core.Orchestra o on p.OrchestraID=o.ID order by timestamp desc"
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
PerformanceHour = @PerformanceHour, 
OrganizerInfo = @OrganizerInfo , 
TicketBox = @TicketBox
where ID=@ID">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="OrchestraID" />
                            <asp:Parameter Name="StartDate" />
                            <asp:Parameter Name="EndDate" />
                            <asp:Parameter Name="PerformanceTitle" />
                            <asp:Parameter Name="Location" />
                            <asp:Parameter Name="PhotoAddLocation" />
                            <asp:Parameter Name="VideoLocation" />
                            <asp:Parameter Name="ConcertHall" />

                            <asp:Parameter Name="PerformanceHour" />
                            <asp:Parameter Name="OrganizerInfo" />
                            <asp:Parameter Name="TicketBox" />
                            <asp:Parameter Name="Brochure" />

                            <asp:Parameter />
                            <asp:Parameter Name="ID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>

                <div class="row">
                    <div class="col-md-12">
                        <asp:Button runat="server" Text="Show More" CssClass="btn btn-success pull-right" OnClick="loadMorePerformances" />
                    </div>
                </div>

                <div class="" style="width: 100%; padding-top: 1em;">


                    <%--<div class="shadowedPanel" style="padding-bottom: 1em; height: 300px;">

                        <div class="col-md-12">
                            <h4><%= Resources.HomeView.aspx.AClassicalPerformanceArchives %></h4>
                        </div>

                        <hr />

                        <div class="col-md-6">
                            <div class="col-md-5">
                                <img src="../Document/4.jpeg" class="shadowedPanel" height="200" width="200" style="padding: 0" />
                            </div>
                            <div class="col-md-6" style="padding: 0px;">Beethoven - Heroic Symphony (Orchestra is Seoul Symphony)</div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-5">
                                <img src="../Document/5.jpg" class="shadowedPanel" height="200" width="200" style="padding: 0" />
                            </div>
                            <div class="bottom-align-text col-md-6" style="padding: 0px; height: 200px;">
                                Vivaldi - the four seasons (Orchestra is 'l MUSIC)
                            </div>
                        </div>
                    </div>--%>
                </div>

            </div>
            </span>
            </span></span></span></span></span>
        </ContentTemplate>

    </asp:UpdatePanel>
    <script type="text/javascript">
        function play() {
            document.getElementById('MainContent_playeraudio').play()
        }
        function pause() {
            document.getElementById('MainContent_playeraudio').pause()
        }
        function volup() {
            document.getElementById('MainContent_playeraudio').volume += 0.1;
        }
        function voldown() {
            document.getElementById('MainContent_playeraudio').volume -= 0.1
        }
        function changeMusicTo(n) {
            console.log('change' + n);
            document.getElementById('MainContent_playeraudio').src = "../Content/audio/" + n + ".mp3";
            document.getElementById('MainContent_playeraudio').play()
        }
    </script>
    <style>
        .shadowedbox {
            /*padding: 0.5em;*/
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
            border-color: #ddd;
        }


        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }


        /*.sadoedbx2 op: 1em; 2px 2px 2px 2 x #f border- tyle borde -width: 1p border widt rder-color: li h p ddig: 5p;
        }*/

        /*hadowedPanel {
            r: 1px solid ranspare borde -rad bo dercolr: ddddd;
            a box s 2px 2p #f5f .list-group-ite borde : no ::-webki r;

        {
            width: 3 x / Trac / llbar-track;*/

        /*{
            - t 0 0 5px gr border-radius: 10p;*/
        /* Handle *
            webkit-scrollb r-thu
         d: #eeeeee;
        
        ius: 10px;
        }

               over */
        /*o umb:hover;

        {
            background background: #d5d5d5;
        }*/
    </style>
</asp:Content>
