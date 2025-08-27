using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class zModificar_ModDocumentos : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        int id_proy = Convert.ToInt32(Session["ID"]);
       
        Mostrar(id_proy);
    }

    TablaProyectos proyectos = new TablaProyectos();

    protected void Mostrar(int id_proy)
    {
        int id_proyecto = id_proy;
        TablaProyectos proyectos = new TablaProyectos();

        String[] DatosProyecto = proyectos.DatosProyecto(id_proyecto);

        if(DatosProyecto[9] != null)
            Lbl_FormatoVie.Text = "Archivo Agregado";
        else
            Lbl_FormatoVie.Text = "Aun no agregado";

        if (DatosProyecto[10] != null)
            {
                Lbl_Carta.Text = "Archivo Agregado";
                DateTime FechaPropuesta = Convert.ToDateTime(DatosProyecto[3]);
                Txt_fechaPropuesta.Text = String.Format("{0:dd/MM/yyyy}", FechaPropuesta);
            }
        else
            Lbl_Carta.Text = "Aun no agregado";
        
        if (DatosProyecto[2] != null)
            Lbl_Propuesta_Pdf.Text = "Archivo Agregado";
        else
            Lbl_Propuesta_Pdf.Text = "Aun no agregado";

        if (DatosProyecto[4] != null)
            Lbl_ActaClaustro.Text = "Archivo Agregado";
        else
            Lbl_ActaClaustro.Text = "Aun no agregado";

        if (DatosProyecto[5] != null)
            Lbl_ActaEscuela.Text = "Archivo Agregado";
        else
            Lbl_ActaEscuela.Text = "Aun no agregado";

        if (DatosProyecto[6] != null)
            Lbl_ActaFacultad.Text = "Archivo Agregado";
        else
            Lbl_ActaFacultad.Text = "Aun no agregado";

        if (DatosProyecto[11] != null)
            Lbl_MemoTecnica.Text = "Archivo Agregado";
        else
            Lbl_MemoTecnica.Text = "Aun no agregado";

        if (DatosProyecto[12] != null)
            Lbl_Presupuesto.Text = "Archivo Agregado";
        else
            Lbl_Presupuesto.Text = "Aun no agregado";
    }

    protected void Btn_FormatoVie_Click(object sender, EventArgs e)
    {
        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_FormatoVie.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_FormatoVie.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_FormatoVie.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_FormatoVie.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                    proyectos.RegistroDocumento1(id_proy, fileName);
                    Btn_FormatoVie.Enabled = false;
                    Subir_FormatoVie.Enabled = false;
                    Btn_Modificar.Enabled = true;
                    Lbl_FormatoVie.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Lbl_FormatoVie.Text = "Error registrando Formato Vie.";
                }
            }
            else
                Lbl_FormatoVie.Text = "Error, el archivo no es pdf";

        }
        else
        {
            Lbl_FormatoVie.Text = "No selecciono ningun archivo.";
        }
    }

    /// <summary>
    /// Elimina el archivo del formato VIE
    /// </summary>
    protected void btn_DeleteFormVIE_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_FormatoVie.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]); //ID del proyecto

            //Consultamos el nombre del archivos que se elimina
            String nomRegistroVIE = proyectos.NombreFileRegistroVIE(id_proy);
            //Verificamos que exista el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomRegistroVIE)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomRegistroVIE));
            }

            //Eliminamos el archivo de la BD
            try
            {
                proyectos.DeleteRegistroVIE(id_proy);
                Btn_FormatoVie.Enabled = true;
                Subir_FormatoVie.Enabled = true;
                Lbl_FormatoVie.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_FormatoVie.Text = "Error eliminando el archivo.";
            }
        }
    }
       
    protected void Btn_Carta_Click(object sender, EventArgs e)
    {
        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_Carta.HasFile)
        {
            if (Txt_fechaPropuesta.Text != null)
            {
                DateTime fechaPropuesta = Convert.ToDateTime(Txt_fechaPropuesta.Text);
                String fileExt = System.IO.Path.GetExtension(Subir_Carta.FileName).ToString();
                if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
                {
                    try
                    {
                        string fileName = Subir_Carta.FileName;
                        fileName = fileName.Replace(" ", "_");
                        Subir_Carta.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                        proyectos.RegistroDocumento2(id_proy, fechaPropuesta, fileName);
                        Btn_Carta.Enabled = false;
                        Subir_Carta.Enabled = false;
                        Txt_fechaPropuesta.Enabled = false;
                        Lbl_Carta.Text = "Archivo subido";
                        Btn_Modificar.Enabled = true;
                    }
                    catch (Exception)
                    {
                        Lbl_Carta.Text = "Error registrando Formato Vie.";
                    }
                }
                else
                    Lbl_Carta.Text = "Error, el archivo no es pdf";

            }
            else
                Label_fecha.Text = "Debe ingresar la fecha propuesta";
        }
        else
        {
            Lbl_Carta.Text = "No selecciono ningun archivo.";
        }

    }

    /// <summary>
    /// Elimina la Carta de presentación
    /// </summary>
    protected void btn_DeleteCarta_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_Carta.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]);

            //Consultamos el nombre del archivos
            String nomCarta = proyectos.NombreFileCarta(id_proy);
            //Verificamos si existe el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomCarta)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomCarta));
            }

            //Eliminamos el nombre del archivo en la BD
            try
            {
                proyectos.DeleteCartaPresentacion(id_proy);
                Btn_Carta.Enabled = true;
                Subir_Carta.Enabled = true;
                Lbl_Carta.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_Carta.Text = "Error eliminando el archivo";
            }
        }
    }

    protected void Btn_Propuesta_Pdf_Click(object sender, EventArgs e)
    {
        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_Propuesta_Pdf.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_Propuesta_Pdf.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Propuesta_Pdf.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_Propuesta_Pdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                    proyectos.RegistroDocumento3(id_proy, fileName);
                    Btn_Propuesta_Pdf.Enabled = false;
                    Subir_Propuesta_Pdf.Enabled = false;
                    Lbl_Propuesta_Pdf.Text = "Archivo subido";
                    Btn_Modificar.Enabled = true;
                }
                catch (Exception)
                {
                    Lbl_Propuesta_Pdf.Text = "Error registrando Formato Vie.";
                }
            }
            else
                Lbl_Propuesta_Pdf.Text = "Error, el archivo no es pdf";


        }
        else
        {
            Lbl_Propuesta_Pdf.Text = "No selecciono ningun archivo.";
        }

    }

    /// <summary>
    /// Elimina el archivo propuesta pdf de la BD
    /// </summary>
    protected void btn_DeletePropuesta_pdf_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_Propuesta_Pdf.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]); //ID del proyecto

            //Consultamos el nombre del archivos que se elimina
            String nomPropuestapdf = proyectos.NombreFilePropuestapdf(id_proy);
            //Verificamos que exista el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomPropuestapdf)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomPropuestapdf));
            }

            //Eliminamos el archivo de la BD
            try
            {                
                proyectos.DeletePropuestapdf(id_proy);
                Btn_Propuesta_Pdf.Enabled = true;                
                Subir_Propuesta_Pdf.Enabled = true;
                Lbl_Propuesta_Pdf.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_Propuesta_Pdf.Text = "Error eliminando el archivo.";
            }
        }
    }

    protected void Btn_ActaClaustro_Click(object sender, EventArgs e)
    {
        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_ActaClaustro.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_ActaClaustro.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_ActaClaustro.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_ActaClaustro.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                    proyectos.RegistroDocumento4(id_proy, fileName);
                    Btn_ActaClaustro.Enabled = false;
                    Subir_ActaClaustro.Enabled = false;
                    Lbl_ActaClaustro.Text = "Archivo subido";
                    Btn_Modificar.Enabled = true;
                }
                catch (Exception)
                {
                    Lbl_ActaClaustro.Text = "Error registrando Formato Vie.";
                }
            }
            else
                Lbl_ActaClaustro.Text = "Error, el archivo no es pdf";


        }
        else
        {
            Lbl_ActaClaustro.Text = "No selecciono ningun archivo.";
        }
    }

    /// <summary>
    /// Elimina el archivo del acta claustro
    /// </summary>
    protected void btn_DeleteActaClaustro_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_ActaClaustro.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]); //ID del proyecto

            //Consultamos el nombre del archivos que se elimina            
            String nomActaClaustro = proyectos.NombreFileActaClaustro(id_proy);
            //Verificamos que exista el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomActaClaustro)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomActaClaustro));
            }

            //Eliminamos el archivo de la BD
            try
            {
                //proyectos.DeleteRegistroVIE(id_proy);
                proyectos.DeleteActaClaustro(id_proy);
                Btn_ActaClaustro.Enabled = true;
                Subir_ActaClaustro.Enabled = true;
                Lbl_ActaClaustro .Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_ActaClaustro.Text = "Error eliminando el archivo.";
            }
        }
    }

    protected void Btn_ActaEscuela_Click(object sender, EventArgs e)
    {
        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_ActaEscuela.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_ActaEscuela.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_ActaEscuela.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_ActaEscuela.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                    proyectos.RegistroDocumento5(id_proy, fileName);
                    Btn_ActaEscuela.Enabled = false;
                    Subir_ActaEscuela.Enabled = false;
                    Btn_Modificar.Enabled = true;
                    Lbl_ActaEscuela.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Lbl_ActaEscuela.Text = "Error registrando Formato Vie";
                }
            }
            else
                Lbl_ActaEscuela.Text = "Error, el archivo no es pdf";


        }
        else
        {
            Lbl_ActaEscuela.Text = "No selecciono ningun archivo.";
        }
    }

    /// <summary>
    /// Elimina el archivo acta escuela
    /// </summary>
    protected void btn_DeleteActaEscuela_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_ActaEscuela.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]); //ID del proyecto

            //Consultamos el nombre del archivos que se elimina            
            String nomActaEscuela = proyectos.NombreFileActaEscuela(id_proy);
            //Verificamos que exista el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomActaEscuela)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomActaEscuela));
            }

            //Eliminamos el archivo de la BD
            try
            {                
                proyectos.DeleteActaEscuela(id_proy);
                Btn_ActaEscuela.Enabled = true;
                Subir_ActaEscuela.Enabled = true;
                Lbl_ActaEscuela.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_ActaEscuela.Text = "Error eliminando el archivo.";
            }
        }
    }

    protected void Btn_ActaFacultad_Click(object sender, EventArgs e)
    {

        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_ActaFacultad.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_ActaFacultad.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_ActaFacultad.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_ActaFacultad.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                    proyectos.RegistroDocumento6(id_proy, fileName);
                    Btn_ActaFacultad.Enabled = false;
                    Subir_ActaFacultad.Enabled = false;
                    Btn_Modificar.Enabled = true;
                    Lbl_ActaFacultad.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Lbl_ActaFacultad.Text = "Error registrando Formato Vie.";
                }
            }
            else
                Lbl_ActaFacultad.Text = "Error, el archivo no es pdf";


        }
        else
        {
            Lbl_ActaFacultad.Text = "No selecciono ningun archivo.";
        }
    }

    /// <summary>
    /// Elimina el archivo acta escuela
    /// </summary>
    protected void btn_DeleteActaFacultad_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_ActaFacultad.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]); //ID del proyecto

            //Consultamos el nombre del archivos que se elimina            
            String nomActaFacultad = proyectos.NombreFileActaFacultad(id_proy);
            //Verificamos que exista el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomActaFacultad)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomActaFacultad));
            }

            //Eliminamos el archivo de la BD
            try
            {                
                proyectos.DeleteActaFacultad(id_proy);
                Btn_ActaFacultad.Enabled = true;
                Subir_ActaFacultad.Enabled = true;
                Lbl_ActaFacultad.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_ActaFacultad.Text = "Error eliminando el archivo.";
            }
        }
    }

    protected void Btn_MemoTecnica_Click(object sender, EventArgs e)
    {
        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_Memo.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_Memo.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Memo.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_Memo.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                    proyectos.RegistroDocumento7(id_proy, fileName);
                    Btn_MemoTecnica.Enabled = false;
                    Subir_Memo.Enabled = false;
                    Btn_Modificar.Enabled = true;
                    Lbl_MemoTecnica.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Lbl_MemoTecnica.Text = "Error registrando Memoria tecnica.";
                }
            }
            else
                Lbl_MemoTecnica.Text = "Error, el archivo no es pdf";


        }
        else
        {
            Lbl_MemoTecnica.Text = "No selecciono ningun archivo.";
        }
    }

    /// <summary>
    /// Elimina el archivo Memo técnica
    /// </summary>
    protected void btn_DeleteMenoTecnica_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_MemoTecnica.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]); //ID del proyecto

            //Consultamos el nombre del archivos que se elimina
            String nomMemoTecnica = proyectos.NombreFileMemoTecnica(id_proy);
            //Verificamos que exista el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomMemoTecnica)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomMemoTecnica));
            }

            //Eliminamos el archivo de la BD
            try
            {
                proyectos.DeleteMemoTecnica(id_proy);
                Btn_MemoTecnica.Enabled = true;
                Subir_Memo.Enabled = true;
                Lbl_MemoTecnica.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_MemoTecnica.Text = "Error eliminando el archivo.";
            }
        }
    }

    protected void Btn_Presupuesto_Click(object sender, EventArgs e)
    {
        string registro = Session["Id_RegistroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["ID"]);

        if (Subir_Presupuesto.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_Presupuesto.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Presupuesto.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_Presupuesto.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + fileName));
                    proyectos.RegistroDocumento8(id_proy, fileName);
                    Btn_Presupuesto.Enabled = false;
                    Subir_Presupuesto.Enabled = false;
                    Btn_Modificar.Enabled = true;
                    Lbl_Presupuesto.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Lbl_Presupuesto.Text = "Error registrando Formato Vie.";
                }
            }
            else
                Lbl_Presupuesto.Text = "Error, el archivo no es pdf";


        }
        else
        {
            Lbl_Presupuesto.Text = "No selecciono ningun archivo.";
        }
    }

    /// <summary>
    /// Elimina el archivo de presupuesto
    /// </summary>
    protected void btn_DeletePresupuesto_Click(object sender, EventArgs e)
    {
        //Si el archivo esta cargado se elimina
        if (Lbl_Presupuesto.Text == "Archivo Agregado")
        {
            String registro = Session["Id_RegistroVie"].ToString();
            int id_proy = Convert.ToInt32(Session["ID"]); //ID del proyecto

            //Consultamos el nombre del archivos que se elimina
            //String nomRegistroVIE = proyectos.NombreFileRegistroVIE(id_proy);
            String nomPresupuesto = proyectos.NombreFilePresupuesto(id_proy);
            //Verificamos que exista el archivo que se va a eliminar
            if (File.Exists(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomPresupuesto)))
            {
                //Eliminamos el archivo
                File.Delete(MapPath("~/Pdfs_Subidos/" + "/" + registro + "/DocumentosIniciales/" + nomPresupuesto));
            }

            //Eliminamos el archivo de la BD
            try
            {
                proyectos.DeletePresupuesto(id_proy);
                Btn_Presupuesto.Enabled = true;
                Subir_Presupuesto.Enabled = true;
                Lbl_Presupuesto.Text = "Aun no agregado";
            }
            catch (Exception)
            {
                Lbl_Presupuesto.Text = "Error eliminando el archivo.";
            }
        }
    }

    protected void Btn_Modificar_Click(object sender, EventArgs e)
    {
        Subir_FormatoVie.Enabled = true;
        Subir_Carta.Enabled = true;
        Subir_Propuesta_Pdf.Enabled = true;
        Subir_ActaClaustro.Enabled = true;
        Subir_ActaEscuela.Enabled = true;
        Subir_ActaFacultad.Enabled = true;
        Subir_Presupuesto.Enabled = true;
        Subir_Memo.Enabled = true;
        Btn_FormatoVie.Enabled = true;
        Btn_Carta.Enabled = true;
        Txt_fechaPropuesta.Enabled = true;
        Btn_Propuesta_Pdf.Enabled = true;
        Btn_ActaClaustro.Enabled = true;
        Btn_ActaEscuela.Enabled = true;
        Btn_ActaFacultad.Enabled = true;
        Btn_MemoTecnica.Enabled = true;
        Btn_Presupuesto.Enabled = true;
        btn_DeleteFormVIE.Enabled = true;
        btn_DeleteActaEscuela.Enabled = true;
        btn_DeleteActaClaustro.Enabled = true;
        btn_DeleteActaFacultad.Enabled = true;
        btn_DeletePropuesta_pdf.Enabled = true;
        btn_DeleteMenoTecnica.Enabled = true;
        btn_DeletePresupuesto.Enabled = true;
        btn_DeleteCarta.Enabled = true;

        Btn_Modificar.Enabled = false;        
    }

    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
            Session.Remove("ID");

        if (Session["Id_RegistroVie"] != null)
            Session.Remove("Id_RegistroVie");

        if (Session["NombreProyecto"] != null)
            Session.Remove("NombreProyecto");

        if (Session["ID_Contrato"] != null)
            Session.Remove("ID_Contrato");

        if (Session["ID_Producto"] != null)
            Session.Remove("ID_Producto");

        if (Session["ID_acta"] != null)
            Session.Remove("ID_acta");

        if (Session["ValorProyecto"] != null)
            Session.Remove("ValorProyecto");

        if (Session["Ultimo"] != null)
            Session.Remove("Ultimo");

        if (Session["ID_adicion"] != null)
            Session.Remove("ID_adicion");

        if (Session["ID_producto"] != null)
            Session.Remove("ID_producto");

        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }








    
}