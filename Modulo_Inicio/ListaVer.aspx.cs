using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Inicio_ListaVer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            Session.Remove("ID");

            if (Session["Id_RegistroVie"] != null)
                Session.Remove("Id_RegistroVie");

            if (Session["NombreProyecto"] != null)
                Session.Remove("NombreProyecto");

            if (Session["ID_Contrato"] != null)
                Session.Remove("ID_Contrato");

            if (Session["ID_Producto"] != null)
                Session.Remove("ID_Producto");

            if (Session["ID_acta"] != null)
                Session.Remove("ID_acta");

            if (Session["ValorProyecto"] != null)
                Session.Remove("ValorProyecto");

            if (Session["Ultimo"] != null)
                Session.Remove("Ultimo");

            if (Session["ID_adicion"] != null)
                Session.Remove("ID_adicion");

            if (Session["ID_producto"] != null)
                Session.Remove("ID_producto");


        }
    }

    protected void VerProyecto_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_proy = ((Label)boton2.Parent.FindControl("Id_ProyectoLabel"));

        int idproy = Convert.ToInt32(id_proy.Text);

        Response.Redirect("~/Modulo_Ver/Consulta.aspx?ID_Proy=" + id_proy.Text);
    }
    protected void Btn_Mostrar_Click(object sender, EventArgs e)
    {
        Session["Palabra_Buscar"] = Tbx_Buscar.Text;
        Response.Redirect("~/Modulo_Inicio/Buscar.aspx");
    }
}