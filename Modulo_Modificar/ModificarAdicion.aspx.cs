using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zModificar_ModificarAdicion : System.Web.UI.Page
{

    String Nombre, tipo, fechaAdicion, Descripcion, archivoPdf, TiempoAdicional1, TiempoAdicional2, ValorAdicional;

    protected void Page_Load(object sender, EventArgs e)
    {
        Nombre = Txt_NombreAdicion.Text;
        tipo = DropDownList1.Text;
        fechaAdicion = Txt_fechaAdicion.Text;
        Descripcion = Txt_Descripcion.Text;
        archivoPdf = Subir_AdicionPdf.FileName;

        TiempoAdicional1 = Tbx_TiempoAdicional.Text;
        TiempoAdicional2 = Tbx_TiempoAdicional2.Text;
        ValorAdicional = Tbx_ValorAdicional.Text;

        if (Request.QueryString["ID_Adicion"] != null && Session["ID_adicion"] == null)
        {
            int idAdicion = Convert.ToInt32(Request.QueryString["ID_Adicion"]);
            Session["ID_adicion"] = idAdicion;
            Mostrar(idAdicion);
        }
        if (Session["ID_adicion"] != null)
        {
            int id_adicion = Convert.ToInt32(Session["ID_adicion"]);
            Mostrar(id_adicion);
        }
    }

    protected void Mostrar(int id_adicion)
    {
        TablaAdiciones adicion = new TablaAdiciones();
        int Idadicion = id_adicion;
        String[] DatosAdicion = adicion.DatosAdicion(Idadicion);

        Txt_NombreAdicion.Text = DatosAdicion[2];
        DropDownList1.Text = DatosAdicion[1];
        DateTime fechaadicion = Convert.ToDateTime(DatosAdicion[3]);
        Txt_fechaAdicion.Text = String.Format("{0:dd/MM/yyyy}", fechaadicion);
        Txt_Descripcion.Text = DatosAdicion[4];
        Label1.Text = DatosAdicion[5];

        int Valor_lista = Convert.ToInt32(DatosAdicion[1]);
        if (Valor_lista == 1 || Valor_lista == 4 || Valor_lista == 5)
        {
            Label2.Visible = true;
            Lbl_Adicional.Visible = true;
            Tbx_ValorAdicional.Visible = true;
            Tbx_TiempoAdicional.Visible = true;
            Tbx_TiempoAdicional2.Visible = true;
            if (DatosAdicion[6] != "" && DatosAdicion[7] != "")
            {
                if (DatosAdicion[6] != null)
                {
                    string cad = DatosAdicion[6].Replace(",0000", "");
                    Tbx_ValorAdicional.Text = cad;
                }
                if (DatosAdicion[7] != null)
                {
                    string[] words = DatosAdicion[7].Split('.');
                    if (words[0] != "")
                    {
                        Tbx_TiempoAdicional.Text = words[0];
                    }
                    if (words[1] != "")
                    {
                        Tbx_TiempoAdicional2.Text = words[1];
                    }
                }
            }
            if (DatosAdicion[6] != "" && DatosAdicion[7] == "")
            {
                if (DatosAdicion != null)
                {
                    string cad = DatosAdicion[6].Replace(",0000", "");
                    Tbx_ValorAdicional.Text = cad;
                }
            }
            if (DatosAdicion[6] == "" && DatosAdicion[7] != "")
            {
                if (DatosAdicion[7] != null)
                {
                    string[] words = DatosAdicion[7].Split('.');
                    if (words[0] != "")
                    {
                        Tbx_TiempoAdicional.Text = words[0];
                    }
                    if (words[1] != "")
                    {
                        Tbx_TiempoAdicional2.Text = words[1];
                    }
                }
            }
            
        }
        else if (Valor_lista == 2)
        {
            Label2.Visible = false;
            Lbl_Adicional.Visible = true;
            Tbx_ValorAdicional.Visible = false;
            Tbx_TiempoAdicional.Visible = true;
            Tbx_TiempoAdicional2.Visible = true;
            if (DatosAdicion[7] != "" || DatosAdicion[7] != null)
            {
                string[] words = DatosAdicion[7].Split('.');
                if (words[0] != "")
                {
                    Tbx_TiempoAdicional.Text = words[0];
                }
                if (words[1] != "")
                {
                    Tbx_TiempoAdicional2.Text = words[1];
                }
            }
        }
        else
        {

            Lbl_Adicional.Visible = false;
            Label2.Visible = true;
            Tbx_ValorAdicional.Visible = true;
            Tbx_TiempoAdicional.Visible = false;
            Tbx_TiempoAdicional2.Visible = false;
            if (DatosAdicion[6] != "")
            {
                if (DatosAdicion != null)
                {
                    string cad = DatosAdicion[6].Replace(",0000", "");
                    Tbx_ValorAdicional.Text = cad;
                }
                
            }
        }

    }

    protected void Btn_Enviar_Form_Usuario_Click(object sender, EventArgs e)
    {
        TablaAdiciones adicion = new TablaAdiciones();
        int id_adicion = Convert.ToInt32(Session["ID_adicion"]);
        String[] DatosAdicion = adicion.DatosAdicion(id_adicion);
        Txt_NombreAdicion.Enabled = true;
        // DropDownList1.Enabled = true;
        Txt_Descripcion.Enabled = true;
        Txt_fechaAdicion.Enabled = true;
        Subir_AdicionPdf.Enabled = true;

        int Valor_lista = Convert.ToInt32(DatosAdicion[1]);
        if (Valor_lista == 1 || Valor_lista == 4 || Valor_lista == 5)
        {
            Lbl_Adicional.Visible = true;
            Label2.Visible = true;
            Tbx_ValorAdicional.Visible = true;
            Tbx_ValorAdicional.Enabled = true;
            Tbx_TiempoAdicional.Visible = true;
            Tbx_TiempoAdicional.Enabled = true;
            Tbx_TiempoAdicional2.Visible = true;
            Tbx_TiempoAdicional2.Enabled = true;
        }
        else if (Valor_lista == 2)
        {
            Lbl_Adicional.Visible = true;
            Label2.Visible = false;
            Tbx_ValorAdicional.Visible = false;
            Tbx_ValorAdicional.Enabled = false;
            Tbx_TiempoAdicional.Visible = true;
            Tbx_TiempoAdicional.Enabled = true;
            Tbx_TiempoAdicional2.Visible = true;
            Tbx_TiempoAdicional2.Enabled = true;
        }
        else
        {
            Lbl_Adicional.Visible = false;
            Label2.Visible = true;
            Tbx_ValorAdicional.Visible = true;
            Tbx_ValorAdicional.Enabled = true;
            Tbx_TiempoAdicional.Visible = false;
            Tbx_TiempoAdicional.Enabled = false;
            Tbx_TiempoAdicional2.Visible = false;
            Tbx_TiempoAdicional2.Enabled = false;
        }

        Btn_Actualizar.Enabled = true;
        Btn_Enviar_Form_Usuario.Enabled = false;
    }
   
    protected void Btn_Actualizar_Click(object sender, EventArgs e)
    {
        TablaAdiciones adicion = new TablaAdiciones();
        //tipo, fechaActa, Descripcion, archivoPdf
        string registro = Convert.ToString(Session["id_RegistroVie"]);
        string nombre = Nombre;
        string descripcion = Descripcion;
        int id_adicion = Convert.ToInt32(Session["ID_adicion"]);
        int Tipo_Adicion = Convert.ToInt32(tipo);
        DateTime Fecha_Adicion = Convert.ToDateTime(fechaAdicion);

        if (Subir_AdicionPdf.HasFile)
        {
            string fileName = Subir_AdicionPdf.FileName;
            fileName = fileName.Replace(" ", "_");
            Subir_AdicionPdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Adiciones/" + fileName));
            archivoPdf = fileName;
            Label1.Text = "Archivo subido";
            // Falta eliminar el archivo antiguo, 
        }
        else
        {
            
            int id_adicion2 = Convert.ToInt32(Session["ID_adicion"]);
            String[] DatosAdicion = adicion.DatosAdicion(id_adicion2);
            if (DatosAdicion[5] != null)
            {
                archivoPdf = DatosAdicion[5];
            }

        }

        if (Tipo_Adicion == 1 || Tipo_Adicion == 4 || Tipo_Adicion == 5) //Quiere decir que tiene los dos controles
        {
            if (Tbx_ValorAdicional.Text == "" && Tbx_TiempoAdicional.Text == "" && Tbx_TiempoAdicional2.Text == "") //estan vacios todos
            {
                try
                {
                    adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion,  archivoPdf, null );
                    Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                }
            }
            if (Tbx_ValorAdicional.Text != "" && Tbx_TiempoAdicional.Text == "" && Tbx_TiempoAdicional2.Text == "")  //vacias los tiempos adicionales
            {

                decimal valor = Convert.ToDecimal(ValorAdicional);
                try
                {
                    adicion.actualizar2(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion,  archivoPdf, null, valor);
                    Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                }
            }
            if (Tbx_ValorAdicional.Text != "" && (Tbx_TiempoAdicional.Text != "" || Tbx_TiempoAdicional2.Text != ""))
            {
                decimal valor = Convert.ToDecimal(ValorAdicional);
                if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text != "") //Los dos estan llenos
                {
                    string tiempo = TiempoAdicional1 + "." + TiempoAdicional2;
                    try
                    {
                        adicion.actualizar2(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo, valor);
                        Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
                else if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text == "") // los dias estan llenos los meses vacios
                {
                    string tiempo = TiempoAdicional1 + ".";
                    try
                    {
                        adicion.actualizar2(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo, valor);
                        Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
                else //los dias vacios los meses llenos
                {
                    string tiempo = "." + TiempoAdicional2;
                    try
                    {
                        adicion.actualizar2(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo, valor);
                        Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
            }
            if (Tbx_ValorAdicional.Text == "" && (Tbx_TiempoAdicional.Text != "" || Tbx_TiempoAdicional2.Text != "")) // vacio el valor adicional
            {
                if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text != "") //Los dos estan llenos
                {
                    string tiempo = TiempoAdicional1 + "." + TiempoAdicional2;
                    try
                    {
                        adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
                else if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text == "")
                {
                    string tiempo = TiempoAdicional1 + ".";
                    try
                    {
                        adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
                else
                {
                    string tiempo = "." + TiempoAdicional2;
                    try
                    {
                        adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
            }
            
        }
        else if (Tipo_Adicion == 2)
        {
            if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text != "") //Los dos estan llenos
            {
                string tiempo = TiempoAdicional1 + "." + TiempoAdicional2;
                try
                {
                    adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo);
                    Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                }
            }
            else if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text == "")
            {
                string tiempo = TiempoAdicional1 + ".";
                try
                {
                    adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo);
                    Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                }
            }
            else
            {
                string tiempo = "." + TiempoAdicional2;
                try
                {
                    adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, tiempo);
                    Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                }
            }
        }
        else
        {
            if (Tbx_ValorAdicional.Text == "")
            {
                try
                {
                    adicion.actualizar(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, null);
                    Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                }
            }
            if (Tbx_ValorAdicional.Text != "")
            {
                decimal valor = Convert.ToDecimal(ValorAdicional);
                try
                {
                    adicion.actualizar2(id_adicion, nombre, Tipo_Adicion, Fecha_Adicion, descripcion, archivoPdf, null, valor);
                    Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                }
            }
        }
        
    }
    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        Session.Remove("ID_adicion");
        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int valor = Convert.ToInt32(DropDownList1.SelectedValue);

        if (valor == 1 || valor == 4 || valor == 5)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            Tbx_ValorAdicional.Visible = true;
            Tbx_TiempoAdicional.Visible = true;
            Tbx_TiempoAdicional2.Visible = true;
        }
        else if (valor == 2)
        {
            Label1.Visible = true;
            Label2.Visible = false;
            Tbx_ValorAdicional.Visible = false;
            Tbx_TiempoAdicional.Visible = true;
            Tbx_TiempoAdicional2.Visible = true;
        }
        else
        {
            Label1.Visible = false;
            Label2.Visible = true;
            Tbx_ValorAdicional.Visible = true;
            Tbx_TiempoAdicional.Visible = false;
            Tbx_TiempoAdicional2.Visible = false;
        }
    }
}