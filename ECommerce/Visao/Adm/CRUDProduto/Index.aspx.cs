using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDProduto
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Alterar")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                int codigo = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

                Response.Redirect("Alterar.aspx?codigo=" + codigo);
            }

            if (e.CommandName == "Excluir")
            {
                int index = Convert.ToInt32(e.CommandArgument);

                int codigo = Convert.ToInt32(GridView1.DataKeys[index].Value.ToString());

                Response.Redirect("Excluir.aspx?codigo=" + codigo);
            }
        }
    }
}