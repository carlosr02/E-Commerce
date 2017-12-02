using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ECommerce.DAL
{
    public class DALProduto
    {
        private string connectionString = "";

        public DALProduto()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["ecommerceConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Produto> SelectAll()
        {
            Modelo.Produto aProduto;
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select p.id, p.nome, p.preco, p.marca, p.qntEmEstoque, p.mediaAvaliacoes, p.descricao, p.emDestaque, dep.id, dep.descricao, p.categoria_id, cat.descricao from Produto p inner join Categoria cat on cat.id = p.categoria_id inner join Departamento dep on dep.id = cat.departamento_id";

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aProduto = new Modelo.Produto(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        dr[3] as string,
                        dr[4] as Nullable<int>,
                        dr[5] as Nullable<double>,
                        dr[6] as string,
                        Convert.ToBoolean(dr[7]),
                        Convert.ToInt32(dr[8]),
                        dr[9] as string,
                        Convert.ToInt32(dr[10]),
                        dr[11] as string
                        );
                    aListProduto.Add(aProduto);
                }
            }
            dr.Close();
            conn.Close();
            return aListProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Produto> SelectBySearch(string search)
        {
            Modelo.Produto aProduto;
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Produto where nome like '%' + @search + '%'";
            cmd.Parameters.AddWithValue("@search", search);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aProduto = new Modelo.Produto(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        dr[3] as string,
                        dr[4] as Nullable<int>,
                        dr[5] as Nullable<double>,
                        dr[6] as string,
                        Convert.ToBoolean(dr[7]),
                        Convert.ToInt32(dr[8])
                        );
                    aListProduto.Add(aProduto);
                }
            }
            dr.Close();
            conn.Close();
            return aListProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Produto> SelectBySearchOrdered(string search)
        {
            Modelo.Produto aProduto;
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Produto where nome like '%' + @search + '%' order by preco";
            cmd.Parameters.AddWithValue("@search", search);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aProduto = new Modelo.Produto(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        dr[3] as string,
                        dr[4] as Nullable<int>,
                        dr[5] as Nullable<double>,
                        dr[6] as string,
                        Convert.ToBoolean(dr[7]),
                        Convert.ToInt32(dr[8])
                        );
                    aListProduto.Add(aProduto);
                }
            }
            dr.Close();
            conn.Close();
            return aListProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Produto> SelectBySearchOrderedDesc(string search)
        {
            Modelo.Produto aProduto;
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Produto where nome like '%' + @search + '%' order by preco desc";
            cmd.Parameters.AddWithValue("@search", search);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aProduto = new Modelo.Produto(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        dr[3] as string,
                        dr[4] as Nullable<int>,
                        dr[5] as Nullable<double>,
                        dr[6] as string,
                        Convert.ToBoolean(dr[7]),
                        Convert.ToInt32(dr[8])
                        );
                    aListProduto.Add(aProduto);
                }
            }
            dr.Close();
            conn.Close();
            return aListProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Produto> SelectAllDestaque()
        {
            Modelo.Produto aProduto;
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Produto where emDestaque = 1";

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aProduto = new Modelo.Produto(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        dr[3] as string,
                        dr[4] as Nullable<int>,
                        dr[5] as Nullable<double>,
                        dr[6] as string,
                        Convert.ToBoolean(dr[7]),
                        Convert.ToInt32(dr[8])
                        );
                    aListProduto.Add(aProduto);
                }
            }
            dr.Close();
            conn.Close();
            return aListProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Produto> SelectAllByCategoria(int categoria_id)
        {
            Modelo.Produto aProduto;
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Produto where categoria_id = @categoria_id";
            cmd.Parameters.AddWithValue("@categoria_id", categoria_id);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aProduto = new Modelo.Produto(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        dr[3] as string,
                        dr[4] as Nullable<int>,
                        dr[5] as Nullable<double>,
                        dr[6] as string,
                        Convert.ToBoolean(dr[7]),
                        Convert.ToInt32(dr[8])
                        );
                    aListProduto.Add(aProduto);
                }
            }
            dr.Close();
            conn.Close();
            return aListProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Produto> SelectAllByDepartamento(Modelo.Departamento obj)
        {
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            List<Modelo.Categoria> aListCategoria = new List<Modelo.Categoria>();

            DALCategoria DALCategoria = new DAL.DALCategoria();
            aListCategoria = DALCategoria.SelectAllByDepartamento(obj.Id);

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            foreach (Modelo.Categoria Categoria in aListCategoria)
            {
                List<Modelo.Produto> dr = SelectAllByCategoria(Categoria.Id);

                if (dr.Count != 0)
                {
                    foreach (Modelo.Produto Produto in dr)
                    {
                        aListProduto.Add(Produto);
                    }
                }
            }

            conn.Close();
            return aListProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Produto Select(int id)
        {
            Modelo.Produto aProduto;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "select p.id, p.nome, p.preco, p.marca, p.qntEmEstoque, p.mediaAvaliacoes, p.descricao, p.emDestaque, dep.id, dep.descricao, p.categoria_id, cat.descricao from Produto p inner join Categoria cat on cat.id = p.categoria_id inner join Departamento dep on dep.id = cat.departamento_id where p.id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();

            aProduto = new Modelo.Produto(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToDouble(dr[2]),
                        dr[3] as string,
                        dr[4] as Nullable<int>,
                        dr[5] as Nullable<double>,
                        dr[6] as string,
                        Convert.ToBoolean(dr[7]),
                        Convert.ToInt32(dr[8]),
                        dr[9] as string,
                        Convert.ToInt32(dr[10]),
                        dr[11] as string
                        );

            dr.Close();
            conn.Close();

            return aProduto;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(int id)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM Produto WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Produto obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO Produto (nome, preco, marca, qntEmEstoque, descricao, categoria_id) VALUES (@nome, @preco, @marca, @qntEmEstoque, @descricao, @categoria_id)", conn);
            cmd.Parameters.AddWithValue("@nome", obj.Nome);
            cmd.Parameters.AddWithValue("@preco", obj.Preco);
            cmd.Parameters.AddWithValue("@marca", obj.Marca);
            cmd.Parameters.AddWithValue("@qntEmEstoque", obj.QntEmEstoque);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@categoria_id", obj.Categoria_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Produto obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE Produto SET nome = @nome, preco = @preco, marca = @marca, qntEmEstoque = @qntEmEstoque, descricao = @descricao, emDestaque = @emDestaque, categoria_id = @categoria_id WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@nome", obj.Nome);
            cmd.Parameters.AddWithValue("@preco", obj.Preco);
            cmd.Parameters.AddWithValue("@marca", obj.Marca);
            cmd.Parameters.AddWithValue("@qntEmEstoque", obj.QntEmEstoque);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@emDestaque", obj.EmDestaque);
            cmd.Parameters.AddWithValue("@categoria_id", obj.Categoria_id);

            cmd.ExecuteNonQuery();
        }
    }
}