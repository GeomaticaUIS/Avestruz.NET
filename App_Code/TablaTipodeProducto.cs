using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaTipodeProducto
/// </summary>
public class TablaTipodeProducto
{

    public int id_Tipo_Producto { set; get; }
    public String Nom_Tipo_Producto { set; get; }
    

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaTipodeProducto()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public String[] DatosTipoProducto(int id_tipo)
    {
        String[] Dato = new String[2];


        var datostipoproducto = from u in dc.Tipo_Producto
                            where u.Id_TipoProducto == id_tipo
                            select u;
        
        Tipo_Producto tipoproducto = datostipoproducto.Single();


        Dato[0] = tipoproducto.Id_TipoProducto.ToString();
        Dato[1] = tipoproducto.Tipo_Producto1;
        
        return Dato;
    }
}