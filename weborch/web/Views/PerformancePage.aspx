<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformancePage.aspx.cs" Inherits="web.Views.PerformancePage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />

            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


            <div class="row" id="forAudience" runat="server">

                <div class="container">
                    <div class="row">

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



                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button runat="server" Text="Show More" CssClass="btn btn-success pull-right" OnClick="loadMorePerformances" />
                        </div>
                    </div>
                </div>

            </div>


            <div class="row ">
                <asp:SqlDataSource ID="SqlDataSource2_allPerformances" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
SELECT top 9 p.*, OfficialName  FROM Main.Performance p
join Core.Orchestra o on p.OrchestraID=o.ID order by StartDate"
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

        </ContentTemplate>


        <Triggers>
        </Triggers>

    </asp:UpdatePanel>

    <script type="text/javascript">
        $(function () {
            $('#datetimepicker2').datetimepicker();
            $('#datetimepicker3').datetimepicker();
        });


        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
            //alert('test');
        }

    </script>

    <style>
        .GridViewEditRow input[type=text] {
            display: block;
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

        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>
</asp:Content>
