using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDDepartamento
{
    public partial class Alterar : System.Web.UI.Page
    {
        DAL.DALDepartamento DALDepartamento = new DAL.DALDepartamento();
        Modelo.Departamento Departamento;

        protected void Page_Load(object sender, EventArgs e)
        {
            Departamento = DALDepartamento.Select(Convert.ToInt32(Request["codigo"]));
            if (!IsPostBack)
            {
                TextBox1.Text = Departamento.Id.ToString();
                TextBox2.Text = Departamento.Descricao;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Departamento.Descricao = TextBox2.Text;

            DALDepartamento.Update(Departamento);
            Response.Redirect("Index.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }
    }
}