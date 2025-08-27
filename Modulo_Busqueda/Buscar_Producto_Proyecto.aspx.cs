using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Modulo_Busqueda_Buscar_Producto_Proyecto : System.Web.UI.Page
{
	
    protected void Page_Load(object sender, EventArgs e)
    {
        Txt_Buscar.Text = (String) Session["Palabra_BuscarCon"]+ " "+Session["Palabra_BuscarSin"];
    }
    protected void VerProducto_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_producto = ((Label)boton2.Parent.FindControl("Id_ProductoLabel"));

        int idproducto = Convert.ToInt32(id_producto.Text);

        Response.Redirect("~/Modulo_Ver/VerProductoEspecifico2.aspx?Id_producto=" + idproducto);
    }
    
    protected void Btn_Mostrar_Click(object sender, EventArgs e)
    {
        Session["Palabra_Buscar"] = Txt_Buscar.Text;
        Response.Redirect("~/Modulo_Inicio/Buscar2.aspx");
    }
    
}