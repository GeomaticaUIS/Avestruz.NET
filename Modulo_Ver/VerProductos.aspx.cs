using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VerProductos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton linkboton2 = ((LinkButton)sender);
        Label id_producto = ((Label)linkboton2.Parent.FindControl("Id_ProductosLabel"));
        int Id_Producto = Convert.ToInt32(id_producto.Text);

        TablaProductos producto = new TablaProductos();
        String[] datosproducto = producto.DatosProducto(Id_Producto);

        if (datosproducto[4] != null)
        {
            string nombreArchivo = datosproducto[4];
            string registroVie = Session["Id_RegistroVie"].ToString();

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/Productos/" + nombreArchivo);
            Response.Flush();
            Response.End();
        }
    }
    protected void VerProducto_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_producto = ((Label)boton2.Parent.FindControl("Id_ProductosLabel"));

        int idproducto = Convert.ToInt32(id_producto.Text);
        
        Response.Redirect("~/Modulo_Ver/VerProductoEspecifico.aspx?Id_producto=" + idproducto);
    }
    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Ver/VerCompromisosAcademicos.aspx");
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

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}