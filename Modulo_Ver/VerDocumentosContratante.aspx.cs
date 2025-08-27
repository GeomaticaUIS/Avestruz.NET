using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Ver_VerDocumentosContratante : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id_contrato = Convert.ToInt32(Session["ID_Contrato"]);
        if (Session["ID_Contrato"] == null || id_contrato == 0)
        {
            Response.Redirect("~/Otros/ContratoVacio.aspx");
        }
        else
        {
            int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
            TablaContratos contrato = new TablaContratos();
            String[] DatosContrato = contrato.DatosContrato(Id_Contrato);

            if (DatosContrato[10] != null)
            {
                Link_Carta.Text = DatosContrato[10];
            }
            else
            {
                Label1.Text = "No se ha subido el archivo aun";
            }


            if (DatosContrato[11] != null)
            {
                Link_Termino.Text = DatosContrato[11];
            }
            else
            {
                Label2.Text = "No se ha subido el archivo aun";
            }


            if (DatosContrato[12] != null)
                Link_estudio.Text = DatosContrato[12];
            else
                Label3.Text = "No se ha subido el archivo aun";


            if (DatosContrato[13] != null)
                Link_Certificado.Text = DatosContrato[13];
            else
                Label4.Text = "No se ha subido el archivo aun";

            if (DatosContrato[14] != null)
                Link_Registro.Text = DatosContrato[14];
            else
                Label5.Text = "No se ha subido el archivo aun";
        }
    }

    protected void Link_estudio_Click(object sender, EventArgs e)
    {
        TablaContratos contrato = new TablaContratos();
        int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
        String[] datoscontrato = contrato.DatosContrato(Id_Contrato);

        if (datoscontrato[12] != null)
        {
            string nombreArchivo = datoscontrato[12];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Contrato/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
        else
        {
            Label1.Text = "No se ha subido el archivo aun";
        }
    }
    protected void Link_Carta_Click(object sender, EventArgs e)
    {
        TablaContratos contrato = new TablaContratos();
        int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
        String[] datoscontrato = contrato.DatosContrato(Id_Contrato);

        if (datoscontrato[10] != null)
        {
            string nombreArchivo = datoscontrato[10];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Contrato/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
        else
        {
            Label2.Text = "No se ha subido el archivo aun";
        }
    }
    protected void Link_Certificado_Click(object sender, EventArgs e)
    {
        TablaContratos contrato = new TablaContratos();
        int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
        String[] datoscontrato = contrato.DatosContrato(Id_Contrato);

        if (datoscontrato[13] != null)
        {
            string nombreArchivo = datoscontrato[13];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Contrato/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
        else
        {
            Label3.Text = "No se ha subido el archivo aun";
        }
    }

    protected void Link_Termino_Click(object sender, EventArgs e)
    {
        TablaContratos contrato = new TablaContratos();
        int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
        String[] datoscontrato = contrato.DatosContrato(Id_Contrato);

        if (datoscontrato[11] != null)
        {
            string nombreArchivo = datoscontrato[11];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Contrato/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
        else
        {
            Label4.Text = "No se ha subido el archivo aun";
        }
    }

    protected void Link_Registro_Click(object sender, EventArgs e)
    {
        TablaContratos contrato = new TablaContratos();
        int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
        String[] datoscontrato = contrato.DatosContrato(Id_Contrato);

        if (datoscontrato[14] != null)
        {
            string nombreArchivo = datoscontrato[14];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Contrato/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
        else
        {
            Label5.Text = "No se ha subido el archivo aun";
        }
    }
    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Ver/VerActas.aspx");
    }
    protected void Btn_Enviar_Form_Usuario0_Click(object sender, EventArgs e)
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