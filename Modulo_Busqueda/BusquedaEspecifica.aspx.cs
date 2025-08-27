using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class Modulo_Busqueda_BusquedaEspecifica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Tbx_BuscarProductos.Visible = false;
        bttBuscarProductos.Visible = false;
    }
    protected void Btn_BuscarNombre_Click(object sender, EventArgs e)
    {
        Session["Palabra_Buscar"] = Tbx_BuscarNombre.Text;
        Response.Redirect("~/Modulo_Busqueda/Buscar_Nombre.aspx");
    }
    protected void Btn_BuscarObjeto_Click(object sender, EventArgs e)
    {
        Session["Palabra_Buscar"] = Tbx_BuscarObjeto.Text;
        Response.Redirect("~/Modulo_Busqueda/Buscar_Objeto.aspx");
    }
    protected void Btn_BuscarEntidad_Click(object sender, EventArgs e)
    {
        String entidad = Convert.ToString(Entidades.SelectedItem);
        
        Session["Palabra_Buscar"] = entidad;
        Response.Redirect("~/Modulo_Busqueda/Buscar_Entidad.aspx");
    }
    /*protected void Btn_BuscarRegistro_Click(object sender, EventArgs e)
    {
        Session["Palabra_Buscar"] = Tbx_BuscarRegistro.Text;
        Response.Redirect("~/Modulo_Busqueda/Buscar_VIE.aspx");
    }*/
    protected void Btn_BuscarContrato_Click(object sender, EventArgs e)
    {
        Session["Palabra_Buscar"] = Tbx_BuscarContrato.Text;
        Response.Redirect("~/Modulo_Busqueda/Buscar_Contrato.aspx");
    }
    protected void Tbx_Buscar2_TextChanged(object sender, EventArgs e)
    {
        
    }
    protected void Opciones_SelectedIndexChanged(Object sender, EventArgs e)
    {

        if(Opciones.SelectedIndex > 0)
        {
            Tbx_BuscarProductos.Visible = true;
            bttBuscarProductos.Visible = true;
            if(Opciones.SelectedIndex == 1)
            {
                Tbx_BuscarProductos.Attributes.Add("placeholder", "Nombre del Proyecto");
            }
            else
            {
                Tbx_BuscarProductos.Attributes.Add("placeholder", "Nombre del Producto");
            }
        }

    }
    protected void Btn_BuscarProducto_Click(object sender, EventArgs e)
    {
        if(Opciones.SelectedIndex == 1)
        {
            Session["Palabra_Buscar"] = Tbx_BuscarProductos.Text;
            Response.Redirect("~/Modulo_Busqueda/Buscar_Producto_Proyecto.aspx");
        }
        if(Opciones.SelectedIndex == 2)
        {
            Session["Palabra_Buscar"] = Tbx_BuscarProductos.Text;
            Response.Redirect("~/Modulo_Busqueda/Buscar_Proyecto_Producto.aspx");
        }
    }
}