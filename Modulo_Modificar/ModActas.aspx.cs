using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zModificar_ModActas : System.Web.UI.Page
{
    String fileName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID_Contrato"] == null)
        {
            Response.Redirect("~/Modulo_Modificar/ModContrato.aspx");
        }
    }
    
    protected void EditarActa_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_acta = ((Label)boton2.Parent.FindControl("Id_ActasLabel"));

        int idacta = Convert.ToInt32(id_acta.Text);

        Response.Redirect("~/Modulo_Modificar/ModificarActa.aspx?ID_Acta=" + idacta);
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
    protected void Btn_AñadirActa_Click(object sender, EventArgs e)
    {
        TablaActas acta = new TablaActas();
        int tipo_acta = Convert.ToInt32(DropDownList1.Text);
        DateTime fecha_acta = Convert.ToDateTime(Txt_fechaActa.Text);
        string descripcion = Txt_descripcion.Text;

        int id_contrato = Convert.ToInt32(Session["ID_Contrato"]);
        string registro = Session["Id_RegistroVie"].ToString();

        if (Subir_ActaPdf.HasFile)
        {
            String fileExt = System.IO.Path.GetExtension(Subir_ActaPdf.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                fileName = Subir_ActaPdf.FileName;
                fileName = fileName.Replace(" ", "_");
                Subir_ActaPdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Actas/" + fileName));
            }
            else
                Lbl_Estado.Text = "Error, el archivo no es pdf";
        }


        if (tipo_acta == 1 || tipo_acta == 11 || tipo_acta == 12 || tipo_acta == 4)
        {

            if (tbx_FechaActividad.Text == null || tbx_FechaActividad.Text == "")
            {
                
               try
                {
                    acta.RegistroActa(tipo_acta, id_contrato, fecha_acta, descripcion, fileName);
                    Response.Redirect("~/Modulo_Modificar/ModActas.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error1 al registrar el acta";
                }
            }
            else
            {
                DateTime fecha_Actividad = Convert.ToDateTime(tbx_FechaActividad.Text);
              
                try
                {
                    acta.RegistroActa2(tipo_acta, id_contrato, fecha_acta, descripcion, fileName, fecha_Actividad);
                    Response.Redirect("~/Modulo_Modificar/ModActas.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error2 al registrar el acta";
                }
            }
        }
        else if (tipo_acta == 3) //Acta de liquidación
        {
            if (tbx_ValorEjecutado.Text == "")
            {
                try
                {
                    acta.RegistroActa(tipo_acta, id_contrato, fecha_acta, descripcion, fileName);
                    Response.Redirect("~/Modulo_Modificar/ModActas.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error al registrar el acta";
                }
            }
            else 
            {   
                //Si se agrega un valor ejecutado
                TablaContratos contrato = new TablaContratos();
                long valorEjecutado = Convert.ToInt64(tbx_ValorEjecutado.Text);
                int id = Convert.ToInt32(Session["ID_Contrato"]);
                try
                {
                    contrato.actualizarValorEjecutado(id, valorEjecutado);
                    acta.RegistroActa(tipo_acta, id_contrato, fecha_acta, descripcion, fileName);
                    Response.Redirect("~/Modulo_Modificar/ModActas.aspx");
                }
                catch (Exception)
                {
                    Lbl_Estado.Text = "Error3 al registrar el acta";
                }
            }
        }
        else
        {
            try
            {
                acta.RegistroActa(tipo_acta, id_contrato, fecha_acta, descripcion, fileName);
                Response.Redirect("~/Modulo_Modificar/ModActas.aspx");
            }
            catch (Exception)
            {
                Lbl_Estado.Text = "Error3 al registrar el acta";
            }
        }
        

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int valor = Convert.ToInt32(DropDownList1.SelectedValue);

        if (valor == 1 || valor == 11 || valor == 12 || valor == 4)
        {
            Label1.Visible = true;
            tbx_FechaActividad.Enabled = true;
            tbx_FechaActividad.Visible = true;
        }
        else if(valor == 3)
        {
            Label1.Visible = false;
            tbx_FechaActividad.Enabled = false;
            tbx_FechaActividad.Visible = false;
            Label2.Visible = true;
            tbx_ValorEjecutado.Visible = true;
        }
        else
        {
            Label1.Visible = false;
            tbx_FechaActividad.Enabled = false;
            tbx_FechaActividad.Visible = false;
            
        }
        
    }
}