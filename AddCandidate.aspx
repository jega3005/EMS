<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddCandidate.aspx.cs" Inherits="AddCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-12">
                <div class="form-horizontal">
                    <div class="panel panel-default">
                        <div id="divMessage" runat="server" />
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Add Candidate</strong></h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>

                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Name</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <asp:TextBox CssClass="form-control" ID="txtCandidateName" runat="server" placeholder="Candidate Name" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Candidate Contact</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <asp:TextBox CssClass="form-control" ID="txtCandidateContact" runat="server" placeholder="Candidate Number" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Email Address</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <asp:TextBox runat="server" ID="txtEmailId" CssClass="form-control" placeholder="Email Address" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">City</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <asp:TextBox runat="server" ID="txtCity" CssClass="form-control" placeholder="City" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Address</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <asp:TextBox runat="server" ID="txtAddress" TextMode="MultiLine" CssClass="form-control" placeholder="Address" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Photo</label>
                                <div class="col-md-6 col-xs-12">
                                    <asp:FileUpload runat="server" ID="fuimgInp" class="fileinput btn-primary" />
                                    <img id="frofilImg" runat="server" src="#" alt="Image Preview" style="width: 50%;" />
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Description</label>
                                <div class="col-md-6 col-xs-12">
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" name="description"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <center>                                 
                                    <asp:Button runat="server" class="btn btn-primary" OnClick="btnsubmit_Click" Text="Submit" ID="btnsubmit"></asp:Button>
                            </center>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <asp:HiddenField ID="hdnProfile" runat="server" />
    </div>
    <!-- END PAGE CONTENT WRAPPER -->
</asp:Content>

