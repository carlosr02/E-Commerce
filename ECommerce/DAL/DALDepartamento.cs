﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ECommerce.DAL
{
    public class DALDepartamento
    {
        private string connectionString = "";

        public DALDepartamento()
        {
            connectionString = ConfigurationManager.ConnectionStrings
                ["ecommerceConnectionString"].ConnectionString;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.Departamento> SelectAll()
        {
            Modelo.Departamento aDepartamento;
            List<Modelo.Departamento> aListDepartamento = new List<Modelo.Departamento>();

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();

            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Departamento";

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    aDepartamento = new Modelo.Departamento(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string
                        );
                    aListDepartamento.Add(aDepartamento);
                }
            }
            dr.Close();
            conn.Close();
            return aListDepartamento;
        }

        [DataObjectMethod(DataObjectMethodType.Select)]
        public Modelo.Departamento Select(int id)
        {
            Modelo.Departamento aDepartamento;

            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandText = "Select * from Departamento where id = @id";
            cmd.Parameters.AddWithValue("@id", id);

            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            aDepartamento = new Modelo.Departamento(
                        Convert.ToInt32(dr[0]),
                        dr[1] as string
                        );
            dr.Close();
            conn.Close();

            return aDepartamento;
        }

        [DataObjectMethod(DataObjectMethodType.Delete)]
        public void Delete(int id)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("DELETE FROM Departamento WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", id);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Insert)]
        public void Insert(Modelo.Departamento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("INSERT INTO Departamento (descricao) VALUES (@descricao)", conn);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);

            cmd.ExecuteNonQuery();
        }

        [DataObjectMethod(DataObjectMethodType.Update)]
        public void Update(Modelo.Departamento obj)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            SqlCommand com = conn.CreateCommand();
            SqlCommand cmd = new SqlCommand("UPDATE Departamento SET descricao = @descricao WHERE id = @id", conn);
            cmd.Parameters.AddWithValue("@id", obj.Id);
            cmd.Parameters.AddWithValue("@descricao", obj.Descricao);

            cmd.ExecuteNonQuery();
        }
    }
}