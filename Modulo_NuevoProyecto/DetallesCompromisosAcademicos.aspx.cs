using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_NuevoProyecto_CompromisosAcademicos : System.Web.UI.Page
{
    
    String tipoCompromiso, fechaCompromiso, Descripcion, Nombre;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["registroVie"] == null)
        {
            Response.Redirect("~/Modulo_NuevoProyecto/DatosGenerales.aspx");
        }

        tipoCompromiso = DropDownList1.Text;
        fechaCompromiso = Txt_fechaActa.Text;
        Descripcion = Txt_descripcion.Text;
        Nombre = Txt_NombreCompromiso.Text;

        if (Request.QueryString["ID_Compromiso"] != null && Session["Id_Compromiso"] == null)
        {
            int id_compromiso = Convert.ToInt32(Request.QueryString["ID_Compromiso"]);
            Session["Id_Compromiso"] = id_compromiso;
            Mostrar(id_compromiso);
        }
        if (Session["Id_Compromiso"] != null)
        {
            int id_compromiso = Convert.ToInt32(Session["Id_Compromiso"]);
            Mostrar(id_compromiso);
        }
    }

    protected void Mostrar(int id_compromiso)
    {

        TablaCompromisosAcademicos compromiso = new TablaCompromisosAcademicos();
        int Idcompromiso = id_compromiso;

        String[] DatosCompromiso = compromiso.DatosCompromiso(Idcompromiso);

        Txt_NombreCompromiso.Text = DatosCompromiso[0];
        DropDownList1.Text = DatosCompromiso[1];
        //DateTime fechaCompromiso = Convert.ToDateTime(DatosCompromiso[2]);
        if (DatosCompromiso[2] != null)
        {
            if (DatosCompromiso[2] != "")
            {
                DateTime fecha = Convert.ToDateTime(DatosCompromiso[2]);
                Txt_fechaActa.Text = String.Format("{0:dd/MM/yyyy}", fecha);
            }
        }
        Txt_descripcion.Text = DatosCompromiso[3];

       

    }


    protected void Btn_Actualizar_Click(object sender, EventArgs e)
    {
        TablaCompromisosAcademicos compromisos = new TablaCompromisosAcademicos();
        string registro = Convert.ToString(Session["id_RegistroVie"]);
        int id_compromiso = Convert.ToInt32(Session["Id_Compromiso"]);
        int Tipo_Compromiso = Convert.ToInt32(tipoCompromiso);
        Btn_Actualizar.Enabled = false;
        if (Txt_fechaActa.Text == "")
        {

            try
            {

                compromisos.actualizar2(id_compromiso, Tipo_Compromiso, Descripcion, Nombre);
                Lbl_Estado.Text = "Compromiso Academico actualizado correctamente ";
                Response.Redirect("~/Modulo_NuevoProyecto/DetallesCompromisosAcademicos.aspx");

            }
            catch (Exception)
            {
                Lbl_Estado.Text = "Error al actualizar Compromiso Academico1";
            }

        }
        else
        {
            try
            {
                DateTime Fecha_Compromiso = Convert.ToDateTime(fechaCompromiso);
                compromisos.actualizar(id_compromiso, Tipo_Compromiso, Fecha_Compromiso, Descripcion, Nombre);
                Lbl_Estado.Text = "Compromiso Academico actualizado correctamente ";
                Response.Redirect("~/Modulo_NuevoProyecto/DetallesCompromisosAcademicos.aspx");

            }
            catch (Exception)
            {
                Lbl_Estado.Text = "Error al actualizar Compromiso Academico2";
            }
        }
    }

   

    protected void Btn_Terminar2_Click(object sender, EventArgs e)
    {
        Session.Remove("Id_Compromiso");
        Response.Redirect("~/Modulo_NuevoProyecto/CompromisosAcademicos.aspx");
    }
    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        Session.Remove("Id_Compromiso");
        Response.Redirect("~/Modulo_NuevoProyecto/CompromisosAcademicos.aspx");
    }
    protected void Btn_Modificar_Click(object sender, EventArgs e)
    {
        Btn_Actualizar.Visible = true;
        Txt_NombreCompromiso.Enabled = true;
        Txt_fechaActa.Enabled = true;
        Txt_descripcion.Enabled = true;
        Btn_Modificar.Visible = false;
        
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
            Response.Redirect("~/Modulo_NuevoProyecto/DetallesCompromisosAcademicos.aspx");
        }
        catch (Exception)
        {
            Lbl_estado2.Text = "Error al registrar Autor";
        }
    }
}