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
            cmd.CommandText = "Select * from Produto";
            
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
                        Convert.ToInt32(dr[4]),
                        Convert.ToDouble(dr[5]),
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
        public List<Modelo.Produto> Select(string id)
        {

            Modelo.Produto aProduto;
            List<Modelo.Produto> aListProduto = new List<Modelo.Produto>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Produto Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

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
                        Convert.ToInt32(dr[4]),
                        Convert.ToDouble(dr[5]),
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

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Produto obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM Produto WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Produto obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO Produto (nome, preco, marca, qntEmEstoque, ) VALUES (@descricao)", conn);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Produto obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE Produto SET descricao = @descricao WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);

            cmd.ExecuteNonQuery();
        }
    }
}