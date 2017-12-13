using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDDepartamento
{
    public partial class Excluir : System.Web.UI.Page
    {
        DAL.DALDepartamento DALDepartamento = new DAL.DALDepartamento();
        Modelo.Departamento Departamento;

        protected void Page_Load(object sender, EventArgs e)
        {
            Departamento = DALDepartamento.Select(Convert.ToInt32(Request["codigo"]));
            Label2.Text = Departamento.Id.ToString();
            Label4.Text = Departamento.Descricao;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                DALDepartamento.Delete(Convert.ToInt32(Request["codigo"]));
                Response.Redirect("Index.aspx");
            }
            catch (SqlException ex)
            {
                if (ex.Number == 547)
                {
                    Label5.Text = "Esse departamento contém categorias relacionadas. Delete-as para poder excluí-lo";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}