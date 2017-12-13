using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao
{
    public partial class Detalhes_Produto : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            MembershipUser user;
            if (User.Identity.IsAuthenticated)
            {
                user = Membership.GetUser();
                string[] roles = Roles.GetRolesForUser();
                if (roles.Contains("Adm")) { this.Page.MasterPageFile = "/Visao/Adm/AdmMasterPage.Master"; }
                else this.Page.MasterPageFile = "/Visao/Aut/AutMasterPage.Master";
            }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.DALProduto DALProduto = new DAL.DALProduto();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Modelo.Produto Produto = DALProduto.Select(id);

            Image1.ImageUrl = Produto.Imagem_destaque;
            LabelID.Text += Produto.Id.ToString();
            LabelMarca.Text = Produto.Marca;
            LabelNome.Text = Produto.Nome;
            LabelValor.Text += Produto.Preco.ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            DAL.DALProduto DALProduto = new DAL.DALProduto();
            Modelo.Produto Produto;

            Modelo.ItensCarrinho ItemCarrinho;
            List<Modelo.ItensCarrinho> ItensCarrinho;

            int id = Convert.ToInt32((sender as LinkButton).ToolTip);

            if (Session["carrinho"] == null)
            {
                ItensCarrinho = new List<Modelo.ItensCarrinho>();

                Produto = DALProduto.Select(id);

                if (ItensCarrinho.Where(item => item.Produto_id == id).First() == null)
                {
                    ItemCarrinho = new Modelo.ItensCarrinho(new Guid(), 1, Produto.Preco, Produto.Id, Produto.Nome, Produto.Preco, Produto.Imagem_destaque);
                    ItensCarrinho.Add(ItemCarrinho);

                    Session["carrinho"] = ItensCarrinho;
                }
            }

            else
            {
                ItensCarrinho = Session["carrinho"] as List<Modelo.ItensCarrinho>;

                Produto = DALProduto.Select(id);

                if (ItensCarrinho.Where(item => item.Produto_id == id).First() == null)
                {
                    ItemCarrinho = new Modelo.ItensCarrinho(new Guid(), 1, Produto.Preco, Produto.Id, Produto.Nome, Produto.Preco, Produto.Imagem_destaque);
                    ItensCarrinho.Add(ItemCarrinho);

                    Session["carrinho"] = ItensCarrinho;
                }
            }

            Response.Redirect("~/Visao/Carrinho.aspx");
        }
    }
}