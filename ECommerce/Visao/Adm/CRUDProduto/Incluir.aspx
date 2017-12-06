<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Incluir.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDProduto.Incluir" Theme="css" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Inclusão de Produto</h2>
                    <asp:Label ID="Label9" runat="server" Text=""></asp:Label>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Nome"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                            </td>
                            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="Preço"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox2">*</asp:RequiredFieldValidator>
                            </td>
                            <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Number"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Marca"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox3">*</asp:RequiredFieldValidator>
                            </td>
                            <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label4" runat="server" Text="Quantidade em estoque"></asp:Label></td>
                            <td><asp:TextBox ID="TextBox4" runat="server" TextMode="Number"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label5" runat="server" Text="Descrição"></asp:Label></td>
                            <td><asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Departamento"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownList1">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Descricao" DataValueField="Id" OnDataBound="DropDownList1_DataBound" AutoPostBack="True"></asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento"></asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label7" runat="server" Text="Categoria"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DropDownList2">*</asp:RequiredFieldValidator>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ObjectDataSource2" DataTextField="Descricao" DataValueField="Id" OnDataBound="DropDownList2_DataBound"></asp:DropDownList>
                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectAllByDepartamento" TypeName="ECommerce.DAL.DALCategoria">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="departamento_id" Type="Int32"></asp:ControlParameter>
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td><asp:Button ID="Button1" runat="server" Text="Salvar" OnClick="Button1_Click" /></td>
                            <td><asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click" CausesValidation="False" /></td>
                        </tr>
                    </table>
                    <br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
