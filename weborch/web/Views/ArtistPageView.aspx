<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistPageView.aspx.cs" Inherits="web.ArtistPageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h3>Artist data</h3>

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-12 shadowedPanel">
                            <div class=" row col-md-12">

                                <%--<div class="col-md-4">
                                    <div class="col-md-4">First Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_firstname" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>--%>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">First Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_firstname" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Family Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_familyname" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Middle Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_middlename" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
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

                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Address:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_address" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Zip Code:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_zipcode" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Tel. No:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_teleno" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Mobile No:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_mobileno" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Fax No:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_aritist_faxno" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Remarks:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_artist_remark" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <div class="row">
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4">
                                            <asp:Label runat="server">Instrument</asp:Label>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:DropDownList runat="server" ID="DropDownList1_InstrumentInTheMain" AutoPostBack="True" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Button ID="btn_add_Inst" CssClass="btn btn-sm btn-info" runat="server" Text="Add" OnClick="btn_add_Inst_Click" />
                                        </div>

                                    </div>
                                </div>
                                <br />
                                <div class="row col-md-12 pull-right">
                                    <asp:Repeater runat="server" ID="myinstrepeater">
                                        <ItemTemplate>
                                            <tr style="margin-bottom:3px;">
                                                <%--<span class="glyphicon glyphicon-trash" style="color:dodgerblue;padding:2px;"></span--%>
                                                <asp:Button runat="server" AutoPostBack="True" CommandArgument='<%#Eval("ID")%>' OnClick="removeinstrumentfrommyMainList" Text="Delete"></asp:Button>
                                                <td>
                                                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("EnglishName") %>' />
                                                </td>                                                
                                            </tr>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <asp:Button ID="btn_artist_add" CssClass="btn btn-primary pull-right" runat="server" Text="Register" OnClick="btn_artistadd_Click" />
                            </div>
                        </div>
                    </div>

                </div>
                <hr />
                <div class="row">
                    <div class="row " style="margin: 5px;">
                        <%--<span class="glyphicon glyphicon-search pull-right" style="padding: 5px;"></span>--%>
                        <span class='input-group-addon'>
                            <i class='glyphicon glyphicon-search pull-right' style="padding: 5px;"></i>
                            <asp:TextBox CssClass="pull-right" ID="TextBox1_serachinstrument" runat="server"  AutoPostBack="True"></asp:TextBox>
                            <asp:Label runat="server" CssClass="pull-right" Style="padding: 5px;">Name:</asp:Label>
                        </span>

                    </div>
                </div>
                
                <div class="row">
                    <div class="row listviewwithedit">                        
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <asp:ListView ID="ListView1" runat="server" class="col-md-7" DataKeyNames="ID" DataSourceID="SqlDataSource1" InsertItemPosition="FirstItem">
                                    <AlternatingItemTemplate>
                                        <tr style="background-color: #F9F9F9;">
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
                                        <tr style="/*background-color: #DCDCDC; */ color: #000000;">
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
                                                        <tr runat="server" style="/*background-color: #DCDCDC; */ color: #000000;">
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
                <hr />
                <div class="row shadowedbox2">
                    <asp:Label runat="server"><h3>Instruments Played By an Artist</h3></asp:Label>
                    <div class="row">
                        <div class="col-md-3">
                            <asp:SqlDataSource ID="artistList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>"
                                SelectCommand="SELECT        ID ,  Name=FamilyName +'  '+FirstName+'  '+ MiddleName FROM            Core.Artist"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, EnglishName, KoreanName FROM Core.Instrument"></asp:SqlDataSource>
                            <label>Artist:</label>
                            <asp:DropDownList ID="DropDownList1_artistList" runat="server" DataSourceID="artistList" DataTextField="Name" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <div class="row pull-right ">
                                <div class="col-md-12">
                                    <asp:SqlDataSource ID="SqlDataSource3_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, EnglishName, KoreanName, [Group] FROM Core.Instrument"></asp:SqlDataSource>
                                    <label>Instrument:</label>
                                    <asp:DropDownList ID="DropDownList1_Instrument" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                    <asp:Button ID="btn_addInstrument" runat="server" Text="Add" OnClick="btn_addInstrument_Click" />

                                    <br />
                                </div>
                            </div>
                            <br />
                            <div class="row shadowedbox instrumentplayedByartist shadowedbox2" style="margin-top: 1em;">
                                <asp:ListView ID="ListView_instrumentsplayedbyartist" runat="server" DataSourceID="Artistinstumentsqldatasource" DataKeyNames="ID">
                                    <AlternatingItemTemplate>
                                        <li style="background-color: #F9F9F9;">ID:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                            <br />
                                            ArtistID:
                                            <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                                            <br />
                                            EnglishName:
                                            <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                            <br />
                                            Group:
                                            <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                            <br />
                                            KoreanName:
                                            <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                            <br />
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        </li>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <li style="background-color: #008A8C; color: #FFFFFF;">ID:
                                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                            <br />
                                            ArtistID:
                                            <asp:TextBox ID="ArtistIDTextBox" runat="server" Text='<%# Bind("ArtistID") %>' />
                                            <br />
                                            EnglishName:
                                            <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                                            <br />
                                            Group:
                                            <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
                                            <br />
                                            KoreanName:
                                            <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                                            <br />
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                        </li>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        No data was returned.
                                    </EmptyDataTemplate>
                                    <InsertItemTemplate>
                                        <li style="">ArtistID:
                                            <asp:TextBox ID="ArtistIDTextBox" runat="server" Text='<%# Bind("ArtistID") %>' />
                                            <br />
                                            EnglishName:
                                            <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                                            <br />
                                            Group:
                                            <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
                                            <br />
                                            KoreanName:
                                            <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                        </li>
                                    </InsertItemTemplate>
                                    <ItemSeparatorTemplate>
                                        <br />
                                    </ItemSeparatorTemplate>
                                    <ItemTemplate>
                                        <li style="background-color: #DCDCDC; color: #000000;">ID:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                            <br />
                                            ArtistID:
                                            <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                                            <br />
                                            EnglishName:
                                            <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                            <br />
                                            Group:
                                            <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                            <br />
                                            KoreanName:
                                            <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                            <br />
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        </li>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <li runat="server" id="itemPlaceholder" />
                                        </ul>
                                        <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                            <asp:DataPager ID="DataPager1" runat="server">
                                                <Fields>
                                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                </Fields>
                                            </asp:DataPager>
                                        </div>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <li style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">ID:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                            <br />
                                            ArtistID:
                                            <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                                            <br />
                                            EnglishName:
                                            <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                            <br />
                                            Group:
                                            <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                            <br />
                                            KoreanName:
                                            <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                            <br />
                                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                        </li>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="Artistinstumentsqldatasource" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="
