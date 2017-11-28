using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDCategoria
{
    public partial class Incluir : System.Web.UI.Page
    {
        DAL.DALCategoria DALCategoria = new DAL.DALCategoria();
        Modelo.Categoria Categoria;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "0") { RequiredFieldValidator2.IsValid = false; }
            else
            {
                string descricao = TextBox1.Text;
                int departamento_id = Convert.ToInt32(DropDownList1.SelectedValue);

                Categoria = new Modelo.Categoria(0, descricao, departamento_id);

                DALCategoria.Insert(Categoria);

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
    }
}