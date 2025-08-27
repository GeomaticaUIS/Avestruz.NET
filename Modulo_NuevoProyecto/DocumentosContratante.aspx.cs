using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_NuevoProyecto_DocumentosContratante : System.Web.UI.Page
{
    TablaContratos contrato = new TablaContratos();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Id_Compromiso"] != null)
        {
            Session.Remove("Id_Compromiso");
        }


        if (Session["registroVie"] == null || Session["Id_Contrato"] == null)
        {
            Response.Redirect("~/Otros/ContratoVacio2.aspx");
        }
        else
        {
            
            int id_contrato = Convert.ToInt32(Session["Id_Contrato"]);

            String[] DatosContrato = contrato.DatosContrato(id_contrato);

            if (DatosContrato[10] != null)
            {
                Label2.Text = "Archivo subido";
                Btn_Carta.Enabled = false;
                Subir_Carta.Enabled = false;
            }

            if (DatosContrato[11] != null)
            {
                Label6.Text = "Archivo subido";
                Btn_Terminos.Enabled = false;
                Subir_Terminos.Enabled = false;
            }
            if (DatosContrato[12] != null)
            {
                Label5.Text = "Archivo subido";
                Btn_Estudios.Enabled = false;
                Subir_Estudios.Enabled = false;
            }
            if (DatosContrato[13] != null)
            {
                Label1.Text = "Archivo subido";
                Btn_Cdp.Enabled = false;
                Subir_Certificado.Enabled = false;
            }
            if (DatosContrato[14] != null)
            {
                Label4.Text = "Archivo subido";
                Btn_Rp.Enabled = false;
                Subir_RegistroP.Enabled = false;
            }
            
        }
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

    protected void Btn_Carta_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_contrato = Convert.ToInt32(Session["Id_Contrato"]);

        if (Subir_Carta.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_Carta.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Carta.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_Carta.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName)); //"/" + 
                    contrato.RegistroDocumento1(id_contrato, fileName);
                    Btn_Carta.Enabled = false;
                    Subir_Carta.Enabled = false;
                    Label2.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label2.Text = "Error, vuelva a intentarlo";
                }
            }
            else
            {
                Label2.Text = "El archivo no es pdf";
            }
        }
        else
        {
            Label2.Text = "Seleccione un archivo";
        }
        
    }

    /// <summary>
    /// Elimina la carta de solicitud
    /// </summary>
    protected void btn_eliminarCarta_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se puede eliminar
        if (Label2.Text == "Archivo subido")
        {
            string registro = Session["RegistroVie"].ToString();
            int id_contrato = Convert.ToInt32(Session["Id_Contrato"]); //ID del contrato o convenio

            //Consultamos el nombre del archivo
            String NomFileCarta = contrato.NombreFileCartaSolicitudPropuesta(id_contrato);
            //Verificamos que exista el archivo físicamente
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileCarta)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileCarta));
            }

            //Eliminamos el registro del archivo en la BD
            try
            {
                contrato.DeleteCartaSolicitudPropuesta(id_contrato);
                Subir_Carta.Enabled = true; //Habilitamos el control para cargar archvios
                Btn_Carta.Enabled = true;
                Label2.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Label2.Text = "Error eliminando el archivo.";
            }
        }
    }

    protected void Btn_Terminos_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_contrato = Convert.ToInt32(Session["Id_Contrato"]);

        if (Subir_Terminos.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_Terminos.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Terminos.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_Terminos.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName)); //"/" + 
                    contrato.RegistroDocumento2(id_contrato, fileName);
                    Btn_Terminos.Enabled = false;
                    Subir_Terminos.Enabled = false;
                    Label6.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label6.Text = "Error, vuelva a intentarlo";
                }
            }
            else
            {
                Label6.Text = "El archivo no es pdf";
            }
        }
        else
        {
            Label6.Text = "Seleccione un archivo";
        }
        
    }

    /// <summary>
    /// Evento que elimina el archivo (Terminos)
    /// </summary>
    protected void btn_EliminarTerminos_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se puede eliminar
        if (Label6.Text == "Archivo subido")
        {
            string registro = Session["RegistroVie"].ToString();
            int id_contrato = Convert.ToInt32(Session["Id_Contrato"]); //ID del contrato o convenio

            //Consultamos el nombre del archivo
            String NomFileTerminos = contrato.NombreFileTerminos(id_contrato);
            //Verificamos que exista el archivo físicamente
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileTerminos)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileTerminos));
            }

            //Eliminamos el registro del archivo en la BD
            try
            {
                contrato.DeleteTerminosReferencia(id_contrato);
                Subir_Terminos.Enabled = true; //Habilitamos el control para cargar archivos
                Btn_Terminos.Enabled = true;
                Label6.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Label6.Text = "Error eliminando el archivo";
            }
        }
    }

    protected void Btn_Estudios_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_contrato = Convert.ToInt32(Session["Id_Contrato"]);

        if (Subir_Estudios.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_Estudios.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Estudios.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_Estudios.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName)); //"/" + 
                    contrato.RegistroDocumento3(id_contrato, fileName);
                    Btn_Estudios.Enabled = false;
                    Subir_Estudios.Enabled = false;
                    Label5.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label5.Text = "Error, vuelva a intentarlo";
                }
            }
            else
            {
                Label5.Text = "El archivo no es pdf";
            }
        }
        else
        {
            Label5.Text = "Seleccione un archivo";
        }
    }

    /// <summary>
    /// Evento que elimina el archivo (Estudios previos)
    /// </summary>
    protected void btn_EliminarEstudios_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se puede eliminar
        if (Label5.Text == "Archivo subido")
        {
            string registro = Session["RegistroVie"].ToString();
            int id_contrato = Convert.ToInt32(Session["Id_Contrato"]); //ID del contrato o convenio

            //Consultamos el nombre del archivo
            String NomFileEstudios = contrato.NombreFileEstudiosPrevios(id_contrato);
            //Verificamos que exista el archivo físicamente
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileEstudios)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileEstudios));
            }

            //Eliminamos el registro del archivo en la BD
            try
            {
                contrato.DeleteEstudiosPrevios(id_contrato);
                Subir_Estudios.Enabled = true; //Habilitamos el control para cargar archivos
                Btn_Estudios.Enabled = true;
                Label5.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Label5.Text = "Error eliminando el archivo";
            }
        }
    }

    protected void Btn_Cdp_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_contrato = Convert.ToInt32(Session["Id_Contrato"]);

        if (Subir_Certificado.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_Certificado.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Certificado.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_Certificado.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName)); //"/" + 
                    contrato.RegistroDocumento4(id_contrato, fileName);
                    Btn_Cdp.Enabled = false;
                    Subir_Certificado.Enabled = false;
                    Label1.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label1.Text = "Error, vuelva a intentarlo";
                }
            }
            else
            {
                Label1.Text = "El archivo no es pdf";
            }
        }
        else
        {
            Label1.Text = "Seleccione un archivo";
        }
    }

    /// <summary>
    /// Evento que elimina el archivo (Certificado de disponibilidad presupuestal)
    /// </summary>
    protected void btn_EliminarCDP_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se puede eliminar
        if (Label1.Text == "Archivo subido")
        {
            string registro = Session["RegistroVie"].ToString();
            int id_contrato = Convert.ToInt32(Session["Id_Contrato"]); //ID del contrato o convenio

            //Consultamos el nombre del archivo
            String NomFileCertificado = contrato.NombreFileCertificado(id_contrato);
            //Verificamos que exista el archivo físicamente
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileCertificado)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileCertificado));
            }

            //Eliminamos el registro del archivo en la BD
            try
            {
                contrato.DeleteCertificado(id_contrato);
                Subir_Certificado.Enabled = true; //Habilitamos el control para cargar archivos
                Btn_Cdp.Enabled = true;
                Label1.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Label1.Text = "Error eliminando el archivo";
            }
        }
    }

    protected void Btn_Rp_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_contrato = Convert.ToInt32(Session["Id_Contrato"]);

        if (Subir_RegistroP.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_RegistroP.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_RegistroP.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_RegistroP.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName)); //"/" + 
                    contrato.RegistroDocumento5(id_contrato, fileName);
                    Btn_Rp.Enabled = false;
                    Subir_RegistroP.Enabled = false;
                    Label4.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label4.Text = "Error, vuelva a intentarlo";
                }
            }
            else
            {
                Label4.Text = "El archivo no es pdf";
            }
        }
        else
        {
            Label4.Text = "Seleccione un archivo";
        }
    }

    /// <summary>
    /// Evento que elimina el archivo (Registro presupuestal)
    /// </summary>
    protected void btn_EliminarRP_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se puede eliminar
        if (Label4.Text == "Archivo subido")
        {
            string registro = Session["RegistroVie"].ToString();
            int id_contrato = Convert.ToInt32(Session["Id_Contrato"]); //ID del contrato o convenio

            //Consultamos el nombre del archivo
            String NomFileRegistro = contrato.NombreFileRegistro(id_contrato);
            //Verificamos que exista el archivo físicamente
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileRegistro)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + NomFileRegistro));
            }

            //Eliminamos el registro del archivo en la BD
            try
            {
                contrato.DeleteRegistroProsupuestal(id_contrato);
                Subir_RegistroP.Enabled = true; //Habilitamos el control para cargar archivos
                Btn_Rp.Enabled = true;
                Label4.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Label4.Text = "Error eliminando el archivo";
            }
        }
    }







    
}