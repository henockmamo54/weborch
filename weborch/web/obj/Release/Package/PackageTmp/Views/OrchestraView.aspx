<%@ Page Title="Orchestra" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrchestraView.aspx.cs" Inherits="web.OrchestraView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="forAudience" runat="server">
                    <h3 style="display: inline-block;"><%= Resources.HomeView.aspx.Orchestradata %></h3>
                    <div class="row col-md-12" style="margin-bottom: 1rem; padding: 0px;">
                        <div class="col-md-3 pull-right" style="padding: 0;">
                            <h5 style="display: inline-block;">Name: </h5>
                            <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="width: 82%; display: inline-block;" OnTextChanged="filterOrchestraDataByName"></asp:TextBox>
                        </div>
                        <div class="col-md-3 pull-right" >
                            <asp:LinkButton CssClass="btn btn-success pull-right" runat="server" ID="btn_MangeOrchestraButton" Text="Add / Manage Orchestra" Visible="false" PostBackUrl="~/Views/ManageOrchestraView.aspx" />
                        </div>
                    </div>

                    <asp:Repeater runat="server" ID="repeater_orchestraList">
                        <ItemTemplate>

                            <div class="col-md-3" style="padding-right: 5px; padding-left: 5px;">
                                <div class="orchContainer" style="background-color: white;">
                                    <h4 style="color: #00796B; font-weight: 800;"><%#Eval("OfficialName") %></h4>
                                    <h5 style="color: #00796B;">(<%#Eval("Alias") %>)</h5>
                                    <div style="font-size: 1.2rem; color: #4c4949; margin-left: 10px;">

                                        <span>Since: <%#Eval("Since") %></span>
                                        <br />
                                        <span>Conductor: <%#Eval("ConductorName") %></span><br />
                                        <span>Address: <%#Eval("Address") %></span><br />
                                        <span>ZipCode: <%#Eval("ZipCode") %></span><br />
                                        <span>TelNO: <%#Eval("TelNO") %></span><br />
                                        <span>FaxNo: <%#Eval("FaxNo") %></span><br />
                                        <span><a href='<%#Eval("URL") %>' target="_blank">Home</a></span>
                                    </div>
                                </div>

                            </div>

                        </ItemTemplate>
                    </asp:Repeater>

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
                        FilterExpression="">
                        <DeleteParameters>
                            <asp:Parameter Name="ID" />
                        </DeleteParameters>
                        <FilterParameters>
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
