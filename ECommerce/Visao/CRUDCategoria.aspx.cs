using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao
{
    public partial class CRUD1 : System.Web.UI.Page
    {
        DAL.DALCategoria DALCategoria = new DAL.DALCategoria();
        Modelo.Categoria Categoria;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string descricao = TextBox1.Text;
            int departamento_id = Convert.ToInt32(DropDownList1.SelectedValue);
            Categoria = new Modelo.Categoria(0, descricao, departamento_id);
            DALCategoria.Insert(Categoria);
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());
            string descricao = (GridView1.Rows[index].Cells[1].Controls[0] as TextBox).Text;
            int departamento_id = Convert.ToInt32((GridView1.Rows[index].Cells[2].Controls[0] as TextBox).Text);

            Categoria = new Modelo.Categoria(id, descricao, departamento_id);
            DALCategoria.Update(Categoria);

            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

            Categoria = new Modelo.Categoria(id, "", 0);
            DALCategoria.Delete(Categoria);

            Response.Redirect(Request.RawUrl);
        }
    }
}