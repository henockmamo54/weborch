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


            <div class="row shadowedPanel" runat="server" id="PanelPerformanceRegiter">
                <div class="row">
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.Title %>:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />

                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.StartDate %>:</div>
                        <div class="col-md-8">
                            <div class='input-group date' id='datetimepicker2' style="display: inline-flex;">
                                <input type='text' class="form-control" runat="server" id="txt_performancestartdate" style="display: inline-block; border-right-width: 0px;" />
                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 7px;">
                                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                            </div>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.EndDate %>:</div>
                        <div class="col-md-8">
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

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.PhotoAd %>:</div>
                        <div class="col-md-8">
                            <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                            <%--<asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>--%>
                        </div>
                        <br />
                    </div>


                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.VideoAd %>:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>


                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.Orchestra %>:</div>
                        <div class="col-md-8">
                            <%--<asp:TextBox ID="txt_orchestra" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>
                        </div>
                        <br />

                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.Location %>:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_location" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4"><%= Resources.HomeView.aspx.ConcertHall %>:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_ConcertHall" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <%--========================================================================--%>

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Ticket box:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_ticketbox" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Performance  Hour:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_peformancehour" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Organizer info:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_organizerinfo" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <%--========================================================================--%>
                </div>
                <div class="row col-md-12">
                    <br />
                    <asp:Button ID="btn_addPerformance" CssClass="btn btn-success pull-right" runat="server" Text="<%$Resources:HomeView.aspx,Register %>" OnClick="btn_performance_Click" />
                </div>
            </div>
            <br />
            <div class="row ">

                <asp:SqlDataSource ID="SqlDataSource2_allPerformances" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
SELECT p.*, OfficialName  FROM Main.Performance p
join Core.Orchestra o on p.OrchestraID=o.ID"
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

                        <asp:Parameter />
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <div class="row"  style="overflow-x: scroll;">
                <asp:GridView ID="GridView1" style="overflow-x: scroll; width:2000px;" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2_allPerformances" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"
                            ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                            EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                            SelectImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-arrow-right-icon.png"
                            CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                            UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png"
                            HeaderStyle-Width="90px" ItemStyle-Width="90px">
                            <ControlStyle Height="20px" Width="20px" />
                            <HeaderStyle Width="90px" />
                            <ItemStyle Width="90px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="ID" HeaderText="<%$Resources:HomeView.aspx,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="PerformanceTitle" HeaderText="<%$Resources:HomeView.aspx,PerformanceTitle %>" SortExpression="PerformanceTitle" />
                        <asp:BoundField DataField="Location" HeaderText="<%$Resources:HomeView.aspx,Location %>" SortExpression="Location" />
                        <asp:BoundField DataField="ConcertHall" HeaderText="<%$Resources:HomeView.aspx,ConcertHall %>" SortExpression="ConcertHall" />
                        <asp:BoundField DataField="StartDate" HeaderText="<%$Resources:HomeView.aspx,StartDate %>" SortExpression="StartDate" />
                        <asp:BoundField DataField="EndDate" HeaderText="<%$Resources:HomeView.aspx,EndDate %>" SortExpression="EndDate" />

                        <asp:BoundField DataField="PerformanceHour" HeaderText="Performance Hour" SortExpression="PerformanceHour" />
                        <asp:BoundField DataField="OrganizerInfo" HeaderText="Organizer Info" SortExpression="OrganizerInfo" />
                        <asp:BoundField DataField="TicketBox" HeaderText="Ticket Box" SortExpression="TicketBox" />

                        <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,PhotoAdLocation %>" SortExpression="PhotoAddLocation">
                            <EditItemTemplate>
                                <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PhotoAddLocation") %>'></asp:TextBox>--%>
                                <asp:Button ID="editButton" CssClass="btn btn-info" runat="server" Text='Change' data-toggle="modal" data-target="#exampleModalLong" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PhotoAddLocation") %>'></asp:Label>
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
                    </Columns>
                    <EditRowStyle BackColor="#e2e2e2" CssClass="GridViewEditRow" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Width="100%"  />
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

        </ContentTemplate>


        <Triggers>
            <asp:PostBackTrigger ControlID="btn_addPerformance" />
            <asp:PostBackTrigger ControlID="btnsaveimagechange" />
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
