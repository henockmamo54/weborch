<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformationSpace.aspx.cs" Inherits="web.Views.InformationSpace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>

            <h4>Information Space</h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-action active">Review</li>
                        <li class="list-group-item list-group-item-action">Concert News</li>
                        <li class="list-group-item list-group-item-action">Free Board</li>
                        <li class="list-group-item list-group-item-action">Recruitment/Promotion</li>
                        <li class="list-group-item list-group-item-action">Notice</li>
                    </ul>
                </div>
                <div class="col-md-10 shadowedPanel" style="height:500px;">

                </div>
            </div>

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
