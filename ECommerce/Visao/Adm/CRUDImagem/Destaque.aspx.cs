using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDImagem
{
    public partial class Destaque : System.Web.UI.Page
    {
        DAL.DALProduto DALProduto = new DAL.DALProduto();
        Modelo.Produto Produto;

        DAL.DALImagem DALImagem = new DAL.DALImagem();
        Modelo.Imagem Imagem;

        protected void Page_Load(object sender, EventArgs e)
        { 

        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType
      != ListItemType.AlternatingItem)
                return;

            RadioButton rdo = (RadioButton)e.Item.FindControl("RadioButton1");
            string script =
               "SetUniqueRadioButton('DataList1.*Destaque',this)";
            rdo.Attributes.Add("onclick", script);

            Imagem = DALImagem.SelectDestaque();
            if (Imagem != null)
                if (rdo.ToolTip == Imagem.Id.ToString()) rdo.Checked = true;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                var botao = item.FindControl("RadioButton1") as RadioButton;
                if (botao.Checked)
                {
                    Produto = DALProduto.Select(Convert.ToInt32(Request.QueryString["produto_id"]));
                    Imagem = DALImagem.Select(Convert.ToInt32(botao.ToolTip));
                    string imagem_destaque = Produto.Imagem_destaque.Substring(19);

                    Produto.Imagem_destaque = Produto.Imagem_destaque.Replace(imagem_destaque, Imagem.Url);
                    DALProduto.Update(Produto);

                    Imagem = DALImagem.SelectDestaque();
                    if (Imagem != null)
                    {
                        Imagem.Destaque = false;
                        DALImagem.Update(Imagem);
                    }

                    Imagem = DALImagem.Select(Convert.ToInt32(botao.ToolTip));
                    Imagem.Destaque = true;
                    DALImagem.Update(Imagem);
                }
            }
            Response.Redirect("Index.aspx?produto_id=" + Request.QueryString["produto_id"]);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx?produto_id=" + Request.QueryString["produto_id"]);
        }
    }
}