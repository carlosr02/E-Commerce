using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao
{
    public partial class Carrinho : System.Web.UI.Page
    {
        DAL.DALCarrinho DALCarrinho = new DAL.DALCarrinho();
        List<Modelo.ItensCarrinho> Itens;
        Modelo.ItensCarrinho Item;
        
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
            Itens = Session["carrinho"] as List<Modelo.ItensCarrinho>;
            DALCarrinho.AtribuirItens(Itens);

            double total = 0;

            if(Session["carrinho"] != null) foreach (Modelo.ItensCarrinho i in Itens) total += i.Total;

            Label1.Text = total.ToString();
            Label2.Text = total.ToString();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Excluir")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                Guid codigo = new Guid(GridView1.DataKeys[index].Value.ToString());

                Item = DALCarrinho.Select(codigo);

                Itens = Session["carrinho"] as List<Modelo.ItensCarrinho>;
                Itens.Remove(Item);

                Session["carrinho"] = Itens;

                Response.Redirect(Request.RawUrl);
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            Guid id = new Guid((sender as TextBox).ToolTip);
            
            Item = DALCarrinho.Select(id);
            int qnt = Convert.ToInt32((sender as TextBox).Text);

            Itens = Session["carrinho"] as List<Modelo.ItensCarrinho>;
            Itens.Where(item => item.Id == id).First().Quantidade = qnt;
            Itens.Where(item => item.Id == id).First().Total = qnt * Item.Produto_preco;

            Session["carrinho"] = Itens;
            
            Response.Redirect(Request.RawUrl);
        }
    }
}