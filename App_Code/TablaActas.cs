using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaActas
/// </summary>
public class TablaActas
{
    public int Id_Actas { set; get; }
    public int Id_Tipo_Actas { set; get; }
    public int Id_Contrato { set; get; }
    public DateTime fechaActa { set; get; }
    public String Descripcion { set; get; }
    public String ArchivoPdf { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaActas()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public void RegistroActa(int tipo_acta, int Id_contrato, DateTime fecha_acta, string Descripcion, string ActaPdf)
    {
        Actas acta = new Actas();
        acta.Tipo_Acta = tipo_acta;
        acta.Nombre_Contrato_Convenio = Id_contrato;
        acta.Fecha_Acta = fecha_acta;
        acta.Descripción = Descripcion;
        acta.Archivo_Pdf = ActaPdf;

        dc.Actas.InsertOnSubmit(acta);
        dc.SubmitChanges();
    }

    public void RegistroActa2(int tipo_acta, int Id_contrato, DateTime fecha_acta, string Descripcion, string ActaPdf, DateTime fecha_actividad)
    {
        Actas acta = new Actas();
        acta.Tipo_Acta = tipo_acta;
        acta.Nombre_Contrato_Convenio = Id_contrato;
        acta.Fecha_Acta = fecha_acta;
        acta.Descripción = Descripcion;
        acta.Archivo_Pdf = ActaPdf;
        acta.Fecha_Actividad = fecha_actividad;

        dc.Actas.InsertOnSubmit(acta);
        dc.SubmitChanges();
    }

    public String[] DatosActa(int Id_Acta)
    {
        String[] Dato = new String[11];

        var datosacta = from u in dc.Actas
                        where u.Id_Actas == Id_Acta
                        select u;

        Actas acta = datosacta.Single();

        Dato[0] = acta.Tipo_Acta.ToString();
        Dato[1] = acta.Nombre_Contrato_Convenio.ToString();
        Dato[2] = acta.Fecha_Acta.ToString();
        Dato[3] = acta.Descripción;
        Dato[4] = acta.Archivo_Pdf;
        Dato[5] = acta.Fecha_Actividad.ToString();
        return Dato;
    }

    public void actualizar(int Id_Acta, int id_tipoActa,  DateTime fechaActa, string Descripcion, string ArchivoPdf)
    {

        var reg = dc.Actas.FirstOrDefault(x => x.Id_Actas == Id_Acta);
        if (reg != null)
        {
            reg.Tipo_Acta = id_tipoActa;
            reg.Fecha_Acta = fechaActa;
            reg.Descripción = Descripcion;
            reg.Archivo_Pdf = ArchivoPdf;
            
        }
        dc.SubmitChanges();

    }
    public void actualizar2(int Id_Acta, int id_tipoActa, DateTime fechaActa, string Descripcion, string ArchivoPdf, DateTime fecha_actividad)
    {

        var reg = dc.Actas.FirstOrDefault(x => x.Id_Actas == Id_Acta);
        if (reg != null)
        {
            reg.Tipo_Acta = id_tipoActa;
            reg.Fecha_Acta = fechaActa;
            reg.Descripción = Descripcion;
            reg.Archivo_Pdf = ArchivoPdf;
            reg.Fecha_Actividad = fecha_actividad;

        }
        dc.SubmitChanges();

    }
}