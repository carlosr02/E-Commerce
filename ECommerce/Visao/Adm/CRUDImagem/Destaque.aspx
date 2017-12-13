<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Destaque.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDImagem.Destaque" Theme="css" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Imagens</h2>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" OnItemDataBound="DataList1_ItemDataBound">
                        <ItemTemplate>
                            <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Destaque" ToolTip='<%# Eval("Id") %>' />
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "../../../Imagens/produtos/" + Eval("Url") %>' Width="205" Height="190" />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllByProduct" TypeName="ECommerce.DAL.DALImagem">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="produto_id" Name="produto_id" Type="Int32"></asp:QueryStringParameter>
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Salvar" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click" />
                    <br /><br />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function SetUniqueRadioButton(nameregex, current) {
            re = new RegExp(nameregex);
            for (i = 0; i < document.forms[0].elements.length; i++) {
                elm = document.forms[0].elements[i]
                if (elm.type == 'radio') {
                    if (re.test(elm.name)) {
                        elm.checked = false;
                    }
                }
            }
            current.checked = true;
        }
    </script>
</asp:Content>
