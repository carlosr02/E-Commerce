using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDImagem
{
    public partial class Index : System.Web.UI.Page
    {
        DAL.DALImagem DALImagem = new DAL.DALImagem();
        Modelo.Imagem Imagem;
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Incluir.aspx?produto_id=" + Request.QueryString["produto_id"]);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Imagem = DALImagem.Select(Convert.ToInt32((sender as Button).ToolTip));
            
            DALImagem.Delete(Imagem.Id);
            File.Delete(Server.MapPath("~/Imagens/produtos/") + Imagem.Url);

            Response.Redirect(Request.RawUrl);
        }
    }
}