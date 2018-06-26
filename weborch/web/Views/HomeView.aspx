<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomeView.aspx.cs" Inherits="web.HomeView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <div class="row" style="width: 100%; padding-top:1em;">
                <div style="height: 500px;" class="col-md-8">

                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="../Document/1.jpg" alt="1" />
                            </div>

                            <div class="item">
                                <img src="../Document/2.jpg" alt="2" />
                            </div>

                            <div class="item">
                                <img src="../Document/3.jpg" alt="3" />
                            </div>
                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                </div>
                <div style="height: 500px;" class="col-md-4">
                    <div class="container" style="padding: 0; padding-top: 1em;">
                        <div class="panel panel-default">
                            <%--<div class="panel-heading">Panel Heading</div>--%>
                            <%--<div class="panel-body">Panel Content</div>--%>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1_bulletininfo">
                                <HeaderTemplate>
                                    <table style="margin: 3px;" class="table-striped">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr style="/*margin: 1px; border-style: solid; border-width: 0 0 1px 0; border-color: darkgray; padding: 5px; margin: 5px; */">

                                        <td style="width: 20%">
                                            <asp:Label runat="server" ID="Label2"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"TimeStamp","{0:d/M/yyyy}") %>' />
                                        </td>
                                        <td style="width: 80%">
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
                            <%--<div class="panel-footer">Panel Footer</div>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="width: 100%;">
                <div class="col-md-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">Classic Appreciation</div>
                        <div class="panel-body">Panel Content</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">Classic in our life</div>
                        <div class="panel-body">Panel Content</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">Free Board</div>
                        <div class="panel-body">Panel Content</div>
                    </div>
                </div>
            </div>
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
