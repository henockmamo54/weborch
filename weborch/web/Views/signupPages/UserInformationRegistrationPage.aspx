﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInformationRegistrationPage.aspx.cs" Inherits="web.Views.signupPages.UserInformationRegistrationPage" %>

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
                                <asp:CheckBox runat="server" ID="chk_Conductor" Text="Conductor" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_tp" Text="Teacher/Professor" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Student" Text="Student" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Audience" Text="Audience" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Player" Text="Player" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_userOther" Text="Other" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <br />
                                <br />
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
                                    <div class="col-md-12" style="padding: 0;">
                                        <div class="col-md-6 form-group" style="padding: 0;">
                                            <div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Email:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uemail" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />

                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Password:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="upassword" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />

                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Name:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uname" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Affiliation:</div>
                                                    <div class="col-md-6">

                                                        <asp:DropDownList ID="DropDownList1_Affilation" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_Affilation_SelectedIndexChanged"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName]='Other', [ID]=-1 FROM  core.[Orchestra]
union
SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>

                                                    </div>
                                                    <br />
                                                </div>
                                                

                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"></div>
                                                    <div class="col-md-6">

                                                        <asp:TextBox ID="uaffilation" runat="server" placeholder="Your Affilation" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>


                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Sex:</div>
                                                    <div class="col-md-6">

                                                        <asp:DropDownList ID="DropDownList1_sex" runat="server" class="form-control">
                                                            <asp:ListItem>Male</asp:ListItem>
                                                            <asp:ListItem>Female</asp:ListItem>
                                                        </asp:DropDownList>

                                                        <%--<asp:TextBox ID="usersex" runat="server" class="form-control"></asp:TextBox>--%>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Birthday:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="userBirthDate" runat="server" ToolTip="dd/mm/yyyy" class="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Zip Code:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uzipcode" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Address:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uaddress" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Mobile No.:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="umobileno" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>

                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Facebook Addr.:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="ufacebookadd" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Twitter Addr.:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="utwitter" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Kakao Talk ID:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="ukakao" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Major Instrument 1:</div>
                                                    <div class="col-md-6">

                                                        <asp:SqlDataSource ID="SqlDataSource3_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="--SELECT ID, EnglishName, KoreanName, [Group] FROM Core.Instrument



