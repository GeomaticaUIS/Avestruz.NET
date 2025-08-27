using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de ListaProyectos
/// </summary>
public class ListaProyectos
{
    public int Id_Contrato_Convenio { set; get; }
    public int Id_Proyecto { set; get; }
    public String Nombre { set; get; }
    public Decimal Valor { set; get; }
    public String Registro_VIE { set; get; }
    public DateTime? Fecha_VIE { set; get; }

	public ListaProyectos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}
}