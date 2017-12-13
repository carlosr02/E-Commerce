<%@ Page Title="" Language="C#" MasterPageFile="~/Visao/Adm/AdmMasterPage.Master" AutoEventWireup="true" CodeBehind="Incluir.aspx.cs" Inherits="ECommerce.Visao.Adm.CRUDImagem.Incluir" Theme="css" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="contact-page" class="container">
        <div class="bg">
            <div class="row">
                <div class="col-sm-12">
                    <h2>Inclusão de Imagem</h2>
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                    <input ID="FileUpload1" type="file" name="file" onchange="previewFile()"  runat="server" />
                    <br />
                    <asp:Image ID="Image1" runat="server" Width="205" Height="190" />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Salvar" OnClick="Upload" />
                    &nbsp;<asp:Button ID="Button2" runat="server" Text="Cancelar" OnClick="Button2_Click" />
                    <br /><br />
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=Image1.ClientID %>');
            var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
            var reader = new FileReader();

            reader.onloadend = function () {
                preview.src = reader.result;
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
            }
        }
    </script>
</asp:Content>
