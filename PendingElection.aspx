<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PendingElection.aspx.cs" Inherits="PendingElection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">

                <div class="form-horizontal">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><strong>Pending Elections</strong></h3>
                            <ul class="panel-controls">
                                <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                            </ul>
                        </div>

                        <div class="panel-body">
                            <div class="form-group">
                                <label class="col-md-3 control-label">Select Election Id</label>
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlElection" runat="server" CssClass="form-control select" AutoPostBack="true" OnSelectedIndexChanged="ddlElection_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12">
                                    <asp:GridView ID="gvCandidate" AutoGenerateColumns="false" CssClass="table table-bordered" runat="server" EmptyDataText="No record found">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Select">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="hdnCandidateId" runat="server" Value='<%#Eval("CandidateId")%>' />
                                                    <asp:CheckBox ID="CheckBox1" Text='<%# Eval("CandidateName")%>' AutoPostBack="true" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Candidate Name">
                                                <ItemTemplate>
                                                    <a href="candidateProfile.aspx?CandidateId=<%#Eval("CandidateId")%>">View Details</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <center>                                 
                                <asp:Button ID="btnSave" runat="server" CssClass="btn btn-primary" OnClick="btnSave_Click" Text="Submit"></asp:Button>
                            </center>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script type="text/javascript">
            function CheckBoxCheck(rb) {
                debugger;
                var gv = document.getElementById("<%=gvCandidate.ClientID%>");
                var chk = gv.getElementsByTagName("input");
                var row = rb.parentNode.parentNode;
                for (var i = 0; i < chk.length; i++) {
                    if (chk[i].type == "checkbox") {
                        if (chk[i].checked && chk[i] != rb) {
                            chk[i].checked = false;
                            break;
                        }
                    }
                }
            }
        </script>
    </div>
</asp:Content>

