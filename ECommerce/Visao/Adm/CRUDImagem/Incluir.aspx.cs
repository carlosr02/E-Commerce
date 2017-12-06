using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao.Adm.CRUDImagem
{
    public partial class Incluir : System.Web.UI.Page
    {
        DAL.DALImagem DALImagem = new DAL.DALImagem();
        Modelo.Imagem Imagem;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Upload(object sender, EventArgs e)
        {
            try
            {
                string extensao = Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower();
                if (extensao == ".jpeg" || extensao == ".jpg" || extensao == ".png" || extensao == ".gif")
                {
                    Guid codigo = Guid.NewGuid();
                    Directory.CreateDirectory(Server.MapPath("~/Imagens/produtos/") + Request.QueryString["produto_id"]);
                    
                    Imagem = new Modelo.Imagem(0,
                        Request.QueryString["produto_id"] + "/" + codigo + extensao, 
                        Convert.ToInt32(Request.QueryString["produto_id"]));

                    DALImagem.Insert(Imagem);
                    
                    string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Imagens/produtos/") + Request.QueryString["produto_id"] + "/" + codigo + extensao);
                    Response.Redirect("Index.aspx?produto_id=" + Request.QueryString["produto_id"]);
                }
                else throw new Exception();
            }

            catch (Exception ex) 
            {
                Label2.Text = "A imagem deve ter formato .jpeg, .jpg, .png ou .gif";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx?produto_id=" + Request.QueryString["produto_id"]);
        }
    }
}