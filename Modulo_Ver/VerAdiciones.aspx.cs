using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerAdiciones : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton linkboton2 = ((LinkButton)sender);
        Label id_adicion = ((Label)linkboton2.Parent.FindControl("Id_OtrosíLabel"));
        int Id_Adicion = Convert.ToInt32(id_adicion.Text);

        TablaAdiciones adicion = new TablaAdiciones();
        String[] datosadicion = adicion.DatosAdicion(Id_Adicion);

        if (datosadicion[5] != null)
        {
            string nombreArchivo = datosadicion[5];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Adiciones/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
    }
    
    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Ver/VerProductos.aspx");
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

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}