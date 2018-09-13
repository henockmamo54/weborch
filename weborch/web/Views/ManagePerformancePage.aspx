<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePerformancePage.aspx.cs" EnableEventValidation="false" Inherits="web.Views.ManagePerformancePage" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />

            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>




            <div class="row" id="formanaging" runat="server" visible="true">

                <h2 style="margin-top: 0px; padding-top: 0px;">Musical Performance Information</h2>

                <div class="row shadowedPanel" runat="server" id="PanelPerformanceRegiter" style="background: white; padding: 10px; margin-bottom: 10px; box-shadow: 1px 1px 1px 1px #d0d0d0;">
                    <div class="row">
                        <div class="col-md-4">
                            <br />
                            <div class="col-md-4"><%= Resources.HomeView.aspx.PerformanceTitle %>:</div>
                            <div class="col-md-8">
                                <asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />

                        </div>

                        <div class="col-md-4">
                            <br />
                            <div class="col-md-4"><%= Resources.HomeView.aspx.MainTitleTheme %>:</div>
                            <div class="col-md-8">
                                <asp:TextBox ID="txt_mainTitleTheme" runat="server" class="form-control"></asp:TextBox>
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
                            <div class="col-md-4">Performance  Time:</div>
                            <div class="col-md-8">
                                <%--<asp:TextBox ID="txt_peformancehour" runat="server" class="form-control"></asp:TextBox>--%>

                                <div class='input-group date' id='datetimepicker2_performancetime' style="display: inline-flex;">
                                    <input type='text' class="form-control" runat="server" id="txt_performanceTime" style="display: inline-block; border-right-width: 0px;" />
                                    <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 7px;">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>

                            </div>
                            <br />
                        </div>

                        <div class="col-md-4">
                            <br />
                            <div class="col-md-4"><%= Resources.HomeView.aspx.Poster %>:</div>
                            <div class="col-md-8">
                                <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                                <%--<asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>--%>
                            </div>
                            <br />
                        </div>

                        <div class="col-md-4">
                            <br />
                            <div class="col-md-4">Brochure:</div>
                            <div class="col-md-8">
                                <asp:FileUpload ID="FileUpload3" runat="server" Style="display: inline" />
                                <%--<asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>--%>
                            </div>
                            <br />
                        </div>

                        <div class="col-md-4">
                            <br />
                            <div class="col-md-4"><%= Resources.HomeView.aspx.VideoAd %>:</div>
                            <div class="col-md-8">
                                <asp:TextBox ID="txt_videolocation" runat="server" class="form-control"></asp:TextBox>
                            </div>
                            <br />
                        </div>


                        <div class="col-md-4">
                            <br />
                            <div class="col-md-4"><%= Resources.HomeView.aspx.PlayerTeam %>:</div>
                            <div class="col-md-6" style="margin-right: 5px;">
                                <%--<asp:TextBox ID="txt_orchestra" runat="server" class="form-control"></asp:TextBox>--%>
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-1">
                                <asp:LinkButton runat="server" AutoPostBack="True" CssClass="btn btn-success pull-right" ID="showandhidebtnforthepanel" Text="+" Style="margin-bottom: 10px;" PostBackUrl="~/Views/ManageOrchestraView.aspx"></asp:LinkButton>
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
                            <div class="col-md-4"><%= Resources.HomeView.aspx.Venu %>:</div>
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
MainTitle = @MainTitle,
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
                </div>

                <div class="row" style="overflow-x: scroll;">

                    <asp:GridView ID="GridView2" Style="overflow-x: scroll; width: 2000px;" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2_allPerformances" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound"  OnRowEditing="GridView1_RowEditing">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ItemStyle-Width="150px" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"
                                ButtonType="Image" ControlStyle-Height="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                                EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                SelectImageUrl="~/Document/detail2.png"
                                CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                                UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png">
                                <ControlStyle Height="20px" />
                                <ItemStyle Width="150px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ID" HeaderText="<%$Resources:HomeView.aspx,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="PerformanceTitle" HeaderText="<%$Resources:HomeView.aspx,PerformanceTitle %>" SortExpression="PerformanceTitle" />
                            <asp:BoundField DataField="Location" HeaderText="<%$Resources:HomeView.aspx,Location %>" SortExpression="Location" />
                            <asp:BoundField DataField="ConcertHall" HeaderText="<%$Resources:HomeView.aspx,ConcertHall %>" SortExpression="ConcertHall" />
                            <%--<asp:BoundField DataField="TimeStamp" HeaderText="TimeStamp" SortExpression="TimeStamp" />--%>
                            <%--<asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" />--%>
                            <%--<asp:BoundField DataField="ExpiryDate" HeaderText="ExpiryDate" SortExpression="ExpiryDate" />--%>
                            <%--<asp:BoundField DataField="OrchestraID" HeaderText="OrchestraID" SortExpression="OrchestraID" />--%>
                            <asp:BoundField DataField="StartDate" HeaderText="<%$Resources:HomeView.aspx,StartDate %>" SortExpression="StartDate" />
                            <asp:BoundField DataField="EndDate" HeaderText="<%$Resources:HomeView.aspx,EndDate %>"  SortExpression="EndDate" />
                            <%--<asp:BoundField DataField="PhotoAddLocation" HeaderText="PhotoAddLocation" SortExpression="PhotoAddLocation" />--%>
                            
                            <asp:TemplateField HeaderText="Brochure" SortExpression="Brochure">
                                <EditItemTemplate>
                                    <asp:Button ID="editButton3" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#exampleModalLong2" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Brochure") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,PhotoAdLocation %>" SortExpression="PhotoAddLocation">
                                <EditItemTemplate>
                                    <asp:Button ID="editButton" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#exampleModalLong" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PhotoAddLocation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="VideoLocation" HeaderText="<%$Resources:HomeView.aspx,VideoLocation %>" SortExpression="VideoLocation" />
                            <asp:BoundField DataField="TicketBox" HeaderText="Ticket Box" SortExpression="TicketBox" />
                            <%--<asp:BoundField DataField="PerformanceHour" HeaderText="PerformanceHour" SortExpression="PerformanceHour" />--%>
                            <asp:BoundField DataField="OrganizerInfo" HeaderText="Organizer Info" SortExpression="OrganizerInfo" />
                            <%--<asp:CheckBoxField DataField="Archive" HeaderText="Archive" SortExpression="Archive" />--%>
                            <%--<asp:BoundField DataField="Brochure" HeaderText="Brochure" SortExpression="Brochure" />--%>
                            <asp:BoundField DataField="MainTitle" HeaderText="<%$Resources:HomeView.aspx,MainTitleTheme %>" SortExpression="MainTitle" />
                            <%--<asp:BoundField DataField="OfficialName" HeaderText="OfficialName" SortExpression="OfficialName" />--%>
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
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>

