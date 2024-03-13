<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="candidateProfile.aspx.cs" Inherits="candidateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">

                <form class="form-horizontal" action="" method="POST">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <center>
                                    <h3 class="panel-title"><strong>Candidate Profile</strong></h3>
                                    </center>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>

                        <div class="panel-body">

                            <div class="col-md-8 col-md-offset-4">
                                <asp:Image runat="server" ID="imgProfilePic" Style="width: 300px;" />
                                <br />
                                <br />
                                <p align="left" style="font-size: 16px; font-weight: 500;">
                                    Name:
                                    <asp:Label ID="lblName" runat="server" />
                                </p>
                                <p align="left" style="font-size: 16px; font-weight: 500;">
                                    Contact Number:
                                    <asp:Label ID="lblContact" runat="server" />
                                </p>
                                <p align="left" style="font-size: 16px; font-weight: 500;">
                                    EmailId:
                                    <asp:Label ID="lblEmail" runat="server" />
                                </p>
                                <p align="left" style="font-size: 16px; font-weight: 500;">
                                    City:
                                    <asp:Label ID="lblCity" runat="server" />
                                </p>
                                <p align="left" style="font-size: 16px; font-weight: 500;">
                                    Address:
                                    <asp:Label ID="lblAddress" runat="server" />
                                </p>

                                <p align="left" style="font-size: 16px; font-weight: 500;">
                                    Description:
                                    <asp:Label ID="lblDescription" runat="server" />
                                </p>

                            </div>
                        </div>
                        <div class="panel-footer">
                            <a href="PendingElection.aspx" class="btn btn-primary pull-right" title="Back">Back</a>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>
</asp:Content>

