<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Election</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="icon" href="favicon.ico" type="image/x-icon" />
    <!-- END META SECTION -->

    <!-- CSS INCLUDE -->
    <link rel="stylesheet" type="text/css" id="theme" href="css/theme-default.css" />
    <!-- EOF CSS INCLUDE -->
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-box animated fadeInDown">
                <div class="login-body">
                    <div class="login-title"><strong>Welcome</strong>, Please Register</div>
                    <div class="form-horizontal">
                        <div class="" id="divMessage" runat="server" ></div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" placeholder="Name" required />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtUsername" placeholder="Username" required />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" required placeholder="Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" TextMode="Password" ID="txtConfirmPassword" required CssClass="form-control" placeholder="Repeat Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" TextMode="MultiLine" ID="txtAddress" CssClass="form-control" placeholder="Address" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="txtContact" CssClass="form-control" required placeholder="Contact Number" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6">
                                <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="btn btn-info btn-block" Text="Register"></asp:Button>
                            </div>
                             <div class="col-md-6">
                            <a href="Login.aspx" class="btn btn-info btn-block" type="submit">Login</a>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
