using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaProductos
/// </summary>
public class TablaProductos
{
    public String nombreProducto { set; get; }
    public String Descripcion { set; get; } 
    public String Archivo { set; get; } 
    public int Id_TipoProyecto { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

    
	public TablaProductos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public int RegistroProducto(int id_Proy, String nombreProducto, String Descripcion, String Archivo, int Id_TipoProducto)
    {
        Productos producto = new Productos();
        
        producto.Id_Proyectos = id_Proy;
        producto.Nombre_Producto = nombreProducto;
        producto.Descripción_Producto = Descripcion;
        producto.Archivo = Archivo;
        producto.Id_TipoProducto = Id_TipoProducto;
        
        

        dc.Productos.InsertOnSubmit(producto);
        dc.SubmitChanges();
        var ID = from u in dc.Productos where u.Id_Proyectos == id_Proy && u.Nombre_Producto == nombreProducto select u.Id_Productos;
        return ID.Single();
    }

    public String[] DatosProducto(int productoID)
    {
        String[] Dato = new String[11];


        var datosproducto = from u in dc.Productos
                            where u.Id_Productos == productoID
                            select u;

        Productos producto = datosproducto.Single();

        Dato[0] = producto.Nombre_Producto;
        Dato[1] = producto.Id_TipoProducto.ToString();
        Dato[2] = producto.Descripción_Producto;
        Dato[4] = producto.Archivo;
        
        return Dato;
    }

    public void actualizar(int Id_Producto, string Nombre, int tipo, String Objeto, String ArchivoPdf )
    {

        var reg = dc.Productos.FirstOrDefault(x => x.Id_Productos == Id_Producto);
        if (reg != null)
        {
            reg.Nombre_Producto = Nombre;
            reg.Id_TipoProducto = tipo;
            reg.Descripción_Producto = Objeto;
            reg.Archivo = ArchivoPdf;

        }
        dc.SubmitChanges();

    }

}