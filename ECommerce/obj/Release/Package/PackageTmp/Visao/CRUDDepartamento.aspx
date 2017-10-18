<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUDDepartamento.aspx.cs" Inherits="ECommerce.Visao.CRUDDepartamento1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server">
            Incluir Departamento
            <br />
            Descrição: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Incluir Departamento" OnClick="Button1_Click" />
        </asp:Panel>
        <br />
        <asp:Panel ID="Panel2" runat="server">
            Departamentos<br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Id">
                <Columns>
                    <asp:BoundField DataField="Id" SortExpression="Id" HeaderText="Id" ReadOnly="True" Visible="False" />
                    <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ECommerce.Modelo.Departamento" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento" UpdateMethod="Update"></asp:ObjectDataSource>
        </asp:Panel>
    </div>
    </form>
</body>
</html>
