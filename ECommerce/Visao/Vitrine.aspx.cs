using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao
{
    public partial class shop : System.Web.UI.Page
    {
        DAL.DALProduto DALProduto = new DAL.DALProduto();
        Modelo.Produto Produto;

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
            if (DataList1.Items.Count == 0) Label1.Text = "Nenhum resultado encontrado";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "0") { ObjectDataSource1.SelectMethod = "SelectBySearch"; }
            else if (DropDownList1.SelectedValue == "1") { ObjectDataSource1.SelectMethod = "SelectBySearchOrdered"; }
            else if (DropDownList1.SelectedValue == "2") { ObjectDataSource1.SelectMethod = "SelectBySearchOrderedDesc"; }
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

                ItemCarrinho = new Modelo.ItensCarrinho(new Guid(), 1, Produto.Id, Produto.Nome, Produto.Preco, Produto.Imagem_destaque);
                ItensCarrinho.Add(ItemCarrinho);

                Session["carrinho"] = ItensCarrinho;
            }

            else
            {
                ItensCarrinho = Session["carrinho"] as List<Modelo.ItensCarrinho>;

                Produto = DALProduto.Select(id);

                ItemCarrinho = new Modelo.ItensCarrinho(new Guid(), 1, Produto.Id, Produto.Nome, Produto.Preco, Produto.Imagem_destaque);
                ItensCarrinho.Add(ItemCarrinho);

                Session["carrinho"] = ItemCarrinho;
            }

            Response.Redirect("~/Visao/Carrinho.aspx");
        }
    }
}