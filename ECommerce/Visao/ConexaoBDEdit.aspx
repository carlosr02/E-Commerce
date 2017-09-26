<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConexaoBDEdit.aspx.cs" Inherits="ECommerce.Visao.ConexaoBDEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource1" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ECommerce.Modelo.Departamento" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="Select" TypeName="ECommerce.DAL.DALDepartamento" UpdateMethod="Update">
            <SelectParameters>
                <asp:SessionParameter Name="id" SessionField="id" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
