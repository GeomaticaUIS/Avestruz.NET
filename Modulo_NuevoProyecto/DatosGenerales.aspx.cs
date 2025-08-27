using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class zNuevo_DatosGenerales : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e) 
    {
        if (Session["Id_Compromiso"] != null)
        {
            Session.Remove("Id_Compromiso");
        }
        if (Session["registroVie"] != null)
        {
            //Muestra la informacion agregada, pero no permite modificar, botones desactivados
            TablaProyectos proyectos = new TablaProyectos();
            int idproy = Convert.ToInt32(Session["Id_Proyecto"]);

            String[] DatosProyecto = proyectos.DatosProyecto(idproy);

            Txt_Nombre.Text = DatosProyecto[0];
            string cad = DatosProyecto[1].Replace(",0000", "");
            Txt_Valor.Text = cad;
            Txt_RegistroVie.Text = DatosProyecto[7];
            DateTime fechaVie = Convert.ToDateTime(DatosProyecto[8]);
            Txt_fechaVie.Text = String.Format("{0:dd/MM/yyyy}", fechaVie);
            //DateTime FechaPropuesta = Convert.ToDateTime(DatosProyecto[3]);
            //Txt_fechaPropuesta.Text = String.Format("{0:dd/MM/yyyy}", FechaPropuesta);            

            Txt_Nombre.Enabled = false;
            Txt_Valor.Enabled = false;
            Txt_RegistroVie.Enabled = false;
            Txt_fechaVie.Enabled = false;
            //Txt_fechaPropuesta.Enabled = false;
            Btn_Agregar.Enabled = false;
            Btn_Agregar.Visible = false;
            Btn_Continuar.Visible = true;
        }

    }
      
    protected void Btn_Agregar_Click(object sender, EventArgs e)
    {
        TablaProyectos proyectos = new TablaProyectos();
        String nombre = Txt_Nombre.Text;
        Decimal valor = System.Convert.ToDecimal(Txt_Valor.Text);
        String registroVie = Txt_RegistroVie.Text;
        //DateTime fechapropuesta = DateTime.Parse(Txt_fechaPropuesta.Text);
        DateTime fechaVie = DateTime.Parse(Txt_fechaVie.Text);

        bool verificarRegistroVie = proyectos.VerificarRegistroVie(registroVie);

        if (verificarRegistroVie == false)
        {
            

            Session["registroVie"] = registroVie;
            try
            {
                Directory.CreateDirectory(MapPath("~/Pdfs_Subidos/" + registroVie + "/Actas"));
                Directory.CreateDirectory(MapPath("~/Pdfs_Subidos/" + registroVie + "/Adiciones"));
                Directory.CreateDirectory(MapPath("~/Pdfs_Subidos/" + registroVie + "/Contrato"));
                Directory.CreateDirectory(MapPath("~/Pdfs_Subidos/" + registroVie + "/Productos"));
                Directory.CreateDirectory(MapPath("~/Pdfs_Subidos/" + registroVie + "/DocumentosIniciales"));
                try
                {
                    Session["Id_Proyecto"] = proyectos.Registro(nombre, valor, registroVie, fechaVie);
                    Session["ValorProyecto"] = valor;
                    // Con el numero de registroVie creo los directorios para ese proyecto

                    Btn_Agregar.Enabled = false;
                    Btn_Agregar.Visible = false;
                    Btn_Continuar.Visible = true;
                    Txt_Nombre.Enabled = false;
                    Txt_Valor.Enabled = false;
                    Txt_RegistroVie.Enabled = false;
                    Txt_fechaVie.Enabled = false;
                    //Txt_fechaPropuesta.Enabled = false;
                    Label1.Text = "Se registro el proyecto.";
                }
                catch (Exception)
                {
                    Label1.Text = "Error registrando Proyecto. Vuelva a intentarlo ";
                }
            }
            catch (Exception)
            {
                Label1.Text = "Error creando carpetas ";
            }
        }
        else
        {
            Label1.Text = "El N° de  Registro Vie ya existe";
        }
        
        
    }

    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        if (Session["registroVie"] != null)
        {
            Response.Redirect("~/Modulo_NuevoProyecto/Dociniciales.aspx");
        }
        else
        {
            Label1.Text = "Primero debe Agregar el Proyecto";
        }
    }

    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        if (Session["registroVie"] != null)
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
        }
        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }

}