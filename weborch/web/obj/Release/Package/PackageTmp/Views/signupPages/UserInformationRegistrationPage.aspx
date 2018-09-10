<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInformationRegistrationPage.aspx.cs" Inherits="web.Views.signupPages.UserInformationRegistrationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>
            <%--<link href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css" rel="stylesheet" />--%>
            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>

            <h4>Sign Up</h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <a class="list-group-item list-group-item-action" href="TermsOfUsePage.aspx"><%= Resources.HomeView.aspx.AcceptTerms %></a>
                        <a class="list-group-item list-group-item-action active"><%= Resources.HomeView.aspx.UserInfo %></a>
                    </ul>
                </div>
                <div class="col-md-10">

                    <div class="col-md-12 shadowedPanel" style="height: 220px; background-color: white;">
                        <div class="rwo">
                            <label><%= Resources.HomeView.aspx.WhatkindOfUserAreyou %></label>
                            <div class="col-md-12 form-group">
                                <br />
                                <%= Resources.HomeView.aspx.Individual %>
                                <asp:CheckBox runat="server" ID="chk_Composer" Text="<%$Resources:HomeView.aspx,Composer %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Conductor" Text="<%$Resources:HomeView.aspx,Conductor %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_tp" Text="<%$Resources:HomeView.aspx,Teacher_Professor %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Student" Text="<%$Resources:HomeView.aspx,Student %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Audience" Text="<%$Resources:HomeView.aspx,Audience %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Player" Text="<%$Resources:HomeView.aspx,Player %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_userOther" Text="<%$Resources:HomeView.aspx,Other %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <br />
                                <br />
                                <%= Resources.HomeView.aspx.Company %>
                                <asp:CheckBox runat="server" ID="chk_Orchestra" Text="<%$Resources:HomeView.aspx,Orchestra %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Promoter" Text="<%$Resources:HomeView.aspx,Promoter %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_Agent" Text="<%$Resources:HomeView.aspx,Agent %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_shopOwner" Text="<%$Resources:HomeView.aspx,ShopOwner %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                <asp:CheckBox runat="server" ID="chk_companyOther" Text="<%$Resources:HomeView.aspx,Other %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                            </div>
                            <div>
                                <hr />
                                <asp:Button runat="server" ID="proccedButton" CssClass="btn btn-info pull-right" Text="<%$Resources:HomeView.aspx,Continue %>" OnClick="btn_continueClicked" />
                                <br />
                            </div>
                        </div>

                    </div>
                    <br />
                    <div runat="server" id="PersonInfoFormContainer" visible="false" style="background-color: white;" class="col-md-12 shadowedPanel">
                        <div class="row">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <div class="col-md-12" style="padding: 0;">
                                        <div class="col-md-6 form-group" style="padding: 0;">
                                            <div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Email %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uemail" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />

                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Password %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="upassword" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />

                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Name %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uname" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Affiliation %>:</div>
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
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Sex %>:</div>
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
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Birthday %>:</div>
                                                    <div class="col-md-6">
                                                        <%--<asp:TextBox ID="userBirthDate" runat="server" ToolTip="dd/mm/yyyy" class="form-control" placeholder="dd/mm/yyyy"></asp:TextBox>--%>
                                                        <div class='input-group date' id='datetimepicker2' style="display: flex;">
                                                            <input type='text' class="form-control" runat="server" id="userBirthDate" style="display: inline-block; border-right-width: 0px;" />
                                                            <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                                                <span class="glyphicon glyphicon-calendar"></span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.ZipCode %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uzipcode" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Address %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="uaddress" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.MobileNo %>:</div>
                                                    <div class="col-md-6">
                                                        
                                                        <asp:TextBox ID="umobileno1" runat="server" class="form-control" MaxLength="3" style="display: inline-block; width: 25%;"></asp:TextBox>
                                                        <asp:TextBox ID="umobileno2" runat="server" class="form-control" MaxLength="4" style="display: inline-block; width: 35%;"></asp:TextBox>
                                                        <asp:TextBox ID="umobileno3" runat="server" class="form-control" MaxLength="4" style="display: inline-block; width: 35%;"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>

                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.FacebookAddr %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="ufacebookadd" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.TwitterAddr %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="utwitter" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.KakaoTalkID %>:</div>
                                                    <div class="col-md-6">
                                                        <asp:TextBox ID="ukakao" runat="server" class="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.MajorInstrument1 %>:</div>
                                                    <div class="col-md-6">

                                                        <asp:SqlDataSource ID="SqlDataSource3_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select 1 row, -1 as ID, 'None' as EnglishName, 'None' as KoreanName, 'None' as [Group] 
