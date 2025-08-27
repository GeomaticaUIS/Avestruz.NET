using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Modificar_ModCompromisosAcademicos : System.Web.UI.Page
{
    TablaCompromisosAcademicos compromisos = new TablaCompromisosAcademicos();

    protected void Page_Load(object sender, EventArgs e)
    {
        

        if (Session["Id_Compromiso"] == null || Session["Id_Compromiso"] == "")
        {
            Panel2.Visible = false;
            Txt_descripcion.Enabled = true;
            Txt_fechaActa.Enabled = true;
            Txt_NombreCompromiso.Enabled = true;
            DropDownList1.Enabled = true;
            Btn_AñadirActa.Enabled = true;
        }
        else
        {
            TablaCompromisosAcademicos compromiso = new TablaCompromisosAcademicos();
            int id_compromiso = Convert.ToInt32(Session["Id_Compromiso"]);
            String[] DatosCompromiso = compromiso.DatosCompromiso(id_compromiso);
            Txt_descripcion.Enabled = false;
            Txt_fechaActa.Enabled = false;
            Txt_NombreCompromiso.Enabled = false;
            DropDownList1.Enabled = false;

            Txt_NombreCompromiso.Text = DatosCompromiso[0];
            Txt_descripcion.Text = DatosCompromiso[3];
            DropDownList1.Text = DatosCompromiso[1];
            if (DatosCompromiso[2] != null)
            {
                if (DatosCompromiso[2] != "")
                {
                    DateTime fechaCompromiso = Convert.ToDateTime(DatosCompromiso[2]);
                    Txt_fechaActa.Text = String.Format("{0:dd/MM/yyyy}", fechaCompromiso);
                }
            }
        }

    }
    protected void Btn_AñadirActa_Click(object sender, EventArgs e)
    {
        int Id_Proyecto = Convert.ToInt32(Session["ID"]);
        string Nombre = Txt_NombreCompromiso.Text;
        string descripcion = Txt_descripcion.Text;
        int Tipo_Compromiso = Convert.ToInt32(DropDownList1.Text);

        TablaInformeCompromisos informe = new TablaInformeCompromisos();
        String[] Datosinfo = informe.DatosInforme(Id_Proyecto, Tipo_Compromiso);
        if(Datosinfo[1] != null && Datosinfo[1] != "")
        {
            int cant = Convert.ToInt32(Datosinfo[1]); 
            cant = cant + 1;
            informe.actualizarcantidad(Id_Proyecto, Tipo_Compromiso, cant);
        }
        else
        {
            int cant = 1;
            informe.RegistroInforme(Id_Proyecto, Tipo_Compromiso, cant);
        }

        if (Txt_fechaActa.Text == null || Txt_fechaActa.Text == "")
        {

            try
            {
                Session["Id_Compromiso"] = compromisos.Registro2(Id_Proyecto, Tipo_Compromiso, Nombre, descripcion);
                Response.Redirect("~/Modulo_Modificar/ModCompromisosAcademicos.aspx");
                
            }
            catch (Exception)
            {
                Lbl_Estado.Text = "Error, vuelva a intentarlo";
            }
        }
        else
        {
            DateTime fechaActa = Convert.ToDateTime(Txt_fechaActa.Text);
            try
            {
                Session["Id_Compromiso"] = compromisos.Registro(Id_Proyecto, Tipo_Compromiso, Nombre, descripcion, fechaActa);
                Response.Redirect("~/Modulo_Modificar/ModCompromisosAcademicos.aspx");
                
            }
            catch (Exception)
            {
                Lbl_Estado.Text = "Error al convertir fecha";
            }

        }
    }
    protected void EditarCompromiso_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_compromiso = ((Label)boton2.Parent.FindControl("Id_Compromiso_AcademicoLabel"));

        int idcompromiso = Convert.ToInt32(id_compromiso.Text);

        Response.Redirect("~/Modulo_Modificar/ModificarCompromisoAcademico.aspx?ID_Compromiso=" + idcompromiso);
    }
    protected void Agregar_Click(object sender, EventArgs e)
    {
        TablaAutores autor = new TablaAutores();
        int id_compromiso = Convert.ToInt32(Session["Id_Compromiso"]);
        String NombreAutor = Tbx_Autor.Text;
        String codigo = Tbx_codigo.Text;

        try
        {
            autor.RegistrarAutores(id_compromiso, NombreAutor, codigo);
            Response.Redirect("~/Modulo_Modificar/ModCompromisosAcademicos.aspx");
        }
        catch(Exception)
        {
           
        }
    }
    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        Session.Remove("Id_Compromiso");
        Response.Redirect("~/Modulo_Modificar/ModCompromisosAcademicos.aspx");
    }
    protected void Btn_Terminar2_Click(object sender, EventArgs e)
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
    protected void Btn_Agregar2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Btn_AgregarCompromiso.Visible = false;
    }
}