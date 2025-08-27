using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zModificar_ModAdiciones : System.Web.UI.Page
{
    String fileName;
    TablaContratos contrato = new TablaContratos();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID_Contrato"] == null)
        {
            Response.Redirect("~/Modulo_Modificar/ModContrato.aspx");
        }
    }
    
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// Evento que añade algún tipo de adición
    /// </summary>
    protected void Btn_AñadirAdicion_Click(object sender, EventArgs e)
    {
        TablaAdiciones adicion = new TablaAdiciones();
        int tipo_adicion = Convert.ToInt32(DropDownList1.Text); // Tipo adicion
        DateTime fecha_adicion = Convert.ToDateTime(Txt_fechaAdicion.Text);// Fecha Adicion
        string descripcion = Txt_Descripcion.Text; //Descripcion
        string Nombre = Txt_NombreAdicion.Text; // Nombre
        int id_contrato = Convert.ToInt32(Session["ID_Contrato"]); // Id del Contrato
        string registro = Session["Id_RegistroVie"].ToString(); // Registro VIE

        if (Subir_AdicionPdf.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_AdicionPdf.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                string fileName = Subir_AdicionPdf.FileName;
                fileName = fileName.Replace(" ", "_");
                Subir_AdicionPdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Adiciones/" + fileName));
            }

        }
        else
        {
            fileName = null;
        }

        if (tipo_adicion == 1 || tipo_adicion == 4 || tipo_adicion == 5)
        {
           
            if (Tbx_ValorAdicional.Text == "" && Tbx_TiempoAdicional.Text == "" && Tbx_TiempoAdicional2.Text == "")
            {
                
                try
                {
                    adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, null);
                    Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                }
            }
            if (Tbx_ValorAdicional.Text != "" && Tbx_TiempoAdicional.Text == "" && Tbx_TiempoAdicional2.Text == "")
            {
                //Se agrega una adición en valor
                decimal valor = Convert.ToDecimal(Tbx_ValorAdicional.Text);
                try
                {
                    adicion.RegistroAdicion2(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, null, valor);
                    //Sumamos la adición en valor al valor del contrato (El resultado de esta suma es el "Valor contratado")
                    contrato.AdicionValorContrato(id_contrato, valor);
                    Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                }
            }
            if (Tbx_ValorAdicional.Text != "" && (Tbx_TiempoAdicional.Text != "" || Tbx_TiempoAdicional2.Text != ""))
            {
                decimal valor = Convert.ToDecimal(Tbx_ValorAdicional.Text);
                if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text != "") //Los dos estan llenos
                {
                    string tiempo = Tbx_TiempoAdicional.Text + "." + Tbx_TiempoAdicional2.Text;
                    try
                    {
                        adicion.RegistroAdicion2(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo, valor);
                        //Sumamos la adición en valor al valor del contrato (El resultado de esta suma es el "Valor contratado")
                        contrato.AdicionValorContrato(id_contrato, valor);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
                else if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text == "") // los dias estan llenos los meses vacios
                {
                    string tiempo = Tbx_TiempoAdicional.Text + ".";
                    try
                    {
                        adicion.RegistroAdicion2(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo, valor);
                        //Sumamos la adición en valor al valor del contrato (El resultado de esta suma es el "Valor contratado")
                        contrato.AdicionValorContrato(id_contrato, valor);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
                else //los dias vacios los meses llenos
                {
                    string tiempo = "." + Tbx_TiempoAdicional2.Text;
                    try
                    {
                        adicion.RegistroAdicion2(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo, valor);
                        //Sumamos la adición en valor al valor del contrato (El resultado de esta suma es el "Valor contratado")
                        contrato.AdicionValorContrato(id_contrato, valor);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al actualizar Otrosí/Adiciones";
                    }
                }
            }
            if (Tbx_ValorAdicional.Text == "" && (Tbx_TiempoAdicional.Text != "" || Tbx_TiempoAdicional2.Text != ""))
            {
                if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text != "")
                {
                    string tiempo = Tbx_TiempoAdicional.Text + "." + Tbx_TiempoAdicional2.Text;
                    try
                    {
                        adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                    }
                }
                else if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text == "")
                {
                    string tiempo = Tbx_TiempoAdicional.Text + ".";
                    try
                    {
                        adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                    }
                }
                else
                {
                    string tiempo = "." + Tbx_TiempoAdicional2.Text;
                    try
                    {
                        adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                    }
                }
            }
        }
        else if (tipo_adicion == 2)
        {
            if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text != "")
                {
                    string tiempo = Tbx_TiempoAdicional.Text + "." + Tbx_TiempoAdicional2.Text;
                    try
                    {
                        adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                    }
                }
                else if (Tbx_TiempoAdicional.Text != "" && Tbx_TiempoAdicional2.Text == "")
                {
                    string tiempo = Tbx_TiempoAdicional.Text + ".";
                    try
                    {
                        adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                    }
                }
                else
                {
                    string tiempo = "." + Tbx_TiempoAdicional2.Text;
                    try
                    {
                        adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, tiempo);
                        Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                    }
                    catch (Exception)
                    {
                        Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                    }
                }
         }        
        else
        {
            if (Tbx_ValorAdicional.Text == "")
            {
                try
                {
                    adicion.RegistroAdicion(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, null);
                    Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                }
            }
            if (Tbx_ValorAdicional.Text != "")
            {
                decimal valor = Convert.ToDecimal(Tbx_ValorAdicional.Text);
                try
                {
                    adicion.RegistroAdicion2(Nombre, tipo_adicion, id_contrato, fecha_adicion, descripcion, fileName, null, valor);
                    //Sumamos la adición en valor al valor del contrato (El resultado de esta suma es el "Valor contratado")
                    contrato.AdicionValorContrato(id_contrato, valor);
                    Response.Redirect("~/Modulo_Modificar/ModAdiciones.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al registrar Otrosí/Adiciones";
                }
            }
        }
        
    }

    protected void EditarAdicion_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_adicion = ((Label)boton2.Parent.FindControl("Id_OtrosíLabel"));

        int Id_adicion = Convert.ToInt32(id_adicion.Text);

        Response.Redirect("~/Modulo_Modificar/ModificarAdicion.aspx?ID_Adicion=" + Id_adicion);
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