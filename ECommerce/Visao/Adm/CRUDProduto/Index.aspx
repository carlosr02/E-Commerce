<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDProduto.Index" Theme="css" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Produtos</h2>
                    <asp:Button ID="Button1" runat="server" Text="Incluir" PostBackUrl="~/Visao/Adm/CRUDProduto/Incluir.aspx" /><br /><br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowCommand="GridView1_RowCommand" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Código" SortExpression="Id" ReadOnly="True"></asp:BoundField>
                            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome"></asp:BoundField>
                            <asp:BoundField DataField="Preco" HeaderText="Preço" SortExpression="Preco"></asp:BoundField>
                            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca"></asp:BoundField>
                            <asp:BoundField DataField="QntEmEstoque" HeaderText="Quantidade em estoque" SortExpression="QntEmEstoque"></asp:BoundField>
                            <asp:BoundField DataField="MediaAvaliacoes" HeaderText="Média das avaliações" ReadOnly="True" SortExpression="MediaAvaliacoes"></asp:BoundField>
                            <asp:BoundField DataField="Descricao" HeaderText="Descrição" SortExpression="Descricao"></asp:BoundField>
                            <asp:CheckBoxField DataField="EmDestaque" HeaderText="EmDestaque" SortExpression="EmDestaque"></asp:CheckBoxField>
                            <asp:BoundField DataField="Departamento" HeaderText="Departamento" SortExpression="Departamento"></asp:BoundField>
                            <asp:BoundField DataField="Categoria_id" HeaderText="Categoria_id" ReadOnly="True" SortExpression="Categoria_id" Visible="False"></asp:BoundField>
                            <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria"></asp:BoundField>
                            <asp:ButtonField Text="Alterar" CommandName="Alterar"></asp:ButtonField>
                            <asp:ButtonField Text="Excluir" CommandName="Excluir"></asp:ButtonField>
                            <asp:ButtonField Text="Visualizar imagens" CommandName="Imagem"></asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALProduto"></asp:ObjectDataSource>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
