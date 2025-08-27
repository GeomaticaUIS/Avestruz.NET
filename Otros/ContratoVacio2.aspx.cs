using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Otros_ContratoVacio2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_NuevoProyecto/cProductos.aspx");
    }
    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        Session.Remove("registroVie");
        Session.Remove("Id_Proyecto");
        if (Session["Id_producto"] != null)
        {
            Session.Remove("Id_producto");
        }
        if (Session["Id_Contrato"] != null)
        {
            Session.Remove("Id_Contrato");
        }
        if (Session["Ultimo"] != null)
        {
            Session.Remove("Ultimo");
        }

        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }
}