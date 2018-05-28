<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Orchestra Information archives</h1>
        <%--<p class="lead">ASP.NET is a free web framework for building great Web sites and Web applications using HTML, CSS, and JavaScript.</p>
        <p>
            <a href="http://www.asp.net" class="btn btn-primary btn-lg">Learn more &raquo;</a>

        </p>--%>
    </div>

    
    <div class="row">
        <h3>Orchestra data</h3>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div class="col-md-12">
                    <div class="col-md-5">
                        <div>
                            <div class="col-md-12">
                                <div class="col-md-4">Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchname" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Alias:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchaliasname" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">URL:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchurl" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Address:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchaddress" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">ZipCode:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchzipcode" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">TelNO:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchtelno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">FaxNo:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchfaxno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Conductor:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchcondactername" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Since:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_orchsince" runat="server" OnClick="dummybtnclick"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12 offset-4">
                                <br />
                                <asp:Button ID="btn_orchadd" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_orchadd_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="GridView1" runat="server" Height="174px" Width="743px">
                        </asp:GridView>
                    </div>
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>


    </div>

    <div class="row">
        <h3>Instrument data</h3>

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="col-md-12">
                    <div class="col-md-5">
                        <div>
                            <div class="col-md-12">
                                <div class="col-md-4">EnglishName:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_engname" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">KoreanName:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_korean_name" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Alias:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_alias" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Player:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_player" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Group:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_group" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Explanation:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_explanation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Sound Clip Location:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_soundcliplocation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Video Clip Location:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_videocliplocation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Photo Location:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_photolocation" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Remarks:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_inst_remarks" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="txt_addInstrument" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_instadd_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="GridView2" runat="server" Width="745px">
                        </asp:GridView>
                    </div>
                </div>
                <hr />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <div class="row">
        <h3>Artist data</h3>

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="col-md-12">
                    <div class="col-md-5">
                        <div>
                            <div class="col-md-12">
                                <div class="col-md-4">First Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_firstname" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Family Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_familyname" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Middle Name:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_middlename" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Birth date:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_birthdate" runat="server" ToolTip="dd/mm/yyyy"></asp:TextBox>
                                </div>
                                <br />
                            </div>

                            <%--<div class="col-md-12">
                                        <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" OnSelectionChanged="Calendar1_SelectionChanged" Visible="True" Width="350px">
                                            <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                            <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                            <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                            <TodayDayStyle BackColor="#CCCCCC" />
                                        </asp:Calendar>
                                </div>--%>

                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Address:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_address" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Zip Code:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_zipcode" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Tel. No:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_teleno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Mobile No:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_mobileno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Fax No:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_aritist_faxno" runat="server"></asp:TextBox>
                                </div>
                                <br />

                            </div>
                            <div class="col-md-12">
                                <br />
                                <div class="col-md-4">Remarks:</div>
                                <div class="col-md-6">
                                    <asp:TextBox ID="txt_artist_remark" runat="server"></asp:TextBox>
                                </div>
                                <br />
                            </div>
                            <div class="col-md-12">
                                <asp:Button ID="btn_artist_add" CssClass="btn btn-primary " runat="server" Text="Add" OnClick="btn_artistadd_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:GridView ID="GridView3" runat="server" Width="745px">
                        </asp:GridView>
                    </div>
                </div>
                <hr />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
    

</asp:Content>