select -1 as ID, 'None' as EnglishName, 'None' as KoreanName, 'None' as [Group] 
union
SELECT ID, EnglishName, KoreanName, [Group] FROM Core.Instrument"></asp:SqlDataSource>
                                                        <asp:DropDownList ID="DropDownList1_mjInst1" class="form-control" runat="server" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>

                                                        <%--<asp:TextBox ID="umajorinst1" runat="server" class="form-control"></asp:TextBox>--%>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4">Major Instrument 2:</div>
                                                    <div class="col-md-6">
                                                        <asp:DropDownList ID="DropDownList1_mjInst2" class="form-control" runat="server" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>

                                                        <%--<asp:TextBox ID="umajorinst2" runat="server" class="form-control"></asp:TextBox>--%>
                                                    </div>
                                                    <br />
                                                </div>

                                            </div>
                                        </div>

                                        <div class="col-md-6 form-group" id="endorserdiv" style="padding: 0;">


                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Photo 1:</div>
                                                <div class="col-md-6">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                                                    <%--<asp:TextBox ID="uphoto1" runat="server" class="form-control"></asp:TextBox>--%>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Photo 2:</div>
                                                <div class="col-md-6">
                                                    <asp:FileUpload ID="FileUpload2" runat="server" Style="display: inline" />
                                                    <%--<asp:TextBox ID="uphoto2" runat="server" class="form-control"></asp:TextBox>--%>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Profile Page.:</div>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="uprofilepage" TextMode="MultiLine" Rows="3" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                                <br />
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Repertory.:</div>
                                                <div class="col-md-8">
                                                    <asp:TextBox TextMode="MultiLine" Rows="3" ID="urepertory" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                                <br />
                                                <br />
                                            </div>

                                            <br />
                                            <hr />

                                            <div class="col-md-12">
                                                <div class="col-md-4">
                                                    <asp:Label runat="server">Endorser:</asp:Label>
                                                </div>
                                                <div class="col-md-4">

                                                    <asp:DropDownList class="form-control" ID="DropDownList1_endorserlist" runat="server" DataSourceID="SqlDataSource1_endorserList" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1_endorserList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [Name], [Email],  [ID] FROM Main.[Endorser]"></asp:SqlDataSource>

                                                </div>
                                                <div class="col-md-4">
                                                    <asp:Button ID="Button5" CssClass="btn btn-sm btn-warning" Style="margin-left: 3px !important;" runat="server" Text="Add" OnClick="btn_add_endorser_tolist" />
                                                    <asp:Button ID="btn_add_Inst" CssClass="btn btn-sm btn-success" Style="margin-left: 3px !important;" runat="server" Text="New" data-toggle="modal" data-target="#exampleModalLong" />
                                                </div>

                                            </div>

                                            <div class="row col-md-12 pull-right">
                                                <asp:Repeater runat="server" ID="myendorsmentlist">
                                                    <ItemTemplate>
                                                        <tr style="margin-bottom: 3px;">
                                                            <asp:Button runat="server" AutoPostBack="True" CommandArgument='<%#Eval("ID")%>' OnClick="btn_remove_endorser_tolist" Text="Delete"></asp:Button>
                                                            <td>
                                                                <asp:Label runat="server" ID="Label1" Text='<%# Eval("Name") %>' />
                                                                - 
                                                            </td>
                                                            <td>
                                                                <asp:Label runat="server" ID="Label2" Text='<%# Eval("Email") %>' />
                                                            </td>
                                                        </tr>
                                                        <br />
                                                        <br />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>

                                            <%--<div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uedoremail1" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorname1" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 1:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorcomm1" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>


                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uedoremail2" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorname2" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 2:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorcomm2" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>



                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 3:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uedoremail3" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 3:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorname3" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 3:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorcomm3" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>



                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 4:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uedoremail4" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 4:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorname4" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 4:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorcomm4" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Email ID 5:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uedoremail5" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Name 5:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorname5" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4">Endorsor Comments 5:</div>
                                                <div class="col-md-6">
                                                    <asp:TextBox ID="uendorcomm5" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>--%>
                                        </div>


                                        <div class="col-md-12 pull-right" style="text-align: center;">
                                            <asp:Button ID="Button1" CssClass="btn btn-danger " runat="server" Text="Cancel" OnClick="btn_cancel_click" />
                                            <asp:Button ID="Button2" CssClass="btn btn-success " runat="server" Text="Add" OnClick="btn_regPersonalInfo_click" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <div runat="server" id="CompanyInfoFormContainer" visible="false" class="col-md-12 shadowedPanel">
                        <div class="row">
                            <div class=" row col-md-12 form-group">

                                <div class="col-md-6 ">
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

                                <div class="col-md-6">
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



                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="row col-md-12">
                            <div class="col-md-12" runat="server" id="divforOrchestrainfo" visible="true">

                                <h4>Orchestra Info.</h4>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Name:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Alias:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchaliasname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">URL:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchurl" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Conductor:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchcondactername" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Since:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchsince" runat="server" OnClick="dummybtnclick" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>

                            </div>
                        </div>

                        <br />

                        <div class="col-md-12 pull-right" style="text-align: center;">
                            <br />
                            <br />
                            <asp:Button ID="Button3" CssClass="btn btn-danger " runat="server" Text="Cancel" OnClick="btn_cancel_click" />
                            <asp:Button ID="Button4" CssClass="btn btn-success " runat="server" Text="Add" OnClick="btn_regCoompany_click" />
                        </div>
                    </div>
                </div>

            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Endorser</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="exampleFormControlInput1">Name</label>
                                <asp:TextBox runat="server" type="text" class="form-control" ID="FormControlInput1_Name" placeholder="Name of the Endorser" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Email</label>
                                <asp:TextBox runat="server" class="form-control" ID="FormControlTextarea1_email" TextMode="Email" placeholder="Email Address of the Endorser" />
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button runat="server" type="button" class="btn btn-primary" Text="Save changes" ID="btnAddReview" OnClick="btnAddEndorser_Click" />
                        </div>
                    </div>
                </div>
            </div>


        </ContentTemplate>

        <Triggers>
            <asp:PostBackTrigger ControlID="proccedButton" />
            <asp:PostBackTrigger ControlID="Button2" />
        </Triggers>

    </asp:UpdatePanel>

    <script type="text/javascript">
        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
            //alert('test');
        }
    </script>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }

        #endorserdiv .col-md-12 {
            padding: 0 !important;
        }

        #endorserdiv .col-md-4 {
            padding: 0 !important;
        }
    </style>

</asp:Content>
