using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDProduto
{
    public partial class Alterar : System.Web.UI.Page
    {
        DAL.DALProduto DALProduto = new DAL.DALProduto();
        Modelo.Produto Produto;

        protected void Page_Load(object sender, EventArgs e)
        {
            Produto = DALProduto.Select(Convert.ToInt32(Request["codigo"]));
            if (!IsPostBack)
            {
                TextBox1.Text = Produto.Id.ToString();
                TextBox2.Text = Produto.Nome;
                TextBox3.Text = Produto.Preco.ToString();
                TextBox4.Text = Produto.Marca;
                TextBox5.Text = Produto.QntEmEstoque.ToString();
                TextBox6.Text = Produto.Descricao;
                DropDownList1.SelectedValue = Produto.Departamento_id.ToString();
                DropDownList2.SelectedValue = Produto.Categoria_id.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Produto.Nome = TextBox2.Text;
            Produto.Preco = Convert.ToInt32(TextBox3.Text);
            Produto.Marca = TextBox4.Text;
            Produto.QntEmEstoque = Convert.ToInt32(string.IsNullOrEmpty(TextBox5.Text) ? "0" : TextBox5.Text);
            Produto.Descricao = TextBox6.Text;
            Produto.Categoria_id = Convert.ToInt32(DropDownList2.SelectedValue);

            DALProduto.Update(Produto);
            Response.Redirect("Index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}