<%@ Page Title="Instrument" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InstrumentView.aspx.cs" Inherits="web.InstrumentView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <div id="forAudinence" runat="server" visible="true">
                       <h3 style="display:inline-block;"><%= Resources.HomeView.aspx.Instrumentdata %></h3>
                    
                    <div class="row col-md-12" style="margin-bottom: 1rem;padding:0px;  ">
                        <div class="col-md-3 pull-right" style="padding:0;">
                            <h5 style="display: inline-block;">Name: </h5>
                            <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="width: 82%; display: inline-block; " OnTextChanged="filterArtistDataByName"></asp:TextBox>
                        </div>
                        <div class="col-md-3 pull-right">
                            <asp:LinkButton CssClass="btn btn-success pull-right" runat="server" ID="btn_InstrumentViewButton" Text="Add / Manage Artist" Visible="false" PostBackUrl="~/Views/ManageInstrumentView.aspx" />                        
                        </div>
                    </div>

                    <asp:Repeater runat="server" ID="instrumentrepeater">

                        <ItemTemplate>
                            <div class="col-lg-3 col-sm-3 text-center" style="margin-bottom:1rem;padding-left: 5px; padding-right: 5px;">
                                <div class="instrumentcontainer">
                                <img height="200" class="rounded-circle img-fluid d-block mx-auto" src="../Document/<%#Eval("PhotoLocation") %>"" alt="" >
                                <h3 style="margin-top:5px;"><%#Eval("EnglishName")%></h3>
                                <p><%# Eval("Explanation").ToString().Length<40? "<br/><br/>":Eval("Explanation").ToString().Length>49?Eval("Explanation").ToString().Substring(0,49):Eval("Explanation").ToString() %></p>

                                </div>
                            </div>
                        </ItemTemplate>

                    </asp:Repeater>

                    
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
                                FilterExpression="">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" />
                                </DeleteParameters>
                                <FilterParameters>
                                    
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


                </div>

            </ContentTemplate>
            <Triggers>
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
        .instrumentcontainer {
            background: white;
            margin: 1px;
            padding: 1px;
            border-radius: 5px;
        }
    </style>
</asp:Content>
