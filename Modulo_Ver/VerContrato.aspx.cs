using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerContrato : System.Web.UI.Page
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
            TablaEntidades entidad = new TablaEntidades();
            TablaEstado estado = new TablaEstado();
            
            String[] DatosContrato = contrato.DatosContrato(Id_Contrato);

            int ID_Entidad = Convert.ToInt32(DatosContrato[2]);
            String[] datosEntidad = entidad.DatosEntidad(ID_Entidad);

            int Id_estado = Convert.ToInt32(DatosContrato[9]);
            String[] DatosEstado = estado.DatosEntidad(Id_estado);

            
            lbl_Nombre.Text = DatosContrato[0];
            lbl_Entidad.Text = datosEntidad[0];
            lbl_Objeto.Text = DatosContrato[3];
            Lbl_Estado.Text = DatosEstado[1];
            //Decimal valor = Convert.ToDecimal(DatosContrato[8]);
            //string cad = valor.ToString("C2");
            //cad = cad.Replace(",00", "");
            lbl_Valor.Text = (DatosContrato[8] == "")? "$ -" : Convert.ToDecimal(DatosContrato[8]).ToString("C").Replace(",00", ""); //Valor contratado -> Valor del contrato + adicionales
            lbl_valorEjecutado.Text = (DatosContrato[15] == "")? "$ -" : Convert.ToInt64(DatosContrato[15]).ToString("C").Replace(",00", ""); //ValorLiquidado -> Sale del acta de liquidación
            DateTime fechaSuscripcion = Convert.ToDateTime(DatosContrato[4]);
            lbl_fechaSuscripcion.Text = String.Format("{0:dd/MM/yyyy}", fechaSuscripcion);
            DateTime fechainicio = Convert.ToDateTime(DatosContrato[5]);
            lbl_FechaInicio.Text = String.Format("{0:dd/MM/yyyy}", fechainicio);
            DateTime fechafinal = Convert.ToDateTime(DatosContrato[6]);
            lbl_FechaFinal.Text = String.Format("{0:dd/MM/yyyy}", fechafinal);

            if (DatosContrato[7] == null || DatosContrato[7] == "")
            {
                Lbl_ArchivoPdf.Text = "Archivo aun no agregado"; 
            }
            else
            {
                LinkButton_ArchivoPdf.Text = DatosContrato[7];
            }

            
        }
    }

    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Ver/VerDocumentosContratante.aspx");
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

    protected void LinkButton_ArchivoPdf_Click(object sender, EventArgs e)
    {
        TablaContratos contrato = new TablaContratos();
        int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
        String[] datoscontrato = contrato.DatosContrato(Id_Contrato);

            string nombreArchivo = datoscontrato[7];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Contrato/" + nombreArchivo);
            Response.Flush();
            Response.End();
                
    }

    
}