using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Ver_DetallesCompromisoAcademico : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID_Compromiso"] != null)
        {
            int idCompromiso = Convert.ToInt32(Request.QueryString["ID_Compromiso"]);
            Session["Id_Compromiso"] = idCompromiso;
            Mostrar(idCompromiso);
        }
    }

    protected void Mostrar(int idCompromiso)
    {
        TablaCompromisosAcademicos compromiso = new TablaCompromisosAcademicos();
        TablaTipoCompromiso nombreTipo = new TablaTipoCompromiso();

        String[] DatosCompromiso = compromiso.DatosCompromiso(idCompromiso);
        
        int Tipo = Convert.ToInt32(DatosCompromiso[1]);
        String[] DatosTipoCompromiso = nombreTipo.DatosTipoCompromiso(Tipo);
        
        lbl_Tipo_producto.Text = DatosTipoCompromiso[1];

        if (DatosCompromiso[0] != "")
        {
            if (DatosCompromiso[0] != null)
            {

                lbl_Nombre.Text = DatosCompromiso[0];
            }
        }
        if (DatosCompromiso[2] != "")
        {
            if (DatosCompromiso[2] != null)
            {
               
                DateTime fechaActa = Convert.ToDateTime(DatosCompromiso[2]);
                Label4.Text = String.Format("{0:dd/MM/yyyy}", fechaActa);
            }
        }
        if (DatosCompromiso[3] != "")
        {
            if (DatosCompromiso[3] != null)
            {
                
                lbl_Descripcion.Text = DatosCompromiso[3];

            }
        }


    }
    
    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        if (Session["Id_Compromiso"] != null)
        {
            Session.Remove("Id_Compromiso");
        }
        Response.Redirect("~/Modulo_Ver/VerCompromisosAcademicos.aspx");
    }
}