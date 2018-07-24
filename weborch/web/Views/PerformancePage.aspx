<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PerformancePage.aspx.cs" Inherits="web.Views.PerformancePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />

            <div class="row shadowedPanel">
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
                        <div class="col-md-4">Performance date:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_performancedate" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>

                    <div class="col-md-4">
                        <br />
                        <div class="col-md-4">Performance day:</div>
                        <div class="col-md-8">
                            <asp:TextBox ID="txt_performanceday" runat="server" class="form-control"></asp:TextBox>
                        </div>
                        <br />
                    </div>


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
                    <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary pull-right" runat="server" Text="Register" OnClick="btn_instadd_Click" />
                </div>
            </div>
            <br />
            <div class="row ">                
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2_allPerformances">
                    <AlternatingItemTemplate>
                        <tr style="background-color:#FFF8DC;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceDateLabel" runat="server" Text='<%# Eval("PerformanceDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceDayLabel" runat="server" Text='<%# Eval("PerformanceDay") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ConcertHallLabel" runat="server" Text='<%# Eval("ConcertHall") %>' />
                            </td>
                            <td>
                                <asp:Label ID="TimeStampLabel" runat="server" Text='<%# Eval("TimeStamp") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Eval("ExpiryDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OrchestraIDLabel" runat="server" Text='<%# Eval("OrchestraID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
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
                            <td>
                                <asp:TextBox ID="PerformanceDateTextBox" runat="server" Text='<%# Bind("PerformanceDate") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PerformanceDayTextBox" runat="server" Text='<%# Bind("PerformanceDay") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PerformanceTitleTextBox" runat="server" Text='<%# Bind("PerformanceTitle") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="ConcertHallTextBox" runat="server" Text='<%# Bind("ConcertHall") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="TimeStampTextBox" runat="server" Text='<%# Bind("TimeStamp") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="ExpiryDateTextBox" runat="server" Text='<%# Bind("ExpiryDate") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="OrchestraIDTextBox" runat="server" Text='<%# Bind("OrchestraID") %>' />
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID" selectedvalue='<%#Bind("OrchestraID")%>'></asp:DropDownList>

                                <%--<asp:TextBox ID="OfficialNameTextBox" runat="server" Text='<%# Bind("OfficialName") %>' />--%>

                            </td>
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
                            <td>
                                <asp:TextBox ID="PerformanceDateTextBox" runat="server" Text='<%# Bind("PerformanceDate") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PerformanceDayTextBox" runat="server" Text='<%# Bind("PerformanceDay") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="PerformanceTitleTextBox" runat="server" Text='<%# Bind("PerformanceTitle") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="LocationTextBox" runat="server" Text='<%# Bind("Location") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="ConcertHallTextBox" runat="server" Text='<%# Bind("ConcertHall") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="TimeStampTextBox" runat="server" Text='<%# Bind("TimeStamp") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="ExpiryDateTextBox" runat="server" Text='<%# Bind("ExpiryDate") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="OrchestraIDTextBox" runat="server" Text='<%# Bind("OrchestraID") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="OfficialNameTextBox" runat="server" Text='<%# Bind("OfficialName") %>' />
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
                            <td>
                                <asp:Label ID="PerformanceDateLabel" runat="server" Text='<%# Eval("PerformanceDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceDayLabel" runat="server" Text='<%# Eval("PerformanceDay") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ConcertHallLabel" runat="server" Text='<%# Eval("ConcertHall") %>' />
                            </td>
                            <td>
                                <asp:Label ID="TimeStampLabel" runat="server" Text='<%# Eval("TimeStamp") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Eval("ExpiryDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OrchestraIDLabel" runat="server" Text='<%# Eval("OrchestraID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                            <th runat="server"></th>
                                            <th runat="server">ID</th>
                                            <th runat="server">PerformanceDate</th>
                                            <th runat="server">PerformanceDay</th>
                                            <th runat="server">PerformanceTitle</th>
                                            <th runat="server">Location</th>
                                            <th runat="server">ConcertHall</th>
                                            <th runat="server">TimeStamp</th>
                                            <th runat="server">UserID</th>
                                            <th runat="server">ExpiryDate</th>
                                            <th runat="server">OrchestraID</th>
                                            <th runat="server">OfficialName</th>
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
                        <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                            <td>
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td>
                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceDateLabel" runat="server" Text='<%# Eval("PerformanceDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceDayLabel" runat="server" Text='<%# Eval("PerformanceDay") %>' />
                            </td>
                            <td>
                                <asp:Label ID="PerformanceTitleLabel" runat="server" Text='<%# Eval("PerformanceTitle") %>' />
                            </td>
                            <td>
                                <asp:Label ID="LocationLabel" runat="server" Text='<%# Eval("Location") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ConcertHallLabel" runat="server" Text='<%# Eval("ConcertHall") %>' />
                            </td>
                            <td>
                                <asp:Label ID="TimeStampLabel" runat="server" Text='<%# Eval("TimeStamp") %>' />
                            </td>
                            <td>
                                <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="ExpiryDateLabel" runat="server" Text='<%# Eval("ExpiryDate") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OrchestraIDLabel" runat="server" Text='<%# Eval("OrchestraID") %>' />
                            </td>
                            <td>
                                <asp:Label ID="OfficialNameLabel" runat="server" Text='<%# Eval("OfficialName") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2_allPerformances" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
SELECT p.*, OfficialName  FROM Main.Performance p
join Core.Orchestra o on p.OrchestraID=o.ID" DeleteCommand="Delete Main.Performance
where id = @ID" UpdateCommand="update Main.Performance
set OrchestraID=@OrchestraID,
PerformanceDate=@PerformanceDate,
PerformanceDay=@PerformanceDay,
PerformanceTitle=@PerformanceTitle,
Location=@Location,
ConcertHall=@ConcertHall
where ID=@ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="OrchestraID" />
                        <asp:Parameter Name="PerformanceDate" />
                        <asp:Parameter Name="PerformanceDay" />
                        <asp:Parameter Name="PerformanceTitle" />
                        <asp:Parameter Name="Location" />
                        <asp:Parameter Name="ConcertHall" />
                        <asp:Parameter Name="ID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>

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
