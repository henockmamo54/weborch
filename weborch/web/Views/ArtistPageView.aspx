<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ArtistPageView.aspx.cs" Inherits="web.ArtistPageView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.css" rel="stylesheet" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>



    <div class="row">


        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

                <div id="foraudience" runat="server">

                        <div class=" col-md-12">
                            <h2 style="margin-top: 0px; padding-top: 0px; display: inline-block;">Artist data</h2>
                            </div>

                    <div class="row col-md-12" style="margin-bottom: 1rem;">
                        <div class="col-md-2 pull-right">
                            <h5 style="display: inline-block;">Type: </h5>
                            <asp:DropDownList AutoPostBack="true" ID="DropDownList1_artistType" runat="server" DataSourceID="SqlDataSource3_artistType" DataTextField="Name" DataValueField="ID" CssClass="form-control pull-right" Style="width: 70%;" OnSelectedIndexChanged="DropDownList1_artistType_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3_artistType" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="
select 'All' as Name , CAST ('-1' AS INT) as ID


union 

SELECT  Name,ID FROM Lookup.ArtistType 
"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3 pull-right">
                            <h5 style="display: inline-block;">Instrument: </h5>
                            <asp:SqlDataSource ID="SqlDataSource3_instrumentListForFilter" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand="select 1 row, -1 as ID, 'None' as EnglishName, 'None' as KoreanName, 'None' as [Group] 
union
SELECT ROW_NUMBER() OVER(ORDER BY EnglishName ASC) AS Row, ID, EnglishName, KoreanName, [Group] FROM Core.Instrument "></asp:SqlDataSource>
                            <asp:DropDownList ID="DropDownList1_instrumentTypeFilter" CssClass="form-control pull-right" Style="width: 70%;" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3_instrumentListForFilter" DataTextField="EnglishName" DataValueField="ID" OnSelectedIndexChanged="DropDownList1_artistType_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                        <div class="col-md-3 pull-right">
                            <h5 style="display: inline-block;">Name: </h5>
                            <asp:TextBox AutoPostBack="true" ID="txtbox_namefilter" runat="server" CssClass="form-control" Style="width: 70%; display: inline-block;" OnTextChanged="DropDownList1_artistType_SelectedIndexChanged"></asp:TextBox>
                        </div>
                        <div class="col-md-3 pull-right">
                            <%--<asp:LinkButton runat="server" Text="test haha" CssClass="btn btn-success pull-right"/>--%>
                            <asp:LinkButton CssClass="btn btn-success pull-right" runat="server" ID="btn_MangeArtistButton" Text="Add / Manage Artist" Visible="false" PostBackUrl="~/Views/ManageArtistPageView.aspx" />                        
                        </div>
                    </div>

                    <asp:SqlDataSource ID="SqlDataSource3_ArtistListForAudience" runat="server" ConnectionString="<%$ ConnectionStrings:OrchestraDBConnectionString %>" SelectCommand=" SELECT core.artist.ID,core.artist.firstname,
       core.artist.middlename,
       core.artist.familyname,
       core.artist.photo1,
       core.artist.affiliation,
       ArtistType.NAME AS ArtistType,
       inst.namevalues AS instruments
FROM   core.artist
       INNER JOIN (SELECT
       artist,
       Stuff((SELECT ', ' + NAME
              FROM   (SELECT at.artist,
                             al.NAME
                      FROM   drived.artist_artisttype at
                             JOIN lookup.artisttype al
                               ON at.artisttypeid = al.id)x
              WHERE  ( artist = Results.artist )
              FOR xml path(''), type).value('(./text())[1]', 'VARCHAR(MAX)'), 1
                                     , 2, '')
       AS NAME
                   FROM   drived.artist_artisttype Results
                   GROUP  BY artist) ArtistType
               ON core.artist.id = ArtistType.artist
       JOIN
              (SELECT
       artist,
                    Stuff((SELECT ', ' + englishname
                           FROM   (SELECT ai.artistid,
                                          i.englishname
                                   FROM   drived.artist_instrument ai
                                          JOIN core.instrument i
                                            ON ai.instrumentid = i.id)x
                           WHERE  ( artistid = Results.artist )
                           FOR xml
       path(''), type).value('(./text())[1]', 'VARCHAR(MAX)'), 1
                                           , 2, '')
                    AS NameValues
             FROM   drived.artist_artisttype Results
             GROUP  BY artist) inst
         ON inst.artist = core.artist.id  "></asp:SqlDataSource>

                    <asp:Repeater runat="server" ID="artistsRepeater">
                        <ItemTemplate>

                            <div class="col-sm-4">
                                <div class="row col-sm-12" style="box-shadow: 0px 0px 5px 2px #d4d3d3; border-radius: 3px; margin-bottom: 2rem; padding-left: 0; background-color: white; font-family: Roboto, Arial, sans-serif;">
                                    <div class="col-sm-6" style="padding: 0;">
                                        <img style="width: 100%; height: 18.25rem; padding: 3px; border-radius: 7px;" class="card-img-top img-rounded" src="../Document/<%#Eval("Photo1") %>" alt="Card image cap">
                                    </div>
                                    <div class="col-sm-6" style="margin: 0px; padding: 0px; padding-left: 8px; font-size: 1.2rem;">
                                        <div class="card-body">
                                            <%--<h5 class="card-title" style="margin: 0; margin-top: 5px; margin-bottom: 5px;"><strong><%#Eval("FirstName") %> <%#Eval("MiddleName") %> <%#Eval("FamilyName") %></strong></h5>--%>
                                            <h5 class="card-title" style="margin: 0; margin-top: 5px; margin-bottom: 5px;"><strong><%#Eval("FirstName") %> </strong></h5>
                                            <p class="card-text" style="color: #555555;">
                                                <strong>Affiliation: </strong>
                                                <%#Eval("Affiliation") %>, <%#Eval("ArtistType") %>
                                                <br />
                                                <strong>Instruments: </strong>
                                                <%#Eval("instruments") %>
                                            </p>
                                            <a href="ArtistProfilePaage.aspx?ID=<%#Eval("ID") %> " class="btn btn-default" ><%= Resources.HomeView.aspx.Homepage %></a>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:Repeater>


                </div>

            </ContentTemplate>

            <Triggers>

            </Triggers>

        </asp:UpdatePanel>

    </div>


    <script type="text/javascript">


        document.getElementById("artisttab").style.backgroundColor = "white";
        document.getElementById("artisttab").style.borderBottom = "none";



        function bindDateTime() {
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

