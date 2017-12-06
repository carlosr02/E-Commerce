<%@ Page Title="Vitrine | ECommerce" Language="C#" MasterPageFile="~/Visao/PublicMasterPage.Master" AutoEventWireup="true" CodeBehind="Vitrine.aspx.cs" Inherits="ECommerce.Visao.shop" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Categoria</h2>
                        <div class="panel-group category-products" id="accordian">
                            <!--category-productsr-->
                            <asp:DataList ID="DataList2" runat="server" DataSourceID="ObjectDataSource2" RepeatColumns="1" ItemStyle-CssClass="panel panel-default" DataKeyField="Id">
                                <ItemTemplate>
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordian" href="#<%# Eval("Id") %>">
                                                <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                                                <%# Eval("Descricao") %>
                                            </a>
                                        </h4>
                                    </div>
                                    <div id='<%# Eval("Id") %>' class="panel-collapse collapse">
                                        <asp:Label Text='<%# Eval("Id") %>' runat="server" ID="IdLabel" Visible="False" />
                                        <div class="panel-body">
                                            <ul>
                                                <asp:DataList ID="DataList3" runat="server" DataSourceID="ObjectDataSource3">
                                                    <ItemTemplate>
                                                        <li><a href="Vitrine.aspx?categoria_id=<%# Eval("Id") %>"><%# Eval("Descricao") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                                <asp:ObjectDataSource runat="server" ID="ObjectDataSource3" SelectMethod="SelectAllByDepartamento" TypeName="ECommerce.DAL.DALCategoria">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="IdLabel" PropertyName="Text" Name="departamento_id" Type="Int32"></asp:ControlParameter>
                                                    </SelectParameters>
                                                </asp:ObjectDataSource>
                                            </ul>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                            <asp:ObjectDataSource runat="server" ID="ObjectDataSource2" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALDepartamento"></asp:ObjectDataSource>
                        </div>
                        <!--/category-products-->

                        <div class="shipping text-center">
                            <!--shipping-->
                            <img src="../Imagens/home/shipping.jpg" alt="" />
                        </div>
                        <!--/shipping-->

                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items">
                        <!--features_items-->
                        <h2 class="title text-center">Resultados</h2>
                        <div id="order">
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Value="0">Ordenar</asp:ListItem>
                                <asp:ListItem Value="1">Menores Pre&#231;os</asp:ListItem>
                                <asp:ListItem Value="2">Maiores Pre&#231;os</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:Label ID="Label1" runat="server" Text="" Font-Size="Large" Font-Bold="False"></asp:Label>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" ItemStyle-CssClass="col-sm-4">
                            <ItemTemplate>
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <a href="Detalhes.aspx?id=<%# Eval("Id") %>">
                                            <div class="productinfo text-center">
                                                <img src="../Imagens/home/product1.jpg" alt="" />
                                                <h2>R$<asp:Label Text='<%# Eval("Preco") %>' runat="server" ID="PrecoLabel" /></h2>
                                                <p>
                                                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" />
                                                </p>
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Adicionar ao carrinho</a>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectBySearch" TypeName="ECommerce.DAL.DALProduto">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="busca" Name="search" Type="String"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                    <!--features_items-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>
