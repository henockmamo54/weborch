<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TermsOfUsePage.aspx.cs" Inherits="web.Views.signupPages.TermsOfUsePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>

            <h4><%= Resources.HomeView.aspx.SignUp %></h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <a class="list-group-item list-group-item-action active"><%= Resources.HomeView.aspx.AcceptTerms %></a>
                        <a class="list-group-item list-group-item-action" href="UserInformationRegistrationPage.aspx" ><%= Resources.HomeView.aspx.UserInfo %></a>
                    </ul>
                </div>
                <div class="col-md-10 " >
                   <div style="height:175px;  background-color:white;" class="shadowedPanel">
                       <h6><strong><%= Resources.HomeView.aspx.Termsofuse %></strong></h6>
                   </div>
                    <div>
                        <asp:CheckBox runat="server" ID="CheckBox1_terms" class="form-group pull-right" Text="<%$Resources:HomeView.aspx,Doyouaccepttermsofuse %>"/>
                        <br />
                    </div>
                    <br />
                   <div style="height:175px;  background-color:white;" class="shadowedPanel">
                       <h6><strong><%= Resources.HomeView.aspx.PrivacyPolicy %></strong></h6>
                   </div>
                    
                    <div>
                        <asp:CheckBox runat="server" ID="CheckBox1_privacy" class="form-group pull-right" Text="<%$Resources:HomeView.aspx,Doyouacceptprivacypolicy %>"/>
                        <br />
                    </div>

                </div>
                <div class="col-md-12 pull-right" style="text-align: center;">
                            <asp:Button ID="txt_addInstrument" CssClass="btn btn-success " runat="server" Text="<%$Resources:HomeView.aspx,Continue %>" OnClick="btn_continueclicked" />
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
