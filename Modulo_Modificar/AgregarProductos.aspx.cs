using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zNuevo_cProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Id_RegistroVie"] == null)
        {
            Response.Redirect("~/Modulo_NuevoProyecto/DatosGenerales.aspx");
        }
        if (Session["ID_Producto"] == null)
        {
            Panel2.Enabled = false;
            Panel1.Visible = false;
            Panel1.Enabled = false;
        }
        else
        {
            Panel2.Enabled = true;
            TablaProductos producto = new TablaProductos();
            int productoID = Convert.ToInt32(Session["ID_Producto"]);
            String[] DatosProducto = producto.DatosProducto(productoID);

            Txt_Nombre.Text = DatosProducto[0];
            Txt_Nombre.Enabled = false;
            DropDownList1.Text = DatosProducto[1];
            DropDownList1.Enabled = false;
            Txt_descripcion.Text = DatosProducto[2];
            Txt_descripcion.Enabled = false;

            LinkButton1.Enabled = false;
            LinkButton1.Visible = false;
            Panel1.Visible = false;
            Panel1.Enabled = false;

            if (DatosProducto[4] != null)
            {
                Txb_Ubicacion.Text = DatosProducto[4];
            }
            Txb_Ubicacion.Enabled = false;
            Label2.Text = "Ultimo producto agregado";

            Btn_Agregar.Enabled = false;
            Btn_Agregar.Visible = false;
            Btn_Terminar.Enabled = false;
            Btn_Terminar.Visible = false;
            Btn_AgregarOtro.Enabled = false;
            Btn_AgregarOtro.Visible = false;
        }
        
    }

    protected void Btn_Agregar_Click(object sender, EventArgs e)
    {
        Agregar();

        Txt_Nombre.Enabled = false;
        DropDownList1.Enabled = false;
        Txt_descripcion.Enabled = false;
        Txb_Ubicacion.Enabled = false;
        LinkButton1.Enabled = false;
        LinkButton1.Visible = false;
        LinkButton2.Enabled = true;
        LinkButton2.Visible = true;
        Btn_Agregar.Enabled = false;
        Btn_Agregar.Visible = false;
        Btn_AgregarOtro.Enabled = true;
        Btn_AgregarOtro.Visible = true;

    }

    protected void Btn_AgregarOtro_Click(object sender, EventArgs e)
    {
        if (Session["ID_Producto"] != null)
        {
            Session.Remove("ID_Producto");
        }

        Response.Redirect("~/Modulo_Modificar/AgregarProductos.aspx");


    }

    private void Agregar()
    {
        TablaProductos producto = new TablaProductos();
        TablaParticipantes participante = new TablaParticipantes();

        int id_proy = Convert.ToInt32(Session["ID"]);
        string registro = Session["Id_RegistroVie"].ToString();

        String Nombre = Txt_Nombre.Text;
        int TipoProducto = Convert.ToInt32(DropDownList1.Text);
        String Descripcion = Txt_descripcion.Text;
        String NomArchivo = Txb_Ubicacion.Text;


        // Registro el producto
        try
        {
            Session["ID_Producto"] = producto.RegistroProducto(id_proy, Nombre, Descripcion, NomArchivo, TipoProducto);
            Label2.Text = "Producto Agregado";

        }
        catch (Exception)
        {
            Label2.Text = "Error registrando producto, vuelva a intentarlo";
        }


    }


    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        if (Session["ID_Producto"] != null)
        {
            Session.Remove("ID_Producto");
        }
        Response.Redirect("~/Modulo_Modificar/ModProducto.aspx");
    }



    protected void Agregar_Click(object sender, EventArgs e)
    {
        TablaParticipantes participante = new TablaParticipantes();
        if (DropDownList7.Text != null)
        {

            int id_participante = Convert.ToInt32(DropDownList7.Text);
            int rol = Convert.ToInt32(DropDownList8.Text);

            int id_prod = Convert.ToInt32(Session["ID_Producto"]);
            try
            {
                participante.RegistrarParticipante(id_prod, id_participante, rol);
            }
            catch (Exception)
            {
                Label2.Text = "Participante no agregado";
            }
        }
        Response.Redirect("~/Modulo_Modificar/AgregarProductos.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Agregar();
        Session["Ultimo"] = 1;
        Txt_Nombre.Enabled = false;
        DropDownList1.Enabled = false;
        Txt_descripcion.Enabled = false;
        Txb_Ubicacion.Enabled = false;

        Btn_Terminar.Enabled = false;
        Btn_Terminar.Visible = false;

        LinkButton2.Visible = false;
        Btn_Agregar.Enabled = false;
        Btn_Agregar.Visible = false;
        Btn_AgregarOtro.Enabled = false;
        Btn_AgregarOtro.Visible = false;
        LinkButton1.Enabled = false;
        LinkButton1.Visible = false;
        Panel2.Enabled = true;


    }
    protected void Btn_terminar2_Click(object sender, EventArgs e)
    {
        Panel2.Enabled = false;
        Session.Remove("ID_Producto");
        Btn_AgregarOtro.Enabled = true;
        Btn_AgregarOtro.Visible = true;
        Btn_Terminar.Visible = true;
        Btn_Terminar.Enabled = true;
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Btn_Terminar.Enabled = false;
        Btn_Terminar.Visible = false;
        LinkButton2.Enabled = false;
        LinkButton2.Visible = false;
        Panel2.Enabled = true;
    }

    protected void Btn_AñadirCol_Click(object sender, EventArgs e)
    {
        String nombre = TextBox1.Text;
        long nCedula = Convert.ToInt64(TextBox2.Text);

        TablaColaboradores colaborador = new TablaColaboradores();
        try
        {
            colaborador.RegistrarColaborador(nombre, nCedula);
        }
        catch (Exception)
        {

        }

        Response.Redirect("~/Modulo_Modificar/AgregarProductos.aspx");
    }
    protected void Btn_Terminar3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Modificar/AgregarProductos.aspx");
    }
    protected void Btn_AñadirColaborador_Click(object sender, EventArgs e)
    {
        Panel2.Enabled = false;

        Panel1.Enabled = true;
        Panel1.Visible = true;
    }
}