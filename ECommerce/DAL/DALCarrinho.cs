using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Providers.Entities;

namespace ECommerce.DAL
{
    public class DALCarrinho
    {
        static List<Modelo.ItensCarrinho> Itens = new List<Modelo.ItensCarrinho>();

        [DataObjectMethod(DataObjectMethodType.Select)]
        public List<Modelo.ItensCarrinho> SelectAll()
        {
            return Itens;
        }

        public void AtribuirItens(List<Modelo.ItensCarrinho> aListItensCarrinho)
        {
            Itens = aListItensCarrinho;
        }
    }
}