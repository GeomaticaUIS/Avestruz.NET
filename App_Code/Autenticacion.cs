using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/// <summary>
/// Descripción breve de Autenticacion
/// </summary>
public class Autenticacion
{
    public String Login { set; get; }
    public String Password { set; get; }
	public Autenticacion()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    TablaUsuarios addusuario = new TablaUsuarios();
    /// <summary>
    /// Verifica las credenciales de logeo del usuario
    /// </summary>
    /// <param name="login">Login del usuario</param>
    /// <param name="password">Clave del usuario</param>
    /// <returns>true - si el usuario esta registrado</returns>
    public bool AutenticarUsuario(String login, String password)
    {
        bool verificado = addusuario.Autenticar(login, password);
        return verificado;
    }
    /// <summary>
    /// Consulta los datos del usuario autenticado
    /// </summary>
    /// <param name="login">Login del usuario</param>
    /// <param name="password">Clave del usario</param>
    /// <returns>Devuelve un objeto con las datos del usuario</returns>
   
    public TablaUsuarios DatosUsuarioValidado(String login, String password)
    {
        TablaUsuarios datosusuario = addusuario.Datosusuario(login, password);
        return datosusuario;
    }
}