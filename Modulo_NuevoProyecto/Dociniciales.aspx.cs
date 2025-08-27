using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zNuevo_Dociniciales : System.Web.UI.Page
{
    TablaProyectos proyectos = new TablaProyectos();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Id_Compromiso"] != null)
        {
            Session.Remove("Id_Compromiso");
        }

        if (Session["registroVie"] == null)
        {
            Response.Redirect("~/Modulo_NuevoProyecto/DatosGenerales.aspx");
        }
        else
        {
            int usuarioID = Convert.ToInt32(Session["Id_Proyecto"]);

            String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

            if(DatosProyecto[9] != null)
            {
                Label2.Text = "Archivo subido";
                Btn_FormatoVie.Enabled = false;
                Subir_FormatoVie.Enabled = false;
            }
            
            if (DatosProyecto[10] != null)
            {
                Label3.Text = "Archivo subido";
                DateTime FechaPropuesta = Convert.ToDateTime(DatosProyecto[3]);
                Txt_fechaPropuesta.Text = String.Format("{0:dd/MM/yyyy}", FechaPropuesta);
                Btn_Carta.Enabled = false;
                Subir_Carta.Enabled = false;
                Txt_fechaPropuesta.Enabled = false;
            }
            if (DatosProyecto[2] != null)
            {
                Label4.Text = "Archivo subido";
                Btn_Propuesta.Enabled = false;
                Subir_Propuesta.Enabled = false;
            }
            if (DatosProyecto[4] != null)
            {
                Label5.Text = "Archivo subido";
                Btn_actaClaustro.Enabled = false;
                Subir_ActaClaustro.Enabled = false;
            }
            if (DatosProyecto[5] != null)
            {
                Label6.Text = "Archivo subido";
                Btn_actaEscuela.Enabled = false;
                Subir_ActaEscuela.Enabled = false;
            }
            if (DatosProyecto[6] != null)
            {
                Label1.Text = "Archivo subido";
                Btn_actaFacultad.Enabled = false;
                Subir_ActaFacultad.Enabled = false;
            }
            if (DatosProyecto[11] != null)
            {
                Label7.Text = "Archivo subido";
                Btn_MemoTecnica.Enabled = false;
                Subir_MemoTecnica.Enabled = false;
            }
            if (DatosProyecto[12] != null)
            {
                Label8.Text = "Archivo subido";
                Btn_Presupuesto.Enabled = false;
                Subir_PresupuestoInterno.Enabled = false;
            }
            
            

            
        }
    }

    protected void Btn_FormatoVie_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);

        if (Subir_FormatoVie.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_FormatoVie.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_FormatoVie.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_FormatoVie.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); //"/" + 
                    proyectos.RegistroDocumento1(id_proy, fileName);
                    Btn_FormatoVie.Enabled = false;
                    Subir_FormatoVie.Enabled = false;
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

    protected void Btn_Carta_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);


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
                        proyectos.RegistroDocumento2(id_proy, fechaPropuesta, fileName);
                        Subir_Carta.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); // "/" +  
                        Btn_Carta.Enabled = false;
                        Subir_Carta.Enabled = false;
                        Txt_fechaPropuesta.Enabled = false;
                        Label3.Text = "Archivo subido";
                    }
                    catch (Exception)
                    {
                        Label3.Text = "Error, vuelva a intentarlo";

                    }
                }
                else
                    Label3.Text = "El archivo no es pdf";
            }
            else
                Label3.Text = "Ingrese la fecha propuesta";
        }
        else
            Label3.Text = "Seleccione un archivo";

    }

    protected void Btn_Propuesta_Click(object sender, EventArgs e)
    {

        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);
        if (Subir_Propuesta.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_Propuesta.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_Propuesta.FileName;
                    fileName = fileName.Replace(" ", "_");
                    proyectos.RegistroDocumento3(id_proy, fileName);
                    Subir_Propuesta.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); // "/" + 
                    Btn_Propuesta.Enabled = false;
                    Subir_Propuesta.Enabled = false;
                    Label4.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label4.Text = "Error, vuelva a intentarlo";

                }
            }
            else
                Label4.Text = "El archivo no es pdf";
        }
        else
            Label4.Text = "Seleccione un archivo";

    }

    protected void Btn_actaClaustro_Click(object sender, EventArgs e)
    {

        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);
        if (Subir_ActaClaustro.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_ActaClaustro.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_ActaClaustro.FileName;
                    fileName = fileName.Replace(" ", "_");
                    proyectos.RegistroDocumento4(id_proy, fileName);
                    Subir_ActaClaustro.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); // "/" + 
                    Btn_actaClaustro.Enabled = false;
                    Subir_ActaClaustro.Enabled = false;
                    Label5.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label5.Text = "Error, vuelva a intentarlo";
                }
            }
            else
                Label5.Text = "El archivo no es pdf";
            
        }
        else
            Label5.Text = "Seleccione un archivo";
    }

    protected void Btn_actaEscuela_Click(object sender, EventArgs e)
    {

        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);
        if (Subir_ActaEscuela.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_ActaEscuela.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_ActaEscuela.FileName;
                    fileName = fileName.Replace(" ", "_");
                    proyectos.RegistroDocumento5(id_proy, fileName);
                    Subir_ActaEscuela.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); // "/" + 
                    Btn_actaEscuela.Enabled = false;
                    Subir_ActaEscuela.Enabled = false;
                    Label6.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label6.Text = "Error, vuelva a intentarlo";
                }
            }
            else
                Label6.Text = "El archivo no es pdf";
        }
        else
            Label6.Text = "Seleccione un archivo";
    }

    protected void Btn_actaFacultad_Click(object sender, EventArgs e)
    {

        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);
        if (Subir_ActaFacultad.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_ActaFacultad.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_ActaFacultad.FileName;
                    fileName = fileName.Replace(" ", "_");
                    proyectos.RegistroDocumento6(id_proy, fileName);
                    Subir_ActaFacultad.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); // "/" + 
                    Btn_actaFacultad.Enabled = false;
                    Subir_ActaFacultad.Enabled = false;
                    Label1.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label1.Text = "Error, vuelva a intentarlo";
                }
            }
            else
                Label1.Text = "El archivo no es pdf";
        }
        else
            Label1.Text = "Seleccione un archivo";
    }

    protected void Btn_MemoTecnica_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);
        if (Subir_MemoTecnica.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_MemoTecnica.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_MemoTecnica.FileName;
                    fileName = fileName.Replace(" ", "_");
                    proyectos.RegistroDocumento7(id_proy, fileName);
                    Subir_MemoTecnica.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); // "/" + 
                    Btn_MemoTecnica.Enabled = false;
                    Subir_MemoTecnica.Enabled = false;
                    Label7.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label7.Text = "Error, vuelva a intentarlo";
                }
            }
            else
                Label7.Text = "El archivo no es pdf";
        }
        else
            Label7.Text = "Seleccione un archivo";
    }

    protected void Btn_Presupuesto_Click(object sender, EventArgs e)
    {
        string registro = Session["registroVie"].ToString();
        int id_proy = Convert.ToInt32(Session["Id_Proyecto"]);
        if (Subir_PresupuestoInterno.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_PresupuestoInterno.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                try
                {
                    string fileName = Subir_PresupuestoInterno.FileName;
                    fileName = fileName.Replace(" ", "_");
                    proyectos.RegistroDocumento8(id_proy, fileName);
                    Subir_PresupuestoInterno.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/DocumentosIniciales/" + fileName)); // "/" + 
                    Btn_Presupuesto.Enabled = false;
                    Subir_PresupuestoInterno.Enabled = false;
                    Label8.Text = "Archivo subido";
                }
                catch (Exception)
                {
                    Label8.Text = "Error, vuelva a intentarlo";
                }
            }
            else
                Label8.Text = "El archivo no es pdf";
        }
        else
            Label8.Text = "Seleccione un archivo";
    }

    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_NuevoProyecto/cContrato.aspx");
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

    
}