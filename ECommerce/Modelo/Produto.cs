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
        private int qntEmEstoque;

        public int QntEmEstoque
        {
            get { return qntEmEstoque; }
            set { qntEmEstoque = value; }
        }
        private double mediaAvaliacoes;

        public double MediaAvaliacoes
        {
            get { return mediaAvaliacoes; }
            set { mediaAvaliacoes = value; }
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
        private int categoria_id;

        public int Categoria_id
        {
            get { return categoria_id; }
            set { categoria_id = value; }
        }

        public Produto(int id, string nome, double preco, string marca, int qntEmEstoque, double mediaAvaliacoes, string descricao, bool emDestaque, int categoria_id)
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
    }
}