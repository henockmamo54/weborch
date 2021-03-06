﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BulletinPage.aspx.cs" Inherits="web.BulletinPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <br />
                <div class="col-md-7">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="rptr" style="width: 40em;box-shadow: 2px 2px 2px 2px #f5f5f5;">
                                <div class="panel panel-default">
                                    <table>
                                        <tr>
                                            <img src="Document/<%#Eval("ImageUrl") %>" style="width: 100%" />
                                        </tr>
                                        <tr>
                                            <th colspan="2">ID <%#Eval("ID") %> </th>
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
                                    <hr style="margin:1em;" />
                                    <div style="padding: 15px 20px; width: 100%;">
                                        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"
                                            Width="100%" Height="60px"></asp:TextBox>
                                        <asp:Image ID="Image1" runat="server"
                                            ImageUrl="https://myspace.com/common/images/user.png"
                                            Style="width: 30px; height: 30px; border-radius: 50%; margin-top:0.2em;" />
                                        <asp:Button ID="btnComment" Text="Comment" runat="server"
                                            Style="background-color: #4a90ce; border: 1px solid #4a90ce; padding: 7px 25px; border-radius: 5px; color: #fff; float: right; margin-top:0.2em;"
                                            OnClick="btnComment_Click" />
                                    </div>
                                </div>

                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="col-md-4 pull-right panel panel-default" style="padding: 1em; box-shadow: 2px 2px 2px 2px #f5f5f5;">
                    <table>
                        <tr>
                            <td>Msg:
                            </td>
                            <td>

                                <asp:TextBox ID="txt_bulmsg" runat="server" TextMode="MultiLine"></asp:TextBox>
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
                                <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                                <asp:Button ID="addPost" CssClass="btn btn-primary pull-right" runat="server" Text="Add" OnClick="Button1_Click" />
                                <%--<asp:TextBox ID="txtbulimage" runat="server"></asp:TextBox>
                                <asp:Button ID="btn_browsdir" CssClass="btn btn-primary pull-right" runat="server" Text="Browse" OnClick="btn_browsdir_Click"/>--%>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                    </table>

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


        <Triggers>
            <asp:PostBackTrigger ControlID="addPost" />
        </Triggers>

    </asp:UpdatePanel>
</asp:Content>
