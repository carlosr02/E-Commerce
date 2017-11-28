using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDProduto
{
    public partial class Incluir : System.Web.UI.Page
    {
        DAL.DALProduto DALProduto = new DAL.DALProduto();
        Modelo.Produto Produto;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "0") { RequiredFieldValidator4.IsValid = false; }
            else if (DropDownList2.SelectedValue == "0") { RequiredFieldValidator5.IsValid = false; }
            else
            {
                string nome = TextBox1.Text;
                double preco = Convert.ToDouble(TextBox2.Text);
                string marca = TextBox3.Text;
                int qntEmEstoque = Convert.ToInt32(string.IsNullOrEmpty(TextBox4.Text) ? "0" : TextBox4.Text);
                string descricao = TextBox5.Text;
                int categoria_id = Convert.ToInt32(DropDownList2.SelectedValue);

                Produto = new Modelo.Produto(0, nome, preco, marca, qntEmEstoque, null, descricao, false, categoria_id);

                DALProduto.Insert(Produto);

                Response.Redirect("Index.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem("Selecione um departamento", "0"));
        }

        protected void DropDownList2_DataBound(object sender, EventArgs e)
        {
            DropDownList2.Items.Insert(0, new ListItem("Selecione uma categoria", "0"));
        }
    }
}