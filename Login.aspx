<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" class="body-full-height">
<head runat="server">
    <title>Election</title>            
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <!-- END META SECTION -->
        
        <!-- CSS INCLUDE -->        
        <link rel="stylesheet" type="text/css" id="theme" href="css/theme-default.css"/>
        <!-- EOF CSS INCLUDE -->  
</head>
<body>
    <form id="form1" runat="server">
    <div class="login-container">
            <div class="login-box animated fadeInDown">
                <!--<div class="login-logo"></div>-->
                <div class="login-body">
                    <div class="login-title"><strong>Welcome</strong>, Please login</div>
                    <div class="form-horizontal">
                        <div class="" id="divMessage" runat="server" />
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtUsername" ClientIDMode="Static" placeholder="Username" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" ClientIDMode="Static" placeholder="Password" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-6">
                            <asp:Button ID="btnLogin" runat="server" ClientIDMode="Static" OnClick="btnLogin_Click" class="btn btn-info btn-block" Text="Log In"></asp:Button>
                        </div>
                        <div class="col-md-6">
                            <a href="Register.aspx" class="btn btn-info btn-block" type="submit">Register</a>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
           
        </script>
    </form>
</body>
</html>
