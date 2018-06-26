<%@ Page Title="Instrument" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstrumentView.aspx.cs" Inherits="web.InstrumentView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <h3>Instrument data</h3>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="row shadowedPanel">
                    <div class="col-md-12">
                        <div class="col-md-12">
                            <div class="row pull-rght">
                                <%--<div class="col-md-4">
                                    <div class="col-md-4">EnglishName:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_engname" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>--%>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4" style="padding: 0;">English Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_engname" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4" style="padding: 0;">Korean Name:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_korean_name" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Alias:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_alias" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Player:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_player" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Group:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_group" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Explanation:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_explanation" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Sound Clip Location:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_soundcliplocation" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Video Clip Location:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_videocliplocation" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Photo Location:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_photolocation" runat="server"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4">Remarks:</div>
                                    <div class="col-md-6">
                                        <asp:TextBox ID="txt_inst_remarks" runat="server"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                            </div>

                            <div class="row col-md-12">
                                <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary pull-right" runat="server" Text="Register" OnClick="btn_instadd_Click" />
                            </div>
                        </div>
                        <%--<div class="col-md-6">
                            <asp:GridView ID="GridView2" CssClass="table-striped" runat="server" Width="745px">
                            </asp:GridView>
                        </div>--%>
                    </div>

                </div>
                <div class="row listviewwithedit">
                    <hr />

                    <div class="row " style="margin: 5px;">
                        <%--<span class="glyphicon glyphicon-search pull-right" style="padding: 5px;"></span>--%>
                        <span class='input-group-addon' style="    background: #DFF0D8;">
                            <i class='glyphicon glyphicon-search pull-right' style="padding: 5px;"></i>
                            <asp:TextBox CssClass="pull-right" ID="TextBox1_serachinstrument" runat="server" OnTextChanged="TextBox1_serachinstrument_TextChanged" AutoPostBack="True"></asp:TextBox>
                            <asp:Label runat="server" CssClass="pull-right" Style="padding: 5px;">Name:</asp:Label>
                        </span>

                    </div>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1_Instrumentlist" InsertItemPosition="FirstItem">
                        <AlternatingItemTemplate>
                            <tr style="background-color: #eeeeee;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"> </asp:Button>
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" ></asp:Button>
                                </td>
                                <td>
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AliasLabel" runat="server" Text='<%# Eval("Alias") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PlayerLabel" runat="server" Text='<%# Eval("Player") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ExplanationLabel" runat="server" title='<%# Eval("Explanation")%>' Text='<%# Eval("Explanation").ToString().Take(20).Aggregate("", (x,y) => x + y)  %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoundClipLocationLabel" runat="server" Text='<%# Eval("SoundClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="VideoClipLocationLabel" runat="server" Text='<%# Eval("VideoClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PhotoLocationLabel" runat="server" Text='<%# Eval("PhotoLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Eval("Remarks") %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="/*background-color: #008A8C; */color: #FFFFFF;">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="AliasTextBox" runat="server" Text='<%# Bind("Alias") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PlayerTextBox" runat="server" Text='<%# Bind("Player") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ExplanationTextBox" runat="server" Text='<%# Bind("Explanation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoundClipLocationTextBox" runat="server" Text='<%# Bind("SoundClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="VideoClipLocationTextBox" runat="server" Text='<%# Bind("VideoClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PhotoLocationTextBox" runat="server" Text='<%# Bind("PhotoLocation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px;">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="EnglishNameTextBox" runat="server" Text='<%# Bind("EnglishName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="KoreanNameTextBox" runat="server" Text='<%# Bind("KoreanName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="AliasTextBox" runat="server" Text='<%# Bind("Alias") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PlayerTextBox" runat="server" Text='<%# Bind("Player") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="GroupTextBox" runat="server" Text='<%# Bind("Group") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="ExplanationTextBox" runat="server" Text='<%# Bind("Explanation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoundClipLocationTextBox" runat="server" Text='<%# Bind("SoundClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="VideoClipLocationTextBox" runat="server" Text='<%# Bind("VideoClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="PhotoLocationTextBox" runat="server" Text='<%# Bind("PhotoLocation") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="/*background-color: #DCDCDC; */color: #000000;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AliasLabel" runat="server" Text='<%# Eval("Alias") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PlayerLabel" runat="server" Text='<%# Eval("Player") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ExplanationLabel" runat="server" title='<%# Eval("Explanation")%>' Text='<%# Eval("Explanation").ToString().Take(20).Aggregate("", (x,y) => x + y)  %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoundClipLocationLabel" runat="server" Text='<%# Eval("SoundClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="VideoClipLocationLabel" runat="server" Text='<%# Eval("VideoClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PhotoLocationLabel" runat="server" Text='<%# Eval("PhotoLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Eval("Remarks") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF; border-collapse: collapse; border-color: #999999; border-style: none; border-width: 1px; font-family: Verdana, Arial, Helvetica, sans-serif;">
                                            <tr runat="server" style="/*background-color: #DCDCDC; */color: #000000;">
                                                <th runat="server"></th>
                                                <th runat="server">ID</th>
                                                <th runat="server">EnglishName</th>
                                                <th runat="server">KoreanName</th>
                                                <th runat="server">Alias</th>
                                                <th runat="server">Player</th>
                                                <th runat="server">Group</th>
                                                <th runat="server">Explanation</th>
                                                <th runat="server">SoundClipLocation</th>
                                                <th runat="server">VideoClipLocation</th>
                                                <th runat="server">PhotoLocation</th>
                                                <th runat="server">Remarks</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="text-align: center; background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif; color: #000000;">
                                        <asp:DataPager ID="DataPager1" runat="server">
                                            <Fields>
                                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="/*background-color: #008A8C; */font-weight: bold; color: #FFFFFF;">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="EnglishNameLabel" runat="server" Text='<%# Eval("EnglishName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="KoreanNameLabel" runat="server" Text='<%# Eval("KoreanName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="AliasLabel" runat="server" Text='<%# Eval("Alias") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PlayerLabel" runat="server" Text='<%# Eval("Player") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="GroupLabel" runat="server" Text='<%# Eval("Group") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ExplanationLabel" runat="server" Text='<%# Eval("Explanation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoundClipLocationLabel" runat="server" Text='<%# Eval("SoundClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="VideoClipLocationLabel" runat="server" Text='<%# Eval("VideoClipLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="PhotoLocationLabel" runat="server" Text='<%# Eval("PhotoLocation") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="RemarksLabel" runat="server" Text='<%# Eval("Remarks") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
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
                </div>
            </ContentTemplate>
            <%--<Triggers>
                <asp:PostBackTrigger ControlID="TextBox1_serachinstrument" />
            </Triggers>--%>
        </asp:UpdatePanel>


    </div>

    <script type="text/javascript">
        function myfunc(n) {
            return false;
        }
    </script>

    <style>
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
            border:none;
        }

        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>
</asp:Content>
