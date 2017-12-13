using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDCategoria
{
    public partial class Excluir : System.Web.UI.Page
    {
        DAL.DALCategoria DALCategoria = new DAL.DALCategoria();
        Modelo.Categoria Categoria;

        protected void Page_Load(object sender, EventArgs e)
        {
            Categoria = DALCategoria.Select(Convert.ToInt32(Request["codigo"]));
            Label2.Text = Categoria.Id.ToString();
            Label4.Text = Categoria.Descricao;
            Label6.Text = Categoria.Departamento;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DALCategoria.Delete(Convert.ToInt32(Request["codigo"]));
                Response.Redirect("Index.aspx");
            }
            catch (SqlException ex)
            {
                if (ex.Number == 547)
                {
                    Label7.Text = "Essa categoria contém produtos relacionados. Delete-os para poder excluí-la";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}