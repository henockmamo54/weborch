<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageArtistPageView.aspx.cs" Inherits="web.ManageArtistPageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>



    <div class="row">


        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

                <div id="formanaging" runat="server" visible="true">

                    <h3>Artist data</h3>

                    <div class="row shadowedPanel" style="background-color: white;box-shadow: 1px 1px 1px 1px #d0d0d0;border-radius: 10px;">
                        <div class="col-md-12">
                            <div class="col-md-12" style="margin:5px;">

                                <div class=" row col-md-12 form-group">

                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Name %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_firstname" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <%--<div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.FamilyName %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_familyname" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.MiddleName %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_middlename" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>--%>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Birthday %>:</div>
                                        <div class="col-md-8">
                                            <%--<asp:TextBox ID="txt_artist_birthdate" runat="server" class="form-control" ToolTip="dd/mm/yyyy"></asp:TextBox>--%>
                                            <div class='input-group date' id='datetimepicker2' style="display: flex;">
                                                <input type='text' class="form-control" runat="server" id="txt_artist_birthdate" style="display: inline-block; border-right-width: 0px;" />
                                                <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 6px;">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                            </div>

                                        </div>
                                        <br />
                                    </div>

                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Address %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_address" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.ZipCode %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_zipcode" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.TelNO %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_teleno" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.MobileNo %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_mobileno" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.FaxNo %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_aritist_faxno" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Remarks %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_artist_remark" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>

                                    <%--=====================================================================================================================================================================================--%>


                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.KakaoTalkID %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="ukakao" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.FacebookAddr %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="ufacebookadd" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.TwitterAddr %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="utwitter" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>

                                    <%--===============================================================================================================================================--%>
                                    <div class="col-md-4 " style="width: 100%;">
                                        <div class="col-md-4" style="padding: 0;">
                                            <div class="col-md-12" style="padding: 0;">
                                                <br />
                                                <div class="col-md-4"><%= Resources.HomeView.aspx.Affiliation %>:</div>
                                                <div class="col-md-8">

                                                    <asp:DropDownList ID="DropDownList1_Affilation" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID" AutoPostBack="false" OnSelectedIndexChanged="DropDownList1_Affilation_SelectedIndexChanged"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName]='Other', [ID]=-1 FROM  core.[Orchestra]
