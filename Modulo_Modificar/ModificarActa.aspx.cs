using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zModificar_ModificarActa : System.Web.UI.Page
{

    String tipo, fechaActa, Descripcion, archivoPdf, fechaActividad;

    protected void Page_Load(object sender, EventArgs e)
    {        
        if (!Page.IsPostBack)
        {                        
            if (Request.QueryString["ID_Acta"] != null && Session["ID_acta"] == null)
            {
                int idActa = Convert.ToInt32(Request.QueryString["ID_Acta"]);
                Session["ID_acta"] = idActa;
                Mostrar(idActa);
            }
            if (Session["ID_acta"] != null)
            {
                int id_acta = Convert.ToInt32(Session["ID_acta"]);
                Mostrar(id_acta);
            }
        }

        tipo = DropDownList1.Text; //Captura el tipo de Acta que se va a editar
        fechaActa = Txt_fechaActa.Text;
        Descripcion = Txt_descripcion.Text;
        archivoPdf = Subir_ActaPdf.FileName;
        fechaActividad = tbx_FechaActividad.Text;
    }

    protected void Mostrar(int id_acta)
    {
        TablaActas acta = new TablaActas();
        int Idacta = id_acta;
        String[] DatosActa = acta.DatosActa(Idacta);
        Lbl_Estado.Text = Convert.ToString(Session["Valor_Lista"]);
        DropDownList1.Text = DatosActa[0];
        DateTime fechaacta = Convert.ToDateTime(DatosActa[2]);
        Txt_fechaActa.Text = String.Format("{0:dd/MM/yyyy}", fechaacta);
        Txt_descripcion.Text = DatosActa[3];

        if (DatosActa[4] == null || DatosActa[4] == "")
        {
            Label2.Text = "Archivo no agregado";
        }
        else
        {
            archivoPdf = DatosActa[4];
            Label2.Text = "Archivo Agregado";
        }

        int valor = Convert.ToInt32(DatosActa[0]);// tipo acta
        if (valor == 1 || valor == 11 || valor == 12 || valor == 4 ) 
        {
            Label1.Visible = true;
            tbx_FechaActividad.Enabled = false;
            tbx_FechaActividad.Visible = true;
            if (DatosActa[5] == null || DatosActa[5] == "")
            {
                tbx_FechaActividad.Text = null;//revisar
            }
            else
            {
                DateTime fecha_Actividad = Convert.ToDateTime(DatosActa[5]);
                tbx_FechaActividad.Text = String.Format("{0:dd/MM/yyyy}", fecha_Actividad);
            }
        }
        else
        {
            Label1.Visible = false;
            tbx_FechaActividad.Enabled = false;
            tbx_FechaActividad.Visible = false;
        }
        //Si se esta modificando un acta de liquidación se habilitan los controles
        if (valor == 3)
        {
            lbl_valorEjecutado.Visible = true;
            tbx_valorEjecutado.Visible = true;
            tbx_valorEjecutado.Text = DatosActa[6]; //Cargamos el valor ejecutado (Liquidación)
        }
        else
        {
            lbl_valorEjecutado.Visible = false;
            tbx_valorEjecutado.Visible = false;
            tbx_valorEjecutado.Text = "";
        }
    }

    protected void Btn_Enviar_Form_Usuario_Click(object sender, EventArgs e)
    {        
        Txt_descripcion.Enabled = true;
        Txt_fechaActa.Enabled = true;
        Subir_ActaPdf.Enabled = true;
        Btn_Actualizar.Enabled = true;
        Btn_Enviar_Form_Usuario.Enabled = false;

        int valor = Convert.ToInt32(tipo);
        if (valor == 1 || valor == 11 || valor == 12 || valor == 4)
        {
            Label1.Visible = true;
            tbx_FechaActividad.Enabled = true;
            tbx_FechaActividad.Visible = true;
        }
        else if (valor == 3) //Si se va ha modificar el Acta de liquidación
        {
            tbx_valorEjecutado.Enabled = true; //Habilitamos el control
        }
        else
        {
            Label1.Visible = false;
            tbx_FechaActividad.Enabled = false;
            tbx_FechaActividad.Visible = false;
        }                   
    }

    /// <summary>
    /// Evento que ejecuta la actualización del acta
    /// </summary>
    protected void Btn_Actualizar_Click(object sender, EventArgs e)
    {
        TablaActas Acta = new TablaActas();
        
        string registro = Convert.ToString(Session["id_RegistroVie"]);
        int id_acta = Convert.ToInt32(Session["ID_acta"]);
        int Tipo_Acta = Convert.ToInt32(tipo); //Tipo de acta
        DateTime Fecha_Acta = Convert.ToDateTime(fechaActa);

        if (Subir_ActaPdf.HasFile)
        {
            string fileName = Subir_ActaPdf.FileName;
            fileName = fileName.Replace(" ", "_");
            Subir_ActaPdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Actas/" + fileName));
            archivoPdf = fileName;
            Label1.Text = "Archivo subido";
            // Falta eliminar el archivo antiguo, 
        }

        if (Tipo_Acta == 1 || Tipo_Acta == 11 || Tipo_Acta == 12 || Tipo_Acta == 4)
        {
            if (fechaActividad == "")
            {
                try
                {
                    Acta.actualizar(id_acta, Tipo_Acta, Fecha_Acta, Descripcion, archivoPdf);
                    Lbl_Estado.Text = "Acta actualizada correctamente";
                    Response.Redirect("~/Modulo_Modificar/ModificarActa.aspx");

                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar el Acta";
                }
            }
            else
            {
                DateTime FechaActividad = Convert.ToDateTime(fechaActividad);//Cambiar por la caja de texto
                try
                {
                    Acta.actualizar2(id_acta, Tipo_Acta, Fecha_Acta, Descripcion, archivoPdf, FechaActividad);
                    Lbl_Estado.Text = "Acta actualizada correctamente ";
                    Response.Redirect("~/Modulo_Modificar/ModificarActa.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar el Acta";
                }
            }
        }
        else if (Tipo_Acta == 3) //Si se modifica el acta de liquidación
        {
            //Si esta vacio el campo tbx_valorEjecutado
            long? valorLiquidado = (tbx_valorEjecutado.Text.Trim() == "") ? (long?)null : Convert.ToInt64(tbx_valorEjecutado.Text.Trim());
            /*Revisar valor el atributo: valor liquidado, si le corresponde a Acta*/
            try
            {
                //Ejecutamos los cambios al acta de liquidación
                Acta.actualizar(id_acta, Tipo_Acta, Fecha_Acta, Descripcion, archivoPdf);
                Lbl_Estado.Text = "Acta actualizada correctamente.";
                Response.Redirect("~/Modulo_Modificar/ModificarActa.aspx");
            }
            catch (Exception)
            {
                Lbl_Estado.Text = "Error actualizando. Por favor, verique los datos.";
            }            
        }
        else
        {
            try
            {
                Acta.actualizar(id_acta, Tipo_Acta, Fecha_Acta, Descripcion, archivoPdf);
                Lbl_Estado.Text = "Acta actualizada correctamente ";
                Response.Redirect("~/Modulo_Modificar/ModificarActa.aspx");

            }
            catch (Exception)
            {
                Lbl_Estado.Text = "Error al actualizar el Acta";
            }
        }

    }

    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        Session.Remove("ID_acta");
        Response.Redirect("~/Modulo_Modificar/ModActas.aspx");
    }

    
    
}