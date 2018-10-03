﻿<%@ Page Title="Orchestra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageOrchestraView.aspx.cs" Inherits="web.ManageOrchestraView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="formanaging" runat="server" visible="true">

                    <h3><%= Resources.HomeView.aspx.ConcertTeamData %></h3>

                    <div class="row shadowedPanel" style="background-color: white; box-shadow: 1px 1px 1px 1px #d0d0d0; border-radius: 5px;">
                        <div class="col-md-12 ">
                            <div class="col-md-12  form-group">
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Name %>*</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Alias %></div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchaliasname" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.URL %></div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchurl" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Address %>*</div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchaddress" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.ZipCode %></div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchzipcode" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.TelNO %></div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchtelno" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.FaxNo %></div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchfaxno" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                </div>
                                <div class="col-md-4">
                                    <br />
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Conductor %></div>
                                    <div class="col-md-8">
                                        <%--<asp:TextBox ID="txt_orchcondactername" runat="server" class="form-control"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3_conductor" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select (FirstName ) as Name, ID
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
                                    <div class="col-md-4"><%= Resources.HomeView.aspx.Since %></div>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txt_orchsince" runat="server" OnClick="dummybtnclick" class="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                            </div>
                            <br />
                            <hr />
                            <div class="col-md-12" >
                                <div class="col-md-12">
                                    <asp:Button ID="btn_cancelorch" Style="margin:1em; margin-right: 0.3em; "  CssClass="btn btn-danger pull-right" runat="server" Text="Cancel" OnClick="btn_cancelorch_Click" />
                                    <asp:Button ID="btn_orchadd" Style="margin:1em; margin-right: 0.3em; " CssClass="btn btn-primary pull-right"  runat="server" Text="<%$Resources:HomeView.aspx,Register %>" OnClick="btn_orchadd_Click" />
                                    <asp:Button ID="btn_updateorch" Style="margin:1em; margin-right: 0.3em; " CssClass="btn btn-success pull-right" Visible="false" runat="server" Text="Update" OnClick="btn_updateorch_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="row">

                        <div class="row">
                            <div class="col-md-12 form-group" style="margin-bottom: 0px;">
                                <span class='input-group-addon'>
                                    <asp:Label runat="server" Style="padding: 5px;"><%= Resources.HomeView.aspx.Name %>:</asp:Label>
                                    <asp:TextBox ID="TextBox1_serach" class="form-control" Style="display: inline;" runat="server" AutoPostBack="True" OnTextChanged="serachTextValueChanged"></asp:TextBox>
                                    <i class='glyphicon glyphicon-search' style="padding: 5px;"></i>
                                </span>

                            </div>

                            <div class="col-md-12">
                                <asp:SqlDataSource ID="SqlDataSource1_allOrchestraInfo" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" DeleteCommand="delete from Core.Orchestra
where ID=@ID"
                                    InsertCommand="insert into Core.Orchestra
(OfficialName, Alias, URL, Address, ZipCode, TelNO, FaxNo, ConductorName, Since)
values (@OfficialName, @Alias, @URL, @Address, @ZipCode, @TelNO, @FaxNo, @ConductorName, @Since)"
                                    SelectCommand="SELECT o.ID, OfficialName, Alias, URL, o.Address, o.ZipCode, o.TelNO,o.FaxNo, ConductorID, Since,  ConductorName= FirstName + ' '+ MiddleName+ ' ' + FamilyName
FROM Core.Orchestra o
left join core.artist a on o.ConductorID = a. ID"
                                    UpdateCommand="Update Core.Orchestra
