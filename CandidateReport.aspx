<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CandidateReport.aspx.cs" Inherits="CandidateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="page-content-wrap">

        <div class="row">
            <div class="col-md-12">

                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="panel-heading">
                                <h3 class="panel-title"><strong>Results</strong></h3>
                                <ul class="panel-controls">
                                    <li><a href="#" class="panel-remove"><span class="fa fa-times"></span></a></li>
                                </ul>
                            </div>
                            <asp:GridView ID="gvCandidate" AutoGenerateColumns="false" CssClass="table table-bordered" runat="server" EmptyDataText="No record found"
                                OnRowDeleting="gvCandidate_RowDeleting" DataKeyNames="CandidateId" >
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr. No.">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnCandidateId" runat="server" Value='<%#Eval("CandidateId")%>' />
                                            <asp:Label ID="lblName" runat="server" Text='<%#Eval("CandidateName") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CandidateContact" HeaderText="Contact" />
                                    <asp:BoundField DataField="EmailId" HeaderText="EmailId" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" />
                                    <asp:TemplateField HeaderText="Candidate Name">
                                        <ItemTemplate>
                                            <a href="AddCandidate.aspx?CandidateId=<%#Eval("CandidateId")%>">Edit</a>
                                            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

