﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce
{
    public partial class AutMasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Vitrine.aspx?busca=" + Busca.Text);
        }

        protected void LoginStatus1_LoggedOut(object sender, EventArgs e)
        {
            Response.Redirect("~/Visao/Index.aspx");
        }
    }
}