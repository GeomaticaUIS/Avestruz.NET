using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class otra_prueba : System.Web.UI.Page
{
    Eliminacion elm = new Eliminacion();
    String nombre, valor, fechapropuesta, fechaVie;
    string regVieAnterior;
    bool confirm;
    protected void Page_Load(object sender, EventArgs e)
    {

        nombre = Txt_Nombre.Text;
        valor = Txt_Valor.Text;
        //fechapropuesta = Txt_fechaPropuesta.Text;
        fechaVie = Txt_fechaVie.Text;

        if (Request.QueryString["ID_Proy"] != null && Session["ID"] == null)
        {
            TablaContratos contratos = new TablaContratos();
            int idproy1 = Convert.ToInt32(Request.QueryString["ID_Proy"]);
            Session["ID"] = idproy1;
            Mostrar(idproy1);
            int id_contrato = contratos.Consultar_Id_Contrato(idproy1);
            if (id_contrato != 0)
            {
                Session["ID_Contrato"] = contratos.Consultar_Id_Contrato(idproy1);
            }
            else
            {
                Session["ID_Contrato"] = null;
            }
        }
        else if (Session["ID"] != null)
        {
            int id_proy2 = Convert.ToInt32(Session["ID"]);
            Mostrar(id_proy2);
        }

        ClientScript.GetPostBackEventReference(this, string.Empty);//This is important to make the "__doPostBack()" method, works properly

        if (Request.Form["__EVENTTARGET"] == "EliminarProyecto")
        {
            //call the method
            EliminarProyecto();
        }
        estado.Text = Server.MapPath("~/Pdfs_Subidos/" + Txt_RegistroVie.Text);
        regVieAnterior = Txt_RegistroVie.Text;
    }

    protected void Btn_Actualizar_Click(object sender, EventArgs e)
    {
        Btn_Modificar.Enabled = true;
        Btn_Actualizar.Enabled = false;
        TablaProyectos proyecto = new TablaProyectos();
        string Nombre = nombre;
        Decimal Valor = Convert.ToDecimal(valor);
        //DateTime Fechapropuesta = Convert.ToDateTime(fechapropuesta);
        DateTime Fechavie = Convert.ToDateTime(fechaVie);
        int id_proy = Convert.ToInt32(Session["ID"]);
        string regVie = renombrarDirectorio();
        //proyecto.actualizar(id_proy, Nombre, Valor, Fechavie, regVie);
        Response.Redirect("~/otra_prueba.aspx");
    }

    protected void Mostrar(int id_proy)
    {
        int id_proyecto = id_proy;
        TablaProyectos proyectos = new TablaProyectos();
        String[] DatosProyecto = proyectos.DatosProyecto(id_proyecto);

        Session["Id_RegistroVie"] = DatosProyecto[7];
        Session["NombreProyecto"] = DatosProyecto[0];
        Session["ValorProyecto"] = DatosProyecto[1];
        Txt_Nombre.Text = DatosProyecto[0];
        string cad = DatosProyecto[1].Replace(",0000", "");
        Txt_Valor.Text = cad;
        Txt_RegistroVie.Text = DatosProyecto[7];

        DateTime fechaVie = Convert.ToDateTime(DatosProyecto[8]);
        Txt_fechaVie.Text = String.Format("{0:dd/MM/yyyy}", fechaVie);

        //DateTime FechaPropuesta = Convert.ToDateTime(DatosProyecto[3]);
        //Txt_fechaPropuesta.Text = String.Format("{0:dd/MM/yyyy}", FechaPropuesta);
    }

    protected void Btn_Modificar_Click(object sender, EventArgs e)
    {
        Txt_Nombre.Enabled = true;
        Txt_Valor.Enabled = true;
        //Txt_fechaPropuesta.Enabled = true;
        Txt_fechaVie.Enabled = true;
        Btn_Actualizar.Enabled = true;
        Btn_Modificar.Enabled = false;
        Txt_RegistroVie.Enabled = true;
    }

    private string renombrarDirectorio()
    {
        string newRegVie = Txt_RegistroVie.Text;
        string root = "~/Pdfs_Subidos/";
        string sourceDirectory = Server.MapPath(root + regVieAnterior);
        string finalDirectory = Server.MapPath(root + newRegVie);
        string finalRegVie;

        var matched = String.Equals(regVieAnterior, newRegVie, StringComparison.OrdinalIgnoreCase);
        if (matched)
        {
            // El registro Vie guardado es igual al que se va a guardar
            finalRegVie = regVieAnterior;
        }
        else
        {
            // El registro Vie guardado es diferente al que se va a guardar
            finalRegVie = newRegVie;
            if (Directory.Exists(sourceDirectory))
            {
                try
                {
                    Directory.Move(sourceDirectory, finalDirectory);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }
            else
            {
                Console.WriteLine("No exite el directorio");
            }
        }

        return finalRegVie;
    }

    protected void Btn_Probar_Click(object sender, EventArgs e)
    {
        estado.Text = Txt_RegistroVie.Text;
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
    protected void Btn_Eliminar_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "deleteAlert();", true);
    }
    public void EliminarProyecto()
    {

        int idproy = Convert.ToInt32(Request.QueryString["ID_Proy"]);
        bool borrado;
        borrado = elm.eliminar(idproy);
        if (borrado)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "Redireccionar();", true);
        }
    }
}