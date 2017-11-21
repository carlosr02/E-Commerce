using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerce.Visao
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_OnClick(object sender, EventArgs e)
        {
            if (Membership.ValidateUser(login_email.Text, login_senha.Text))
            {
                FormsAuthentication.SetAuthCookie(login_email.Text, login_checkbox.Checked);
                Response.Redirect("Index.aspx");
            }
        }

        protected void Cadastro_OnClick(object sender, EventArgs e)
        {
            Membership.CreateUser(cadastro_email.Text,cadastro_senha.Text);
            FormsAuthentication.SetAuthCookie(cadastro_email.Text, true);
            Response.Redirect("Index.aspx");
        }
    }
}