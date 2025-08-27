using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zModificar_Modificarproducto : System.Web.UI.Page
{

    String Nombre, tipo, Descripcion, Ubicacion, P1, P2, P3, P4, R1, R2, R3, R4;
    protected void Page_Load(object sender, EventArgs e)
    {
        Nombre = Txt_Nombre.Text;
        tipo = DropDownList1.Text;
        
        Descripcion = Txt_descripcion.Text;
        Ubicacion = Txb_Ubicacion.Text;
        Panel1.Visible = false;
        Panel1.Enabled = false;
        if (Request.QueryString["ID_Producto"] != null && Session["ID_producto"] == null)
        {
            int idProducto = Convert.ToInt32(Request.QueryString["ID_Producto"]);
            Session["ID_Producto"] = idProducto;
            Mostrar(idProducto);
        }
        if (Session["ID_Producto"] != null)
        {
            int id_Producto = Convert.ToInt32(Session["ID_Producto"]);
            Mostrar(id_Producto);
        }
    }

    protected void Mostrar(int id_producto)
    {
        TablaProductos producto = new TablaProductos();
        int Idproducto = id_producto;
        String[] DatosProducto = producto.DatosProducto(Idproducto);

        Txt_Nombre.Text = DatosProducto[0];
        DropDownList1.Text = DatosProducto[1];
        Txt_descripcion.Text = DatosProducto[2];
        Txb_Ubicacion.Text = DatosProducto[4];

               
    }

    protected void Btn_Modificar_Click(object sender, EventArgs e)
    {
        Txt_descripcion.Enabled = true;
        Txt_Nombre.Enabled = true;
        Txb_Ubicacion.Enabled = true;
        DropDownList1.Enabled = true;
        Btn_Modificar.Enabled = false;
        Btn_Actualizar.Enabled = true;
       
    }

    protected void Btn_Actualizar_Click(object sender, EventArgs e)
    {
        TablaProductos producto = new TablaProductos();
        int id_producto = Convert.ToInt32(Session["ID_Producto"]);
        string registro = Convert.ToString(Session["Id_RegistroVie"]);
        int Tipo = Convert.ToInt32(tipo);
        TablaParticipantes participantes = new TablaParticipantes();

        
        try
        {
            producto.actualizar(id_producto, Nombre, Tipo, Descripcion, Ubicacion);
            
        }
        catch (Exception)
        {
            Label2.Text = "Error actualizando el Producto";
        }

      

        Response.Redirect("~/Modulo_Modificar/Modificarproducto.aspx");
    }

    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        Session.Remove("ID_Producto");
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
        Response.Redirect("~/Modulo_Modificar/Modificarproducto.aspx");
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

        Response.Redirect("~/Modulo_Modificar/Modificarproducto.aspx");
    }
    protected void Btn_Terminar3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Modificar/Modificarproducto.aspx");
    }
    protected void Btn_AñadirColaborador_Click(object sender, EventArgs e)
    {
        Panel2.Enabled = false;

        Panel1.Enabled = true;
        Panel1.Visible = true;
    }
}