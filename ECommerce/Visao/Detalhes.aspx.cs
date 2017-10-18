using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao
{
    public partial class Detalhes_Produto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.DALProduto DALProduto = new DAL.DALProduto();
            int id = Convert.ToInt32(Request.QueryString["id"]);
            Modelo.Produto Produto = DALProduto.Select(id);

            LabelID.Text += Produto.Id.ToString();
            LabelMarca.Text = Produto.Marca;
            LabelNome.Text = Produto.Nome;
            LabelValor.Text += Produto.Preco.ToString();
        }
    }
}