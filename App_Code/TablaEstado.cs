using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaEstado
/// </summary>
public class TablaEstado
{

    public int Id_Estado { set; get; }
    public String Nombre_Estado { set; get; }
    
    AccesoDatosDataContext dc = new AccesoDatosDataContext();

    public TablaEstado()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    public String[] DatosEntidad(int Id_Estado)
    {
        String[] Dato = new String[2];


        var DatosEstado = from u in dc.Estado_Contrato
                            where u.Id_Estado_Contrato == Id_Estado
                            select u;

        Estado_Contrato estado = DatosEstado.Single();

        Dato[0] = estado.Id_Estado_Contrato.ToString();
        Dato[1] = estado.Nombre_Estado;
        
        return Dato;
    }
	
}