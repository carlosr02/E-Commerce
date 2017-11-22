<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECommerce.log" Theme="css" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | Ecommerce</title>
</head>
<body>
    <form id="form1" runat="server">
        <header id="header">
            <!--header-->
            <div class="header-middle">
                <!--header-middle-->
                <div class="container">
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="logo pull-left">
                                <a href="Index.aspx">
                                    <img src="../Imagens/home/logo.png" alt="" /></a>
                            </div>
                            <div class="btn-group pull-right">
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="shop-menu pull-right">
                                <ul class="nav navbar-nav">
                                    <li><a href="Carrinho.aspx"><i class="fa fa-shopping-cart"></i>Carrinho</a></li>
                                    <li><a href="Login.aspx"><i class="fa fa-lock"></i>Login</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/header-middle--> 
        </header>
        <!--/header-->
        <section id="form">
            <!--form-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-4 col-sm-offset-1">
                        <asp:Panel ID="Panel2" runat="server" CssClass="login-form" DefaultButton="login">
                            <!--login form-->
                            <h2>Entrar</h2>
                            <asp:Label ID="login_erro" runat="server" Text="" ForeColor="Red"></asp:Label>
                            <asp:TextBox ID="login_email" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="login_email" Display="None" ValidationGroup="login"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="login_senha" runat="server" placeholder="Senha" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="login_senha" Display="None" ValidationGroup="login"></asp:RequiredFieldValidator>
                            <span>
                                <asp:CheckBox ID="login_checkbox" runat="server" />
                                Continuar contectado
                            </span>
                            <asp:Button ID="login" runat="server" Text="Entrar" CssClass="btn btn-default" OnClick="Login_OnClick" ValidationGroup="login" />
                        </asp:Panel>
                        <!--/login form-->
                    </div>
                    <div class="col-sm-1">
                        <h2 class="or">OU</h2>
                    </div>
                    <div class="col-sm-4">
                        <asp:Panel ID="Panel3" runat="server" CssClass="signup-form" DefaultButton="cadastro">
                            <!--sign up form-->
                            <h2>Cadastrar</h2>
                            <asp:Label ID="cadastro_erro" runat="server" Text="" ForeColor="Red"></asp:Label>                            
                            <asp:TextBox ID="cadastro_email" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="cadastro_email" Display="None" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="cadastro_senha" runat="server" TextMode="Password" placeholder="Senha"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="cadastro_senha" Display="None" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="cadastro_confirmar" runat="server" TextMode="Password" placeholder="Confirmar senha"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="cadastro_confirmar" Display="None" ValidationGroup="cadastro"></asp:RequiredFieldValidator>
                            <asp:Button ID="cadastro" runat="server" Text="Cadastrar" CssClass="btn btn-default" OnClick="Cadastro_OnClick" ValidationGroup="cadastro" />
                        </asp:Panel>
                        <!--/sign up form-->
                    </div>
                </div>
            </div>
        </section>
        <!--/form-->
        <footer id="footer">
            <!--Footer-->
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
                        <p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
                    </div>
                </div>
            </div>
        </footer>
        <!--/Footer-->

        <script type="text/javascript">
            function ValidatorUpdateDisplay(val) {
                if (val.isvalid) {
                    document.getElementById(val.controltovalidate).style.backgroundColor = '#F0F0E9';
                }
                else {
                    document.getElementById(val.controltovalidate).style.backgroundColor = '#ffdddd';
                }
            }
</script>

        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/jquery.scrollUp.min.js"></script>
        <script src="../js/price-range.js"></script>
        <script src="../js/jquery.prettyPhoto.js"></script>
        <script src="../js/main.js"></script>
    </form>
</body>
</html>

