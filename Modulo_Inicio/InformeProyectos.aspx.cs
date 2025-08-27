using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Inicio_InformeProyectos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        TablaContratos contrato = new TablaContratos();
        List<Informe> lista = new List<Informe>();
        
        TablaEntidades entidad = new TablaEntidades();

        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        List<ListaContratos> contratos = new List<ListaContratos>();
        contratos = DatosContratos();
        foreach (var u in contratos)
        {
            Informe info = new Informe();
            info.nombreProyecto = u.Nombre;

            DateTime? fechaSuscripcion = u.Fecha_Suscripcion;
            info.fechaSuscripcionContrato = String.Format("{0:dd/MM/yyyy}", fechaSuscripcion);

            String[] DatosEntidad = entidad.DatosEntidad(u.Id_Entidad);
            info.EntidadContratante = DatosEntidad[0];

            info.ObjetoContrato = u.Objeto;


            info.ValorContratado = CalcularValorContratado(u.Id_Contrato_Convenio, u.Valor); 
            
            info.Plazo = Plazo(u.Id_Contrato_Convenio);

            info.FechadeInicio = EncontrarFechaInicio(u.Id_Contrato_Convenio);

            info.FechaFinal = EncontrarFechaFinal(u.Id_Contrato_Convenio);

            info.TiempoEjecucion = CalcularTiempoEjecutado(u.Id_Contrato_Convenio);

            if (u.ValorEjecutado != null)
            {
                Decimal ValorE = Convert.ToDecimal(u.ValorEjecutado);
                string ValorEjecutado = ValorE.ToString("C2");
                info.ValorEjecutado = ValorEjecutado;
            }
            else
            {
                info.ValorEjecutado = "Aun no registrado";
            }

            info.TiempoSuspension = CalcularTiempoSuspencion(u.Id_Contrato_Convenio);
            
            

            lista.Add(info);
        }
        GV.DataSource = lista;
        GV.DataBind();
        
    }

    
    public List<ListaContratos> DatosContratos()
    {

        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        var datoscontratos = from u in dc.Contrato_Convenio
                                select new ListaContratos
                                {
                                    Id_Contrato_Convenio = u.Id_Convenio_Contrato,
                                    Id_Proyecto = u.Id_Proyecto,
                                    Tipo_Contrato = u.Tipo,
                                    Id_Entidad = u.Entidad_Contratante,
                                    Nombre = u.Nombre,
                                    Objeto = u.Objeto,
                                    Valor = u.Valor,
                                    ValorEjecutado = u.Valor_Contratado,
                                    Archivo_Pdf = u.Archivo_Pdf,
                                    Fecha_Suscripcion = u.Fecha_Suscripción,
                                };

        return datoscontratos.ToList();

    }

    public string EncontrarFechaInicio(int Id_Contrato)
    {
        Informe inf = new Informe();
        DateTime? fecha = inf.EncontrarFechaInicio(Id_Contrato);

        if (fecha != null)
        {
            
            string fechaInicial = String.Format("{0:dd/MM/yyyy}", fecha);
            return fechaInicial;
        }
        else
        {
            string mensaje = "Fecha no registrada";
            return mensaje;
        }
    }

    public string EncontrarFechaFinal(int Id_Contrato)
    {

        Informe inf = new Informe();
        DateTime? fecha = inf.EncontrarFechaFinal(Id_Contrato);
        
        if (fecha != null)
        {
            string fechaFinal = String.Format("{0:dd/MM/yyyy}", fecha);
            return fechaFinal;
        }
        else
        {
            string mensaje = "Fecha no registrada";
            return mensaje;
        }
    }

    public string CalcularValorContratado(int Id_Contrato, Decimal? Valor)
    {
        Decimal? Suma = 0;
        string ValorA;
        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        var adiciones = from u in dc.Otrosí_Adiciones
                   where u.Convenio_Contrato == Id_Contrato && u.Tipo_Otrosi_Adición != 2 
                   select u;
        foreach (var u in adiciones)
        {
            if (u.Valor_Adicional != null)
            {
                Suma = Suma + u.Valor_Adicional;
            }
        }

        if (Suma != 0)
        {
            Suma = Suma + Valor;
            Decimal Suma1 = Convert.ToDecimal(Suma);
            ValorA = Suma1.ToString("C2");
            ValorA = ValorA.Replace(",00", "");
            ValorA = ValorA.Replace(" ", "");
            
        }
        else
        {
            Decimal Valor1 = Convert.ToDecimal(Valor);
            ValorA = Valor1.ToString("C2");
            ValorA = ValorA.Replace(",00", "");
            ValorA = ValorA.Replace(" ", "");
        }
        
        return ValorA;
    }

    public string Plazo(int id)
    {
        int inicio_año, inicio_mes, inicio_dia, final_año, final_mes, final_dia;
        string Plazotiempo = "No registra";
        TablaContratos contrato = new TablaContratos();
        String[] datos = contrato.DatosContrato(id);
        
        DateTime fechaI = Convert.ToDateTime(datos[5]);
        string cadena1 = String.Format("{0:dd/MM/yyyy}", fechaI);
        string[] words = cadena1.Split('/');
        inicio_año = Convert.ToInt32(words[2]);
        inicio_mes = Convert.ToInt32(words[1]);
        inicio_dia = Convert.ToInt32(words[0]);
        
        DateTime fechaF = Convert.ToDateTime(datos[6]);
        string cadena2 = String.Format("{0:dd/MM/yyyy}", fechaF);
        
        string[] words2 = cadena2.Split('/');
        final_año = Convert.ToInt32(words2[2]);
        final_mes = Convert.ToInt32(words2[1]);
        final_dia = Convert.ToInt32(words2[0]);

        
        int dif_año = final_año - inicio_año;
        int dif_mes = final_mes - inicio_mes;
        int dif_dia = final_dia - inicio_dia;
        if (dif_año > 0 )
        {
            if (dif_mes > 0)
            {
                if (dif_dia > 0)
                {
                    Plazotiempo = " " + dif_año + " año(s) " + dif_mes + " mes(es)" + dif_dia + "dia(s)";
                }
                else if (dif_dia == 0)
                {
                    Plazotiempo = " " + dif_año + " año(s) " + dif_mes + " mes(es)";
                }
                else
                {
                    dif_mes = dif_mes - 1;
                    dif_dia = 30 + final_dia - inicio_dia;
                    Plazotiempo = " " + dif_año + " año(s) " + dif_mes + " mes(es)" + dif_dia + "dia(s)";
                }
            }
            else if (dif_mes == 0)
            {
                if (dif_dia > 0)
                {
                    Plazotiempo = " " + dif_año + " año(s) " + dif_dia + "dia(s)";
                }
                else if (dif_dia == 0)
                {
                    Plazotiempo = " " + dif_año + " año(s) ";
                }
                else
                {
                    dif_mes = 11;
                    dif_año = dif_año - 1;
                    dif_dia = 30 + final_dia - inicio_dia;
                    if (dif_año == 0)
                    {
                        Plazotiempo = " " + dif_mes + " mes(es)" + dif_dia + "dia(s)";
                    }
                    else
                    {
                        Plazotiempo = " " + dif_año + " año(s) " + dif_mes + " mes(es)" + dif_dia + "dia(s)";
                    }
                }
            }
            else
            {
                dif_mes = 12 + final_mes - inicio_mes;
                dif_año = dif_año - 1;
                if (dif_dia > 0)
                {
                    if (dif_año == 0)
                    {
                        Plazotiempo = " " + dif_año + " año(s) " + dif_dia + "dia(s)";
                    }

                    else
                    {
                        Plazotiempo = " " + dif_año + " año(s) " + dif_dia + "dia(s)";
                    }
                }
                else if (dif_dia == 0)
                {
                    Plazotiempo = " " + dif_año + " año(s) " + dif_mes + "mes(es)";
                }
                else
                {
                    
                    dif_dia = 30 + final_dia - inicio_dia;
                    if (dif_año == 0)
                    {
                        Plazotiempo = " " + dif_mes + " mes(es)" + dif_dia + "dia(s)";
                    }
                    else
                    {
                        Plazotiempo = " " + dif_año + " año(s) " + dif_mes + " mes(es)" + dif_dia + "dia(s)";
                    }
                }
            }
            
        }
        else if (dif_año == 0)
        {
            if (dif_mes > 0)
            {
                if (dif_dia > 0)
                {
                    Plazotiempo = dif_mes + " mes(es)" + dif_dia + "dia(s)";
                }
                else if (dif_dia == 0)
                {
                    Plazotiempo = " " + dif_mes + " mes(es)";
                }
                else
                {
                    dif_mes = dif_mes - 1;
                    dif_dia = 30 + final_dia - inicio_dia;
                    Plazotiempo = " " + dif_mes + " mes(es)" + dif_dia + "dia(s)";
                }
            }
            else if (dif_mes == 0)
            {
                if (dif_dia > 0)
                {
                    Plazotiempo = " " + dif_dia + "dia(s)";
                }
                else if (dif_dia == 0)
                {
                    Plazotiempo = " Error ";
                }
                
            }
            
            
        }

        int Meses_Adiciones = 0;
        int Dias_Adiciones = 0;
        
        Informe info = new Informe();
        String[] MesDia = info.sumaMesDia(id);
        if (MesDia[0] != "" || MesDia[1] != "")
        {
            if (MesDia[1] != "" && MesDia[0] != "")
            {
                Dias_Adiciones = Convert.ToInt32(MesDia[1]);
                Meses_Adiciones = Convert.ToInt32(MesDia[0]);
                if (dif_dia + Dias_Adiciones >= 30)
                {
                    int dias_total = Meses_Adiciones + dif_mes;
                    int cociente2 = (int)(dias_total / 30);
                    int residuo2 = dias_total % 30;
                    dif_mes = dif_mes + cociente2;
                    dif_dia = residuo2;
                    if (Meses_Adiciones + dif_mes >= 12)
                    {
                        int mes_total = Meses_Adiciones + dif_mes;
                        int cociente = (int)(mes_total / 12);
                        int residuo = mes_total % 12;
                        dif_año = dif_año + cociente;
                        dif_mes = residuo;
                    }
                    else
                    {
                        dif_mes = dif_mes + Meses_Adiciones;
                    }


                }
                else
                {
                    dif_dia = dif_dia + Dias_Adiciones;
                    if (Meses_Adiciones + dif_mes >= 12)
                    {
                        int mes_total = Meses_Adiciones + dif_mes;
                        int cociente = (int)(mes_total / 12);
                        int residuo = mes_total % 12;
                        dif_año = dif_año + cociente;
                        dif_mes = residuo;
                    }
                    else
                    {
                        dif_mes = dif_mes + Meses_Adiciones;
                    }
                }
                
            }
            else if (MesDia[0] != "")
            {
                Meses_Adiciones = Convert.ToInt32(MesDia[0]);
                if (Meses_Adiciones + dif_mes >= 12)
                {
                    int mes_total = Meses_Adiciones + dif_mes;
                    int cociente = (int)(mes_total / 12);
                    int residuo = mes_total % 12;
                    dif_año = dif_año + cociente;
                    dif_mes = residuo;
                }
                else
                {
                    dif_mes = dif_mes + Meses_Adiciones;
                }
            }
            else
            {
                Dias_Adiciones = Convert.ToInt32(MesDia[1]);
                if (dif_dia + Dias_Adiciones >= 30)
                {
                    int dias_total = Meses_Adiciones + dif_mes;
                    int cociente3 = (int)(dias_total / 30);
                    int residuo3 = dias_total % 30;
                    dif_mes = dif_mes + cociente3;
                    dif_dia = residuo3;
                    if (dif_mes >= 12)
                    {
                        int cociente = (int)(dif_mes / 12);
                        int residuo = dif_mes % 12;
                        dif_año = dif_año + cociente;
                        dif_mes = residuo;
                    }

                }
                else
                {
                    dif_dia = dif_dia + Dias_Adiciones;
                }
            }

            Plazotiempo = " " + dif_año + " año(s) " + dif_mes + " mes(es)" + dif_dia + "dia(s)";

        }
        if (dif_año != 0 && dif_mes != 0 && dif_dia != 0)
        {
            Plazotiempo =  dif_año + "año(s) " + dif_mes + "mes(es) " + dif_dia + "dia(s)";
        }
        
        if (dif_año == 0)
        {
            Plazotiempo =  dif_mes + "mes(es) " + dif_dia + "dia(s)";
        }

        if (dif_mes == 0)
        {
            Plazotiempo =  dif_año + "año(s) " + dif_dia + "dia(s)";
        }
        if (dif_dia == 0)
        {
            Plazotiempo = dif_año + "año(s) " + dif_mes + "mes(es)";
        }

        if (dif_año == 0 && dif_dia == 0)
        {
            Plazotiempo = dif_mes + "mes(es) ";
        }

        if (dif_mes == 0 && dif_dia == 0)
        {
            Plazotiempo =  dif_año + "año(s) ";
        }

        return Plazotiempo;
     }

    public string CalcularTiempoSuspencion(int Id)
    {
        int[] SumaAñoMesDia = new int[3];

        string TiempoSuspencion = "No hay suspensiones";
        Informe info = new Informe();
        SumaAñoMesDia = info.CalcularTiempoSuspension(Id);
        // Falta arreglar los datos del Array
        if (SumaAñoMesDia[2] != null || SumaAñoMesDia[1] != null || SumaAñoMesDia[0] != null)
        {
            if (SumaAñoMesDia[2] >= 30)
            {

                int cociente1 = (int)(SumaAñoMesDia[2] / 30);
                int residuo1 = SumaAñoMesDia[2] % 30;
                SumaAñoMesDia[2] = residuo1;

                if (SumaAñoMesDia[1] != null)
                {
                    SumaAñoMesDia[1] = SumaAñoMesDia[1] + cociente1;

                    if (SumaAñoMesDia[1] > 12)
                    {
                        int cociente2 = (int)(SumaAñoMesDia[1] / 12);
                        int residuo2 = SumaAñoMesDia[1] % 12;
                        if (SumaAñoMesDia[0] != null)
                        {
                            SumaAñoMesDia[0] = SumaAñoMesDia[0] + cociente2;
                        }
                        else
                        {
                            SumaAñoMesDia[0] = cociente2;
                        }
                    }

                }
                else
                {
                    SumaAñoMesDia[1] = cociente1;
                }

            }
            else
            {
                if (SumaAñoMesDia[1] != null)
                {
                    if (SumaAñoMesDia[1] > 12)
                    {
                        int cociente2 = (int)(SumaAñoMesDia[1] / 12);
                        int residuo2 = SumaAñoMesDia[1] % 12;
                        if (SumaAñoMesDia[0] != null)
                        {
                            SumaAñoMesDia[0] = SumaAñoMesDia[0] + cociente2;
                        }
                        else
                        {
                            SumaAñoMesDia[0] = cociente2;
                        }
                    }

                }

            }
            if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] != 0)
            {
                TiempoSuspencion =  SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[1] + "mes(es) " + SumaAñoMesDia[2] + "dia(s) ";
            }
            else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] != 0)
            {
                TiempoSuspencion = SumaAñoMesDia[1] + "mes(es) " + SumaAñoMesDia[2] + "dia(s) ";
            }
            else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] != 0)
            {
                TiempoSuspencion = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[2] + "dia(s) ";
            }
            else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] == 0)
            {
                TiempoSuspencion = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[1] + "mes(es) ";
            }
            else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] == 0)
            {
                TiempoSuspencion = SumaAñoMesDia[0] + "año(s) ";
            }
            else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] == 0)
            {
                TiempoSuspencion = SumaAñoMesDia[1] + "mes(es) ";
            }
            else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] != 0)
            {
                TiempoSuspencion = SumaAñoMesDia[2] + "dia(s) ";
            }

        }
        
        
        return TiempoSuspencion;
    }

    public string CalcularTiempoEjecutado(int Id)
    {
        int[] Plazo;
        int[] SumaAñoMesDia;
        String TiempoEjecutado = "No registra";
        Informe inf = new Informe();
        if (inf.EncontrarFechaInicio(Id) != null && inf.EncontrarFechaFinal(Id) != null)
        {
            DateTime fechaI = (DateTime)inf.EncontrarFechaInicio(Id);
            DateTime fechaF = (DateTime)inf.EncontrarFechaFinal(Id);
            Plazo = inf.CalculaTiempo2Fechas(fechaI, fechaF);
            if (inf.CalcularTiempoSuspension(Id) != null)
            {
                SumaAñoMesDia = inf.CalcularTiempoSuspension(Id);

                SumaAñoMesDia[0] = Plazo[0] - SumaAñoMesDia[0];
                SumaAñoMesDia[1] = Plazo[1] - SumaAñoMesDia[1];
                SumaAñoMesDia[2] = Plazo[2] - SumaAñoMesDia[2];
                if (SumaAñoMesDia[2] != 0 || SumaAñoMesDia[1] != 0 || SumaAñoMesDia[0] != 0)
                {
                    if (SumaAñoMesDia[2] > 0)
                    {

                        if (SumaAñoMesDia[1] < 0)
                        {
                            SumaAñoMesDia[0] = SumaAñoMesDia[0] - 1;
                            SumaAñoMesDia[1] = SumaAñoMesDia[1] + 12;
                        }


                    }
                    else if (SumaAñoMesDia[2] < 0)
                    {
                        SumaAñoMesDia[1] = SumaAñoMesDia[1] - 1;
                        SumaAñoMesDia[2] = SumaAñoMesDia[2] + 30;

                        if (SumaAñoMesDia[1] < 0)
                        {
                            SumaAñoMesDia[0] = SumaAñoMesDia[0] - 1;
                            SumaAñoMesDia[1] = SumaAñoMesDia[1] + 12;
                        }

                    }
                    
                    if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[1] + "mes(es) " + SumaAñoMesDia[2] + "dia(s) ";
                    }
                    else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[1] + "mes(es) " + SumaAñoMesDia[2] + "dia(s) ";
                    }
                    else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[2] + "dia(s) ";
                    }
                    else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] == 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[1] + "mes(es) ";
                    }
                    else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] == 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) ";
                    }
                    else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] == 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[1] + "mes(es) ";
                    }
                    else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[2] + "dia(s) ";
                    }
                }




            }

        }
        else if (inf.EncontrarFechaInicio(Id) != null && inf.EncontrarFechaFinal(Id) == null)
        {
            DateTime fechaI = (DateTime)inf.EncontrarFechaInicio(Id);
            DateTime fechaF = DateTime.Now;
            Plazo = inf.CalculaTiempo2Fechas(fechaI, fechaF);
            if (inf.CalcularTiempoSuspension(Id) != null)
            {
                SumaAñoMesDia = inf.CalcularTiempoSuspension(Id);
                SumaAñoMesDia[0] = Plazo[0] - SumaAñoMesDia[0];
                SumaAñoMesDia[1] = Plazo[1] - SumaAñoMesDia[1];
                SumaAñoMesDia[2] = Plazo[2] - SumaAñoMesDia[2];

                if (SumaAñoMesDia[2] != 0 || SumaAñoMesDia[1] != 0 || SumaAñoMesDia[0] != 0)
                {
                    if (SumaAñoMesDia[2] > 0)
                    {

                        if (SumaAñoMesDia[1] < 0)
                        {
                            SumaAñoMesDia[0] = SumaAñoMesDia[0] - 1;
                            SumaAñoMesDia[1] = SumaAñoMesDia[1] + 12;
                        }


                    }
                    else if (SumaAñoMesDia[2] < 0)
                    {
                        SumaAñoMesDia[1] = SumaAñoMesDia[1] - 1;
                        SumaAñoMesDia[2] = SumaAñoMesDia[2] + 30;

                        if (SumaAñoMesDia[1] < 0)
                        {
                            SumaAñoMesDia[0] = SumaAñoMesDia[0] - 1;
                            SumaAñoMesDia[1] = SumaAñoMesDia[1] + 12;
                        }

                    }
                    
                    if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[1] + "mes(es) " + SumaAñoMesDia[2] + "dia(s) ";
                    }
                    else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[1] + "mes(es) " + SumaAñoMesDia[2] + "dia(s) ";
                    }
                    else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[2] + "dia(s) ";
                    }
                    else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] == 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) " + SumaAñoMesDia[1] + "mes(es) ";
                    }
                    else if (SumaAñoMesDia[0] != 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] == 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[0] + "año(s) ";
                    }
                    else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] != 0 && SumaAñoMesDia[2] == 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[1] + "mes(es) ";
                    }
                    else if (SumaAñoMesDia[0] == 0 && SumaAñoMesDia[1] == 0 && SumaAñoMesDia[2] != 0)
                    {
                        TiempoEjecutado = SumaAñoMesDia[2] + "dia(s) ";
                    }
                }

            }
        }

        else if (inf.EncontrarFechaInicio(Id) == null && inf.EncontrarFechaFinal(Id) != null)
        {
            TiempoEjecutado = "Falta Fecha de Inicio de Actividades";
        }



        return TiempoEjecutado;
    }

}