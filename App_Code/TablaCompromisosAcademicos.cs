using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaCompromisosAcademicos
/// </summary>
public class TablaCompromisosAcademicos
{
    public int Tipo_Compromiso { set; get; }
    public String Nombre { set; get; }
    public String Detalles { set; get; }
    public DateTime FechaCompromiso { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaCompromisosAcademicos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public void RegistroInfo(int proyecto, int tipo)
    {
        Compromisos_Academicos compromiso = new Compromisos_Academicos();
        compromiso.Id_Proyecto = proyecto;
        compromiso.Tipo_Compromiso = tipo;

        dc.Compromisos_Academicos.InsertOnSubmit(compromiso);
        dc.SubmitChanges();
    }


    public int Registro(int proyecto, int tipo_compromiso, String nombre, String detalles, DateTime fechaCompromiso)
    {
        Compromisos_Academicos compromiso = new Compromisos_Academicos();

        compromiso.Id_Proyecto = proyecto;
        compromiso.Tipo_Compromiso = tipo_compromiso;
        compromiso.Nombre = nombre;
        compromiso.Detalles_Compromiso = detalles;
        compromiso.Fecha = fechaCompromiso;
        

        dc.Compromisos_Academicos.InsertOnSubmit(compromiso);
        dc.SubmitChanges();

        var Id_Compromiso = from u in dc.Compromisos_Academicos where u.Id_Proyecto == proyecto && u.Nombre == nombre select u.Id_Compromiso_Academico;
        return Id_Compromiso.Single();
      
    }

    public int Registro2(int proyecto, int tipo_compromiso, String nombre, String detalles)
    {
        Compromisos_Academicos compromiso = new Compromisos_Academicos();

        compromiso.Id_Proyecto = proyecto;
        compromiso.Tipo_Compromiso = tipo_compromiso;
        compromiso.Nombre = nombre;
        compromiso.Detalles_Compromiso = detalles;
        

        dc.Compromisos_Academicos.InsertOnSubmit(compromiso);
        dc.SubmitChanges();

        var Id_Compromiso = from u in dc.Compromisos_Academicos where u.Id_Proyecto == proyecto && u.Nombre == nombre select u.Id_Compromiso_Academico;
        return Id_Compromiso.Single();
    }

    public String[] DatosCompromiso(int Id_Compromiso)
    {
        String[] Dato = new String[5];

        var datoscompromiso = from u in dc.Compromisos_Academicos
                              where u.Id_Compromiso_Academico == Id_Compromiso
                              select u;

        Compromisos_Academicos compromiso = datoscompromiso.Single();

        Dato[0] = compromiso.Nombre;
        Dato[1] = compromiso.Tipo_Compromiso.ToString();
        Dato[2] = compromiso.Fecha.ToString();
        Dato[3] = compromiso.Detalles_Compromiso;
        

        return Dato;
    }

    public void actualizar(int Id_Compromiso, int id_tipoCompromiso, DateTime fechaCompromiso, string Descripcion, string Nombre)
    {

        var reg = dc.Compromisos_Academicos.FirstOrDefault(x => x.Id_Compromiso_Academico == Id_Compromiso);
        if (reg != null)
        {
            reg.Tipo_Compromiso = id_tipoCompromiso;
            reg.Fecha = fechaCompromiso;
            reg.Detalles_Compromiso = Descripcion;
            reg.Nombre = Nombre;

        }
        dc.SubmitChanges();

    }
    public void actualizar2(int Id_Compromiso, int id_tipoCompromiso, string Descripcion, string Nombre)
    {

        var reg = dc.Compromisos_Academicos.FirstOrDefault(x => x.Id_Compromiso_Academico == Id_Compromiso);
        if (reg != null)
        {
            reg.Tipo_Compromiso = id_tipoCompromiso;
            reg.Detalles_Compromiso = Descripcion;
            reg.Nombre = Nombre;

        }
        dc.SubmitChanges();

    }
}