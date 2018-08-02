<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistPageView.aspx.cs" Inherits="web.ArtistPageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h3>Artist data</h3>

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="row shadowedPanel">
                    <div class="col-md-12">
                        <div class="col-md-12">

                            <div class=" row col-md-12 form-group">

                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">First Name:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_firstname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Family Name:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_familyname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Middle Name:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_middlename" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Birth date:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_birthdate" runat="server" class="form-control" ToolTip="dd/mm/yyyy"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>

                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Address:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_address" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Zip Code:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_zipcode" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Tel. No:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_teleno" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Mobile No:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_mobileno" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Fax No:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_aritist_faxno" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Remarks:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_artist_remark" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>

                                <%--=====================================================================================================================================================================================--%>


                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Kakao Talk ID:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="ukakao" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Facebook Addr.:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="ufacebookadd" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Twitter Addr.:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="utwitter" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Photo 1:</div>
                                    <div class="col-md-8">
                                        <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                                            class="form-control" />
                                        <%--<asp:TextBox ID="uphoto1" runat="server" class="form-control"></asp:TextBox>--%>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Photo 2:</div>
                                    <div class="col-md-8">
                                        <asp:FileUpload ID="FileUpload2" runat="server" Style="display: inline; display: inline; padding-left: 0; padding-right: 0; border: none; box-shadow: none;"
                                            class="form-control" />
                                        <%--<asp:TextBox ID="uphoto2" runat="server" class="form-control"></asp:TextBox>--%>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-6">
                                    <br />
                                    <div class="col-md-3">Profile Page.:</div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="uprofilepage" runat="server" class="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-6">
                                    <br />
                                    <div class="col-md-3">Repertory.:</div>
                                    <div class="col-md-9">
                                        <asp:TextBox ID="urepertory" runat="server" class="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>

                                <%--===========================================================================================================================================================--%>
                            </div>
                            <div class="row">
                                <hr />
                                <div class="col-md-6">
                                    <div class="col-md-4">
                                        <asp:Label runat="server"><strong>Endorser:</strong></asp:Label>
                                    </div>
                                    <div class="col-md-4">

                                        <asp:DropDownList class="form-control" ID="DropDownList1_endorserlist" runat="server" DataSourceID="SqlDataSource1_endorserList" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1_endorserList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [Name], [Email],  [ID] FROM Main.[Endorser]"></asp:SqlDataSource>

                                    </div>
                                    <div class="col-md-4">
                                        <asp:Button ID="Button5" CssClass="btn btn-sm btn-warning" Style="margin-left: 3px !important;" runat="server" Text="Add" OnClick="btn_add_endorser_tolist" />
                                        <asp:Button ID="Button1" CssClass="btn btn-sm btn-success" Style="margin-left: 3px !important;" runat="server" Text="New" data-toggle="modal" data-target="#exampleModalLong" />
                                    </div>

                                </div>

                                <div class="row col-md-12 pull-right">
                                    <asp:Repeater runat="server" ID="myendorsmentlist">
                                        <ItemTemplate>
                                            <tr style="margin-bottom: 3px;">
                                                <asp:Button runat="server" AutoPostBack="True" CommandArgument='<%#Eval("ID")%>' Text="Delete" OnClick="btn_remove_endorser_tolist"></asp:Button>
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
                                <label><strong>What kind Of Artist Are you?</strong></label>
                                <div class="col-md-12 form-group">
                                    <br />
                                    <asp:CheckBox runat="server" ID="chk_Composer" Text="Composer" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                    <asp:CheckBox runat="server" ID="chk_Conductor" Text="Conductor" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                    <asp:CheckBox runat="server" ID="chk_tp" Text="Teacher/Professor" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                    <asp:CheckBox runat="server" ID="chk_Student" Text="Student" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                    <asp:CheckBox runat="server" ID="chk_player" Text="Player" Style="padding: 5px;" OnCheckedChanged="chk_boxChanged" AutoPostBack="true" />
                                </div>
                            </div>

                            <hr />

                            <div class="row col-md-12">
                                <div class="row">
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4">
                                            <asp:Label runat="server"><strong>Instrument</strong></asp:Label>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:DropDownList class="form-control" runat="server" ID="DropDownList1_InstrumentInTheMain" AutoPostBack="True" DataSourceID="SqlDataSource3_instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <asp:Button ID="btn_add_Inst" CssClass="btn btn-sm btn-info" runat="server" Text="Add" OnClick="btn_add_Inst_Click" />
                                        </div>

                                    </div>
                                </div>
                                <br />
                                <div class="row col-md-12 pull-right">
                                    <asp:Repeater runat="server" ID="myinstrepeater">
                                        <ItemTemplate>
                                            <tr style="margin-bottom: 3px;">
                                                <asp:Button runat="server" AutoPostBack="True" CommandArgument='<%#Eval("ID")%>' OnClick="removeinstrumentfrommyMainList" Text="Delete"></asp:Button>
                                                <td>
                                                    <asp:Label runat="server" ID="Label1" Text='<%# Eval("EnglishName") %>' />
                                                </td>
                                            </tr>
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="row col-md-12">
                                <asp:Button ID="btn_artist_add" CssClass="btn btn-primary pull-right" runat="server" Text="Register" OnClick="btn_artistadd_Click" />
                            </div>

                        </div>
                    </div>

                </div>
                <hr />
                <div class="row ">
                    <div class="row form-group" style="margin: 5px;" >
                        <span class='input-group-addon' >
                            <asp:Label runat="server"  Style="padding: 5px;">Name:</asp:Label>
                            <asp:TextBox  ID="TextBox1_serach" class="form-control" runat="server" style="display: inline;" AutoPostBack="True" OnTextChanged="serachTextValueChanged"></asp:TextBox>
                            <i class='glyphicon glyphicon-search'   style="padding: 5px;"></i>
                        </span>

                    </div>
                </div>

                <div class="row">
                    <div class="row listviewwithedit">
                        <div class="col-md-12">
                            <div class="col-md-12">
                            </div>
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
FacebookAddress=@FacebookAddress 

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
                                    <asp:Parameter Name="ID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>

                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowSorting="True" DataKeyNames="ID">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                            ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                            EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                            SelectImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-arrow-right-icon.png"
                            CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                            UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png"
                            HeaderStyle-Width="90px" ItemStyle-Width="90px" >
                                     <ControlStyle Height="20px" Width="20px" />
                                     <HeaderStyle Width="90px" />
                                     <ItemStyle Width="90px" Wrap="False" />
                                     </asp:CommandField>
                                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                                    <asp:BoundField DataField="FamilyName" HeaderText="FamilyName" SortExpression="FamilyName" />
                                    <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
                                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                                    <asp:BoundField DataField="TelNO" HeaderText="TelNO" SortExpression="TelNO" />
                                    <asp:BoundField DataField="MobileNO" HeaderText="MobileNO" SortExpression="MobileNO" />
                                    <asp:BoundField DataField="FaxNo" HeaderText="FaxNo" SortExpression="FaxNo" />
                                    <asp:BoundField DataField="Remar" HeaderText="Remar" SortExpression="Remar" />
                                    <asp:BoundField DataField="FacebookAddress" HeaderText="FacebookAddress" SortExpression="FacebookAddress" />
                                    <asp:BoundField DataField="TwitterAddress" HeaderText="TwitterAddress" SortExpression="TwitterAddress" />
                                    <asp:BoundField DataField="KakaoTalkAddress" HeaderText="KakaoTalkAddress" SortExpression="KakaoTalkAddress" />
                                    <asp:BoundField DataField="Photo1" HeaderText="Photo1" SortExpression="Photo1" />
                                    <asp:BoundField DataField="Photo2" HeaderText="Photo2" SortExpression="Photo2" />
                                    <asp:BoundField DataField="ProfilePage" HeaderText="ProfilePage" SortExpression="ProfilePage" />
                                    <asp:BoundField DataField="Repertory" HeaderText="Repertory" SortExpression="Repertory" />
                                </Columns>
                                <EditRowStyle BackColor="#e2e2e2" CssClass="GridViewEditRow" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>

                        </div>
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
                <asp:PostBackTrigger ControlID="btn_artist_add" />
            </Triggers>

        </asp:UpdatePanel>

    </div>


    <script type="text/javascript">
        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
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
        
         .GridViewEditRow {
            width: 200px;
        }

            .GridViewEditRow input[type=text] {
                display: block;
                width: 100%;
                height: 34px;
                padding: 6px 12px;
                font-size: 14px;
                line-height: 1.428571429;
                color: #555555;
                vertical-align: middle;
                background-color: #ffffff;
                border: 1px solid #cccccc;
                border-radius: 4px;
                -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
                -webkit-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
                transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            }
                
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>

    <style>
      
    #MainContent L iewpager {
        width: 100%;
    }

    .istvie d input {
        1 max-w d tant;
    }

    hadowedbox pdding: 0 box-shad w: 0 1 0, 0, 0.05); r-color: #ddd dd; .shad wedbox2 {
        argin-to: 1e dow: 2px 2px 2px 2px #f5ff5 b solid;
        b rd r b rder-width bo der- h paddin :;
    }

    .intrumentplaye i {
    }

    striped td, t, th {
        rder-col r: l pa din: 2x;
    }

    s {
        border: 1p ent;
        border-r bord ddd;
        1em;
        : 2px 2px 2px px #f5 .backgroundforartistinstul;

    {
        background-color: #DCDCDC;
        color: #000000;
        margin: 1px;
        padding: 0.5em;
        border-radius: 0.7em;
    }
</style>

</asp:Content>

