<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserPageView.aspx.cs" Inherits="web.UserPageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h3>User data</h3>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="col-md-12">
                    <div class="col-md-5">
                        <div>
                            <%--<div class="col-md-12">
                                <br />
                                <div class="col-md-4">User ID:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_user_userid" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>--%>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Email:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_useremail" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Password:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_userPassword" TextMode="Password" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">KoreanName:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_userkoreanname" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">EnglishName:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_userenglishname" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Sex:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_usersex" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Birth date:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_userBirthDate" runat="server" ToolTip="dd/mm/yyyy"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Zip Code:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_userZipCode" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Address:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_useraddress" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Phone Num.:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_userPhoneNumber" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <br />

                            <div class="col-md-12 pull-right" style="text-align:center;">
                                <asp:Button ID="btn_cancel" CssClass="btn btn-danger " runat="server" Text="Cancel" OnClick="btn_cancel_click" />
                                <asp:Button ID="txt_addInstrument" CssClass="btn btn-success " runat="server" Text="Add" OnClick="btn_useradd_Click" />
                            </div>

                        </div>
                    </div>
                  <%--  <div class="col-md-6">
                        <asp:GridView ID="usergridview" CssClass="table-striped" runat="server" Width="745px">
                        </asp:GridView>
                    </div>--%>
                </div>
                <hr />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    <div class="col-md-5">
        <br />
        <br />
     <%--   <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ID" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
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
                        <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #F9F9F9; color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #F9F9F9; color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">ID</th>
                                    <th runat="server">EnglishName</th>
                                    <th runat="server">KoreanName</th>
                                    <th runat="server">UserID</th>
                                    <th runat="server">Password</th>
                                    <th runat="server">Email</th>
                                    <th runat="server">Address</th>
                                    <th runat="server">ZipCode</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center; background-color: lightgray; font-family: Verdana, Arial, Helvetica, sans-serif; color: #FFFFFF">
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
                <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Eval("Password") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                    </td>
                    <td>
                        <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Eval("ZipCode") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString2 %>" SelectCommand="SELECT ID, EnglishName, KoreanName, UserID, Password, Email, Address, ZipCode FROM Core.[User]" DeleteCommand="
delete Core.[User] where ID=@id
"
            InsertCommand="insert into Core.[User] ( EnglishName, KoreanName, UserID, Password, Email, Address, ZipCode ) values

( @EnglishName, @KoreanName, @UserID, @Password, @Email, @Address, @ZipCode)"
            UpdateCommand="update Core.[User]

set
EnglishName=@EnglishName,
KoreanName=@KoreanName,
UserID=@UserID,
Password=@Password,
Email=@Email,  
Address=@Address,  
ZipCode =@ZipCode 

where ID=@ID">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EnglishName" />
                <asp:Parameter Name="KoreanName" />
                <asp:Parameter Name="UserID" />
                <asp:Parameter Name="Password" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Address" />
                <asp:Parameter Name="ZipCode" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EnglishName" />
                <asp:Parameter Name="KoreanName" />
                <asp:Parameter Name="UserID" />
                <asp:Parameter Name="Password" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Address" />
                <asp:Parameter Name="ZipCode" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>--%>

    </div>
    <style>
        .table-striped td, tr, th {
            border-color: lightgray;
            padding: 2px;
        }
    </style>
</asp:Content>
