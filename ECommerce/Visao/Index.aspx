﻿<%@ Page Title="Home | ECommerce" Language="C#" MasterPageFile="~/Visao/PublicMasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ECommerce.Visao.index" StylesheetTheme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="slider">
        <!--slider-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#slider-carousel" data-slide-to="0" class="active"></li>
                            <li data-target="#slider-carousel" data-slide-to="1"></li>
                            <li data-target="#slider-carousel" data-slide-to="2"></li>
                        </ol>

                        <div class="carousel-inner">
                            <div class="item active">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-SHOPPER</h1>
                                    <h2>Free E-Commerce Template</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="../Imagens/home/girl1.jpg" class="girl img-responsive" alt="" />
                                    <img src="../Imagens/home/pricing.png" class="pricing" alt="" />
                                </div>
                            </div>
                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-SHOPPER</h1>
                                    <h2>100% Responsive Design</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="../Imagens/home/girl2.jpg" class="girl img-responsive" alt="" />
                                    <img src="../Imagens/home/pricing.png" class="pricing" alt="" />
                                </div>
                            </div>

                            <div class="item">
                                <div class="col-sm-6">
                                    <h1><span>E</span>-SHOPPER</h1>
                                    <h2>Free Ecommerce Template</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                                    <button type="button" class="btn btn-default get">Get it now</button>
                                </div>
                                <div class="col-sm-6">
                                    <img src="../Imagens/home/girl3.jpg" class="girl img-responsive" alt="" />
                                    <img src="../Imagens/home/pricing.png" class="pricing" alt="" />
                                </div>
                            </div>

                        </div>

                        <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                            <i class="fa fa-angle-left"></i>
                        </a>
                        <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--/slider-->

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="left-sidebar">
                        <h2>Categorias</h2>
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
                                    <div id="<%# Eval("Id") %>" class="panel-collapse collapse">
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
                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items">
                        <!--features_items-->
                        <h2 class="title text-center">Produtos em Destaque</h2>
                        <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" ItemStyle-CssClass="col-sm-4">
                            <ItemTemplate>
                                <div class="product-image-wrapper">
                                    <div class="single-products">
                                        <a href="Detalhes.aspx?id=<%# Eval("Id") %>">
                                            <div class="productinfo text-center">
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Imagem_destaque") %>' />
                                                <h2>R$<asp:Label Text='<%# Eval("Preco") %>' runat="server" ID="PrecoLabel" /></h2>
                                                <p>
                                                    <asp:Label Text='<%# Eval("Nome") %>' runat="server" ID="NomeLabel" />
                                                </p>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default add-to-cart" OnClick="LinkButton1_Click" ToolTip='<%# Eval("Id") %>'><i class="fa fa-shopping-cart"></i>Adicionar ao carrinho</asp:LinkButton>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                        <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAllDestaque" TypeName="ECommerce.DAL.DALProduto"></asp:ObjectDataSource>
                    </div>
                    <!--features_items-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>
