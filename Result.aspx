<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Result.aspx.cs" Inherits="Result" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">

                <div class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Calculate Votes</strong></h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Select Election Id</label>
                                <div class="col-md-6">
                                    <asp:DropDownList CssClass="form-control select" runat="server" OnSelectedIndexChanged="ddlElectionId_SelectedIndexChanged" AutoPostBack="true" ID="ddlElectionId">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <%--<center>                                 
                                    <button class="btn btn-primary" type="submit" name="submit">Submit</button>
                                </center>--%>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-md-12">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title"><strong>Results</strong></h3>
                        <ul class="panel-controls">
                            <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                        </ul>
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <center>
                                        <h3><strong>Elction is Won By <asp:Label ID="lblCandidate" runat="server" /></strong></h3>
                                    </center>
                        </div>
                        <br />
                        <br />
                        
                    </div>
                    <div class="panel-footer">
                    </div>
                </div>

            </div>
        </div>

    </div>
</asp:Content>

