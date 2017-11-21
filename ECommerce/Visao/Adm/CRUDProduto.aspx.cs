using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm
{
    public partial class CRUD : System.Web.UI.Page
    {
        DAL.DALProduto DALProduto = new DAL.DALProduto();
        Modelo.Produto Produto;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string nome = TextBox1.Text;
            double preco = Convert.ToDouble(TextBox2.Text);
            string marca = TextBox3.Text;
            string descricao = TextBox4.Text;
            int categoria_id = Convert.ToInt32(DropDownList1.SelectedValue);

            Produto = new Modelo.Produto(0, nome, preco, marca, 0, 0, descricao, false, categoria_id);
            DALProduto.Insert(Produto);
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());
            string nome = (GridView1.Rows[index].Cells[1].Controls[0] as TextBox).Text;
            double preco = Convert.ToDouble((GridView1.Rows[index].Cells[2].Controls[0] as TextBox).Text);
            string marca = (GridView1.Rows[index].Cells[3].Controls[0] as TextBox).Text;
            int qntEmEstoque = Convert.ToInt32((GridView1.Rows[index].Cells[4].Controls[0] as TextBox).Text);
            string descricao = (GridView1.Rows[index].Cells[6].Controls[0] as TextBox).Text;
            bool emDestaque = Convert.ToBoolean((GridView1.Rows[index].Cells[7].Controls[0] as CheckBox).Checked);
            int categoria_id = Convert.ToInt32((GridView1.Rows[index].Cells[8].Controls[0] as TextBox).Text);

            Produto = new Modelo.Produto(id, nome, preco, marca, qntEmEstoque, 0, descricao, emDestaque, categoria_id);
            DALProduto.Update(Produto);

            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

            Produto = new Modelo.Produto(id, "", 0, "", 0, 0, "", false, 0);
            DALProduto.Delete(Produto);

            Response.Redirect(Request.RawUrl);
        }
    }
}