using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaProyectos
/// </summary>
public class TablaProyectos
{
    public String nombreProyecto { set; get; }
    public Double valorProyecto { set; get; } 
    public String propuestaPdf { set; get; } 
    public DateTime fechaPropuesta { set; get; } 
    public String actaClaustro { set; get; } 
    public String actaConsejoEscuela { set; get; }
    public String actaConsejoFacultad { set; get; }
    public String registroVie { set; get; }
    public DateTime fechaRegistroVie { set; get; }
    public String formatoRegistro { set; get; }
    public String cartaPresentacion { set; get; }
    public String MemoriaTecnica { set; get; }
    public String PresupuestoInterno {set; get;}
    
    AccesoDatosDataContext dc = new AccesoDatosDataContext();

    public TablaProyectos()
    {
        //
        // TODO: Agregar aquí la lógica del constructor
        //
    }

    /// <summary>
    /// Registra los datos generales del nuevo proyecto y consulta el ID generado
    /// </summary>
    /// <param name="nombre">Nombre del proyecto</param>
    /// <param name="valor">Valor del contrato</param>
    /// <param name="registroVie">Número de registro VIE</param>
    /// <param name="fechaVie">Fecha de registro del proyecto</param>
    /// <returns>ID del proyecto creado</returns>
    public int Registro(String nombre, Decimal valor, String registroVie, DateTime fechaVie)
    {
        Proyectos proyecto = new Proyectos();

        proyecto.Nombre = nombre;
        proyecto.Valor = valor;
        proyecto.Registro_VIE = registroVie;
        proyecto.Fecha_Registro_VIE = fechaVie;
        
        dc.Proyectos.InsertOnSubmit(proyecto);
        dc.SubmitChanges();

        var ID = from u in dc.Proyectos where u.Registro_VIE == registroVie select u.Id_Proyecto;
        return ID.Single();
    }
    
