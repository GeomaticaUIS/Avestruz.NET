using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Ver_VerProductos2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            Session.Remove("ID");
        }
        if (Session["Id_RegistroVie"] != null)
        {
            Session.Remove("Id_RegistroVie");
        }
        if (Session["NombreProyecto"] != null)
        {
            Session.Remove("NombreProyecto");
        }
        if (Session["ID_Contrato"] != null)
        {
            Session.Remove("ID_Contrato");
        }
        if (Session["ID_Producto"] != null)
        {
            Session.Remove("ID_Producto");
        }
        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }
    protected void VerProducto_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_producto = ((Label)boton2.Parent.FindControl("Id_ProductosLabel"));

        int idproducto = Convert.ToInt32(id_producto.Text);

        Response.Redirect("~/Modulo_Ver/VerProductoEspecifico.aspx?Id_producto=" + idproducto);
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}