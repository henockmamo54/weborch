<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BulletinPage.aspx.cs" Inherits="web.BulletinPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <br />
                <div class="col-md-7">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="rptr">
                                <table>
                                    <tr>
                                        <th colspan="2">ID <%#Eval("ID") %>" </th>
                                    </tr>
                                    <tr>
                                        <td>MSG</td>
                                        <td><%#Eval("MSG") %></td>
                                    </tr>
                                    <tr>
                                        <td>URL</td>
                                        <td><%#Eval("URL") %></td>
                                    </tr>
                                    <tr>
                                        <td>Image</td>
                                        <td><%#Eval("ImageUrl") %></td>
                                    </tr>
                                    <%--<tr><td>Date of Examination</td><td><%#Eval("D_O_E") %></td></tr>
          <tr><td>Department</td><td><%#Eval("Department") %></td></tr>--%>
                                </table>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4">
                    <table>
                        <tr>
                            <td>Msg:
                            </td>
                            <td>

                                <asp:TextBox ID="txt_bulmsg" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>URL:
                            </td>
                            <td>

                                <asp:TextBox ID="txt_bulurl" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>Image:                        
                            </td>
                            <td>

                                <asp:TextBox ID="txtbulimage" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <asp:Button ID="addPost" CssClass="btn btn-primary pull-right" runat="server" Text="Button" OnClick="Button1_Click" />
                    <%--<div>
                Msg: 
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </div>
            <div>
                URL: 
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </div>
            <div>
                Image: 
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </div>--%>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
