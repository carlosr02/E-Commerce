<%@ Page Title="Carrinho | ECommerce" Language="C#" MasterPageFile="~/Visao/PublicMasterPage.Master" AutoEventWireup="true" CodeBehind="Carrinho.aspx.cs" Inherits="ECommerce.Visao.Carrinho" Theme="css" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="cart_items">
        <div class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <div class="table-responsive cart_info">
                <!--<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="cart_product">
								<a href=""><img src="../Imagens/cart/one.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>$59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>

						<tr>
							<td class="cart_product">
								<a href=""><img src="../Imagens/cart/two.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>$59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="cart_product">
								<a href=""><img src="../Imagens/cart/three.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>$59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<a class="cart_quantity_up" href=""> + </a>
									<input class="cart_quantity_input" type="text" name="quantity" value="1" autocomplete="off" size="2">
									<a class="cart_quantity_down" href=""> - </a>
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
					</tbody>
				</table>-->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" CssClass="table table-condensed" DataKeyNames="Id" OnRowCommand="GridView1_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Produto_nome" HeaderText="Item" ReadOnly="True" SortExpression="Produto_nome"></asp:BoundField>
                        <asp:BoundField DataField="Produto_preco" HeaderText="Preço" ReadOnly="True" SortExpression="Produto_preco"></asp:BoundField>
                        <asp:TemplateField HeaderText="Quantidade" SortExpression="Quantidade">
                            <EditItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("Quantidade") %>' ID="TextBox1"></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:TextBox runat="server" Text='<%# Bind("Quantidade") %>' ID="TextBox1" OnTextChanged="TextBox1_TextChanged" ToolTip='<%# Eval("Id") %>' TextMode="Number" AutoPostBack="True"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total"></asp:BoundField>
                        <asp:ButtonField Text="Excluir" CommandName="Excluir"></asp:ButtonField>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="Produto_id" HeaderText="Produto_id" ReadOnly="True" SortExpression="Produto_id" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="Produto_imagem_destaque" HeaderText="Produto_imagem_destaque" ReadOnly="True" SortExpression="Produto_imagem_destaque" Visible="False"></asp:BoundField>
                    </Columns>
                </asp:GridView>
                <asp:ObjectDataSource runat="server" ID="ObjectDataSource1" SelectMethod="SelectAll" TypeName="ECommerce.DAL.DALCarrinho">
                </asp:ObjectDataSource>
            </div>
        </div>
    </section>
    <!--/#cart_items-->
    <section id="do_action">
        <div class="container">
            <div class="heading">
                <h3>Finalizar compra</h3>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="total_area">
                        <ul>
                            <li>Subtotal<span>R$<asp:Label ID="Label1" runat="server" Text=""></asp:Label></span></li>
                            <li>Frete <span>Grátis</span></li>
                            <li>Total <span>R$<asp:Label ID="Label2" runat="server" Text=""></asp:Label></span></li>
                        </ul>
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-default check_out" PostBackUrl="~/Visao/Aut/FinalizarCompra.aspx">Finalizar</asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/#do_action-->
</asp:Content>
