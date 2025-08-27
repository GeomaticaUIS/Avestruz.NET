using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de TablaContratos
/// </summary>
public class TablaContratos
{
    public int Id_Contrato_Convenio{ set; get; }
    public int Id_Proyecto { set; get; }
    public int Tipo_Contrato { set; get; }
    public int Id_Entidad { set; get; }
    public String Nombre { set; get; }
    public String Objeto { set; get; }
    public Decimal Valor { set; get; }
    public String Archivo_Pdf{ set; get; }
    public DateTime? Fecha_Suscripcion { set; get; }
    public DateTime? Fecha_Inicio { set; get; }
    public DateTime? Fecha_Final { set; get; }
    public int Estado { set; get; }

    AccesoDatosDataContext dc = new AccesoDatosDataContext();
    public TablaContratos()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    /// <summary>
    /// Registra los datos del contrato/convenio del proyecto
    /// </summary>
    /// <param name="Id_Proyecto">ID del proyecto</param>
    /// <param name="Tipo_Contrato">Tipo de contrato</param>
    /// <param name="Id_Entidad"></param>
    /// <param name="Nombre"></param>
    /// <param name="Objeto"></param>
    /// <param name="Valor"></param>
    /// <param name="Fecha_Suscripcion"></param>
    /// <param name="Fecha_Inicio"></param>
    /// <param name="Fecha_Final"></param>
    /// <param name="Archivo_Pdf"></param>
    /// <param name="Estado"></param>
    /// <returns>ID del contrato/convenio</returns>
    public int Registro(int Id_Proyecto, int Tipo_Contrato, int Id_Entidad, String Nombre, String Objeto, Decimal Valor, DateTime? Fecha_Suscripcion, DateTime? Fecha_Inicio, DateTime? Fecha_Final, String Archivo_Pdf, int Estado)
    {
        Contrato_Convenio contrato = new Contrato_Convenio();

        contrato.Id_Proyecto = Id_Proyecto;
        contrato.Nombre = Nombre;
        contrato.Tipo = Tipo_Contrato;
        contrato.Entidad_Contratante = Id_Entidad;
        contrato.Objeto = Objeto;
        contrato.Valor= Valor;
        contrato.Valor_Contratado = Valor; //valor contrato + Adicionales (Si los hay) -> Valor contratado (En la página)
        contrato.Fecha_Suscripción = Fecha_Suscripcion;
        contrato.Fecha_Inicio = Fecha_Inicio;
        contrato.Fecha_Terminación = Fecha_Final;
        contrato.Archivo_Pdf = Archivo_Pdf;
        contrato.Estado = Estado;

        dc.Contrato_Convenio.InsertOnSubmit(contrato);
        dc.SubmitChanges();

        var ID = from u in dc.Contrato_Convenio where u.Id_Proyecto == Id_Proyecto && u.Nombre == Nombre select u.Id_Convenio_Contrato;
        return ID.Single();
        
    }

    /// <summary>
    /// Buscamos el convenio_contrato y le sumamos el valor de la adición al valor del contrato
    /// </summary>
    /// <param name="id_contrato">ID del contrato</param>
    /// <param name="valorAdicion">Valor de la adición</param>
    public void AdicionValorContrato(int id_contrato, decimal valorAdicion)
    {
        //Consultamos
        var contrato_convenios = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_contrato);
        Contrato_Convenio ContratoConvenio = contrato_convenios.Single();
        ContratoConvenio.Valor_Contratado += valorAdicion;

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consulta los datos del contrato
    /// </summary>
    /// <param name="contratoID">ID del registro del contrato en la BD (tabla Contrato_Convenio)</param>
    /// <returns>String[] con los datos del contrato</returns>
    public String[] DatosContrato(int contratoID)
    {
        String[] Dato = new String[16];

        
        var datoscontrato = from u in dc.Contrato_Convenio
                           where u.Id_Convenio_Contrato == contratoID
                           select u;

        Contrato_Convenio contrato = datoscontrato.Single();

        Dato[0] = contrato.Nombre;
        Dato[1] = Convert.ToString(contrato.Tipo);
        Dato[2] = Convert.ToString(contrato.Entidad_Contratante);
        Dato[3] = contrato.Objeto;
        Dato[4] = contrato.Fecha_Suscripción.ToString();
        Dato[5] = contrato.Fecha_Inicio.ToString();
        Dato[6] = contrato.Fecha_Terminación.ToString();
        Dato[7] = contrato.Archivo_Pdf;
        Dato[8] = contrato.Valor_Contratado.ToString(); //valor contrato + Adicionales (Si los hay) -> Valor contratado (En la página)
        Dato[9] = contrato.Estado.ToString();
        Dato[10] = contrato.Carta_Solicitud_Propuesta;
        Dato[11] = contrato.Terminos_referencia;
        Dato[12] = contrato.Estudios_Previos;
        Dato[13] = contrato.Certificados_Disponibilida_Presupuestal;
        Dato[14] = contrato.Registro_Presupuestal;
        Dato[15] = contrato.Valor_Liquidado.ToString(); //El valor que se registra en este campo se obtiene del formato "Acta de liquidación" de la pág.
                       
        return Dato;
    }

