<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FullEndorsementPage.aspx.cs" Inherits="web.Views.FullEndorsementPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-6">
                    <h3>Endorsement Approval</h3>
                    <hr />
                    <h5><strong>Artist Name:</strong>
                        <asp:Label runat="server" ID="ArtistName" /></h5>
                    <h5><strong>Endorser:</strong>
                        <asp:Label runat="server" ID="EndorserName" /></h5>
                    <asp:TextBox runat="server" ID="endorserComment" TextMode="MultiLine" Rows="5" Style="width: 100%;" CssClass="form-control"></asp:TextBox>
                    <asp:Button runat="server" ID="savecomment" CssClass="btn btn-success pull-right" Style="margin-top: 4px;" Text="save" OnClick="saveComment" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
