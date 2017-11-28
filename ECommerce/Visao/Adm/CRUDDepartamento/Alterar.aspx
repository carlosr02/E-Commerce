<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Alterar.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDDepartamento.Alterar" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Alteração de Departamento</h2>
                    <table>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Código"></asp:Label></td>
                            <td><asp:TextBox ID="TextBox1" runat="server" Enabled="False"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Descrição"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox2">*</asp:RequiredFieldValidator>
                            </td>
                            <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="Button1" runat="server" Text="Salvar" OnClick="Button1_Click" /></td>
                            <td><asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click" CausesValidation="False" /></td>
                        </tr>
                    </table>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
