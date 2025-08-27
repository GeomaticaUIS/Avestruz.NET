using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaEntidades
/// </summary>
public class TablaEntidades
{
    public int Id_Entidad { set; get; }
    public string Nombre_Entidad { set; get; }
    public int Nit { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaEntidades()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    
    public void RegistrarEntidad(String Nombre, long Nit)
    {

        Entidad_Contratante entidad = new Entidad_Contratante();
        entidad.Nombre_Entidad = Nombre;
        entidad.Nit = Nit;

        dc.Entidad_Contratante.InsertOnSubmit(entidad);
        dc.SubmitChanges();

    }

    public String[] DatosEntidad(int Id_Empresa)
    {
        String[] Dato = new String[3];


        var datosentidad = from u in dc.Entidad_Contratante
                            where u.Id_Entidad_Contratante == Id_Empresa
                            select u;

        Entidad_Contratante entidad = (Entidad_Contratante)datosentidad.Single();

        Dato[0] = entidad.Nombre_Entidad;
        Dato[1] = Convert.ToString(entidad.Nit);
        
        
        return Dato;
    }
}