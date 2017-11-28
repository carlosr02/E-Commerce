<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Excluir.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDDepartamento.Excluir" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Exclusão de Departamento</h2>
                    <table>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Código:"></asp:Label></td>
                            <td><asp:Label ID="Label2" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label3" runat="server" Text="Descrição:"></asp:Label></td>
                            <td><asp:Label ID="Label4" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="Button1" runat="server" Text="Excluir" OnClick="Button1_Click" /></td>
                            <td><asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click" /></td>
                        </tr>
                    </table>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