delete Drived.Artist_Instrument
where id=@ID"
                                    FilterExpression="ArtistID={0}" SelectCommand="SELECT ai.ID, ai.ArtistID,i.EnglishName,  i.[Group], i.KoreanName FROM Drived.Artist_Instrument AS ai INNER JOIN Core.Instrument AS i ON i.ID = ai.InstrumentID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ID" />
                                    </DeleteParameters>
                                    <FilterParameters>
                                        <asp:ControlParameter ControlID="DropDownList1_artistList" DefaultValue="1" Name="ArtistID" PropertyName="SelectedValue" />
                                    </FilterParameters>
                                </asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <style>
        .listviewwithedit tr td :not(#listviewpager) {
            /*width: 10px;*/
            /*max-width: 8em;*/
        }

        #MainContent_ListView1_listviewpager {
            max-width: 100%;
        }

        .listviewwithedit tr td input {
            /*width: 10px;*/
            max-width: 7em !important;
        }

        .shadowedbox {
            padding: 0.5em;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
            border-color: #dddddd;
        }

        .shadowedbox2 {
            margin-top: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
            border-style: solid;
            border-width: 1px;
            border-width: 1px;
            border-color: lightgray;
            padding: 5px;
        }

        .instrumentplayedByartist ul li {
        }

        .table-striped td, tr, th {
            border-color: lightgray;
            padding: 2px;
        }

        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>

    <script type="text/javascript">
        function removeinstrumentfromList() {
            PageMethods.test("test");
        }

        function OnSuccess(result) {
            //if (result) {
            //    alert(result);
            //}
        }
        function OnFailure(error) {

        }

        function removeinstrumentfromList2() {

            $.ajax({
                type: "POST",
                url: "ArtistPageView.aspx/test('test')", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                data: {},//data
                dataType: "json",
                success: function (data) {

                    alert(data.d);

                },
                error: function (result) {

                    alert("error")

                }
            });
        }

    </script>

</asp:Content>

