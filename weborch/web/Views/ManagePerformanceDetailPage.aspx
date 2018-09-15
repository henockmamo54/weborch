<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePerformanceDetailPage.aspx.cs" Inherits="web.Views.ManagePerformanceDetailPage" ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <br />

            <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
            <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>


            <div class="row" id="formanaging" runat="server">
                <div class="row">
                    <div class="row">
                        <h2 runat="server" id="performanceTitle" style="margin-top: 0px; padding-top: 0px;"></h2>
                    </div>

                    <div class="row">
                        <asp:Button runat="server" AutoPostBack="True" CssClass="btn btn-success pull-right" ID="showandhidebtnforthepanel" Text="+" OnClick="btn_ADD_ONClick_showAndHideTheDataEntryPanel" Style="margin-bottom: 10px;"></asp:Button>
                        <br />
                    </div>

                    <div class="row shadowedPanel" visible="false" runat="server" id="AddNewEntryPanel" style="background: white; padding: 10px; margin-bottom: 10px; box-shadow: 1px 1px 1px 1px #d0d0d0;">

                        <div class="row">
                            <div class="col-md-4" runat="server" visible="false">
                                <br />
                                <div class="col-md-4">Performance:</div>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="dropdown_performance" runat="server" DataSourceID="SqlDataSource1_performanceList" DataTextField="PerformanceTitle" DataValueField="ID" class="form-control" Enabled="false" AutoPostBack="True"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_performanceList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, PerformanceTitle FROM Main.Performance"></asp:SqlDataSource>
                                </div>
                                <br />

                            </div>

                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Music Title:</div>
                                <div class="col-md-8">
                                    <asp:TextBox ID="txt_performancetitle" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <br />
                            </div>


                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Orchestra:</div>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="DropDownList1_orchestra" runat="server" class="form-control" DataSourceID="SqlDataSource1_allOrchestra" DataTextField="OfficialName" DataValueField="ID"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1_allOrchestra" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT [OfficialName], [ID] FROM  core.[Orchestra]"></asp:SqlDataSource>

                                </div>
                                <br />
                            </div>


                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Conductor:</div>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3_conductor" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select (FirstName + ' '+ MiddleName + ' '+ FamilyName) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name='Conductor'
) a"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Composer</div>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="DropDownList4_composer" runat="server" DataSourceID="SqlDataSource5_composer" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5_composer" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
select ( isnull(FirstName,'') + ' '+ isnull(MiddleName,'') + ' '+ isnull(FamilyName,'') ) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name like '%Composer%'
) a
"></asp:SqlDataSource>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-4">
                                <br />
                                <div class="col-md-4">Time</div>
                                <div class="col-md-8">
                                    <%--<asp:TextBox ID="txt_time" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class='input-group date' id='datetimepicker3' style="display: inline-flex;">
                                        <input type='text' class="form-control" runat="server" id="txt_time" style="display: inline-block; border-right-width: 0px;" />
                                        <span class="input-group-addon" style="flex-wrap: wrap; width: auto; display: inline-block; padding-left: 12px; margin-left: -5px; padding-top: 9px; padding-bottom: 7px;">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                                <br />
                            </div>

                        </div>

                        <div class="row col-md-12">
                            <hr />
                            <div class="col-md-4">
                                Instrument:
                        <asp:DropDownList ID="DropDownList3_instrumentlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_Instrumentlist" DataTextField="EnglishName" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_Instrumentlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT EnglishName, ID FROM Core.Instrument"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-4">
                                Played by:
                        <asp:DropDownList ID="DropDownList2_artistlist" class="form-control" runat="server" DataSourceID="SqlDataSource1_artistlist" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_artistlist" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="SELECT ID, Name= FirstName
FROM Core.Artist"></asp:SqlDataSource>
                            </div>
                            <div class="col-md-3">
                                <br />
                                <asp:Button ID="Button1_addorchestraDetail" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btn_add_ArtistInstrument_tolist" />
                            </div>

                        </div>

                        <br />

                        <div class="row col-md-12">
                            <hr />
                            <asp:Repeater runat="server" ID="myPerformanceDetailArtistInstrumentlist">
                                <ItemTemplate>
                                    <tr style="margin-bottom: 3px;">

                                        <td>
                                            <asp:Button runat="server" AutoPostBack="True" CssClass="btn btn-warning" CommandArgument='<%#Eval("ArtistID")+","+ Eval("InstrumentID")%>' Text="Delete" OnClick="btn_remove_ArtistInstrument_tolist"></asp:Button>
                                        </td>

                                        <td>
                                            <asp:Label runat="server" ID="Label1" Text='<%# Eval("Artist.FirstName") %>' />
                                            - 
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="Label2" Text='<%# Eval("Instrument.EnglishName") %>' />
                                        </td>

                                    </tr>
                                    <br />
                                    <br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div class="row col-md-12">
                            <asp:Button ID="btn_cancel" CssClass="btn btn-danger pull-right" Style="margin-right: 5px;" runat="server" Text="Cancel" OnClick="cancelDetailClicked" />
                            <asp:Button ID="btn_update" CssClass="btn btn-success pull-right" Style="margin-right: 5px;" runat="server" Text="Save" OnClick="saveDetailClicked" />
                            <asp:Button ID="btn_register" CssClass="btn btn-primary pull-right" Style="margin-right: 5px;" runat="server" Text="Register" OnClick="addDetailClicked" />
                        </div>

                    </div>

                    <div class="row">
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1_performanceDetailList"
                            Width="100%"
                            ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" ShowDeleteButton="True" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                                    SelectImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png" ShowSelectButton="True" HeaderStyle-Width="60px" />
                                <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                <%--<asp:BoundField DataField="PerformanceTitle" HeaderText="PerformanceTitle" SortExpression="PerformanceTitle" />--%>
                                <asp:BoundField DataField="Title" HeaderText="Music Title" SortExpression="Title" />
                                <asp:BoundField DataField="Conductor" HeaderText="Conductor" ReadOnly="True" SortExpression="Conductor" />
                                <asp:BoundField DataField="Composer" HeaderText="Composer" ReadOnly="True" SortExpression="Composer" />
                                <asp:BoundField DataField="Artists" HeaderText="Artists" ReadOnly="True" SortExpression="Artists" />
                                <asp:BoundField DataField="Instruments" HeaderText="Instruments" ReadOnly="True" SortExpression="Instruments" />
                                <asp:BoundField DataField="Time" HeaderText="Time" SortExpression="Time" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
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


                <div class="row">
                    <asp:SqlDataSource ID="SqlDataSource1_performanceDetailList" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="
