using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zNuevo_cContrato : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["registroVie"] == null)
        {
            Response.Redirect("~/Modulo_NuevoProyecto/DatosGenerales.aspx");
        }
        if (Session["Id_Compromiso"] != null)
        {
            Session.Remove("Id_Compromiso");
        }
        if (Session["Id_Contrato"] != null)
        {
            TablaContratos contrato= new TablaContratos();
            int contratoID = Convert.ToInt32(Session["Id_Contrato"]);

            String[] DatosContrato = contrato.DatosContrato(contratoID);

            Txt_Nombre.Text = DatosContrato[0];
            DropDownList1.Text = DatosContrato[1];
            DropDownList2.Text = DatosContrato[2];
            DropDownList3.Text = DatosContrato[9];
            Txt_Objeto.Text = DatosContrato[3];
            DateTime fechaSuscripcion = Convert.ToDateTime(DatosContrato[4]);
            Txt_fechaPropuesta.Text = String.Format("{0:dd/MM/yyyy}", fechaSuscripcion);
            DateTime fechainicio = Convert.ToDateTime(DatosContrato[5]);
            Txt_FechaInicio.Text = String.Format("{0:dd/MM/yyyy}", fechainicio);
            DateTime fechafinal = Convert.ToDateTime(DatosContrato[6]);
            Txt_FechaFinal.Text = String.Format("{0:dd/MM/yyyy}", fechafinal);
            Label2.Text = DatosContrato[7];

            DropDownList1.Enabled = false;
            DropDownList2.Enabled = false;
            DropDownList3.Enabled = false;
            Txt_Nombre.Enabled = false;
            Txt_Objeto.Enabled = false;
            Txt_fechaPropuesta.Enabled = false;
            Txt_FechaInicio.Enabled = false;
            Txt_FechaFinal.Enabled = false;
            Subir_ContratoPdf.Enabled = false;
            Btn_Agregar.Enabled = false;
            Btn_Agregar.Visible = false;
            
        }
    }
    
    protected void Btn_Agregar_Click(object sender, EventArgs e)
    {
        TablaContratos contratos = new TablaContratos();
        string registro = Session["registroVie"].ToString();
        Decimal valor = System.Convert.ToDecimal(Session["ValorProyecto"]);
        int Id_proyecto = System.Convert.ToInt32(Session["Id_Proyecto"]);

        int Tipo_Contrato = Convert.ToInt32(DropDownList1.Text);
        int Id_Entidad = Convert.ToInt32(DropDownList2.Text);
        String nombre = Txt_Nombre.Text;
        String Objeto = Txt_Objeto.Text;
        DateTime fechaSuscripcion = Convert.ToDateTime(Txt_fechaPropuesta.Text);
        DateTime fechaInicial = Convert.ToDateTime(Txt_FechaInicio.Text);
        DateTime fechaFinal = Convert.ToDateTime(Txt_FechaFinal.Text);
        int estado = Convert.ToInt32(DropDownList3.Text);



        if (Subir_ContratoPdf.HasFile)
        {

            String fileExt = System.IO.Path.GetExtension(Subir_ContratoPdf.FileName).ToString();
            if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
            {
                string fileName = Subir_ContratoPdf.FileName;
                fileName = fileName.Replace(" ", "_");
                Subir_ContratoPdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName));
                Label2.Text = "Archivo subido";
                try
                {

                    Session["Id_Contrato"] = contratos.Registro(Id_proyecto, Tipo_Contrato, Id_Entidad, nombre, Objeto, valor, fechaSuscripcion, fechaInicial, fechaFinal, fileName, estado);
                    Label1.Text = "Contrato registrado con exito";
                    DropDownList1.Enabled = false;
                    DropDownList2.Enabled = false;
                    DropDownList3.Enabled = false;
                    Txt_Nombre.Enabled = false;
                    Txt_Objeto.Enabled = false;
                    Txt_fechaPropuesta.Enabled = false;
                    Txt_FechaInicio.Enabled = false;
                    Txt_FechaFinal.Enabled = false;
                    Subir_ContratoPdf.Enabled = false;
                    Btn_Agregar.Enabled = false;
                    Btn_Agregar.Visible = false;
                }
                catch (Exception)
                {
                    Label1.Text = "Error registrando contrato, vuelva a intentarlo ";
                }
            }
            else
            {
                Label2.Text = "Error, el archivo no es un pdf";
            }
        }
        else
        {
            try
            {

                Session["Id_Contrato"] = contratos.Registro(Id_proyecto, Tipo_Contrato, Id_Entidad, nombre, Objeto, valor, fechaSuscripcion, fechaInicial, fechaFinal, null, estado);
                Label1.Text = "Contrato registrado con exito";
                DropDownList1.Enabled = false;
                DropDownList2.Enabled = false;
                DropDownList3.Enabled = false;
                Txt_Nombre.Enabled = false;
                Txt_Objeto.Enabled = false;
                Txt_fechaPropuesta.Enabled = false;
                Txt_FechaInicio.Enabled = false;
                Txt_FechaFinal.Enabled = false;
                Subir_ContratoPdf.Enabled = false;
                Btn_Agregar.Enabled = false;
                Btn_Agregar.Visible = false;
            }
            catch (Exception)
            {
                Label1.Text = "Error registrando contrato, vuelva a intentarlo ";
            }
        }

        
        
    }

    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        if (Session["Id_Contrato"] != null)
        {
            Response.Redirect("~/Modulo_NuevoProyecto/DocumentosContratante.aspx");
        }
        else
        {
            Label1.Text = "Agregue el contrato antes de continuar";
        }
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