union
SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>

                                                </div>
                                                <br />
                                            </div>
                                            <div class="col-md-12" style="padding: 0;">
                                                <br />
                                                <div class="col-md-4"></div>
                                                <div class="col-md-8">

                                                    <asp:TextBox ID="uaffilation" runat="server" placeholder="Your Affilation" class="form-control"></asp:TextBox>
                                                </div>
                                                <br />
                                            </div>
                                        </div>
                                    </div>
                                    <%--===========================================================================================================================================================--%>
                                    <div class="col-md-12">
                                        <div class="col-md-6">
                                            <br />
                                            <div class="col-md-3"><%= Resources.HomeView.aspx.ProfilePage %>:</div>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="uprofilepage" runat="server" class="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-6">
                                            <br />
                                            <div class="col-md-3"><%= Resources.HomeView.aspx.Repertory %>:</div>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="urepertory" runat="server" class="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                            </div>
                                            <br />
                                        </div>
                                    </div>
                                    <%--===========================================================================================================================================================--%>
                                </div>
                                <div class="row col-md-12">
                                    <hr />
                                    <div class="col-md-6">
                                        <div class="col-md-2">
                                            <asp:Label runat="server"><strong><%= Resources.HomeView.aspx.Endorser %>:</strong></asp:Label>
                                        </div>

                                        <%--<div class="col-md-4">
                                            <asp:DropDownList class="form-control" ID="DropDownList1_endorserlist" runat="server" DataSourceID="SqlDataSource1_endorserList" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1_endorserList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [Name], [Email],  [ID] FROM Main.[Endorser]"></asp:SqlDataSource>
                                        </div>--%>

                                        <div class="col-md-4">
                                            <%--<asp:Button ID="Button5" CssClass="btn btn-sm btn-warning" Style="margin-left: 3px !important;" runat="server" Text="<%$Resources:HomeView.aspx,Add %>" OnClick="btn_add_endorser_tolist" />--%>
                                            <asp:Button ID="Button1" CssClass="btn btn-sm btn-success" Style="margin-left: 3px !important;" runat="server" Text="<%$Resources:HomeView.aspx,Add %>" data-toggle="modal" data-target="#exampleModalLong" />
                                        </div>

                                    </div>

                                    <div class="row col-md-12 pull-right">
                                        <asp:Repeater runat="server" ID="myendorsmentlist">
                                            <ItemTemplate>
                                                <tr style="margin-bottom: 5px;">
                                                    <asp:Button runat="server" AutoPostBack="True" Text="<%$Resources:HomeView.aspx,Delete %>" CommandArgument='<%# Container.ItemIndex  %>' OnCommand="btn_remove_endorser_tolist"></asp:Button>
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

                                <hr />

                                <div class="rwo">
                                    <label><strong><%= Resources.HomeView.aspx.WhatkindOfArtistAreyou %></strong></label>
                                    <div class="col-md-12 form-group">
                                        <br />
                                        <asp:CheckBox runat="server" ID="chk_Composer" Text="<%$Resources:HomeView.aspx,Composer %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="false" />
                                        <asp:CheckBox runat="server" ID="chk_Conductor" Text="<%$Resources:HomeView.aspx,Conductor %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="false" />
                                        <asp:CheckBox runat="server" ID="chk_tp" Text="<%$Resources:HomeView.aspx,Teacher_Professor %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="false" />
                                        <asp:CheckBox runat="server" ID="chk_Student" Text="<%$Resources:HomeView.aspx,Student %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="false" />
                                        <asp:CheckBox runat="server" ID="chk_player" Text="<%$Resources:HomeView.aspx,Player %>" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="false" />
                                    </div>
                                </div>

                                <hr />

                                <div class="row col-md-12">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <br />
                                            <div class="col-md-4">
                                                <asp:Label runat="server"><strong><%= Resources.HomeView.aspx.Instrument %></strong></asp:Label>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:DropDownList class="form-control" runat="server" ID="DropDownList1_InstrumentInTheMain" AutoPostBack="True" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                            </div>
                                            <div class="col-md-4">
                                                <asp:Button ID="btn_add_Inst" CssClass="btn btn-sm btn-info" runat="server" Text="<%$Resources:HomeView.aspx,Add %>" OnClick="btn_add_Inst_Click" />
                                            </div>

                                        </div>
                                    </div>
                                    <br />
                                    <div class="row col-md-12 pull-right">
                                        <asp:Repeater runat="server" ID="myinstrepeater">
                                            <ItemTemplate >
                                                <tr >
                                                    <asp:Button style="margin-bottom: 5px;" runat="server" AutoPostBack="True" CommandArgument='<%#Eval("ID")%>' OnClick="removeinstrumentfrommyMainList" Text="<%$Resources:HomeView.aspx,Delete %>"></asp:Button>
                                                    <td>
                                                        <asp:Label runat="server" ID="Label1" Text='<%# Eval("EnglishName") %>' />
                                                    </td>
                                                </tr>
                                                <br />
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>

                                <hr />
                                <div class=" row col-md-12">
                                    <label><strong>Profile Pictures</strong></label>

                                    <div class="col-md-12 form-group">
                                        <div class="col-md-4">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.Photo1 %>:</div>
                                            <div class="col-md-8">
                                                <asp:FileUpload ID="FileUpload5" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                                                    class="form-control" />
                                                <%--<asp:TextBox ID="uphoto1" runat="server" class="form-control"></asp:TextBox>--%>
                                            </div>
                                            <br />
                                        </div>
                                        <div class="col-md-4">
                                            <br />
                                            <div class="col-md-4"><%= Resources.HomeView.aspx.Photo2 %>:</div>
                                            <div class="col-md-8">
                                                <asp:FileUpload ID="FileUpload6" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                                                    class="form-control" />
                                            </div>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                                <hr />

                                <div class="row col-md-12">
                                    <asp:Button Visible="false" ID="btn_artist_cancel" CssClass="btn btn-danger pull-right" runat="server" Text="Cancel" OnClick="btn_artistcancel_Click" style="margin-right:10px;" />
                                    <asp:Button Visible="false" ID="btn_artist_save" CssClass="btn btn-warning pull-right" runat="server" Text="Update" OnClick="btn_artistsave_Click" style="margin-right:10px;" />
                                    <asp:Button ID="btn_artist_add" CssClass="btn btn-primary pull-right" runat="server" Text="<%$Resources:HomeView.aspx,Register %>" OnClick="btn_artistadd_Click" style="margin-right:10px;" />
                                </div>

                            </div>
                        </div>

                    </div>
                    <hr />
                    <div class="row" style="margin-right: -15px; margin-left: -15px;">
                        <div class="col-md-12 form-group" style="margin-bottom: 0px; padding: 0px;">
                            <span class='input-group-addon'>
                                <asp:Label runat="server" Style="padding: 5px;"><%= Resources.HomeView.aspx.Name %>:</asp:Label>
                                <asp:TextBox ID="TextBox1_serach" class="form-control" runat="server" Style="display: inline;" AutoPostBack="True" OnTextChanged="serachTextValueChanged"></asp:TextBox>
                                <i class='glyphicon glyphicon-search' style="padding: 5px;"></i>
                            </span>

                        </div>

                        <div class="col-md-12" style="margin-bottom: 0px; overflow-x: scroll; padding: 0px;">

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="Delete 
Core.Artist
where ID=@ID"
                                InsertCommand="Insert into Core.Artist (FirstName, FamilyName, MiddleName, BirthDate, Address, ZipCode, TelNO, MobileNO, FaxNo, Remar)
