<%@ Page Title="Detalhes Produto | ECommerce" Language="C#" MasterPageFile="~/Visao/PublicMasterPage.Master" AutoEventWireup="true" CodeBehind="Detalhes.aspx.cs" Inherits="ECommerce.Visao.Detalhes_Produto" Theme="css" %>

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
                    </div>
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="product-details">
                        <!--product-details-->
                        <div class="col-sm-5">
                            <div class="view-product">
                                <asp:Image ID="Image1" runat="server" />
                            </div>
                            <div id="similar-product" class="carousel slide" data-ride="carousel">

                                <!-- Wrapper for slides -->
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <a href="">
                                            <img src="../Imagens/product-details/similar1.jpg" alt=""></a>
                                        <a href="">
                                            <img src="../Imagens/product-details/similar2.jpg" alt=""></a>
                                        <a href="">
                                            <img src="../Imagens/product-details/similar3.jpg" alt=""></a>
                                    </div>
                                    <div class="item">
                                        <a href="">
                                            <img src="../Imagens/product-details/similar1.jpg" alt=""></a>
                                        <a href="">
                                            <img src="../Imagens/product-details/similar2.jpg" alt=""></a>
                                        <a href="">
                                            <img src="../Imagens/product-details/similar3.jpg" alt=""></a>
                                    </div>
                                    <div class="item">
                                        <a href="">
                                            <img src="../Imagens/product-details/similar1.jpg" alt=""></a>
                                        <a href="">
                                            <img src="../Imagens/product-details/similar2.jpg" alt=""></a>
                                        <a href="">
                                            <img src="../Imagens/product-details/similar3.jpg" alt=""></a>
                                    </div>

                                </div>

                                <!-- Controls -->
                                <a class="left item-control" href="#similar-product" data-slide="prev">
                                    <i class="fa fa-angle-left"></i>
                                </a>
                                <a class="right item-control" href="#similar-product" data-slide="next">
                                    <i class="fa fa-angle-right"></i>
                                </a>
                            </div>

                        </div>
                        <div class="col-sm-7">
                            <div class="product-information">
                                <!--/product-information-->
                                <h2><asp:Label ID="LabelNome" runat="server"></asp:Label></h2>
                                <p>
                                    <asp:Label ID="LabelID" runat="server" Text="ID: "></asp:Label></p>
                                <img src="../Imagens/product-details/rating.png" alt="" /><br />
                                <span>
                                    <asp:Label ID="LabelValor" runat="server" Text="R$"></asp:Label>
                                    <label>Quantidade:</label>
                                    <asp:TextBox ID="TextBox2" runat="server" Text="1"></asp:TextBox>
                                </span>
                                <span>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default add-to-cart" OnClick="LinkButton1_Click" ToolTip='<%# Eval("Id") %>'><i class="fa fa-shopping-cart"></i>Adicionar ao carrinho</asp:LinkButton>
                                </span>
                                <p><b>Disponibilidade:</b> -</p>
                                <p><b>Marca:</b>
                                    <asp:Label ID="LabelMarca" runat="server"></asp:Label></p>
                                <a href="">
                                    <img src="../Imagens/product-details/share.png" class="share img-responsive" alt="" /></a>
                            </div>
                            <!--/product-information-->
                        </div>
                    </div>
                    <!--/product-details-->

                    <div class="category-tab shop-details-tab">
                        <!--category-tab-->
                        <div class="col-sm-12">
                            <ul class="nav nav-tabs">
                                <li><a href="#details" data-toggle="tab">Details</a></li>
                                <li><a href="#companyprofile" data-toggle="tab">Company Profile</a></li>
                                <li><a href="#tag" data-toggle="tab">Tag</a></li>
                                <li class="active"><a href="#reviews" data-toggle="tab">Reviews (5)</a></li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div class="tab-pane fade" id="details">
                                
                            </div>

                            <div class="tab-pane fade" id="companyprofile">
                                
                            </div>

                            <div class="tab-pane fade" id="tag">
                                
                            </div>

                            <div class="tab-pane fade active in" id="reviews">
                                <div class="col-sm-12">
                                    <ul>
                                        <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                        <li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
                                        <li><a href=""><i class="fa fa-calendar-o"></i>31 DEC 2014</a></li>
                                    </ul>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
                                    <p><b>Escreva seu comentário</b></p>
                                    <div>
                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        <b>Avaliações: </b>
                                        <asp:Label ID="Label1" runat="server" Text="-"></asp:Label>
                                        <asp:Button ID="Button1" runat="server" Text="Enviar" CssClass="btn btn-default pull-right" />
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--/category-tab-->
                </div>
            </div>
        </div>
    </section>
</asp:Content>
