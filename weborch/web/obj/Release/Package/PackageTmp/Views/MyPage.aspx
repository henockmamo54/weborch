<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyPage.aspx.cs" Inherits="web.Views.MyPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div>

                <center>
                    <%--<img src="data:image/png;base64,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"
                         name="aboutme" width="140" height="140" border="0" class="img-circle"></a>--%>
                    <asp:Image ID="profileimage" runat="server" width="140" height="140" border="0" class="img-circle"></asp:Image>
                    <h3 class="media-heading"> <asp:Label ID="mynameholder" runat="server"></asp:Label> <small>KR</small></h3>
                    
                        <asp:Label runat="server" class="label label-warning">Attended 48 Times</asp:Label>
                        <asp:Label runat="server" class="label label-info">12 Posts</asp:Label>
                        <asp:Label runat="server" class="label label-info">42 comments</asp:Label>
                        <asp:Label runat="server" class="label label-success">Active since Oct 2017</asp:Label>
                    </center>
            </div>
            <%--==========================================================================================--%>
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#home">Bio:</a></li>
                <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
                <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
                <li><a data-toggle="tab" href="#menu3">Menu 3</a></li>
            </ul>

            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <div id="personalInfoDiv" runat="server" visible="false">

                        <h3>Personal Info</h3>

                        <div class="row">

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
                                                <asp:TextBox ID="uaffilation" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4">Sex:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="usersex" runat="server" class="form-control"></asp:TextBox>
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
                                            <div class="col-md-6">
                                                <asp:TextBox ID="uprofilepage" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4">Repertory.:</div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="urepertory" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>

                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4">occupation:</div>
                                            <div class="col-md-6">
                                                <asp:CheckBox ID="radioOcupation_Composer" runat="server" Text="Composer" />
                                                <br />
                                                <asp:CheckBox ID="radioOcupation_Conductor" runat="server" Text="Conductor" />
                                                <br />
                                                <asp:CheckBox ID="radioOcupation_TeacherProfessor" runat="server" Text="Teacher/Professor" />
                                                <br />
                                                <asp:CheckBox ID="radioOcupation_Student" runat="server" Text="Student" />
                                                <br />
                                                <asp:CheckBox ID="radioOcupation_Audience" runat="server" Text="Audience" />
                                                <br />
                                                <asp:CheckBox ID="radioOcupation_Player" runat="server" Text="Player" />
                                                <br />
                                                <asp:CheckBox ID="RadioButton1_Other" runat="server" Text="Other" />

                                            </div>
                                            <br />
                                        </div>



                                    </div>
                                </div>

                            </div>

                        </div>


                    </div>
                    <div id="companyInfoDiv" runat="server">
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

                                        <div class="col-md-12">
                                            <br />
                                            <div class="col-md-4">occupation:</div>
                                            <div class="col-md-6">
                                                <asp:CheckBox ID="RadioButton1_Orchestra" runat="server" Text="Orchestra" />
                                                <br />
                                                <asp:CheckBox ID="RadioButton2_Promoter" runat="server" Text="Promoter" />
                                                <br />
                                                <asp:CheckBox ID="RadioButton3_Agent" runat="server" Text="Agent" />
                                                <br />
                                                <asp:CheckBox ID="RadioButton4_ShopOwner" runat="server" Text="Shop Owner" />
                                                <br />
                                                <asp:CheckBox ID="RadioButton7comp_Other" runat="server" Text="Other" />

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

                    </div>
                </div>
                <div id="menu1" class="tab-pane fade">
                    <h3>Menu 1</h3>
                    <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
                <div id="menu2" class="tab-pane fade">
                    <h3>Menu 2</h3>
                    <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
                </div>
                <div id="menu3" class="tab-pane fade">
                    <h3>Menu 3</h3>
                    <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p>
                </div>
            </div>


            <%--=====================================================================================================--%>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