delete  
Main.PerformanceDetail 
where ID= @ID"
                        SelectCommand="
select pd.ID, p.PerformanceTitle,pd.Title,
(c.FirstName + ' '+ c.MiddleName + ' '+ c.FamilyName) as Conductor,
(co.FirstName + ' '+ co.MiddleName + ' '+ co.FamilyName) as Composer,
list.Artists,list.Instruments,
pd.Time from Main.PerformanceDetail pd
join Core.Orchestra o on pd.Orchestra=o.ID
join Main.Performance p on p.ID=pd.PerformanceID
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Conductor%') c on c.ID= pd.Conductor
join  (select a.* from Core.Artist a 
		join Drived.Artist_ArtistType at on a.ID= at.Artist
		join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
		where al.Name like '%Composer%') co on co.ID= pd.Composer
join(
		SELECT
			 PerformanceDetailID,
			 STUFF(
				 (SELECT ',' + Name
				  FROM (
		select distinct pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		 from Drived.PerformanceDetail_Instrument_Artist pia 
		join Core.Artist a on a.ID = pia.ArtistID
		join Core.Instrument i on i.ID = pia.InstrumentID
		) x
		where x.PerformanceDetailID= a.PerformanceDetailID
				  FOR XML PATH (''))
				  , 1, 1, '')  AS Artists,

			 STUFF(
				 (SELECT ','+ instrument
				  FROM (
		select distinct  pia.PerformanceDetailID, i.EnglishName as instrument,a.FirstName + ' '+ a.MiddleName + ' '+ a.FamilyName as Name
		 from Drived.PerformanceDetail_Instrument_Artist pia 
		join Core.Artist a on a.ID = pia.ArtistID
		join Core.Instrument i on i.ID = pia.InstrumentID
		) x
		where x.PerformanceDetailID= a.PerformanceDetailID
				  FOR XML PATH (''))
				  , 1, 1, '')  AS Instruments

		FROM Drived.PerformanceDetail_Instrument_Artist AS a
		GROUP BY PerformanceDetailID

) list on pd.ID = list.PerformanceDetailID
 ">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <FilterParameters>
                            <asp:ControlParameter ControlID="dropdown_performance" DefaultValue="-1" Name="performanceID" PropertyName="SelectedValue" />
                        </FilterParameters>
                    </asp:SqlDataSource>
                </div>

            </div>


            <br />


        </ContentTemplate>
    </asp:UpdatePanel>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            /*padding: 1em;*/
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }

        .shadowedPanel2 {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            box-shadow: 2px 2px 2px 2px #d0d0d0;
        }

        .social-like,
        .social-dislike {
            margin-bottom: 1em;
            border: none;
            outline: none;
            font-size: 16px;
            width: 45%;
            /*background-color: #8dbd64;*/
            /*background-color: #e0e0e0;*/
            color: #fff;
            display: inline-table;
        }

        /*.social-like :hover,
        .social-dislike :hover {
            background-color: #8dbd64;
        }*/
        .social-like {
            border-top-left-radius: 5px;
            text-align: right;
        }

        .social-dislike {
            border-top-right-radius: 5px;
            text-align: left;
        }

        .count,
        .like,
        .dislike {
            /*padding: 10px;*/
        }

        .count,
        .dislike {
            /*background-color: #5da25e;*/
            /*border-radius: 40%;*/
            font-size: 14px;
            color: black;
        }
    </style>

    <script type="text/javascript">
        $(function () {
            $('#datetimepicker3').datetimepicker({
                format: "HH:mm A"
            });
        });

        function showdattime() {
            $('#datetimepicker3').datetimepicker({
                format: "HH:mm A"
            });
        }

        function showReply(n) {
            console.log(n);

            // check for user login
            $.ajax({
                type: "POST",
                url: "PerformanceDetailPage.aspx/checkLoginStatus", //Pagename/Functionname
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ n: 1 }), //{ },//data
                success: function (data) {
                    //alert('success')
                    //console.log(data);
                    //alert(data.d);

                    //if log in show the reply message 
                    if (data.d) {

                        $("#divReply" + n).show();
                        return false;
                        return false;
                    }

                    else {
                        alert('Please sign in to write comments!!!');
                    }

                },
                error: function (result) {
                    console.log(result)
                    //alert("error")

                }
            });



        }
        function closeReply(n) {
            $("#divReply" + n).hide();
            return false;
        }

    </script>

</asp:Content>
