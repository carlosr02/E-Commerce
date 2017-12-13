using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ECommerce.DAL
{
    public class DALImagem
    {
        private string connectionString = "";

        public DALImagem()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["ecommerceConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Imagem> SelectAllByProduct(int produto_id)
        {
            Modelo.Imagem aImagem;
            List<Modelo.Imagem> aListImagem = new List<Modelo.Imagem>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Imagem where produto_id = @produto_id";
            cmd.Parameters.AddWithValue("@produto_id", produto_id);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aImagem = new Modelo.Imagem(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToInt32(dr[2])
                        );
                    aListImagem.Add(aImagem);
                }
            }
            dr.Close();
            conn.Close();
            return aListImagem;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Imagem Select(int id)
        {
            Modelo.Imagem aImagem;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Imagem where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            aImagem = new Modelo.Imagem(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToInt32(dr[2])
                        );
            dr.Close();
            conn.Close();

            return aImagem;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Imagem SelectDestaque()
        {
            Modelo.Imagem aImagem;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Imagem where destaque = 1";

            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            if (dr.HasRows)
            {
                aImagem = new Modelo.Imagem(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToBoolean(dr[2]),
                        Convert.ToInt32(dr[3])
                        );
            }
            else aImagem = null;
            dr.Close();
            conn.Close();

            return aImagem;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(int id)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM Imagem WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Imagem obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO Imagem (url, produto_id) VALUES (@url, @produto_id)", conn);
            cmd.Parameters.AddWithValue("@url", obj.Url);
            cmd.Parameters.AddWithValue("@produto_id", obj.Produto_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Imagem obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE Imagem SET destaque = @destaque WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@destaque", obj.Destaque);

            cmd.ExecuteNonQuery();
        }
    }
}