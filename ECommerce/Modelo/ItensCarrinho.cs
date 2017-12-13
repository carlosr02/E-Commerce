using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.Modelo
{
    public class ItensCarrinho
    {
        private Guid id;

        public Guid Id
        {
            get { return id; }
        }
        private int quantidade;

        public int Quantidade
        {
            get { return quantidade; }
            set { quantidade = value; }
        }
        private double total;

        public double Total
        {
            get { return total; }
            set { total = value; }
        }
        private int produto_id;

        public int Produto_id
        {
            get { return produto_id; }
        }
        private string produto_nome;

        public string Produto_nome
        {
            get { return produto_nome; }
        }
        private double produto_preco;

        public double Produto_preco
        {
            get { return produto_preco; }
        }
        private string produto_imagem_destaque;

        public string Produto_imagem_destaque
        {
            get { return produto_imagem_destaque; }
        }

        public ItensCarrinho() { }

        public ItensCarrinho(Guid id, int quantidade, double total, int produto_id, string produto_nome, double produto_preco, string produto_imagem_destaque)
        {
            this.id = id;
            this.quantidade = quantidade;
            this.total = total;
            this.produto_id = produto_id;
            this.produto_nome = produto_nome;
            this.produto_preco = produto_preco;
            this.produto_imagem_destaque = produto_imagem_destaque;
        }
    }
}