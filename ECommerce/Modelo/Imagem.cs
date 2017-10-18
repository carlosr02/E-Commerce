using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.Modelo
{
    public class Imagem
    {
        private int id;

        public int Id
        {
            get { return id; }
        }
        private string url;

        public string Url
        {
            get { return url; }
        }
        private int produto_id;

        public int Produto_id
        {
            get { return produto_id; }
        }

        public Imagem(int id, string url, int produto_id)
        {
            this.id = id;
            this.url = url;
            this.produto_id = produto_id;
        }
    }
}