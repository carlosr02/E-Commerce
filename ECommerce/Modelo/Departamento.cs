using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.Modelo
{
    public class Departamento
    {
        private int id;

        public int Id
        {
            get { return id; }
        }
        private string descricao;

        public string Descricao
        {
            get { return descricao; }
            set { descricao = value; }
        }

        public Departamento(int id, string descricao)
        {
            this.id = id;
            this.descricao = descricao;
        }
    }
}