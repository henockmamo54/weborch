<%@ Page Title="Instrument" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstrumentView.aspx.cs" Inherits="web.InstrumentView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <h3>Instrument data</h3>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="row shadowedPanel">
                    <div class="col-md-12">
                        <div class="col-md-12">
                            <div class="row pull-rght form-group" id="instrumentinfoInput">

                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">English Name:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_engname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Korean Name:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_korean_name" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Alias:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_alias" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Player:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_player" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Group:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_group" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Explanation:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_explanation" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Sound Clip Location:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_soundcliplocation" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Video Clip Location:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_videocliplocation" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Photo Location:</div>
                                    <div class="col-md-8">
                                        <%--<asp:TextBox ID="txt_inst_photolocation" runat="server" class="form-control"></asp:TextBox>--%>
                                        <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline; margin-bottom: 1em;" />
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Remarks:</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_inst_remarks" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                            </div>

                            <div class="row col-md-12">
                                <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary pull-right" runat="server" Text="Register" OnClick="btn_instadd_Click" />
                            </div>
                        </div>

                    </div>

                </div>
                <hr />
                <div class="row listviewwithedit">

                    <div class="row form-group">
                        <span class='input-group-addon'>
                            <asp:Label runat="server" Style="padding: 5px;">Name:</asp:Label>
                            <asp:TextBox ID="TextBox1_serachinstrument" Style="display: inline;" class="form-control" runat="server" OnTextChanged="TextBox1_serachinstrument_TextChanged" AutoPostBack="True"></asp:TextBox>
                            <i class='glyphicon glyphicon-search' style="padding: 5px;"></i>
                        </span>

                        <asp:SqlDataSource ID="SqlDataSource1_Instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="delete Core.Instrument
where ID=@ID"
                            InsertCommand="insert into
Core.Instrument(
EnglishName, KoreanName, Alias, Player, [Group], Explanation, SoundClipLocation, VideoClipLocation, PhotoLocation, Remarks )

values
(@EnglishName, @KoreanName, @Alias, @Player, @Group, @Explanation, @SoundClipLocation, @VideoClipLocation, @PhotoLocation, @Remarks)"
                            SelectCommand="SELECT ID, EnglishName, KoreanName, Alias, Player, [Group], Explanation, SoundClipLocation, VideoClipLocation, PhotoLocation, Remarks FROM Core.Instrument
order by ID desc"
                            UpdateCommand="
