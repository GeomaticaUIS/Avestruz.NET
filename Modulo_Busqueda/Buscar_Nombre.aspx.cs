using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Modulo_Busqueda_Buscar_Nombre : System.Web.UI.Page
{
	
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_Mostrar_Click(object sender, EventArgs e)
    {
        Session["Palabra_Buscar"] = Txt_Buscar.Text;
        Response.Redirect("~/Modulo_Inicio/Buscar2.aspx");
    }
    protected void VerProyecto_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_proy = ((Label)boton2.Parent.FindControl("Id_ProyectoLabel"));

        int idproy = Convert.ToInt32(id_proy.Text);

        Response.Redirect("~/Modulo_Ver/Consulta.aspx?ID_Proy=" + id_proy.Text);
    }
    protected void EditarProyecto_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_proy = ((Label)boton2.Parent.FindControl("Id_ProyectoLabel"));

        int idproy = Convert.ToInt32(id_proy.Text);

        Response.Redirect("~/Modulo_Modificar/ModInfoGeneral.aspx?ID_Proy=" + id_proy.Text);
    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
	
}