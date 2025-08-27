using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaAutores
/// </summary>
public class TablaAutores
{

    public string Nombre { set; get; }
    public int Codigo{ set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();
	
    public TablaAutores()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public void RegistrarAutores(int Id_compromiso, string NombreAutor, String codigo)
    {
        
        Autores_Compromisos autor = new Autores_Compromisos();

        autor.Id_Compromiso = Id_compromiso;
        autor.Nombre_Autor = NombreAutor;
        autor.Codigo_Autor = codigo;
                
        dc.Autores_Compromisos.InsertOnSubmit(autor);
        dc.SubmitChanges();
    }
    

}