    public int Consultar_Id_Contrato(int Id_Proyecto)
    {

        Contrato_Convenio contrato = new Contrato_Convenio();

        var ID = from u in dc.Contrato_Convenio where u.Id_Proyecto == Id_Proyecto select u.Id_Convenio_Contrato;
        return ID.SingleOrDefault();
        
    }

    public void actualizar(int Id_Contrato, int Tipo, int Entidad, string Nombre, DateTime fechaInicio ,DateTime fechaFinal,  DateTime fechaPropuesta, String Objeto, String ArchivoPdf, int Estado)
    {

        var reg = dc.Contrato_Convenio.FirstOrDefault(x => x.Id_Convenio_Contrato == Id_Contrato);
        if (reg != null)
        {
            reg.Tipo = Tipo;
            reg.Entidad_Contratante = Entidad;
            reg.Nombre = Nombre;
            reg.Fecha_Inicio = fechaInicio;
            reg.Fecha_Terminación = fechaFinal;
            reg.Fecha_Suscripción = fechaPropuesta;
            reg.Objeto = Objeto;
            reg.Archivo_Pdf = ArchivoPdf;
            reg.Estado = Estado;

        }
        dc.SubmitChanges();

    }

    /// <summary>
    /// Consulta el contrato_convenio y agrega el valor de liquidación
    /// </summary>
    /// <param name="Id_Contrato">ID del contrato o convenio</param>
    /// <param name="ValorLiquidado">Valor final ejecutado (Acta de liquidación)</param>
    public void actualizarValorEjecutado(int Id_Contrato, long ValorLiquidado)
    {
        var reg = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == Id_Contrato);
        Contrato_Convenio contrato = reg.Single();
        if (reg.Count() > 0)
        {
            contrato.Valor_Liquidado = ValorLiquidado;
        }
        dc.SubmitChanges();
    }

    public void RegistroDocumento1(int id_contrato, String Carta)
    {

        Contrato_Convenio contrato = new Contrato_Convenio();
        var reg = from u in dc.Contrato_Convenio
                  where u.Id_Convenio_Contrato == id_contrato
                  select u;
        foreach (var i in reg)
        {
            i.Carta_Solicitud_Propuesta = Carta;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo (Carta, Solicitud, Propuesta)
    /// </summary>
    /// <param name="id_convenio_contrato">ID del contrato o convenio</param>
    /// <returns>String con el nombre del archivo a eliminar</returns>
    public String NombreFileCartaSolicitudPropuesta(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato).Select(x => new { NomFile = x.Carta_Solicitud_Propuesta });
        return contratos.Single().NomFile;
    }

    /// <summary>
    /// Elimina el registro del arhivo en la BD (de la carta, solicitud, propuesta)
    /// </summary>
    /// <param name="id_convenito_contrato">ID del convenio o contrato</param>
    public void DeleteCartaSolicitudPropuesta(int id_convenito_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenito_contrato);
        //Cambiamos el valor del campo
        Contrato_Convenio contrato = contratos.Single();
        contrato.Carta_Solicitud_Propuesta = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento2(int id_contrato, String Terminos)
    {

        Contrato_Convenio contrato = new Contrato_Convenio();
        var reg = from u in dc.Contrato_Convenio
                  where u.Id_Convenio_Contrato == id_contrato
                  select u;
        foreach (var i in reg)
        {
            i.Terminos_referencia = Terminos;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consultamos el nombre del archivo (Terminos de referencia)
    /// </summary>
    /// <param name="id_convenio_contrato">ID del contrato o convenio</param>
    /// <returns>String con el nombre del archivo a eliminar</returns>
    public String NombreFileTerminos(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato).Select(x => new { NomFile = x.Terminos_referencia });
        return contratos.Single().NomFile;
    }

    /// <summary>
    /// Elimina el registro del archivo de la BD (Terminos de referencia)
    /// </summary>
    /// <param name="id_convenio_contrato">ID del contrato o convenio</param>
    public void DeleteTerminosReferencia(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato);
        //Cambiamos el valor del campo
        Contrato_Convenio contrato = contratos.Single();
        contrato.Terminos_referencia = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento3(int id_contrato, String Estudios)
    {

        Contrato_Convenio contrato = new Contrato_Convenio();
        var reg = from u in dc.Contrato_Convenio
                  where u.Id_Convenio_Contrato == id_contrato
                  select u;
        foreach (var i in reg)
        {
            i.Estudios_Previos =  Estudios;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consulta el nombre del archivo (Estudios previos)
    /// </summary>
    /// <param name="id_convenio_contrato">ID del contrato o convenio</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileEstudiosPrevios(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato).Select(x => new { NomFile = x.Estudios_Previos });
        return contratos.Single().NomFile;
    }

    /// <summary>
    /// Elimina el registro del archivo de la BD (Estudios previos)
    /// </summary>
    /// <param name="id_convenio_contrato">ID del contrato o convenio</param>
    public void DeleteEstudiosPrevios(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato);
        //Cambiamos el valor del campo
        Contrato_Convenio contrato = contratos.Single();
        contrato.Estudios_Previos = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento4(int id_contrato, String cdp)
    {

        Contrato_Convenio contrato = new Contrato_Convenio();
        var reg = from u in dc.Contrato_Convenio
                  where u.Id_Convenio_Contrato == id_contrato
                  select u;
        foreach (var i in reg)
        {
            i.Certificados_Disponibilida_Presupuestal = cdp;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consulta el nombre del archivo (Certificado de disponibilidad presupuestal)
    /// </summary>
    /// <param name="id_convenio_contrato">ID del convenio o contrato</param>
    /// <returns>String con el nombre del archivo</returns>
    public String NombreFileCertificado(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato).Select(x => new { NomFile = x.Certificados_Disponibilida_Presupuestal });
        return contratos.Single().NomFile;
    }

    /// <summary>
    /// Elimina el registro del archivo en la BD (Certificado de disponibilidad presupuestal)
    /// </summary>
    /// <param name="id_convenio_contrato">ID del contrato o convenio</param>
    public void DeleteCertificado(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato);
        //Cambiamos el valor del campo
        Contrato_Convenio contrato = contratos.Single();
        contrato.Certificados_Disponibilida_Presupuestal = null;

        dc.SubmitChanges();
    }

    public void RegistroDocumento5(int id_contrato, String Rp)
    {

        Contrato_Convenio contrato = new Contrato_Convenio();
        var reg = from u in dc.Contrato_Convenio
                  where u.Id_Convenio_Contrato == id_contrato
                  select u;
        foreach (var i in reg)
        {
            i.Registro_Presupuestal = Rp;
        }

        dc.SubmitChanges();
    }

    /// <summary>
    /// Consulta el nombre del archivo (registro presupuestal)
    /// </summary>
    /// <param name="id_convenio_Contrato">ID del convenio o contrato</param>
    /// <returns>string con el nombre del archivo</returns>
    public String NombreFileRegistro(int id_convenio_Contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_Contrato).Select(x => new { NomFile = x.Registro_Presupuestal });
        return contratos.Single().NomFile;
    }

    /// <summary>
    /// Elimina el registro del archivo en la BD (Registro presupuestal)
    /// </summary>
    /// <param name="id_convenio_contrato">Id del convenio o contrato</param>
    public void DeleteRegistroProsupuestal(int id_convenio_contrato)
    {
        var contratos = dc.Contrato_Convenio.Where(x => x.Id_Convenio_Contrato == id_convenio_contrato);
        //Cambiamos el valor del campo
        Contrato_Convenio contrato = contratos.Single();
        contrato.Registro_Presupuestal = null;

        dc.SubmitChanges();
    }





}