set
OfficialName=@OfficialName, 
Alias=@Alias, 
URL=@URL, 
Address=@Address, 
ZipCode=@ZipCode, 
TelNO=@TelNO, 
FaxNo=@FaxNo, 
ConductorID=@ConductorID, 
Since=@Since  
where 
ID=@ID"
                                    FilterExpression="( '{0}'='') or (OfficialName like '%{0}%')">
                                    <DeleteParameters>
                                        <asp:Parameter Name="ID" />
                                    </DeleteParameters>
                                    <FilterParameters>
                                        <asp:ControlParameter ControlID="TextBox1_serach" Name="name" PropertyName="Text" />
                                    </FilterParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="OfficialName" />
                                        <asp:Parameter Name="Alias" />
                                        <asp:Parameter Name="URL" />
                                        <asp:Parameter Name="Address" />
                                        <asp:Parameter Name="ZipCode" />
                                        <asp:Parameter Name="TelNO" />
                                        <asp:Parameter Name="FaxNo" />
                                        <asp:Parameter Name="ConductorName" />
                                        <asp:Parameter Name="Since" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="OfficialName" />
                                        <asp:Parameter Name="Alias" />
                                        <asp:Parameter Name="URL" />
                                        <asp:Parameter Name="Address" />
                                        <asp:Parameter Name="ZipCode" />
                                        <asp:Parameter Name="TelNO" />
                                        <asp:Parameter Name="FaxNo" />
                                        <asp:Parameter Name="ConductorID" />
                                        <asp:Parameter Name="Since" />
                                        <asp:Parameter Name="ID" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <asp:GridView ID="GridView1" runat="server" Width="100%" AllowPaging="True" AllowSorting="True" CellPadding="4" DataSourceID="SqlDataSource1_allOrchestraInfo" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    <Columns>
                                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="false" ShowCancelButton="true" ShowSelectButton="true"
                                            ButtonType="Image" ControlStyle-Height="20px" ControlStyle-Width="20px" DeleteImageUrl="http://icons.iconarchive.com/icons/everaldo/kids-icons/128/edit-delete-icon.png"
                                            EditImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                            SelectImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-9/128/edit-validated-icon.png"
                                            CancelImageUrl="http://icons.iconarchive.com/icons/oxygen-icons.org/oxygen/128/Actions-edit-delete-icon.png"
                                            UpdateImageUrl="http://icons.iconarchive.com/icons/custom-icon-design/pretty-office-7/128/Save-icon.png">
                                            <ControlStyle Height="20px" Width="20px" />
                                            <ItemStyle Wrap="False" />
                                        </asp:CommandField>
                                        <asp:BoundField DataField="ID" HeaderText="<%$Resources:HomeView.aspx,ID %>" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                        <asp:BoundField DataField="OfficialName" HeaderText="<%$Resources:HomeView.aspx,Name %>" SortExpression="OfficialName" />
                                        <asp:BoundField DataField="Alias" HeaderText="<%$Resources:HomeView.aspx,Alias %>" SortExpression="Alias" />
                                        <asp:BoundField DataField="URL" HeaderText="<%$Resources:HomeView.aspx,URL %>" SortExpression="URL" />
                                        <asp:BoundField DataField="Address" HeaderText="<%$Resources:HomeView.aspx,Address %>" SortExpression="Address" />
                                        <asp:BoundField DataField="ZipCode" HeaderText="<%$Resources:HomeView.aspx,ZipCode %>" SortExpression="ZipCode" />
                                        <asp:BoundField DataField="TelNO" HeaderText="<%$Resources:HomeView.aspx,TelNO %>" SortExpression="TelNO" />
                                        <asp:BoundField DataField="FaxNo" HeaderText="<%$Resources:HomeView.aspx,FaxNo %>" SortExpression="FaxNo" />
                                        <asp:TemplateField HeaderText="<%$Resources:HomeView.aspx,Conductor %>" SortExpression="ConductorName">
                                            <EditItemTemplate>
                                                <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ConductorName") %>'></asp:TextBox>--%>
                                                <asp:DropDownList ID="DropDownList2_conductor" runat="server" DataSourceID="SqlDataSource3_conductor" DataTextField="Name" DataValueField="ID" class="form-control" SelectedValue='<%#Bind("ConductorID")%>'></asp:DropDownList>
                                                <asp:SqlDataSource ID="SqlDataSource3_conductor" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select (FirstName + ' '+ MiddleName + ' '+ FamilyName) as Name, ID
from(
select a.ID,a.FirstName,a.MiddleName,a.FamilyName from Core.Artist a 
join Drived.Artist_ArtistType at on a.ID= at.Artist
join Lookup.ArtistType al  on at.ArtistTypeID = al.ID
where al.Name='Conductor'
) a"></asp:SqlDataSource>

                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ConductorName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Since" HeaderText="<%$Resources:HomeView.aspx,Since %>" SortExpression="Since" />
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

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>


    </div>


    <style>
        .orchContainer {
            background: white;
            margin: 5px;
            border-radius: 5px;
            padding: 5px;
            background-color: whie;
            bord 1 box-haow 1px 1px 1px 1px #dd 0 .listvieww :not(#list iewpa d-wrap: break-word;
            max w;
        }


        o ew1_listviewpager {
            00%;
        }

        stviewwith dit tr td input : 10px;*/ idth: 9e !impo
        }

        .sadoedbox {
            m;
            box-sh x 0, 0, 0.05;
            border-colo:;
        }


        .myl :not(#li tviewp rd-wrap: breakwor; : 0.2em;
        }

        striped d, t rder-color: li h p ddig: 2p;
        }

        hadowedPanel {
            r: 1px solid ranspare borde -rad bo dercolr: ddddd;
            a box s 2px 2px #f5f5f5;
        }

        dViewEditRow {
            /*wid h
              }

            nput[t pe=te
                 /* ispla
                      wdth: 
                 heigh : 34p
              padding: 6 x 12px;
   size: 4px;
  -height: 1.4285 1429;
            
            lor: #555555;
          n: midd e;
                         : #ffffff;
      px solid #cccccc;
            
                        order-rdis: 4px;
            
             bkit-box-sh dow: net  1p 1px rga(, , 0, 0.
                 box-shadow: in et 0 1px 1px rgba(0, 0, , 0.07);
               -wbkit-t
            color ease- n-out 0.15s, box-shadow ase-inout 0.15s;
               t
        d

         ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
            }
    </style>
</asp:Content>
