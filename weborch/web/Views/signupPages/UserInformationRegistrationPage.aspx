<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInformationRegistrationPage.aspx.cs" Inherits="web.Views.signupPages.UserInformationRegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>
            <h4>Sign Up</h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <a class="list-group-item list-group-item-action" href="TermsOfUsePage.aspx">Accept Terms</a>
                        <a class="list-group-item list-group-item-action active">User Info.</a>
                    </ul>
                </div>
                <div class="col-md-10">

                <div class="col-md-12 shadowedPanel" style="height: 220px;">
                    <div class="rwo">
                        <label>What kind Of User Are you?</label>
                        <div class="col-md-12 form-group">
                            <br />
                            Individual
                            <asp:CheckBox runat="server" ID="chk_Composer" Text="Composer" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_Conductor" Text="Conductor" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true"/>
                            <asp:CheckBox runat="server" ID="chk_tp" Text="Teacher/Professor" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_Student" Text="Student" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_Audience" Text="Audience" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_userOther" Text="Other" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <br />  <br />
                            Company
                            <asp:CheckBox runat="server" ID="chk_Orchestra" Text="Orchestra" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_Promoter" Text="Promoter" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_Agent" Text="Agent" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_shopOwner" Text="Shop Owner" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            <asp:CheckBox runat="server" ID="chk_companyOther" Text="Other" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                        </div>
                        <div>
                            <hr />
                            <asp:Button runat="server" ID="proccedButton" CssClass="btn btn-info pull-right" Text="Continue" OnClick="btn_continueClicked" />
                            <br />
                        </div>
                    </div>

                </div>
                                <br />
                <div runat="server" id="PersonInfoFormContainer" visible="false" class="col-md-12 shadowedPanel">
                    <div class="row">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="col-md-12" style="padding:0;">
                                    <div class="col-md-6 form-group" style="padding:0;">
                                        <div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Email:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox6" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Password:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox9" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Name:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox10" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Affiliation:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox11" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Zip Code:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox13" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Address:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox14" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Mobile No.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox12" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Facebook Addr.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox15" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Twitter Addr.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox16" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Kakao Talk ID:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox17" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Major Instrument 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox18" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Major Instrument 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox19" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Photo 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox20" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Photo 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox21" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Profile Page.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox22" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Repertory.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox31" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            

                                        </div>
                                    </div>

                                    <div class="col-md-6 form-group" id="endorserdiv" style="padding:0;">
                                        
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox32" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox33" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox34" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>


                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox35" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox36" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox37" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                            

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 3:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox38" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 3:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox39" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 3:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox40" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                            

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 4:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox41" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 4:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox42" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 4:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox43" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>                                            

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 5:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox44" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 5:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox45" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 5:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="TextBox46" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                    </div>


                                    <div class="col-md-12 pull-right" style="text-align: center;">
                                        <asp:Button ID="Button1" CssClass="btn btn-danger " runat="server" Text="Cancel" OnClick="btn_cancel_click" />
                                        <asp:Button ID="Button2" CssClass="btn btn-success " runat="server" Text="Add" OnClick="btn_useradd_Click" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
                <div runat="server" id="CompanyInfoFormContainer" visible="false" class="col-md-12 shadowedPanel">
                    <div class="row">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div class="col-md-12">
                                    <div class="col-md-6 form-group">
                                        <div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Email:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="oemail" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Password:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="opassword" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Mobile No.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="omibile" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Company Name:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="ocompanyname" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Bussiness No:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="obussinessno" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Zip Code:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="ozipcode" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Address:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="oaddress" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 form-group">
                                        <div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Phone No.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="ophonenumber" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />

                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Fax No.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="ofaxnumber" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">CEO Name:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="oceoname" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Admin Email:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="oadminemail" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Admin Name:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="oadminname" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Admin Mobile No:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="oadminmobno" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Company Home Url:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="ocompanyurl" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Other Info.:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="ootherinof" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                            <br />


                                        </div>
                                    </div>

                                    <div class="col-md-12 pull-right" style="text-align: center;">
                                        <asp:Button ID="Button3" CssClass="btn btn-danger " runat="server" Text="Cancel" OnClick="btn_cancel_click" />
                                        <asp:Button ID="Button4" CssClass="btn btn-success " runat="server" Text="Add" OnClick="btn_regCoompany_click" />
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
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
        #endorserdiv .col-md-12 {
        padding:0!important;        
        }
        #endorserdiv .col-md-4 {
        padding:0!important;        
        }
    </style>

</asp:Content>
