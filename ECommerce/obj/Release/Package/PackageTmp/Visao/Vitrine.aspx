﻿    <%@ Page Title="Vitrine | ECommerce" Language="C#" MasterPageFile="~/Visao/MasterPage.Master" AutoEventWireup="true" CodeBehind="Vitrine.aspx.cs" Inherits="ECommerce.Visao.shop" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="advertisement">
        <div class="container">
            <img src="../Imagens/shop/advertisement.jpg" alt="" />
        </div>
    </section>

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

                        <div class="brands_products">
                            <!--brands_products-->
                            <h2>Marcas</h2>
                            <div class="brands-name">
                                <ul class="nav nav-pills nav-stacked">
                                    <li><a href="#"><span class="pull-right">(50)</span>Acne</a></li>
                                    <li><a href="#"><span class="pull-right">(56)</span>Grüne Erde</a></li>
                                    <li><a href="#"><span class="pull-right">(27)</span>Albiro</a></li>
                                    <li><a href="#"><span class="pull-right">(32)</span>Ronhill</a></li>
                                    <li><a href="#"><span class="pull-right">(5)</span>Oddmolly</a></li>
                                    <li><a href="#"><span class="pull-right">(9)</span>Boudestijn</a></li>
                                    <li><a href="#"><span class="pull-right">(4)</span>Rösch creative culture</a></li>
                                </ul>
                            </div>
                        </div>
                        <!--/brands_products-->

                        <div class="price-range">
                            <!--price-range-->
                            <h2>Preço</h2>
                            <div class="well text-center">
                                <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2"><br />
                                <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                            </div>
                        </div>
                        <!--/price-range-->

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
                        <h2 class="title text-center">Features Items</h2>
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
                                                <a href="#" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="choose">
                                        <ul class="nav nav-pills nav-justified">
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
                                            <li><a href="#"><i class="fa fa-plus-square"></i>Add to compare</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllByCategoria" TypeName="ECommerce.DAL.DALProduto">
                            <SelectParameters>
                                <asp:QueryStringParameter QueryStringField="categoria_id" Name="categoria_id" Type="Int32"></asp:QueryStringParameter>
                            </SelectParameters>
                        </asp:ObjectDataSource>                    

                        <ul class="pagination">
                            <li class="active"><a href="">1</a></li>
                            <li><a href="">2</a></li>
                            <li><a href="">3</a></li>
                            <li><a href="">&raquo;</a></li>
                        </ul>
                    </div>
                    <!--features_items-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>
