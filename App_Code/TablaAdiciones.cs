using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaAdiciones
/// </summary>
public class TablaAdiciones
{
    public int Id_Contrato { set; get; }
    public int Id_Tipo_Adicion { set; get; }
    public DateTime fechaAdicion { set; get; }
    public String NombreAdicion { set; get; }
    public String Descripcion { set; get; }
    public String ArchivoPdf { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaAdiciones()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
    public void RegistroAdicion(String Nombre, int tipo_adicion, int Id_contrato, DateTime fecha_adicion, string Descripcion, string AdicionPdf, string TiempoAdicional)
    {
        Otrosí_Adiciones adicion = new Otrosí_Adiciones();
        adicion.Nombre = Nombre;
        adicion.Tipo_Otrosi_Adición = tipo_adicion;
        adicion.Convenio_Contrato = Id_contrato;
        adicion.Fecha_Otrosi_Adición = fecha_adicion;
        adicion.Descripción = Descripcion;
        adicion.Archivo_Pdf = AdicionPdf;
        adicion.Tiempo_Adicional = TiempoAdicional;
        

        dc.Otrosí_Adiciones.InsertOnSubmit(adicion);
        dc.SubmitChanges();
    }

    public void RegistroAdicion2(string Nombre, int tipo_adicion, int Id_contrato, DateTime fecha_adicion, string Descripcion, string AdicionPdf, string TiempoAdicional, Decimal ValorAdicional)
    {
        Otrosí_Adiciones adicion = new Otrosí_Adiciones();
        adicion.Nombre = Nombre;
        adicion.Tipo_Otrosi_Adición = tipo_adicion;
        adicion.Convenio_Contrato = Id_contrato;
        adicion.Fecha_Otrosi_Adición = fecha_adicion;
        adicion.Descripción = Descripcion;
        adicion.Archivo_Pdf = AdicionPdf;
        adicion.Tiempo_Adicional = TiempoAdicional;
        adicion.Valor_Adicional = ValorAdicional;

        dc.Otrosí_Adiciones.InsertOnSubmit(adicion);
        dc.SubmitChanges();
    }

    public String[] DatosAdicion(int Id_Adicion)
    {
        String[] Dato = new String[11];

        var datosadicion = from u in dc.Otrosí_Adiciones
                        where u.Id_Otrosí == Id_Adicion
                        select u;

        Otrosí_Adiciones adicion = datosadicion.Single();

        Dato[0] = adicion.Convenio_Contrato.ToString();
        Dato[1] = adicion.Tipo_Otrosi_Adición.ToString();
        Dato[2] = adicion.Nombre;
        Dato[3] = adicion.Fecha_Otrosi_Adición.ToString();
        Dato[4] = adicion.Descripción;
        Dato[5] = adicion.Archivo_Pdf;
        Dato[6] = adicion.Valor_Adicional.ToString();
        Dato[7] = adicion.Tiempo_Adicional;

        return Dato;
    }

    public void actualizar(int Id_Adicion, string Nombre, int id_tipoAdicion, DateTime fechaAdicion, string Descripcion, string ArchivoPdf, string TiempoAdicional)
    {

        var reg = dc.Otrosí_Adiciones.FirstOrDefault(x => x.Id_Otrosí == Id_Adicion);
        if (reg != null)
        {
            reg.Nombre = Nombre;
            reg.Tipo_Otrosi_Adición = id_tipoAdicion;
            reg.Fecha_Otrosi_Adición = fechaAdicion;
            reg.Descripción = Descripcion;
            reg.Archivo_Pdf = ArchivoPdf;
            reg.Tiempo_Adicional = TiempoAdicional;

        }
        dc.SubmitChanges();

    }
    public void actualizar2(int Id_Adicion, string Nombre, int id_tipoAdicion, DateTime fechaAdicion, string Descripcion, string ArchivoPdf, string TiempoAdicional, decimal ValorAdicional)
    {

        var reg = dc.Otrosí_Adiciones.FirstOrDefault(x => x.Id_Otrosí == Id_Adicion);
        if (reg != null)
        {
            reg.Nombre = Nombre;
            reg.Tipo_Otrosi_Adición = id_tipoAdicion;
            reg.Fecha_Otrosi_Adición = fechaAdicion;
            reg.Descripción = Descripcion;
            reg.Archivo_Pdf = ArchivoPdf;
            reg.Tiempo_Adicional = TiempoAdicional;
            reg.Valor_Adicional = ValorAdicional;

        }
        dc.SubmitChanges();

    }
}