using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerActas : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
       
        
    }

    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        LinkButton linkboton2 = ((LinkButton)sender);
        Label id_acta = ((Label)linkboton2.Parent.FindControl("Id_ActasLabel"));
        int Id_Acta = Convert.ToInt32(id_acta.Text);

        TablaActas acta = new TablaActas();
        String[] datosacta = acta.DatosActa(Id_Acta);

        if (datosacta[4] != null)
        {
            string nombreArchivo = datosacta[4];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Actas/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
    }

    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Ver/VerAdiciones.aspx");
    }

    protected void Btn_Terminar_Click(object sender, EventArgs e)
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