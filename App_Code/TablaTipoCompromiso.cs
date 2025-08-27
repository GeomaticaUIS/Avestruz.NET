using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaTipoCompromiso
/// </summary>
public class TablaTipoCompromiso
{
    public int id_Tipo_Compromiso { set; get; }
    public String Nom_Tipo_Compromiso { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaTipoCompromiso()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public String[] DatosTipoCompromiso(int id_tipo)
    {
        String[] Dato = new String[2];


        var datostipocompromiso = from u in dc.Tipo_Compromiso_Academico
                                where u.Id_Tipo_Compromiso == id_tipo
                                select u;

        Tipo_Compromiso_Academico tipocompromiso = datostipocompromiso.Single();


        Dato[0] = tipocompromiso.Id_Tipo_Compromiso.ToString();
        Dato[1] = tipocompromiso.Tipo_Compromiso_Academico1;

        return Dato;
    }
}