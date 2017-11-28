using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDCategoria
{
    public partial class Alterar : System.Web.UI.Page
    {
        DAL.DALCategoria DALCategoria = new DAL.DALCategoria();
        Modelo.Categoria Categoria;

        protected void Page_Load(object sender, EventArgs e)
        {
            Categoria = DALCategoria.Select(Convert.ToInt32(Request["codigo"]));
            if (!IsPostBack)
            {
                TextBox1.Text = Categoria.Id.ToString();
                TextBox2.Text = Categoria.Descricao;
                DropDownList1.SelectedValue = Categoria.Departamento_id.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Categoria.Descricao = TextBox2.Text;
            Categoria.Departamento_id = Convert.ToInt32(DropDownList1.SelectedValue);

            DALCategoria.Update(Categoria);
            Response.Redirect("Index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}