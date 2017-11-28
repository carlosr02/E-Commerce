using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDDepartamento
{
    public partial class Incluir : System.Web.UI.Page
    {
        DAL.DALDepartamento DALDepartamento = new DAL.DALDepartamento();
        Modelo.Departamento Departamento;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string descricao = TextBox1.Text;

            Departamento = new Modelo.Departamento(0, descricao);

            DALDepartamento.Insert(Departamento);

            Response.Redirect("Index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}