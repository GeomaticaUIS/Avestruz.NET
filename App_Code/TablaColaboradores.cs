using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaColaboradores
/// </summary>
public class TablaColaboradores
{
    
    public int Id_Colaborador { set; get; }
    public String Nombre_Col { set; get; }
    public float Cedula { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

	public TablaColaboradores()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public void RegistrarColaborador(String Nombre, long numeroCedula)
    {
        Colaboradores colaborador = new Colaboradores();

        colaborador.Nombre_Colaborador = Nombre;
        colaborador.Cedula_Ciudadania = numeroCedula;

        dc.Colaboradores.InsertOnSubmit(colaborador);
        dc.SubmitChanges();
    }
}