Update Core.Instrument
set
EnglishName=@EnglishName, 
KoreanName=@KoreanName, 
Alias=@Alias, 
Player=@Player, 
[Group]=@Group, 
Explanation=@Explanation, 
SoundClipLocation=@SoundClipLocation, 
VideoClipLocation=@VideoClipLocation,
PhotoLocation=@PhotoLocation, 
Remarks =@Remarks 
where ID=@ID
"
                            FilterExpression="( '{0}'='') or (Englishname like '{0}')">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" />
                            </DeleteParameters>
                            <FilterParameters>
                                <asp:ControlParameter ControlID="TextBox1_serachinstrument" DefaultValue="" Name="englishname" PropertyName="Text" />
                            </FilterParameters>
                            <InsertParameters>
                                <asp:Parameter Name="EnglishName" />
                                <asp:Parameter Name="KoreanName" />
                                <asp:Parameter Name="Alias" />
                                <asp:Parameter Name="Player" />
                                <asp:Parameter Name="Group" />
                                <asp:Parameter Name="Explanation" />
                                <asp:Parameter Name="SoundClipLocation" />
                                <asp:Parameter Name="VideoClipLocation" />
                                <asp:Parameter Name="PhotoLocation" />
                                <asp:Parameter Name="Remarks" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="EnglishName" />
                                <asp:Parameter Name="KoreanName" />
                                <asp:Parameter Name="Alias" />
                                <asp:Parameter Name="Player" />
                                <asp:Parameter Name="Group" />
                                <asp:Parameter Name="Explanation" />
                                <asp:Parameter Name="SoundClipLocation" />
                                <asp:Parameter Name="VideoClipLocation" />
                                <asp:Parameter Name="PhotoLocation" />
                                <asp:Parameter Name="Remarks" />
                                <asp:Parameter Name="ID" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1_Instrumentlist" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnRowEditing="GridView1_RowEditing">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True"
                                    ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                                    EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                    SelectImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-arrow-right-icon.png"
                                    CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                                    UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png">
                                    <ControlStyle Height="20px" Width="20px" />
                                    <ItemStyle Wrap="False" />
                                </asp:CommandField>
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <asp:BoundField DataField="EnglishName" HeaderText="EnglishName" SortExpression="EnglishName" />
                                <asp:BoundField DataField="KoreanName" HeaderText="KoreanName" SortExpression="KoreanName" />
                                <asp:BoundField DataField="Alias" HeaderText="Alias" SortExpression="Alias" />
                                <asp:BoundField DataField="Player" HeaderText="Player" SortExpression="Player" />
                                <asp:BoundField DataField="Group" HeaderText="Group" SortExpression="Group" />
                                <asp:BoundField DataField="Explanation" HeaderText="Explanation" SortExpression="Explanation" />
                                <asp:BoundField DataField="SoundClipLocation" HeaderText="SoundClipLocation" SortExpression="SoundClipLocation" />
                                <asp:BoundField DataField="VideoClipLocation" HeaderText="VideoClipLocation" SortExpression="VideoClipLocation" />
                                <asp:TemplateField HeaderText="PhotoLocation" SortExpression="PhotoLocation">
                                    <EditItemTemplate>
                                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PhotoLocation") %>'></asp:TextBox>--%>
                                        <asp:Button ID="editButton" CssClass="btn btn-info" runat="server" Text='<%# Bind("PhotoLocation") %>' data-toggle="modal" data-target="#exampleModalLong" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PhotoLocation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
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

                <!-- Modal -->
                <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Photo</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="form-group" style="text-align: center;">
                                    <%--<label for="exampleFormControlInput1">Current Image</label>--%>
                                    <%--<asp:TextBox runat="server" type="text" class="form-control" ID="FormControlInput1_Name" placeholder="Name of the Endorser" />--%>
                                    <asp:Image runat="server" ID="modalImageContainer" Width="20em" Height="20em" />
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Change</label>
                                    <%--<asp:TextBox runat="server" class="form-control" ID="FormControlTextarea1_email" TextMode="Email" placeholder="Email Address of the Endorser" />--%>

                                    <asp:FileUpload ID="FileUpload2" runat="server" Style="display: inline" />
                                    <%--<asp:Button class="glyphicon glyphicon-refresh" runat="server" ID="refreshimagebtn" onclick="showimage"/>--%>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <asp:Button runat="server" type="button" class="btn btn-primary" Text="Save changes" OnClick="buttonChangeImage" ID="btnsaveimagechange" />
                                <%--<asp:Button runat="server" type="button" class="btn btn-primary" Text="Save changes" ID="btnAddReview" OnClick="btnAddEndorser_Click" />--%>
                            </div>
                        </div>
                    </div>
                </div>



            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="txt_addInstrument" />
                <asp:PostBackTrigger ControlID="btnsaveimagechange" />
            </Triggers>
        </asp:UpdatePanel>


    </div>

    <script type="text/javascript">
        function myfunc(n) {
            return false;
        }
        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
            //alert('test');
        }
    </script>

    <style>
        #instrumentinfoInput .col-md-12 {
            padding: 0 !important;
        }

        #instrumentinfoInput .col-md-4 {
            padding: 0 !important;
        }

        #instrumentinfoInput .col-md-6 {
            padding: 0 !important;
        }

        .listviewwithedit tr td :not(#listviewpager) {
            word-wrap: break-word;
            max-width: 13em;
        }

        #MainContent_ListView1_listviewpager {
            max-width: 100%;
        }

        .listviewwithedit tr td input {
            /*width: 10px;*/
            max-width: 9em !important;
        }

        .shadowedbox {
            padding: 0.5em;
            box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
            border-color: #dddddd;
        }

        .mylistview tr td :not(#listviewpager) {
            word-wrap: break-word;
            padding: 0.2em;
        }

        .table-striped td, tr, th {
            /*border-color: lightgray;
            padding: 2px;*/
            border: none;
        }

        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }


        .mystyle td {
            /*width: 60px;*/
            -ms-word-break: break-all;
            word-break: break-all;
            word-break: break-word;
            -webkit-hyphens: auto;
            -moz-hyphens: auto;
            -ms-hyphens: auto;
            hyphens: auto;
        }


        /*@media all and (-ms-high-contrast:none) {
            *::-ms-backdrop, textarea, div.WrapContainerDname {
                white-space: pre-wrap !important;
                color: #f00;
            }
        }*/

        .GridViewEditRow input[type=text] {
            /*display: block;*/
            /*width: 100%;*/
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
    </style>
</asp:Content>
