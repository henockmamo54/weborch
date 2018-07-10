<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassicCoinPage.aspx.cs" Inherits="web.Views.ClassicCoinPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />
            <div class="col-md-8">

                <div class="panel panel-info" style="text-align: center;">
                    <div class="panel-heading">Classic coin</div>
                    <div class="panel-body">
                        <div class="col-md-6 ">
                            <img class="shadowedPanel" src="../Document/9.jpg" width="300" height="300" />

                        </div>
                        <div class="col-md-6">
                            <div class="card" style="text-align:left;">
                                <p>
                                    <h5>Total Number of Coins: 45</h5>
                                    <h5>The Number of Available Coins: 30</h5>
                                </p>
                            </div>
                            <asp:Button runat="server" Text="Charge" CssClass="btn btn-success" /> 
                            <asp:Button runat="server" Text="Withdraw" CssClass="btn btn-info" />
                        </div>
                    </div>
                    <%--<div class="panel-footer">Panel Footer</div>--%>
                </div>
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
