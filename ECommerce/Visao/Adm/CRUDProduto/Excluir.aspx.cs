using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDProduto
{
    public partial class Excluir : System.Web.UI.Page
    {
        DAL.DALProduto DALProduto = new DAL.DALProduto();
        DAL.DALImagem DALImagem = new DAL.DALImagem();
        Modelo.Produto Produto;

        protected void Page_Load(object sender, EventArgs e)
        {
            Produto = DALProduto.Select(Convert.ToInt32(Request["codigo"]));
            Label2.Text = Produto.Id.ToString();
            Label4.Text = Produto.Nome;
            Label6.Text = Produto.Preco.ToString();
            Label8.Text = Produto.Marca;
            Label10.Text = Produto.QntEmEstoque.ToString();
            Label12.Text = Produto.MediaAvaliacoes.ToString();
            Label14.Text = Produto.Descricao;
            if(Produto.EmDestaque == true) Label16.Text = "Sim";
            else Label16.Text = "Não";
            Label18.Text = Produto.Departamento;
            Label20.Text = Produto.Categoria;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            List<Modelo.Imagem> Imagens = DALImagem.SelectAllByProduct(Convert.ToInt32(Request["codigo"]));
            if (Imagens.Count != 0)
            {
                foreach (Modelo.Imagem img in Imagens) DALImagem.Delete(img.Id);
                Directory.Delete(Server.MapPath("~/Imagens/produtos/") + Request.QueryString["codigo"],true);
            }
            DALProduto.Delete(Convert.ToInt32(Request["codigo"]));
            Response.Redirect("Index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}