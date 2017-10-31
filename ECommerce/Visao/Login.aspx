<%@ Page Title="Login | ECommerce" Language="C#" MasterPageFile="~/Visao/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECommerce.Visao.Login" Theme="css" %>

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
                        <h2>Login to your account</h2>
                        <input type="text" placeholder="Name" />
                        <input type="email" placeholder="Email Address" />
                        <span>
                            <input type="checkbox" class="checkbox" />
                            Keep me signed in
                        </span>
                        <button type="submit" class="btn btn-default">Login</button>
                    </div>
                    <!--/login form-->
                </div>
                <div class="col-sm-1">
                    <h2 class="or">OR</h2>
                </div>
                <div class="col-sm-4">
                    <div class="signup-form">
                        <!--sign up form-->
                        <h2>New User Signup!</h2>
                        <asp:TextBox ID="UserName" runat="server" CssClass="signup-form input" placeholder="Name"></asp:TextBox>
                        <asp:TextBox ID="Email" runat="server" CssClass="signup-form input" TextMode="Email" placeholder="Email Address"></asp:TextBox>
                        <asp:TextBox ID="Password" runat="server" CssClass="signup-form input" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <asp:Button ID="Button1" runat="server" Text="Signup" CssClass="btn btn-default signup-form button " />
                        <!--<button type="submit" class="btn btn-default">Signup</button>-->
                    </div>
                    <!--/sign up form-->
                </div>
            </div>
        </div>
    </section>
    <!--/form-->
</asp:Content>
