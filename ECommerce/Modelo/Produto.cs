using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.Modelo
{
    public class Produto
    {
        private int id;

        public int Id
        {
            get { return id; }
        }
        private string nome;

        public string Nome
        {
            get { return nome; }
            set { nome = value; }
        }
        private double preco;

        public double Preco
        {
            get { return preco; }
            set { preco = value; }
        }
        private string marca;

        public string Marca
        {
            get { return marca; }
            set { marca = value; }
        }
        private Nullable<int> qntEmEstoque;

        public Nullable<int> QntEmEstoque
        {
            get { return qntEmEstoque; }
            set { qntEmEstoque = value; }
        }
        private Nullable<double> mediaAvaliacoes;

        public Nullable<double> MediaAvaliacoes
        {
            get { return mediaAvaliacoes; }
        }
        private string descricao;

        public string Descricao
        {
            get { return descricao; }
            set { descricao = value; }
        }
        private bool emDestaque;

        public bool EmDestaque
        {
            get { return emDestaque; }
            set { emDestaque = value; }
        }
        private int departamento_id;

        public int Departamento_id
        {
            get { return departamento_id; }
            set { departamento_id = value; }
        }
        private string departamento;

        public string Departamento
        {
            get { return departamento; }
        }
        private int categoria_id;

        public int Categoria_id
        {
            get { return categoria_id; }
            set { categoria_id = value; }
        }
        private string categoria;

        public string Categoria
        {
            get { return categoria; }
        }

        public Produto(int id, string nome, double preco, string marca, Nullable<int> qntEmEstoque, Nullable<double> mediaAvaliacoes, string descricao, bool emDestaque, int categoria_id)
        {
            this.id = id;
            this.nome = nome;
            this.preco = preco;
            this.marca = marca;
            this.qntEmEstoque = qntEmEstoque;
            this.mediaAvaliacoes = mediaAvaliacoes;
            this.descricao = descricao;
            this.emDestaque = emDestaque;
            this.categoria_id = categoria_id;
        }

        public Produto(int id, string nome, double preco, string marca, Nullable<int> qntEmEstoque, Nullable<double> mediaAvaliacoes, string descricao, bool emDestaque, int departamento_id, string departamento, int categoria_id, string categoria)
        {
            this.id = id;
            this.nome = nome;
            this.preco = preco;
            this.marca = marca;
            this.qntEmEstoque = qntEmEstoque;
            this.mediaAvaliacoes = mediaAvaliacoes;
            this.descricao = descricao;
            this.emDestaque = emDestaque;
            this.departamento_id = departamento_id;
            this.departamento = departamento;
            this.categoria_id = categoria_id;
            this.categoria = categoria;
        }
    }
}