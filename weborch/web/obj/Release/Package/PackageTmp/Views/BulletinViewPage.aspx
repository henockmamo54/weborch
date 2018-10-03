<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BulletinViewPage.aspx.cs" Inherits="web.Views.BulletinViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">

        <div class="col-md-8 col-xs-8" style="padding-right: 0; padding-left: 0;">
            <div class="container" style="padding: 0; padding-top: 0em;">
                <div class="panel panel-default" style="overflow-y: scroll;">
                    <div class="panel-heading">Notice</div>

                    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1_bulletininfo">
                        <HeaderTemplate>
                            <table style="margin: 3px;" class="table-striped">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr style="">

                                <td style="width: 30%">
                                    <img src="../Document/<%#Eval("ImageUrl") %>" style="width: 100%" />
                                    <asp:Label runat="server" ID="Label2"
                                        Text='<%# DataBinder.Eval(Container.DataItem,"TimeStamp","{0:d/M/yyyy}") %>' />
                                </td>

                                <td style="width: 70%">
                                    <asp:Label runat="server" ID="Label1"
                                        Text='<%# Eval("MSG") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="SqlDataSource1_bulletininfo" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [ID], [MSG], [URL], [ImageUrl], [TimeStamp] FROM core.Bulletin"></asp:SqlDataSource>

                </div>
            </div>
        </div>


    </div>


</asp:Content>
