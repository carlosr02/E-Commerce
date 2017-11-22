<%@ Page Title="Categorias | ECommerce" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDCategoria.aspx.cs" Inherits="ECommerce.Visao.CRUD1" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Categorias</h2>
                    <table>
                        <tr>
                            <td>Descrição:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1" ValidationGroup="Inserir">*</asp:RequiredFieldValidator></td>
                            <td>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Departamento:</td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Descricao" DataValueField="Id"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="Button1" runat="server" Text="Incluir Categoria" OnClick="Button1_Click" ValidationGroup="Inserir" /></td>
                        </tr>
                    </table>
                    <br />
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento"></asp:ObjectDataSource>

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="Descricao" HeaderText="Descricao" SortExpression="Descricao" />
                            <asp:BoundField DataField="Departamento_id" HeaderText="Departamento_id" SortExpression="Departamento_id" ReadOnly="True" Visible="False" />
                            <asp:BoundField DataField="Departamento" HeaderText="Departamento" ReadOnly="True" SortExpression="Departamento"></asp:BoundField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton runat="server" Text="Atualizar" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancelar" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="Editar" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Excluir" CommandName="Delete" CausesValidation="False" ID="LinkButton2" OnClientClick="javascript:return ConfirmaExclusao();"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ECommerce.Modelo.Categoria" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAllDepDescr" TypeName="ECommerce.DAL.DALCategoria" UpdateMethod="Update"></asp:ObjectDataSource>
                    <br />
                </div>
            </div>
        </div>
    </div>
    <script language="javascript">
        function ConfirmaExclusao() {
            return confirm('Deseja realmente excluir este registro?');
        }
    </script>
</asp:Content>
