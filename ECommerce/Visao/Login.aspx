<%@ Page Title="Login | ECommerce" Language="C#" MasterPageFile="~/Visao/PublicMasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECommerce.Visao.Login" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="form">
        <!--form-->
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-sm-offset-1">
                    <div class="login-form">
                        <!--login form-->
                        <h2>Entrar</h2>
                        <asp:TextBox ID="login_email" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                        <asp:TextBox ID="login_senha" runat="server" placeholder="Senha" TextMode="Password"></asp:TextBox>
                        <span>
                            <asp:CheckBox ID="login_checkbox" runat="server" />
                            Continuar contectado
                        </span>
                        <asp:Button ID="login" runat="server" Text="Entrar" CssClass="btn btn-default" OnClick="Login_OnClick" />
                    </div>
                    <!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OU</h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>Cadastrar</h2>
                        <asp:TextBox ID="cadastro_email" runat="server" TextMode="Email" placeholder="Email"></asp:TextBox>
                        <asp:TextBox ID="cadastro_senha" runat="server" TextMode="Password" placeholder="Senha"></asp:TextBox>
                        <asp:TextBox ID="cadastro_confirmar" runat="server" TextMode="Password" placeholder="Confirmar senha"></asp:TextBox>
                        <asp:Button ID="cadastro" runat="server" Text="Cadastrar" CssClass="btn btn-default" OnClientClick="Cadastro_OnClick" />
                    </div>
                    <!--/sign up form-->
                </div>
            </div>
        </div>
    </section>
    <!--/form-->
</asp:Content>