values (@FirstName, @FamilyName, @MiddleName, @BirthDate, @Address, @ZipCode, @TelNO, @MobileNO, @FaxNo, @Remar)"
                                SelectCommand="SELECT ID, FirstName, FamilyName, MiddleName, BirthDate, Address, ZipCode, TelNO, MobileNO, FaxNo, Remar, FacebookAddress, TwitterAddress, KakaoTalkAddress, Photo1, Photo2, ProfilePage,
 Repertory

 FROM Core.Artist"
                                UpdateCommand="Update Core.Artist
set
FirstName= @FirstName,
FamilyName=@FamilyName,
MiddleName=@MiddleName, 
BirthDate=@BirthDate, 
Address=@Address,
ZipCode=@ZipCode,
TelNO=@TelNO,
 MobileNO=@MobileNO, 
FaxNo=@FaxNo, 
Remar =@Remar, 
FacebookAddress=@FacebookAddress,
TwitterAddress=@TwitterAddress, 
KakaoTalkAddress = @KakaoTalkAddress,  
--Photo1 = @Photo1,  
--Photo2=@Photo2, 
ProfilePage=@ProfilePage,
Repertory =@Repertory 

Where ID=@ID"
                                FilterExpression="( '{0}'='') or (FirstName like '{0}') or (FamilyName like '{0}') or (MiddleName like '{0}')">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" />
                                </DeleteParameters>
                                <FilterParameters>
                                    <asp:ControlParameter ControlID="TextBox1_serach" Name="TextBox1_serach" PropertyName="Text" />
                                </FilterParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="FirstName" />
                                    <asp:Parameter Name="FamilyName" />
                                    <asp:Parameter Name="MiddleName" />
                                    <asp:Parameter Name="BirthDate" />
                                    <asp:Parameter Name="Address" />
                                    <asp:Parameter Name="ZipCode" />
                                    <asp:Parameter Name="TelNO" />
                                    <asp:Parameter Name="MobileNO" />
                                    <asp:Parameter Name="FaxNo" />
                                    <asp:Parameter Name="Remar" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="FirstName" />
                                    <asp:Parameter Name="FamilyName" />
                                    <asp:Parameter Name="MiddleName" />
                                    <asp:Parameter Name="BirthDate" />
                                    <asp:Parameter Name="Address" />
                                    <asp:Parameter Name="ZipCode" />
                                    <asp:Parameter Name="TelNO" />
                                    <asp:Parameter Name="MobileNO" />
                                    <asp:Parameter Name="FaxNo" />
                                    <asp:Parameter Name="Remar" />
                                    <asp:Parameter Name="FacebookAddress" />
                                    <asp:Parameter Name="TwitterAddress" />
                                    <asp:Parameter Name="KakaoTalkAddress" />
                                    <asp:Parameter Name="Photo1" />
                                    <asp:Parameter Name="Photo2" />
                                    <asp:Parameter Name="ProfilePage" />
                                    <asp:Parameter Name="Repertory" />
                                    <asp:Parameter Name="ID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Style="overflow-x: scroll; width: 2000px;" AllowPaging="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="ID" OnRowEditing="GridView1_RowEditing">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"/>
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="false" ShowSelectButton="true"
                                        ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                                        EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                        SelectImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                        CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                                        UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png"
                                        HeaderStyle-Width="90px" ItemStyle-Width="90px">
                                        <ControlStyle Height="20px" Width="20px" />
                                        <HeaderStyle Width="90px" />
                                        <ItemStyle Width="90px" Wrap="False" />
                                    </asp:CommandField>
                                    <asp:BoundField DataField="ID" HeaderText="<%$Resources:HomeView.aspx,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="FirstName" HeaderText="<%$Resources:HomeView.aspx,Name %>" SortExpression="FirstName" />
                                   <%-- <asp:BoundField DataField="FamilyName" HeaderText="<%$Resources:HomeView.aspx,FamilyName %>" SortExpression="FamilyName" />
                                    <asp:BoundField DataField="MiddleName" HeaderText="<%$Resources:HomeView.aspx,MiddleName %>" SortExpression="MiddleName" />--%>
                                    <asp:BoundField DataField="BirthDate" HeaderText="<%$Resources:HomeView.aspx,BirthDay %>" SortExpression="BirthDate" />
                                    <asp:BoundField DataField="Address" HeaderText="<%$Resources:HomeView.aspx,Address %>" SortExpression="Address" />
                                    <asp:BoundField DataField="ZipCode" HeaderText="<%$Resources:HomeView.aspx,ZipCode %>" SortExpression="ZipCode" />
                                    <asp:BoundField DataField="TelNO" HeaderText="<%$Resources:HomeView.aspx,TelNO %>" SortExpression="TelNO" />
                                    <asp:BoundField DataField="MobileNO" HeaderText="<%$Resources:HomeView.aspx,MobileNO %>" SortExpression="MobileNO" />
                                    <asp:BoundField DataField="FaxNo" HeaderText="<%$Resources:HomeView.aspx,FaxNo %>" SortExpression="FaxNo" />
                                    <asp:BoundField DataField="Remar" HeaderText="<%$Resources:HomeView.aspx,Remarks %>" SortExpression="Remar" />
                                    <asp:BoundField DataField="FacebookAddress" HeaderText="<%$Resources:HomeView.aspx,FacebookAddr %>" SortExpression="FacebookAddress" />
                                    <asp:BoundField DataField="TwitterAddress" HeaderText="<%$Resources:HomeView.aspx,TwitterAddr %>" SortExpression="TwitterAddress" />
                                    <asp:BoundField DataField="KakaoTalkAddress" HeaderText="<%$Resources:HomeView.aspx,KakaoTalkID %>" SortExpression="KakaoTalkAddress" />
                                    <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,Photo1 %>" SortExpression="Photo1">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Photo1") %>'></asp:TextBox>--%>
                                            <asp:Button ID="editButton" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#photoModalLong" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Photo1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,Photo2 %>" SortExpression="Photo2">
                                        <EditItemTemplate>
                                            <asp:Button ID="editButton2" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#photoModalLong" />
                                            <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Photo2") %>'></asp:TextBox>--%>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Photo2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ProfilePage" HeaderText="<%$Resources:HomeView.aspx,ProfilePage %>" SortExpression="ProfilePage" />
                                    <asp:BoundField DataField="Repertory" HeaderText="<%$Resources:HomeView.aspx,Repertory %>" SortExpression="Repertory" />
                                </Columns>
                                <EditRowStyle BackColor="#e2e2e2" CssClass="GridViewEditRow" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle CssClass="mystyle" BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>

                        </div>

                    </div>
                    <hr />
                    <div class="row shadowedbox2">
                        <asp:Label runat="server"><h3>Instruments Played By an Artist</h3></asp:Label>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:SqlDataSource ID="artistList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>"
                                    SelectCommand="SELECT        ID ,  Name=FamilyName +'  '+FirstName+'  '+ MiddleName FROM            Core.Artist order by ID desc" FilterExpression="( '{0}'='') or (Name like '%{0}%')">
                                    <FilterParameters>
                                        <asp:ControlParameter ControlID="TextBox1_serach" Name="EnglishName" PropertyName="Text" />
                                    </FilterParameters>
                                </asp:SqlDataSource>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, EnglishName, KoreanName FROM Core.Instrument"></asp:SqlDataSource>
                                <label>Artist:</label>
                                <asp:DropDownList ID="DropDownList1_artistList" runat="server" DataSourceID="artistList" DataTextField="Name" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <div class="row pull-right ">
                                    <div class="col-md-12">
                                        <asp:SqlDataSource ID="SqlDataSource3_instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, EnglishName, KoreanName, [Group] FROM Core.Instrument"></asp:SqlDataSource>
                                        <label>Instrument:</label>
                                        <asp:DropDownList ID="DropDownList1_Instrument" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                        <asp:Button ID="btn_addInstrument" runat="server" Text="Add" OnClick="btn_addInstrument_Click" />

                                        <br />
                                    </div>
                                </div>
                                <br />
                                <div class="row shadowedbox instrumentplayedByartist shadowedbox2" style="margin-top: 1em;">
                                    <asp:ListView ID="ListView_instrumentsplayedbyartist" runat="server" DataSourceID="Artistinstumentsqldatasource" DataKeyNames="ID">
                                        <AlternatingItemTemplate>
                                            <li style="background-color: #eeeeee;" class="backgroundforartistinstul">ID:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                ArtistID:
                                            <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                                                <br />
                                                EnglishName:
                                            <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                                <br />
                                                Group:
                                            <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                                <br />
                                                KoreanName:
                                            <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                                <br />
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </li>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <li style="background-color: #008A8C; color: #FFFFFF;">ID:
                                            <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                ArtistID:
                                            <asp:TextBox ID="ArtistIDTextBox" runat="server" Text='<%# Bind("ArtistID") %>' />
                                                <br />
                                                EnglishName:
                                            <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                                                <br />
                                                Group:
                                            <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
                                                <br />
                                                KoreanName:
                                            <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                                                <br />
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                            </li>
                                        </EditItemTemplate>
                                        <EmptyDataTemplate>
                                            No data was returned.
                                        </EmptyDataTemplate>
                                        <InsertItemTemplate>
                                            <li style="">ArtistID:
                                            <asp:TextBox ID="ArtistIDTextBox" runat="server" Text='<%# Bind("ArtistID") %>' />
                                                <br />
                                                EnglishName:
                                            <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                                                <br />
                                                Group:
                                            <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
                                                <br />
                                                KoreanName:
                                            <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                                                <br />
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                            </li>
                                        </InsertItemTemplate>
                                        <ItemSeparatorTemplate>
                                            <br />
                                        </ItemSeparatorTemplate>
                                        <ItemTemplate>
                                            <li style="background-color: #DCDCDC; color: #000000;" class="backgroundforartistinstul">ID:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                ArtistID:
                                            <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                                                <br />
                                                EnglishName:
                                            <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                                <br />
                                                Group:
                                            <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                                <br />
                                                KoreanName:
                                            <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                                <br />
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </li>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                <li runat="server" id="itemPlaceholder" />
                                            </ul>
                                            <div style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                                <asp:DataPager ID="DataPager1" runat="server">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </div>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <li style="background-color: #008A8C; font-weight: bold; color: #FFFFFF;">ID:
                                            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                ArtistID:
                                            <asp:Label ID="ArtistIDLabel" runat="server" Text='<%# Eval("ArtistID") %>' />
                                                <br />
                                                EnglishName:
                                            <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                                <br />
                                                Group:
                                            <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                                <br />
                                                KoreanName:
                                            <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                                <br />
                                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                            </li>
                                        </SelectedItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="Artistinstumentsqldatasource" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="
