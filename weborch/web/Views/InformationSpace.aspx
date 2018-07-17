﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InformationSpace.aspx.cs" Inherits="web.Views.InformationSpace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" ID="updatepanel1">
        <ContentTemplate>

            <h4>Information Space</h4>
            <div class="row">
                <div class="col-md-2">
                    <ul class="list-group">
                        <li class="list-group-item list-group-item-action active">Review</li>
                        <li class="list-group-item list-group-item-action">Concert News</li>
                        <li class="list-group-item list-group-item-action">Free Board</li>
                        <li class="list-group-item list-group-item-action">Recruitment/Promotion</li>
                        <li class="list-group-item list-group-item-action">Notice</li>
                    </ul>
                </div>
                <div class="col-md-10 shadowedPanel" style="height: 500px;">
                    <div style="height: 400px;">
                    </div>
                    <hr />
                    <div style="height: 40px;">
                        <asp:Button CssClass="btn btn-info pull-right" runat="server" Text="ADD" data-toggle="modal" data-target="#exampleModalLong" />
                    </div>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Review</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="exampleFormControlInput1">Title</label>
                                <asp:TextBox runat="server" type="text" class="form-control" ID="FormControlInput1_Title" placeholder="Title of the concert" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Content</label>
                                <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="FormControlTextarea1_content" Rows="3" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Comment</label>
                                <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" ID="FormControlTextarea1_comment" Rows="3" />
                            </div>

                            <div class="form-group">
                                <label for="exampleFormControlInput1">Writer</label>
                                <asp:TextBox runat="server" type="text" class="form-control" ID="FormControlInput1_writer" placeholder="Title of the concert" />
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button runat="server" type="button" class="btn btn-primary" Text="Save changes" ID="btnAddReview" OnClick="btnAddReview_Click" />
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <%--<asp:AsyncPostBackTrigger ControlID="btnAddReview" />--%>
        </Triggers>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function closeModal() {
            $('#exampleModalLong').modal('hide');
            $('.modal-backdrop').remove();
            alert('test');
        }
    </script>

    <style>
        .shadowedPanel {
            border: 1px solid transparent;
            border-radius: 4px;
            border-color: #dddddd;
            padding: 1em;
            box-shadow: 2px 2px 2px 2px #f5f5f5;
        }
    </style>

</asp:Content>