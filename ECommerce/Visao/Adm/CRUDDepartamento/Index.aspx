<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDDepartamento.Index" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Departamentos</h2>
                    <asp:Button ID="Button1" runat="server" Text="Incluir" PostBackUrl="~/Visao/Adm/CRUDDepartamento/Incluir.aspx" /><br /><br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" DataKeyNames="Id" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Código" ReadOnly="True" SortExpression="Id"></asp:BoundField>
                            <asp:BoundField DataField="Descricao" HeaderText="Descrição" SortExpression="Descricao"></asp:BoundField>
                            <asp:ButtonField Text="Alterar" CommandName="Alterar"></asp:ButtonField>
                            <asp:ButtonField Text="Excluir" CommandName="Excluir"></asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento"></asp:ObjectDataSource>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
