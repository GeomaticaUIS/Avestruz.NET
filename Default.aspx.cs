using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    Autenticacion auth = new Autenticacion();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void btn_ingresar_Click(object sender, EventArgs e)
    {
        
        if (Page.IsValid)
        {
            String login = txtUsuario.Text.Trim();
            String password = txtContraseña.Text.Trim();
            bool verificado = auth.AutenticarUsuario(login, password);
            if (verificado == true) //usuario verificado
            {

                TablaUsuarios userinfo = auth.DatosUsuarioValidado(login, password);
                Session["userinfo"] = userinfo;
                string nombrei = userinfo.Nombre;
                int id_rol = userinfo.Rol;
                Response.Cookies["userinfo"].Expires = DateTime.Now.AddDays(20);
                //Generamos el menú para el rol del usuario
                //GenerarMenu();
                if (id_rol == 1 || id_rol == 2)
                {
					
                    Response.Redirect("~/Modulo_Inicio/Lista.aspx");
                }
                else
                {
                    Response.Redirect("~/Modulo_Inicio/ListaVer.aspx");
                }
            }

            else
            {
                //Label1.Text = "Login y/o contraseña de usuario incorrecto";
                LinkButton1.Text = "Login y/o contraseña de usuario incorrecto";
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        LinkButton1.Attributes.Add("onclick", "return confirm('Si ha olvidado su cuenta, comuniquese al siguiente correo:      carlos.ivan.obregon@hotmail.com');");
    }

    protected void tbx_login_TextChanged(object sender, EventArgs e)
    {
		
    }
}