<%@ Page Title="Instrument" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageInstrumentView.aspx.cs" Inherits="web.ManageInstrumentView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <div id="formanaging" runat="server" >
                    <h3><%= Resources.HomeView.aspx.Instrumentdata %></h3>
                    <div class="row shadowedPanel" style="background-color: white;padding: 10px;box-shadow: 1px 1px 1px 1px #d0d0d0;border-radius:5px;">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <div class="row pull-rght form-group" id="instrumentinfoInput">

                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Name %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_engname" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.KoreanName %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_korean_name" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Alias %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_alias" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Player %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_player" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Group %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_group" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Explanation %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_explanation" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.SoundClipLocation %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_soundcliplocation" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.VideoClipLocation %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_videocliplocation" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.PhotoLocation %>:</div>
                                        <div class="col-md-8">
                                            <%--<asp:TextBox ID="txt_inst_photolocation" runat="server" class="form-control"></asp:TextBox>--%>
                                            <asp:FileUpload ID="FileUpload1" runat="server" Style="display: inline; margin-bottom: 1em;" />
                                        </div>
                                        <br />

                                    </div>
                                    <div class="col-md-4">
                                        <br />
                                        <div class="col-md-4"><%= Resources.HomeView.aspx.Remarks %>:</div>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txt_inst_remarks" runat="server" class="form-control"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                </div>

                                <div class="row col-md-12">
                                    <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary pull-right" runat="server" Text="<%$Resources:HomeView.aspx,Register %>" OnClick="btn_instadd_Click" />
                                </div>
                            </div>

                        </div>

                    </div>
                    <hr />
                    <div class="row listviewwithedit">

                        <span class='input-group-addon'>
                            <asp:Label runat="server" Style="padding: 5px;">Name:</asp:Label>
                            <asp:TextBox ID="TextBox1_serachinstrument" Style="display: inline;" class="form-control" runat="server" OnTextChanged="TextBox1_serachinstrument_TextChanged" AutoPostBack="True"></asp:TextBox>
                            <i class='glyphicon glyphicon-search' style="padding: 5px;"></i>
                        </span>
                        <div style="overflow-x: scroll;">

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
                                    <asp:Parameter Name="Remarks" />
                                    <asp:Parameter Name="ID" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:GridView ID="GridView1" Style="overflow-x: scroll; width: 2000px;" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1_Instrumentlist" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnRowEditing="GridView1_RowEditing">
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
                                    <asp:BoundField DataField="ID" HeaderText="<%$Resources:HomeView.aspx,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="EnglishName" HeaderText="<%$Resources:HomeView.aspx,Name %>" SortExpression="EnglishName" />
                                    <asp:BoundField DataField="KoreanName" HeaderText="<%$Resources:HomeView.aspx,KoreanName %>" SortExpression="KoreanName" />
                                    <asp:BoundField DataField="Alias" HeaderText="<%$Resources:HomeView.aspx,Alias %>" SortExpression="Alias" />
                                    <asp:BoundField DataField="Player" HeaderText="<%$Resources:HomeView.aspx,Player %>" SortExpression="Player" />
                                    <asp:BoundField DataField="Group" HeaderText="<%$Resources:HomeView.aspx,Group %>" SortExpression="Group" />
                                    <asp:BoundField DataField="Explanation" HeaderText="<%$Resources:HomeView.aspx,Explanation %>" SortExpression="Explanation" />
                                    <asp:BoundField DataField="SoundClipLocation" HeaderText="<%$Resources:HomeView.aspx,SoundClipLocation %>" SortExpression="SoundClipLocation" />
                                    <asp:BoundField DataField="VideoClipLocation" HeaderText="<%$Resources:HomeView.aspx,VideoClipLocation %>" SortExpression="VideoClipLocation" />
                                    <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,PhotoLocation %>" SortExpression="PhotoLocation">
                                        <EditItemTemplate>
                                            <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PhotoLocation") %>'></asp:TextBox>--%>
                                            <asp:Button ID="editButton" CssClass="btn btn-info" runat="server" Text='<%$Resources:HomeView.aspx,Change %>' data-toggle="modal" data-target="#exampleModalLong" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("PhotoLocation") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Remarks" HeaderText="<%$Resources:HomeView.aspx,Remarks %>" SortExpression="Remarks" />
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

                </div>


            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="txt_addInstrument" />
                <asp:PostBackTrigger ControlID="btnsaveimagechange" />
            </Triggers>
        </asp:UpdatePanel>


    </div>

    <script type="text/javascript">

        document.getElementById("instrumenttab").style.backgroundColor = "white";
        document.getElementById("instrumenttab").style.borderBottom = "none";

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
        .instrumentcontainer {
                background: white;
                margin: 1px;
                padding: 1px;
                border-radius: 5px;
        }
        
    </style>
</asp:Content>
