<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TermsOfUsePage.aspx.cs" Inherits="web.Views.signupPages.TermsOfUsePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>

            <h4>Sign Up</h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <a class="list-group-item list-group-item-action active">Accept Terms</a>
                        <a class="list-group-item list-group-item-action" href="UserInformationRegistrationPage.aspx" >User Info.</a>
                    </ul>
                </div>
                <div class="col-md-10 " style="height: 250px;">
                   <div style="height:100px; " class="shadowedPanel">
                       <h6><strong>Terms of use</strong></h6>
                   </div>
                    <div>
                        <asp:CheckBox runat="server" ID="CheckBox1_terms" class="form-group pull-right" Text="Do you accept terms of use ?"/>
                        <br />
                    </div>
                    <br />
                   <div style="height:100px; " class="shadowedPanel">
                       <h6><strong>Privacy Policy</strong></h6>
                   </div>
                    
                    <div>
                        <asp:CheckBox runat="server" ID="CheckBox1_privacy" class="form-group pull-right" Text="Do you accept privacy policy ?"/>
                        <br />
                    </div>

                </div>
                <div class="col-md-12 pull-right" style="text-align: center;">
                            <asp:Button ID="txt_addInstrument" CssClass="btn btn-success " runat="server" Text="Continue" OnClick="btn_continueclicked" />
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
