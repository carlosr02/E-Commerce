<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDCategoria.aspx.cs" Inherits="ECommerce.Visao.CRUDCategoria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server">
            Incluir Categoria
            <br />
            Descrição: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            Departamento: <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Descricao" DataValueField="Id"></asp:DropDownList>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Incluir Categoria" OnClick="Button1_Click" />
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento"></asp:ObjectDataSource>
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                    <asp:BoundField DataField="Departamento_id" HeaderText="Departamento_id" SortExpression="Departamento_id" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ECommerce.Modelo.Categoria" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALCategoria" UpdateMethod="Update"></asp:ObjectDataSource>
        </asp:Panel>
    </div>
    </div>
    </form>
</body>
</html>
