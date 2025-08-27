using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zModificar_ModProducto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Btn_Editar_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_producto = ((Label)boton2.Parent.FindControl("Id_ProductosLabel"));

        int Id_producto = Convert.ToInt32(id_producto.Text);

        Response.Redirect("~/Modulo_Modificar/Modificarproducto.aspx?ID_Producto=" + Id_producto);
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

   
    protected void Btn_Agregar2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Modificar/AgregarProductos.aspx");
    }
}