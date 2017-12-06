<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDImagem.Index" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label></h2>
                    <asp:Button ID="Button1" runat="server" Text="Incluir" OnClick="Button1_Click" /><br />
                    <br />
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../../../Imagens/produtos/" + Eval("Url") %>' Width="205" Height="190" /><br />
                            <asp:Button ID="Button2" runat="server" Text="Excluir" OnClick="Button2_Click" OnClientClick="javascript:return ConfirmaExclusao();" ToolTip='<%# Eval("Id") %>' />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllByProduct" TypeName="ECommerce.DAL.DALImagem">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="produto_id" Name="produto_id" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function ConfirmaExclusao() {
            return confirm('Deseja realmente excluir este registro?');
        }
    </script>

</asp:Content>
