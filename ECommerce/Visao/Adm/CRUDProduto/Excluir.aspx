<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Excluir.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDProduto.Excluir" Theme="css" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Exclusão de Produto</h2>
                    <table>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text="Código:"></asp:Label></td>
                            <td><asp:Label ID="Label2" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label3" runat="server" Text="Nome:"></asp:Label></td>
                            <td><asp:Label ID="Label4" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label5" runat="server" Text="Preço:"></asp:Label></td>
                            <td><asp:Label ID="Label6" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label7" runat="server" Text="Marca:"></asp:Label></td>
                            <td><asp:Label ID="Label8" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label9" runat="server" Text="Quantidade em estoque:"></asp:Label></td>
                            <td><asp:Label ID="Label10" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label11" runat="server" Text="Média das avaliações:"></asp:Label></td>
                            <td><asp:Label ID="Label12" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label13" runat="server" Text="Descrição:"></asp:Label></td>
                            <td><asp:Label ID="Label14" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label15" runat="server" Text="Em destaque:"></asp:Label></td>
                            <td><asp:Label ID="Label16" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label17" runat="server" Text="Departamento:"></asp:Label></td>
                            <td><asp:Label ID="Label18" runat="server" Text="" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label19" runat="server" Text="Categoria:"></asp:Label></td>
                            <td><asp:Label ID="Label20" runat="server" Text="" Font-Bold="True"></asp:Label></td>
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
