<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDProduto.aspx.cs" Inherits="ECommerce.Visao.CRUDProduto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server">
            Incluir Produto
            <br />
            Nome: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            Preco: <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            Marca: <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            Descrição: <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            Categoria
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Descricao" DataValueField="Id"></asp:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALCategoria"></asp:ObjectDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Incluir Produto" OnClick="Button1_Click" />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Preco" HeaderText="Preco" SortExpression="Preco" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                    <asp:BoundField DataField="QntEmEstoque" HeaderText="QntEmEstoque" SortExpression="QntEmEstoque" />
                    <asp:BoundField DataField="MediaAvaliacoes" HeaderText="MediaAvaliacoes" SortExpression="MediaAvaliacoes" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                    <asp:CheckBoxField DataField="EmDestaque" HeaderText="EmDestaque" SortExpression="EmDestaque" />
                    <asp:BoundField DataField="Categoria_id" HeaderText="Categoria_id" SortExpression="Categoria_id" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ECommerce.Modelo.Produto" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALProduto" UpdateMethod="Update"></asp:ObjectDataSource>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
