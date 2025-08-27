using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;

/// <summary>
/// Descripción breve de TablaUsuarios
/// </summary>
public class TablaUsuarios
{
    public int Id_usuario { set; get; }
    public String Nombre { set; get; }
    public String Apellido { set; get; }
    public int Rol { set; get; }
    private String Nombre_usuario { set; get; }
    private String Contraseña { set; get; }
    private String Correo { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();

  

    /// <summary>
    /// Encripta la contraseña del usuario
    /// </summary>
    /// <param name="password">Contraseña del usuario</param>
    /// <returns>Cadena cifrada en MD5</returns>
    private String MD5Encrypt(String password)
    {
        MD5CryptoServiceProvider provider = new MD5CryptoServiceProvider(); //Creamos el objeto proveedor

        byte[] data = System.Text.Encoding.ASCII.GetBytes(password);
        data = provider.ComputeHash(data);

        String md5 = String.Empty;

        for (int i = 0; i < data.Length; i++)
        {
            md5 += data[i].ToString("x2").ToLower();
        }

        return md5;
    }

    /// <summary>
    /// Verifica que el usuario esta registrado
    /// </summary>
    /// <param name="login">Login del usuario</param>
    /// <param name="pass">Clave del usuario</param>
    /// <returns></returns>
    public bool Autenticar(String login, String pass)
    {
        //convertimos el pass a MD5 para validar las credenciales
        String passMD5 = MD5Encrypt(pass);
        //buscamos el registro del usuario
        var auth = from u in dc.Usuarios where u.Username == login && u.Password == passMD5 select u;
        if (auth.Count() > 0) return true; //verificado
        else return false;
    }

    /// <summary>
    /// Consulta los datos del usuario autenticado
    /// </summary>
    /// <param name="login">login del usuario</param>
    /// <param name="pass">password del usuario</param>
    /// <returns></returns>
    public TablaUsuarios Datosusuario(String login, String pass)
    {
        String passmd5 = MD5Encrypt(pass); //Convertimos el pass en MD5

        var datos = from u in dc.Usuarios where u.Username == login && u.Password == passmd5 select u;

        Usuarios usuario = datos.Single();
        TablaUsuarios datosusuarios = new TablaUsuarios(usuario.Id_Usuario, usuario.Username, usuario.Nombre, usuario.Apellido, usuario.Id_Rol, usuario.Correo_Electronico);
        return datosusuarios;
    }

    

    /// <summary>
    /// Registro de Usuarios
    /// </summary>
    /// <param name="nom">Nombre</param>
    /// <param name="apellido">Apellido</param>
    /// <param name="password">contraseña</param>
    /// <param name="nom_usuario">nombre de usuario</param>
    /// <param name="idrol">rol de usuario</param>
    /// <param name="correo">Correo electronico</param>
	public void Registro(String nom, String apellido, String password, String nom_usuario,int idrol, String correo)
    {
        Usuarios user = new Usuarios();

        String passMD5 = MD5Encrypt(password);
        user.Nombre = nom;
        user.Apellido = apellido;
        user.Username = nom_usuario;
        user.Password = passMD5;
        user.Id_Rol = idrol;
        user.Correo_Electronico = correo;

        dc.Usuarios.InsertOnSubmit(user);
        dc.SubmitChanges();
    }

	public TablaUsuarios()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public TablaUsuarios(int idusuario, string username, string nombre, string apellido, int IdCargo, string correo)
    {
        this.Id_usuario = idusuario;
        this.Nombre_usuario = username;
        this.Nombre = nombre;
        this.Apellido = apellido;
        this.Rol = IdCargo;
        this.Correo = correo;
    }

}