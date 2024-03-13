<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewElection.aspx.cs" Inherits="NewElection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="js/plugins/jquery/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content-wrap">
        <div class="row">
            <div class="col-md-12">
                <div class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>New Election</strong></h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>

                        <div class="panel-body">

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Election Id</label>
                                <div class="col-md-6 col-xs-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span class="fa fa-pencil"></span></span>
                                        <asp:TextBox ID="txtElectionId" runat="server" CssClass="form-control" placeholder="Election Id" Enabled="false" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 col-xs-12 control-label">Election Topic</label>
                                <div class="col-md-6 col-xs-12">
                                    <asp:TextBox runat="server" ID="txtElectionName" required CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-md-3 control-label">No Of Candidates</label>
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="ddlNoOfCandidate" AutoPostBack="true" OnSelectedIndexChanged="ddlNoOfCandidate_SelectedIndexChanged" ClientIDMode="Static" CssClass="form-control select">
                                        <asp:ListItem Value="0">Select No. Of Candidates</asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Select Candidates</label>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlCandList1" Style="display: none;" ClientIDMode="Static" runat="server" CssClass="form-control "></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlCandList2" Style="display: none;" ClientIDMode="Static" runat="server" CssClass="form-control "></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlCandList3" Style="display: none;" ClientIDMode="Static" runat="server" CssClass="form-control "></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:DropDownList ID="ddlCandList4" Style="display: none;" ClientIDMode="Static" runat="server" CssClass="form-control "></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="form-group">
                                <label class="col-md-3 control-label">End Date</label>
                                <div class="col-md-6">
                                    <asp:TextBox runat="server" ID="txtEndDate" ClientIDMode="Static" required CssClass="form-control datepicker" PlaceHolder="yyyy-mm-dd" />
                                </div>
                            </div>

                        </div>
                        <div class="panel-footer">
                            <center>                                 
                                    <asp:Button runat="server" Text="Submit"  ClientIDMode="Static" class="btn btn-primary" OnClick="btnSubmit_Click" ID="btnSubmit"></asp:Button>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
