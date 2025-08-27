using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zModificar_ModContrato : System.Web.UI.Page
{
    String Nombre, Tipo, Entidad, FechaInicio, Fechafinal, FechaSuscripcion, Objeto, archivo_Pdf, Estado, fileName; 
    protected void Page_Load(object sender, EventArgs e)
    {

        Nombre = Txt_Nombre.Text;
        Tipo = DropDownList1.Text;
        Entidad = DropDownList2.Text;
        Estado = DropDownList3.Text;
        FechaInicio = Txt_FechaInicio.Text;
        Fechafinal = Txt_FechaFinal.Text;
        FechaSuscripcion = Txt_fechaPropuesta.Text;
        Objeto = Txt_Objeto.Text;
        

        int id_contrato = Convert.ToInt32(Session["ID_Contrato"]);
        if (Session["ID_Contrato"] == null || id_contrato == 0)
        {
            // Debo registrarlo normalmente
        }
        else
        {

            int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);

            TablaContratos contrato = new TablaContratos();
            

            String[] DatosContrato = contrato.DatosContrato(Id_Contrato);
          

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

            if (DatosContrato[7] == null || DatosContrato[7] == "")
            {
                
                Label2.Text = "Archivo aun no agregado";
            }
            else
            {
                archivo_Pdf = DatosContrato[7];
                Label2.Text = "Archivo Agregado"; 
            }
        }
    }

    protected void Btn_Modificar_Click(object sender, EventArgs e)
    {
        Btn_Modificar.Enabled = false;
        Txt_Nombre.Enabled = true;
        DropDownList1.Enabled = true;
        DropDownList2.Enabled = true;
        DropDownList3.Enabled = true;
        Txt_FechaInicio.Enabled = true;
        Txt_FechaFinal.Enabled = true;
        Txt_fechaPropuesta.Enabled = true;
        Txt_Objeto.Enabled = true;
        Subir_ContratoPdf.Enabled = true;
        Btn_Actualizar.Enabled = true;
    }

    protected void Btn_Actualizar_Click(object sender, EventArgs e)
    {
        Btn_Modificar.Enabled = true;
        Btn_Actualizar.Enabled = false;

        if (Session["ID_Contrato"] != null)
        {
            string registro = Convert.ToString(Session["id_RegistroVie"]);
            int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
            TablaContratos contrato = new TablaContratos();
            String[] DatosContrato = contrato.DatosContrato(Id_Contrato);

            string nombre = Nombre;
            int tipo = Convert.ToInt32(Tipo);
            int entidad = Convert.ToInt32(Entidad);
            DateTime Fechapropuesta = Convert.ToDateTime(FechaSuscripcion);
            DateTime FechaInicial = Convert.ToDateTime(FechaInicio);
            DateTime fechaFinal = Convert.ToDateTime(Fechafinal);
            string objeto = Objeto;
            int id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
            int estado = Convert.ToInt32(Estado);

            if (Subir_ContratoPdf.HasFile)
            {
                String fileExt = System.IO.Path.GetExtension(Subir_ContratoPdf.FileName).ToString();
                if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
                {
                    string fileName = Subir_ContratoPdf.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_ContratoPdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName));
                    archivo_Pdf = fileName;
                    Label2.Text = "Archivo subido";
                    //Aca deberia eliminarse el archivo existente
                    try
                    {
                        contrato.actualizar(id_Contrato, tipo, entidad, nombre, FechaInicial, fechaFinal, Fechapropuesta, objeto, archivo_Pdf, estado);
                        Response.Redirect("~/Modulo_Modificar/ModContrato.aspx");
                    }
                    catch (Exception)
                    {
                        Label1.Text = "Error registrando contrato, vuelva a intentarlo ";
                    }
                }
                else
                    Label2.Text = "Error, el archivo no es pdf";
            }
            else
            {
                if (DatosContrato[7] == null || DatosContrato[7] == "")
                {

                    try
                    {
                        contrato.actualizar(id_Contrato, tipo, entidad, nombre, FechaInicial, fechaFinal, Fechapropuesta, objeto, null, estado);
                        Response.Redirect("~/Modulo_Modificar/ModContrato.aspx");
                    }
                    catch (Exception)
                    {
                        Label1.Text = "Error registrando contrato, vuelva a intentarlo ";
                    }
                }
                else
                {
                    try
                    {
                        archivo_Pdf = DatosContrato[7];
                        contrato.actualizar(id_Contrato, tipo, entidad, nombre, FechaInicial, fechaFinal, Fechapropuesta, objeto, archivo_Pdf, estado);
                        Response.Redirect("~/Modulo_Modificar/ModContrato.aspx");
                    }
                    catch (Exception)
                    {
                        Label1.Text = "Error registrando contrato, vuelva a intentarlo ";
                    }
                }
            }

            
        }
        else
        {
            TablaContratos contratos = new TablaContratos();

            Decimal valor = System.Convert.ToDecimal(Session["ValorProyecto"]);
            int Id_proyecto = System.Convert.ToInt32(Session["ID"]);
            int Tipo_Contrato = Convert.ToInt32(DropDownList1.Text);
            int Id_Entidad = Convert.ToInt32(DropDownList2.Text);
            int Id_Estado = Convert.ToInt32(DropDownList3.Text);
            String nombre = Txt_Nombre.Text;
            String Objeto = Txt_Objeto.Text;
            DateTime fechaSuscripcion = Convert.ToDateTime(Txt_fechaPropuesta.Text);
            DateTime fechaInicial = Convert.ToDateTime(Txt_FechaInicio.Text);
            DateTime fechaFinal = Convert.ToDateTime(Txt_FechaFinal.Text);

            string registro = Session["Id_RegistroVie"].ToString();
            
            if (Subir_ContratoPdf.HasFile)
            {
                String fileExt = System.IO.Path.GetExtension(Subir_ContratoPdf.FileName).ToString();
                if (fileExt == "pdf" || fileExt == ".pdf" || fileExt == ".PDF" || fileExt == "PDF")
                {
                    string fileName = Subir_ContratoPdf.FileName;
                    fileName = fileName.Replace(" ", "_");
                    Subir_ContratoPdf.SaveAs(Server.MapPath("~/Pdfs_Subidos/" + registro + "/Contrato/" + fileName));
                    Label2.Text = "Archivo subido";
                }
                else
                    Label2.Text = "Error, el archivo no es pdf";
            }

            try
            {

                Session["Id_Contrato"] = contratos.Registro(Id_proyecto, Tipo_Contrato, Id_Entidad, nombre, Objeto, valor, fechaSuscripcion, fechaInicial, fechaFinal, fileName, Id_Estado);
                Response.Redirect("~/Modulo_Modificar/ModContrato.aspx");
               
            }
            catch (Exception)
            {
                Label1.Text = "Error registrando contrato, vuelva a intentarlo ";
            }
        }
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