    public void RegistroDocumento1(int id_proy, String formatoRegistro)
    {
        
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Formato_Registro_VIE = formatoRegistro;
        }
        
        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo Registro VIE que se va a eliminar
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileRegistroVIE(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Formato_Registro_VIE });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo de la VIE de la BD
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    public void DeleteRegistroVIE(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Formato_Registro_VIE = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento2(int id_proy, DateTime fechaPropuesta, String cartaPresentacion)
    {
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Carta_Presentación = cartaPresentacion;
            i.Fecha_Propuesta = fechaPropuesta;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre de la carta de presentación que se va a eliminar
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileCarta(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Carta_Presentación });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo carta de presentación de la BD
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    public void DeleteCartaPresentacion(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Carta_Presentación = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento3(int id_proy, String propuestaPdf)
    {
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Propuesta_Pdf = propuestaPdf;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo propuesta pdf que se va a eliminar
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFilePropuestapdf(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Propuesta_Pdf });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo propuesta pdf de la BD
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    public void DeletePropuestapdf(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Propuesta_Pdf = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento4(int id_proy, String actaClaustro)
    {
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Acta_Claustro = actaClaustro;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo acta claustro que se va a eliminar
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileActaClaustro(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Acta_Claustro });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo acta claustro de la BD
    /// </summary>
    /// <param name="id_proy">Id del proyecto</param>
    public void DeleteActaClaustro(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Acta_Claustro = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento5(int id_proy, String actaConsejoEscuela)
    {
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Acta_Consejo_Escuela = actaConsejoEscuela;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo acta escuela que se va a eliminar
    /// </summary>
    /// <param name="id_proy">ID del proyectos</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileActaEscuela(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Acta_Consejo_Escuela });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo acta escuela de la BD
    /// </summary>
    /// <param name="id_proy">Id del proyecto</param>
    public void DeleteActaEscuela(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Acta_Consejo_Escuela = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento6(int id_proy, String ActaConsejoFacultad)
    {
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Acta_Consejo_Facultad = ActaConsejoFacultad;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo acta facultad que se va a eliminar
    /// </summary>
    /// <param name="id_proy">Id del proyecto</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileActaFacultad(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Acta_Consejo_Facultad });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo acta facultad de la BD
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    public void DeleteActaFacultad(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Acta_Consejo_Facultad = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento7(int id_proy, String MemoTecnico)
    {
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Memoria_Tecnica = MemoTecnico;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo memo tecnica que se va a eliminar
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileMemoTecnica(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Memoria_Tecnica });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo Memo Tecnica de la BD
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    public void DeleteMemoTecnica(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Memoria_Tecnica = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento8(int id_proy, String PresupuestoInterno)
    {
        Proyectos proyecto = new Proyectos();
        var reg = from u in dc.Proyectos
                  where u.Id_Proyecto == id_proy
                  select u;
        foreach (var i in reg)
        {
            i.Presupuesto_interno = PresupuestoInterno;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo presupuesto que se va a eliminar
    /// </summary>
    /// <param name="id_proy">ID del proyecto</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFilePresupuesto(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy).Select(x => new { NomFile = x.Presupuesto_interno });
        return files.Single().NomFile;
    }

    /// <summary>
    /// Eliminamos el nombre del archivo Presupuesto de la BD
    /// </summary>
    /// <param name="id_proy">Id del proyecto</param>
    public void DeletePresupuesto(int id_proy)
    {
        var files = dc.Proyectos.Where(x => x.Id_Proyecto == id_proy);
        //Cambiamos el valor del campo
        Proyectos proy = files.Single();
        proy.Presupuesto_interno = null;

        dc.SubmitChanges();
    }

    /// <summary>
    /// Verifica si el número de registro VIE ya esta en la BD (No se admiten registros VIE repetidos)
    /// </summary>
    /// <param name="registroVie">Número de registro VIE</param>
    /// <returns>true -> Ya esta en la BD/false -> No esta en la BD</returns>
    public bool VerificarRegistroVie(string registroVie)
    {
        var auth = from u in dc.Proyectos where u.Registro_VIE == registroVie  select u;
        if (auth.Count() > 0) return true; //verificado
        else return false;
    }

    /// <summary>
    /// Consulta todos los datos del proyecto
    /// </summary>
    /// <param name="IdProyecto">ID del proyecto</param>
    /// <returns>String[] con los datos del proyecto</returns>
    public String[] DatosProyecto(int IdProyecto)
    {
        String[] Dato = new String[13];

        var datosusuario = from u in dc.Proyectos
                           where u.Id_Proyecto == IdProyecto
                           select u;

        Proyectos proyecto = datosusuario.Single();
        
        Dato[0] = proyecto.Nombre;
        Dato[1] = proyecto.Valor.ToString();
        Dato[2] = proyecto.Propuesta_Pdf;
        Dato[3] = proyecto.Fecha_Propuesta.ToString();
        Dato[4] = proyecto.Acta_Claustro;
        Dato[5] = proyecto.Acta_Consejo_Escuela;
        Dato[6] = proyecto.Acta_Consejo_Facultad;
        Dato[7] = proyecto.Registro_VIE;
        Dato[8] = proyecto.Fecha_Registro_VIE.ToString();
        Dato[9] = proyecto.Formato_Registro_VIE;
        Dato[10] = proyecto.Carta_Presentación;
        Dato[11] = proyecto.Memoria_Tecnica;
        Dato[12] = proyecto.Presupuesto_interno;
               
        return Dato;
    }

    public void actualizar(int Id_Proyecto, string Nombre, decimal valor, DateTime fechaVie,string regVie)
    {

        var reg = dc.Proyectos.FirstOrDefault(x => x.Id_Proyecto == Id_Proyecto);
        if (reg != null)
        {
            reg.Nombre = Nombre;
            reg.Valor = valor;
            reg.Fecha_Registro_VIE = fechaVie;
            reg.Registro_VIE = regVie;
        }
        dc.SubmitChanges();

    }
	
}