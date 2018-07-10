﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HomeView.aspx.cs" Inherits="web.HomeView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

        <ContentTemplate>

            <div>
                <div class="row" style="width: 100%; padding-top: 1em; height: 380px;">
                    <div style="" class="col-md-8">

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
                    <div style="" class="col-md-4">
                        <div class="container" style="padding: 0; padding-top: 1em;">
                            <div class="panel panel-default" style="overflow-y: scroll; height: 360px;">
                                <%--<div class="panel-heading">Panel Heading</div>--%>
                                <%--<div class="panel-body">Panel Content</div>--%>
                                <%--<div class="btn-info pull-right">Notice</div>
                            <br />--%>
                                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1_bulletininfo">
                                    <HeaderTemplate>
                                        <table style="margin: 3px;" class="table-striped">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr style="/*margin: 1px; border-style: solid; border-width: 0 0 1px 0; border-color: darkgray; padding: 5px; margin: 5px; */">

                                            <td style="width: 30%">
                                                <img src="../Document/<%#Eval("ImageUrl") %>" style="width: 100%" />
                                                <asp:Label runat="server" ID="Label2"
                                                    Text='<%# DataBinder.Eval(Container.DataItem,"TimeStamp","{0:d/M/yyyy}") %>' />
                                            </td>
                                            <%--<td style="width: 20%">
                                            <asp:Label runat="server" ID="Label3"
                                                Text='<%# DataBinder.Eval(Container.DataItem,"TimeStamp","{0:d/M/yyyy}") %>' />
                                        </td>--%>
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
                                <%--<div class="panel-footer">Panel Footer</div>--%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="width: 100%; padding-top: 1em;">
                    <div class="col-md-4">
                        <div class="panel panel-success">
                            <div class="panel-heading">Classic Appreciation</div>
                            <div class="panel-body">
                                <%--Panel Content--%>
                                <%--<iframe width="100%" height="315" src="https://www.youtube.com/embed/t9lxe5I-yFE" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>--%>
                                <iframe width="100%" height="315" src="https://www.youtube.com/embed/WnL4Hq050is" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-success">
                            <div class="panel-heading">Classic in our life</div>
                            <div class="panel-body" style="padding-top: 0px;">
                                <div class="row">
                                    <div class="wrapper_musictag_sle_list">
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item" runat="server" onclick="changeMusicTo('Tracy Chapman - 02 - Fast Car')"><span class="glyphicon glyphicon-music" />Tracy Chapman- Fast Car</li>
                                            <li class="list-group-item" onclick="changeMusicTo('Tracy Chapman - 03 - Across the Lines')"><span class="glyphicon glyphicon-music" />Tracy Chapman- Across the Lines</li>
                                            <li class="list-group-item" onclick="changeMusicTo('Tracy Chapman - 04 - Behind the Wall')"><span class="glyphicon glyphicon-music" />Tracy Chapman- Behind the Wall</li>
                                            <li class="list-group-item" onclick="changeMusicTo('Tracy Chapman - 05 - Baby Can I Hold You')"><span class="glyphicon glyphicon-music" />Tracy Chapman- Baby Can I Hold You</li>
                                            <li class="list-group-item" onclick="changeMusicTo('Tracy Chapman - 06 - Mountain O Things')"><span class="glyphicon glyphicon-music" />Tracy Chapman- Mountain O' Things</li>
                                            <li class="list-group-item" onclick="changeMusicTo('Tracy Chapman - 07 - Shes Got Her Ticket')"><span class="glyphicon glyphicon-music" />Tracy Chapman- She's Got Her Ticket</li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row">
                                    <audio id="playeraudio" controls runat="server">
                                        <source src="../Content/audio/Tracy Chapman - 02 - Fast Car.mp3" type="audio/mpeg">
                                        <source src="../Content/audio/Tracy Chapman - 02 - Fast Car.mp3" type="audio/mpeg">
                                        <source src="../Content/audio/Tracy Chapman - 02 - Fast Car.mp3" type="audio/mpeg">
                                        Your browser does not support this audio format.
                                    </audio>
                                    <div>
                                        <span class="glyphicon glyphicon-play-circle" runat="server" style="padding: 3px; color: darkblue" text="test" onclick="play(); return false;"></span>
                                        <span class="glyphicon glyphicon-pause " runat="server" text="test" style="padding: 3px; color: darkblue" onclick="pause(); return false;"></span>
                                        <span class="glyphicon glyphicon-volume-up " runat="server" text="test" style="padding: 3px; color: darkblue" onclick="volup(); return false;"></span>
                                        <span class="glyphicon glyphicon-volume-down " runat="server" text="test" style="padding: 3px; color: darkblue" onclick="voldown(); return false;"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="panel panel-success">
                            <div class="panel-heading">Free Board</div>
                            <div class="panel-body">
                                <img src="../Content/img/er.jpg" style="width:90%; height:320px;"/>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            </span>
            </span></span></span></span></span>
        </ContentTemplate>

    </asp:UpdatePanel>
    <script type="text/javascript">
        function play() {
            document.getElementById('MainContent_playeraudio').play()
        }
        function pause() {
            document.getElementById('MainContent_playeraudio').pause()
        }
        function volup() {
            document.getElementById('MainContent_playeraudio').volume += 0.1;
        }
        function voldown() {
            document.getElementById('MainContent_playeraudio').volume -= 0.1
        }
        function changeMusicTo(n) {
            console.log('change' + n);
            document.getElementById('MainContent_playeraudio').src = "../Content/audio/" + n + ".mp3";
            document.getElementById('MainContent_playeraudio').play()
        }
    </script>
    <style>
        .list-group-item {
            border: none;
        }

        ::-webkit-scrollbar {
            width: 3px;
        }

        /* Track */
        ::-webkit-scrollbar-track {
            box-shadow: inset 0 0 5px grey;
            border-radius: 10px;
        }

        /* Handle */
        ::-webkit-scrollbar-thumb {
            background: #eeeeee;
            border-radius: 10px;
        }

            /* Handle on hover */
            ::-webkit-scrollbar-thumb:hover {
                background: #d5d5d5;
            }
    </style>
</asp:Content>