delete Drived.Artist_Instrument
where id=@ID"
                                        FilterExpression="ArtistID={0}" SelectCommand="SELECT ai.ID, ai.ArtistID,i.EnglishName,  i.[Group], i.KoreanName FROM Drived.Artist_Instrument AS ai INNER JOIN Core.Instrument AS i ON i.ID = ai.InstrumentID">
                                        <DeleteParameters>
                                            <asp:Parameter Name="ID" />
                                        </DeleteParameters>
                                        <FilterParameters>
                                            <asp:ControlParameter ControlID="DropDownList1_artistList" DefaultValue="1" Name="ArtistID" PropertyName="SelectedValue" />
                                        </FilterParameters>
                                    </asp:SqlDataSource>
                                </div>
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

                <!-- Modal -->
                <div class="modal fade" id="photoModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="photoModalLongTitle">Photo</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group" style="text-align: center;">
                                    <asp:Image runat="server" ID="modalImageContainer" Width="18em" Height="18em" />
                                    <asp:Image runat="server" ID="modalImageContainer2" Width="18em" Height="18em" />
                                </div>

                                <div class="form-group">
                                    <br />
                                    <label for="exampleFormControlTextarea1">Change Photo #1</label>
                                    <asp:FileUpload ID="FileUpload3" runat="server" Style="display: inline" />
                                    <br />
                                    <label for="exampleFormControlTextarea1">Change Photo #2</label>
                                    <asp:FileUpload ID="FileUpload4" runat="server" Style="display: inline" />
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button runat="server" type="button" class="btn btn-primary" Text="Save changes" OnClick="buttonChangeImage" ID="btnsaveimagechange" />
                            </div>
                        </div>
                    </div>
                </div>





            </ContentTemplate>

            <Triggers>
                <asp:PostBackTrigger ControlID="btn_artist_add" />
                <asp:PostBackTrigger ControlID="btnsaveimagechange" />
                <asp:PostBackTrigger ControlID="btn_artist_save" />
            </Triggers>

        </asp:UpdatePanel>

    </div>


    <script type="text/javascript">



        function bindDateTime() {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        }

        function showdattime() {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        }


        function closeModal() {
            $('#photoModalLong').modal('hide');
            $('.modal-backdrop').remove();
            //alert('test');
        }


        $(function () {
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY'
            });
        });

        //function closeModal() {
        //    $('#exampleModalLong').modal('hide');
        //    $('.modal-backdrop').remove();
        //}
        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
            $('body').removeClass('modal-open');

            //alert('test');
        }

        function removeinstrumentfromList() {
            PageMethods.test("test");
        }

        function OnSuccess(result) {
            //if (result) {
            //    alert(result);
            //}
        }
        function OnFailure(error) {

        }

        function removeinstrumentfromList2() {

            $.ajax({
                type: "POST",
                url: "ArtistPageView.aspx/test('test')", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                data: {},//data
                dataType: "json",
                success: function (data) {

                    alert(data.d);

                },
                error: function (result) {

                    alert("error")

                }
            });
        }

    </script>

    <style>
        G {
        }

        .mys
        /* idth: 60px
               -ms-word break: brea
                  word-break  brea
                  word-br ak: b
                      -w bkit-
            
           n

                ms-hyphens:  auto;
         hens: auto;
         .mystyle nput[type=
                     /* idth: 60px
               -ms-word break: brea
                  word-break  brea
                  word-br ak: b
                      -w bkit-
            
           n

                  -ms-hyhens:  auto;
    : auto;
                   .Grid iewEd
            pe=text  {
             play: bl ck;
     100%;
       px;
           padding:
                     font-
                       line height:
            
            colo : #55555
              verti al-lign: middle;
            ackground-colo :  #f
                  border: 1px s lid #cccc
            
          orer-radi
                    -we kit-bxshaow: inset  0 1p 1x rgba(
            );
            box shadow: inse 0 1px 1px gba(0, 0, 0, 0.07);
           -w
            on: border- olor ease-inout 0.15s, ox-shaow ease-inout 0.15s;
          s

        r-co ease-i -
            -shad
        ; .shadowed anel border: 1px solid tr bor x; borer-olo: #ddddd ding: 1em; b hadow: 2px 2px 2px 2px #f5f
    </style>

    <style>
        /*inContent iewpagr {
            id h: 100%;
            .itvie d n 1 ma -w d tat;
        }

        hadowe oxsa w: 0 1 0, 0, 0.05; r-colo: s {
            r i o px 2px f5f 5 s l b rd b rerwidt bo d .intrum ntlaye;
        }

        trip - ol : l pa i
              }

        s {              ;
            bo der-r bo 1em;
            x 2px 2 x px ndforart stinst;

        {
            backg r C;
            color: #000000;
            margin: 1px;
            padding: 0.5em;
            border-radius: 0.7em;
        }*/
    </style>

</asp:Content>

