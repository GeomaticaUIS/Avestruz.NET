using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menus_Menu_Informe : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userinfo"] != null)
        {
            TablaUsuarios user = (TablaUsuarios)Session["userinfo"];

            lbl_usuario.Text = "[" + user.Nombre + " " + user.Apellido + "]";
            if (user.Rol == 3)
            {
                Response.Redirect("~/Modulo_Inicio/ListaVer.aspx");
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }

    protected void lbtn_salir_Click(object sender, EventArgs e)
    {
        if (Session["userinfo"] != null)
        {
            Session.Abandon();
        }

        Response.Redirect("~/Default.aspx");
    }
}
