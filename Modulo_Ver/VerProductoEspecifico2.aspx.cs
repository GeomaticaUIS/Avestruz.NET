using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class zVer_VerProductoEspecifico2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Id_producto"] != null)
        {

            int idproducto = Convert.ToInt32(Request.QueryString["Id_producto"]);
            Session["ID_Producto"] = idproducto;

            TablaProductos producto = new TablaProductos();
            String[] datosproducto = producto.DatosProducto(idproducto);
            lbl_Nombre.Text = datosproducto[0];
            int id_tipo = Convert.ToInt32(datosproducto[1]);
            TablaTipodeProducto tipo = new TablaTipodeProducto();
            String[] DatostipoProducto = tipo.DatosTipoProducto(id_tipo);
            lbl_Tipo_producto.Text = DatostipoProducto[1];
            lbl_Descripcion.Text = datosproducto[2];

           
            if(datosproducto[4] != null)
            {
                if (datosproducto[4] != "")
                {
                    Label4.Text = datosproducto[4];
                }
                else
                {
                    Label4.Text = "Archivo no agregado aun";
                }
            }
            else
            {
                Label4.Text = "Archivo no agregado aun";
            }
        }
    }

    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Busqueda/Buscar_Producto_Proyecto.aspx");
    }

    

    
}