union
SELECT ROW_NUMBER() OVER(ORDER BY EnglishName ASC) AS Row, ID, EnglishName, KoreanName, [Group] FROM Core.Instrument "></asp:SqlDataSource>
                                                        <asp:DropDownList ID="DropDownList1_mjInst1" class="form-control" runat="server" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>

                                                        <%--<asp:TextBox ID="umajorinst1" runat="server" class="form-control"></asp:TextBox>--%>
                                                    </div>
                                                    <br />
                                                </div>
                                                <div class="col-md-12">
                                                    <br />
                                                    <div class="col-md-4"><%= Resources.HomeView.aspx.MajorInstrument2 %>:</div>
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
                                                <div class="col-md-4"><%= Resources.HomeView.aspx.Photo1 %>:</div>
                                                <div class="col-md-6">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline" />
                                                    <%--<asp:TextBox ID="uphoto1" runat="server" class="form-control"></asp:TextBox>--%>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4"><%= Resources.HomeView.aspx.Photo2 %>:</div>
                                                <div class="col-md-6">
                                                    <asp:FileUpload ID="FileUpload2" runat="server" Style="display: inline" />
                                                    <%--<asp:TextBox ID="uphoto2" runat="server" class="form-control"></asp:TextBox>--%>
                                                </div>
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4"><%= Resources.HomeView.aspx.ProfilePage %>:</div>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="uprofilepage" TextMode="MultiLine" Rows="3" runat="server" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                                <br />
                                                <br />
                                            </div>

                                            <div class="col-md-12">
                                                <br />
                                                <div class="col-md-4"><%= Resources.HomeView.aspx.Repertory %>:</div>
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
                                                    <asp:Label runat="server"><%= Resources.HomeView.aspx.Endorser %>:</asp:Label>
                                                </div>
                                                <%--<div class="col-md-4">

                                                    <asp:DropDownList class="form-control" ID="DropDownList1_endorserlist" runat="server" DataSourceID="SqlDataSource1_endorserList" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1_endorserList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [Name], [Email],  [ID] FROM Main.[Endorser]"></asp:SqlDataSource>

                                                </div>--%>
                                                <div class="col-md-4">
                                                    <%--<asp:Button ID="Button5" CssClass="btn btn-sm btn-warning" Style="margin-left: 3px !important;" runat="server" Text="<%$Resources:HomeView.aspx,Add %>" OnClick="btn_add_endorser_tolist" />--%>
                                                    <asp:Button ID="btn_add_Inst" CssClass="btn btn-sm btn-success" Style="margin-left: 3px !important;" runat="server" Text="<%$Resources:HomeView.aspx,Add %>" data-toggle="modal" data-target="#exampleModalLong" />
                                                </div>

                                            </div>

                                            <div class="row col-md-12 pull-right">
                                                <asp:Repeater runat="server" ID="myendorsmentlist">
                                                    <ItemTemplate>
                                                        <tr style="margin-bottom: 3px;">
                                                            <asp:Button CssClass="btn btn-secondary" runat="server" AutoPostBack="True" CommandArgument='<%# Container.ItemIndex  %>' OnCommand="btn_remove_endorser_tolist" Text="<%$Resources:HomeView.aspx,Delete %>"></asp:Button>
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

                                        </div>


                                        <div class="col-md-12 pull-right" style="text-align: center;">
                                            <asp:Button ID="Button1" CssClass="btn btn-danger " runat="server" Text="<%$Resources:HomeView.aspx,Cancel %>" OnClick="btn_cancel_click" />
                                            <asp:Button ID="Button2" CssClass="btn btn-success " runat="server" Text="<%$Resources:HomeView.aspx,Add %>" OnClick="btn_regPersonalInfo_click" />
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>
                    </div>
                    <div runat="server" id="CompanyInfoFormContainer" style="background-color: white;" visible="false" class="col-md-12 shadowedPanel">
                        <div class="row">
                            <div class=" row col-md-12 form-group">

                                <div class="col-md-6 ">
                                    <div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.Email %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="oemail" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />

                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.Password %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="opassword" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />

                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.MobileNo %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="omibile" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.CompanyName %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="ocompanyname" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />

                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.BussinessNo %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="obussinessno" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.ZipCode %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="ozipcode" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.Address %>:</div>
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
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.PhoneNo %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="ophonenumber" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />

                                        </div>

                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.FaxNo %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="ofaxnumber" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>

                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.CEOName %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="oceoname" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.AdminEmail %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="oadminemail" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.AdminName %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="oadminname" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.AdminMobileNo %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="oadminmobno" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.CompanyHomeUrl %>:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="ocompanyurl" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.OtherInfo %>:</div>
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

                                <h4><%= Resources.HomeView.aspx.Orchestradata %></h4>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Name %>:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Alias %>:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchaliasname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.URL %>:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchurl" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Conductor %>:</div>
                                    <div class="col-md-8">
                                        <%--<asp:TextBox ID="txt_orchcondactername" runat="server" class="form-control"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3_conductor" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select ( isnull(FirstName,'') + ' '+ isnull(MiddleName,'') + ' '+ isnull(FamilyName,'')) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName,al.Name from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name like '%Conductor%'
) a"></asp:SqlDataSource>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Since %>:</div>
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
                            <asp:Button ID="Button3" CssClass="btn btn-danger " runat="server" Text="<%$Resources:HomeView.aspx,Cancel %>" OnClick="btn_cancel_click" />
                            <asp:Button ID="Button4" CssClass="btn btn-success " runat="server" Text="<%$Resources:HomeView.aspx,Add %>" OnClick="btn_regCoompany_click" />
                        </div>
                    </div>
                </div>

            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle"><%= Resources.HomeView.aspx.Endorser %></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="exampleFormControlInput1"><%= Resources.HomeView.aspx.Name %></label>
                                <asp:TextBox runat="server" type="text" class="form-control" ID="FormControlInput1_Name" placeholder="Name of the Endorser" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1"><%= Resources.HomeView.aspx.Email %></label>
                                <asp:TextBox runat="server" class="form-control" ID="FormControlTextarea1_email" TextMode="Email" placeholder="Email Address of the Endorser" />
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"><%= Resources.HomeView.aspx.Close %></button>
                            <asp:Button runat="server" type="button" class="btn btn-primary" Text="<%$Resources:HomeView.aspx,Save %>" ID="btnAddReview" OnClick="btnAddEndorser_Click" />
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
            $('body').removeClass('modal-open');

            //alert('test');
        }
        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        }
        $(function () {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        });

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
