using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaInformeCompromisos
/// </summary>
public class TablaInformeCompromisos
{

    public int Id_proyecto { set; get; }
    public int Tipo_Compromiso { set; get; }
    public int cantidad { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaInformeCompromisos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
   

    public void RegistroInforme(int proyecto, int tipo, int cantidad)
    {

        Informe_CompromisosAcademicos informe = new Informe_CompromisosAcademicos();
        informe.Id_Proyecto = proyecto;
        informe.Id_Tipo_Compromiso = tipo;
        informe.Cantidad = cantidad;

        dc.Informe_CompromisosAcademicos.InsertOnSubmit(informe);
        dc.SubmitChanges();
    }

    public String[] DatosInforme(int id_proyecto, int Tipo)
    {
        String[] Dato = new String[2];

        var datosinforme = from u in dc.Informe_CompromisosAcademicos
                              where u.Id_Proyecto == id_proyecto && u.Id_Tipo_Compromiso == Tipo 
                              select u;

        Informe_CompromisosAcademicos informe = datosinforme.SingleOrDefault();

        if(informe != null)
        {
            Dato[0] = informe.Id_Informe.ToString();
            Dato[1] = informe.Cantidad.ToString();
        }
      
        return Dato;
    }

    public void actualizarcantidad(int proyecto, int tipo, int cantidad)
    {
        var reg = dc.Informe_CompromisosAcademicos.FirstOrDefault(x => x.Id_Proyecto == proyecto && x.Id_Tipo_Compromiso == tipo);
        if (reg != null)
        {
            reg.Cantidad = cantidad;
        }
        dc.SubmitChanges();
    }
}