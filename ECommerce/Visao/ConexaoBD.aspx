<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConexaoBD.aspx.cs" Inherits="ECommerce.Visao.ConexaoBD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowCommand="GridView1_RowCommand">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:ButtonField CommandName="Editar" Text="Editar" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ECommerce.Modelo.Departamento" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento" UpdateMethod="Update"></asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