<%--                    <asp:GridView ID="GridView1" Style="overflow-x: scroll; width: 2000px;" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2_allPerformances" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ItemStyle-Width="150px" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"
                                ButtonType="Image" ControlStyle-Height="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                                EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                SelectImageUrl="~/Document/detail2.png"
                                CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                                UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png">
                                <ControlStyle Height="20px" />
                                <ItemStyle Width="150px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ID" HeaderText="<%$Resources:HomeView.aspx,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                            <asp:BoundField DataField="PerformanceTitle" HeaderText="<%$Resources:HomeView.aspx,PerformanceTitle %>" SortExpression="PerformanceTitle" />
                            <asp:BoundField DataField="MainTitle" HeaderText="<%$Resources:HomeView.aspx,MainTitleTheme %>" SortExpression="PerformanceTitle" />
                            <asp:BoundField DataField="Location" HeaderText="<%$Resources:HomeView.aspx,Location %>" SortExpression="Location" />
                            <asp:BoundField DataField="ConcertHall" HeaderText="<%$Resources:HomeView.aspx,ConcertHall %>" SortExpression="ConcertHall" />
                            <asp:BoundField DataField="StartDate" HeaderText="<%$Resources:HomeView.aspx,StartDate %>" SortExpression="StartDate" />
                            <asp:BoundField DataField="EndDate" HeaderText="<%$Resources:HomeView.aspx,EndDate %>" SortExpression="EndDate" />

                            <asp:BoundField DataField="PerformanceTime" HeaderText="Performance Time" SortExpression="PerformanceHour" />
                            <asp:BoundField DataField="OrganizerInfo" HeaderText="Organizer Info" SortExpression="OrganizerInfo" />
                            <asp:BoundField DataField="TicketBox" HeaderText="Ticket Box" SortExpression="TicketBox" />

                            <asp:TemplateField HeaderText="Brochure" SortExpression="Brochure">
                                <EditItemTemplate>
                                    <asp:Button ID="editButton3" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#exampleModalLong2" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Brochure") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,PhotoAdLocation %>" SortExpression="PhotoAddLocation">
                                <EditItemTemplate>
                                    <asp:Button ID="editButton" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#exampleModalLong" />
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
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Width="100%" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>--%>

                </div>

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
                                <asp:FileUpload ID="FileUpload4" runat="server" Style="display: inline" />
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


        <Triggers>
            <asp:PostBackTrigger ControlID="btn_addPerformance" />
            <asp:PostBackTrigger ControlID="btnsaveimagechange" />
            <asp:PostBackTrigger ControlID="btnsaveimagechange2" />
        </Triggers>

    </asp:UpdatePanel>

    <script type="text/javascript">
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
