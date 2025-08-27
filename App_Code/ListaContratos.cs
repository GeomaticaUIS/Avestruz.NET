using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ListaContratos
/// </summary>
public class ListaContratos
{
    public int Id_Contrato_Convenio { set; get; }
    public int Id_Proyecto { set; get; }
    public int Tipo_Contrato { set; get; }
    public int Id_Entidad { set; get; }
    public String Nombre { set; get; }
    public String Objeto { set; get; }
    public Decimal? Valor { set; get; }
    public Decimal? ValorEjecutado { set; get; }
    public String Archivo_Pdf { set; get; }
    public DateTime? Fecha_Suscripcion { set; get; }
    public DateTime? Fecha_Inicio { set; get; }
    public DateTime? Fecha_Final { set; get; }
    public int Estado { set; get; }

	public ListaContratos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}