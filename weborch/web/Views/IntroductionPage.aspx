<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IntroductionPage.aspx.cs" Inherits="web.Views.IntroductionPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <h4>Introduction</h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-action active">Greetings</li>
                        <li class="list-group-item list-group-item-action">Company Introduction</li>
                        <li class="list-group-item list-group-item-action">HomePage Introduction</li>
                        <li class="list-group-item list-group-item-action">Classic coin Introduction</li>
                        <li class="list-group-item list-group-item-action">Korea's Orchestra</li>
                    </ul>
                </div>
                <div class="col-md-10 shadowedPanel" style="height:500px;">

                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">

        document.getElementById("introductiontab").style.backgroundColor = "white";
        document.getElementById("introductiontab").style.borderBottom = "none";

    </script>

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
