using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Inicio_Buscar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void VerProyecto_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_proy = ((Label)boton2.Parent.FindControl("Id_ProyectoLabel"));

        int idproy = Convert.ToInt32(id_proy.Text);

        Response.Redirect("~/Modulo_Ver/Consulta.aspx?ID_Proy=" + id_proy.Text);
    }
}