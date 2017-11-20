<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/MasterPage.Master" AutoEventWireup="true" CodeBehind="CRUDDepartamento.aspx.cs" Inherits="ECommerce.Visao.CRUD" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Departamentos</h2>
                    <table>
                        <tr>
                            <td>Descrição:<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ValidationGroup="Inserir" ControlToValidate="TextBox1">*</asp:RequiredFieldValidator><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                            <td><asp:Button ID="Button1" runat="server" Text="Incluir Departamento" OnClick="Button1_Click" ValidationGroup="Inserir" /></td>
                        </tr>
                    </table>
                    <br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="Id">
                        <Columns>
                            <asp:BoundField DataField="Id" SortExpression="Id" HeaderText="C&#243;digo" ReadOnly="True" />
                            <asp:BoundField DataField="Descricao" HeaderText="Descri&#231;&#227;o" SortExpression="Descricao" />
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
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="ECommerce.Modelo.Departamento" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento" UpdateMethod="Update"></asp:ObjectDataSource>
                    <br />
                </div>
            </div>
        </div>
    </div>
    <script language=javascript>
        function ConfirmaExclusao() {
            return confirm('Deseja realmente excluir este registro?');
        }
</script>
</asp:Content>
