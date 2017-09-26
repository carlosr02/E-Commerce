using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao
{
    public partial class CRUDDepartamento1 : System.Web.UI.Page
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
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());
            string descricao = (GridView1.Rows[index].Cells[1].Controls[0] as TextBox).Text;

            Departamento = new Modelo.Departamento(id, descricao);
            DALDepartamento.Update(Departamento);

            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            int id = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

            Departamento = new Modelo.Departamento(id, "");
            DALDepartamento.Delete(Departamento);

            Response.Redirect(Request.RawUrl);
        }
    }
}