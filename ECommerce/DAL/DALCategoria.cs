using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ECommerce.DAL
{
    public class DALCategoria
    {
        private string connectionString = "";

        public DALCategoria()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["ecommerceConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Categoria> SelectAll()
        {
            Modelo.Categoria aCategoria;
            List<Modelo.Categoria> aListCategoria = new List<Modelo.Categoria>();
            
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Categoria";
            
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aCategoria = new Modelo.Categoria(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToInt32(dr[2])
                        );
                    aListCategoria.Add(aCategoria);
                }
            }
            dr.Close();
            conn.Close();
            return aListCategoria;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Categoria> Select(string id)
        {

            Modelo.Categoria aCategoria;
            List<Modelo.Categoria> aListCategoria = new List<Modelo.Categoria>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Categoria Where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aCategoria = new Modelo.Categoria(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string,
                        Convert.ToInt32(dr[2])
                        );
                    aListCategoria.Add(aCategoria);
                }
            }
            dr.Close();
            conn.Close();

            return aListCategoria;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(Modelo.Categoria obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM Categoria WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.Id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Categoria obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO Categoria (descricao, departamento_id) VALUES (@descricao,@departamento_id)", conn);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@departamento_id", obj.Departamento_id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Categoria obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE Categoria SET descricao = @descricao, departamento_id = @departamento_id WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);
            cmd.Parameters.AddWithValue("@departamento_id", obj.Departamento_id);

            cmd.ExecuteNonQuery();
        }
    }
}