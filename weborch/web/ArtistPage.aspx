<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistPage.aspx.cs" Inherits="web.ArtistPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h3>Artist data</h3>

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-5">
                            <div>
                                <div class="col-md-12">
                                    <div class="col-md-4">First Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_firstname" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Family Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_familyname" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Middle Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_middlename" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Birth date:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_birthdate" runat="server" ToolTip="dd/mm/yyyy"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>

                                <%--<div class="col-md-12">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Visible="True" Width="350px">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                </div>--%>

                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Address:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_address" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Zip Code:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_zipcode" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Tel. No:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_teleno" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Mobile No:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_mobileno" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Fax No:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_aritist_faxno" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-12">
                                    <br />
                                    <div class="col-md-4">Remarks:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_remark" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-12">
                                    <asp:Button ID="btn_artist_add" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_artistadd_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <asp:GridView ID="GridView3" runat="server" Width="745px">
                            </asp:GridView>
                        </div>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="row listviewwithedit">
                        <div class="col-md-12">
                            <div class="col-md-7">
                                <asp:ListView ID="ListView1" runat="server" class="col-md-7" DataKeyNames="ID" DataSourceID="SqlDataSource1" InsertItemPosition="FirstItem">
                                    <AlternatingItemTemplate>
                                        <tr style="background-color: #FFF8DC;">
                                            <td>
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                            </td>
                                            <td>
                                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FamilyNameLabel" runat="server" Text='<%# Eval("FamilyName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="MiddleNameLabel" runat="server" Text='<%# Eval("MiddleName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="TelNOLabel" runat="server" Text='<%# Eval("TelNO") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="MobileNOLabel" runat="server" Text='<%# Eval("MobileNO") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FaxNoLabel" runat="server" Text='<%# Eval("FaxNo") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="RemarLabel" runat="server" Text='<%# Eval("Remar") %>' />
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
                                                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="FamilyNameTextBox" runat="server" Text='<%# Bind("FamilyName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="MiddleNameTextBox" runat="server" Text='<%# Bind("MiddleName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TelNOTextBox" runat="server" Text='<%# Bind("TelNO") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="MobileNOTextBox" runat="server" Text='<%# Bind("MobileNO") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="FaxNoTextBox" runat="server" Text='<%# Bind("FaxNo") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="RemarTextBox" runat="server" Text='<%# Bind("Remar") %>' />
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
                                                <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="FamilyNameTextBox" runat="server" Text='<%# Bind("FamilyName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="MiddleNameTextBox" runat="server" Text='<%# Bind("MiddleName") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TelNOTextBox" runat="server" Text='<%# Bind("TelNO") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="MobileNOTextBox" runat="server" Text='<%# Bind("MobileNO") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="FaxNoTextBox" runat="server" Text='<%# Bind("FaxNo") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="RemarTextBox" runat="server" Text='<%# Bind("Remar") %>' />
                                            </td>
                                        </tr>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <tr style="background-color: #DCDCDC; color: #000000;">
                                            <td>
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                            </td>
                                            <td>
                                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FamilyNameLabel" runat="server" Text='<%# Eval("FamilyName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="MiddleNameLabel" runat="server" Text='<%# Eval("MiddleName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="TelNOLabel" runat="server" Text='<%# Eval("TelNO") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="MobileNOLabel" runat="server" Text='<%# Eval("MobileNO") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FaxNoLabel" runat="server" Text='<%# Eval("FaxNo") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="RemarLabel" runat="server" Text='<%# Eval("Remar") %>' />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                        <tr runat="server" style="background-color: #DCDCDC; color: #000000;">
                                                            <th runat="server"></th>
                                                            <th runat="server">ID</th>
                                                            <th runat="server">FirstName</th>
                                                            <th runat="server">FamilyName</th>
                                                            <th runat="server">MiddleName</th>
                                                            <th runat="server">BirthDate</th>
                                                            <th runat="server">Address</th>
                                                            <th runat="server">ZipCode</th>
                                                            <th runat="server">TelNO</th>
                                                            <th runat="server">MobileNO</th>
                                                            <th runat="server">FaxNo</th>
                                                            <th runat="server">Remar</th>
                                                        </tr>
                                                        <tr id="itemPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000">
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
                                        <tr style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">
                                            <td>
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                                <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                            </td>
                                            <td>
                                                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FamilyNameLabel" runat="server" Text='<%# Eval("FamilyName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="MiddleNameLabel" runat="server" Text='<%# Eval("MiddleName") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="TelNOLabel" runat="server" Text='<%# Eval("TelNO") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="MobileNOLabel" runat="server" Text='<%# Eval("MobileNO") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="FaxNoLabel" runat="server" Text='<%# Eval("FaxNo") %>' />
                                            </td>
                                            <td>
                                                <asp:Label ID="RemarLabel" runat="server" Text='<%# Eval("Remar") %>' />
                                            </td>
                                        </tr>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="Delete Core.Artist where ID=@ID" InsertCommand="Insert into Core.Artist (FirstName, FamilyName, MiddleName, BirthDate, Address, ZipCode, TelNO, MobileNO, FaxNo, Remar)
values (@FirstName, @FamilyName, @MiddleName, @BirthDate, @Address, @ZipCode, @TelNO, @MobileNO, @FaxNo, @Remar)"
                                SelectCommand="SELECT ID, FirstName, FamilyName, MiddleName, BirthDate, Address, ZipCode, TelNO, MobileNO, FaxNo, Remar FROM Core.Artist
order by ID desc"
                                UpdateCommand="Update Core.Artsit
set
FirstName= @FirstName,
FamilyName=@FamilyName,
MiddleName=@MiddleName, 
BirthDate=@BirthDate, 
Address=@Address,
ZipCode=@ZipCode,
TelNO=@TelNO,
 MobileNO=@MobileNO, 
FaxNo=@FaxNo, 
Remar =@Remar 

Where ID=@ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="FirstName" />
                                    <asp:Parameter Name="FamilyName" />
                                    <asp:Parameter Name="MiddleName" />
                                    <asp:Parameter Name="BirthDate" />
                                    <asp:Parameter Name="Address" />
                                    <asp:Parameter Name="ZipCode" />
                                    <asp:Parameter Name="TelNO" />
                                    <asp:Parameter Name="MobileNO" />
                                    <asp:Parameter Name="FaxNo" />
                                    <asp:Parameter Name="Remar" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FirstName" />
                                    <asp:Parameter Name="FamilyName" />
                                    <asp:Parameter Name="MiddleName" />
                                    <asp:Parameter Name="BirthDate" />
                                    <asp:Parameter Name="Address" />
                                    <asp:Parameter Name="ZipCode" />
                                    <asp:Parameter Name="TelNO" />
                                    <asp:Parameter Name="MobileNO" />
                                    <asp:Parameter Name="FaxNo" />
                                    <asp:Parameter Name="Remar" />
                                    <asp:Parameter Name="ID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <style>
        .listviewwithedit tr td :not(#listviewpager) {
            /*width: 10px;*/
            max-width: 8em;
        }

        #MainContent_ListView1_listviewpager {
            max-width: 100%;
        }

        .listviewwithedit tr td input {
            /*width: 10px;*/
            max-width: 7em !important;
        }
    </style>

</asp:Content>

