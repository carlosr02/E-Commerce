using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.Modelo
{
    public class Categoria
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
        private int departamento_id;

        public int Departamento_id
        {
            get { return departamento_id; }
        }

        private string departamento;

        public string Departamento
        {
            get { return departamento; }
        }

        public Categoria(int id, string descricao, int departamento_id)
        {
            this.id = id;
            this.descricao = descricao;
            this.departamento_id = departamento_id;
        }

        public Categoria(int id, string descricao, string departamento)
        {
            this.id = id;
            this.descricao = descricao;
            this.departamento = departamento;
        }
    }
}