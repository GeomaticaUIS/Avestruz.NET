using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Ver_VerCompromisosAcademicos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void VerCompromiso_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_compromiso = ((Label)boton2.Parent.FindControl("Id_Compromiso_AcademicoLabel"));

        int idcompromiso = Convert.ToInt32(id_compromiso.Text);

        Response.Redirect("~/Modulo_Ver/DetallesCompromisoAcademico.aspx?ID_Compromiso=" + idcompromiso);
    }
    protected void VerGrupos_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_Tipo = ((Label)boton2.Parent.FindControl("Id_Tipo_CompromisoLabel"));

        int idtipo = Convert.ToInt32(id_Tipo.Text);
        Session["id_tipo"] = idtipo;
        Panel4.Visible = true;
        Panel3.Visible = false;
    }
    protected void Btn_Volver_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel4.Visible = false;
    }
    protected void Btn_Terminar2_Click(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            Session.Remove("ID");
        }
        if (Session["Id_RegistroVie"] != null)
        {
            Session.Remove("Id_RegistroVie");
        }
        if (Session["NombreProyecto"] != null)
        {
            Session.Remove("NombreProyecto");
        }
        if (Session["ID_Contrato"] != null)
        {
            Session.Remove("ID_Contrato");
        }
        if (Session["ID_Producto"] != null)
        {
            Session.Remove("ID_Producto");
        }
        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }
   
}