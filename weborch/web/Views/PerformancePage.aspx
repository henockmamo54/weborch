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
                        <div class="col-md-4">Title:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_title" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />

                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Start date:</div>
                        <div class="col-md-8">
                            <%--<asp:TextBox ID="txt_performancedate" runat="server" class="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>--%>
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
                        <div class="col-md-4">End date:</div>
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
                        <div class="col-md-4">Photo Ad.:</div>
                        <div class="col-md-8">
                            <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                            <%--<asp:TextBox ID="TextBox2" runat="server" class="form-control"></asp:TextBox>--%>
                        </div>
                        <br />
                    </div>


                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Video Ad.:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>



                    <%--<div class="col-md-4">
                        <br />
                        <div class="col-md-4">Performance day:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_performanceday" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>--%>


                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Orchestra:</div>
                        <div class="col-md-8">
                            <%--<asp:TextBox ID="txt_orchestra" runat="server" class="form-control"></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>
                        </div>
                        <br />

                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Location:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_location" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Concert Hall:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_ConcertHall" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>
                </div>
                <div class="row col-md-12">
                    <br />
                    <asp:Button ID="btn_addPerformance" CssClass="btn btn-success pull-right" runat="server" Text="Register" OnClick="btn_performance_Click" />
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
PhotoAddLocation=@PhotoAddLocation,
VideoLocation=@VideoLocation,
ConcertHall=@ConcertHall

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
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

            <div class="row">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2_allPerformances" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True"
                            ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                            EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                            SelectImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-arrow-right-icon.png"
                            CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                            UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png"
                            HeaderStyle-Width="90px" ItemStyle-Width="90px" />
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="PerformanceTitle" HeaderText="Performance Title" SortExpression="PerformanceTitle" />
                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                        <asp:BoundField DataField="ConcertHall" HeaderText="Concert Hall" SortExpression="ConcertHall" />
                        <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" />
                        <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" />
                        <asp:BoundField DataField="PhotoAddLocation" HeaderText="Photo Ad Location" SortExpression="PhotoAddLocation" />
                        <asp:BoundField DataField="VideoLocation" HeaderText="Video Location" SortExpression="VideoLocation" />
                        <asp:TemplateField HeaderText="Orchestra" SortExpression="OfficialName">
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
            </div>
        </ContentTemplate>


        <Triggers>
            <asp:PostBackTrigger ControlID="btn_addPerformance" />
        </Triggers>

    </asp:UpdatePanel>

    <script type="text/javascript">
        $(function () {
            $('#datetimepicker2').datetimepicker();
            $('#datetimepicker3').datetimepicker();
        });
    </script>

    <style>
        .GridViewEditRow {
            width: 200px;
        }

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
