using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Informe
/// </summary>
public class Informe
{
    public String nombreProyecto { set; get; }
    public String fechaSuscripcionContrato { set; get; }
    public String EntidadContratante { set; get; }
    public String ObjetoContrato { set; get; }
    public String ValorContratado { set; get; }
    public String Plazo { set; get; }
    public String FechadeInicio { set; get; }
    public String FechaFinal { set; get; }
    public String TiempoSuspension { set; get; }
    public String TiempoEjecucion { set; get; }
    public String ValorEjecutado { set; get; }
	public Informe()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    public DateTime? EncontrarFechaInicio(int Id_Contrato)
    {
        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        var acta = from u in dc.Actas
                   where u.Nombre_Contrato_Convenio == Id_Contrato && u.Tipo_Acta == 1
                   select u.Fecha_Actividad;

        return acta.SingleOrDefault();
    }


    public DateTime? EncontrarFechaFinal(int Id_Contrato)
    {
        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        var acta = from u in dc.Actas
                   where u.Nombre_Contrato_Convenio == Id_Contrato && u.Tipo_Acta == 4
                   select u.Fecha_Actividad;

        return acta.SingleOrDefault();
       
    }

    public String[] sumaMesDia(int id)
    {
        int sumaMes = 0;
        int sumaDia = 0;
        String [] mesydia = new String[2];
        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        var adiciones = from u in dc.Otrosí_Adiciones
                        where u.Convenio_Contrato == id && u.Tipo_Otrosi_Adición != 3
                        select u;
        foreach (var u in adiciones)
        {
            if (u.Tiempo_Adicional != null)
            {
                String[] adicion = u.Tiempo_Adicional.Split('.');
                if (adicion[0] != "")
                {
                    sumaMes = sumaMes + Convert.ToInt32(adicion[0]);
                }
                if (adicion[1] != "")
                {
                    sumaDia = sumaDia + Convert.ToInt32(adicion[1]);
                }
            }
        }

        mesydia[0] = sumaMes.ToString();
        mesydia[1] = sumaDia.ToString();

       return mesydia; 
    }



    //Calcula el tiempo de Suspencion
    public int[] CalcularTiempoSuspension(int id)
    {
        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        int bandera = 0;
        int bandera2 = 0;
        DateTime FechaSuspension1 = DateTime.Now;
        DateTime FechaSuspension2 = DateTime.Now;
        int[] AñoMesDia;
        int[] SumaAñoMesDia = new int[3];

        var acta = from u in dc.Actas
                   where ((u.Nombre_Contrato_Convenio == id) && (u.Tipo_Acta == 11 || u.Tipo_Acta == 12))
                   select u;
        foreach (var u in acta)
        {
            

            if (bandera == 0 && bandera2 ==0)
            {

                if (u.Tipo_Acta == 11 && u.Fecha_Actividad != null)
                {
                    FechaSuspension1 = (DateTime)u.Fecha_Actividad;
                    bandera = 1;
                }
                
            }
            else if (bandera == 1 && bandera2 == 0)
            {
                if (u.Tipo_Acta == 12 && u.Fecha_Actividad != null)
                {
                    FechaSuspension2 = (DateTime)u.Fecha_Actividad;
                    bandera2 = 1;
                }
                //Necesito saber cual es el ultimo registro
            }

            if (bandera == 1 && bandera2 == 1)
            {
                //mirar si la forma de capturar esta bien hecha
                AñoMesDia = CalculaTiempo2Fechas(FechaSuspension1, FechaSuspension2);
                bandera = bandera2 =  0;
                SumaAñoMesDia[0] = SumaAñoMesDia[0] + AñoMesDia[0];
                SumaAñoMesDia[1] = SumaAñoMesDia[1] + AñoMesDia[1];
                SumaAñoMesDia[2] = SumaAñoMesDia[2] + AñoMesDia[2]; 

            }

        }
        // Este if es por si no encuentra un acta de reinicio, tome la fecha de hoy
         if (bandera == 1 && bandera2 == 0)
            {
                //Necesito darle la hecha de hoy
                // FechaSuspension2 = Fecha de Hoy 
                DateTime FechaHoy = DateTime.Now;
                AñoMesDia = CalculaTiempo2Fechas(FechaSuspension1, FechaHoy);
                SumaAñoMesDia[0] = SumaAñoMesDia[0] + AñoMesDia[0]; 
                SumaAñoMesDia[1] = SumaAñoMesDia[1] + AñoMesDia[1];
                SumaAñoMesDia[2] = SumaAñoMesDia[2] + AñoMesDia[2]; 
            }

         if (SumaAñoMesDia[2] >= 30)
         {
             int cociente1 = (int)(SumaAñoMesDia[2] / 30);
             int residuo1 = SumaAñoMesDia[2] % 30;
             SumaAñoMesDia[2] = residuo1;
             SumaAñoMesDia[1] = SumaAñoMesDia[1] + cociente1;
             if (SumaAñoMesDia[1] >= 12)
             {
                 int cociente2 = (int)(SumaAñoMesDia[1] / 12);
                 int residuo2 = SumaAñoMesDia[2] % 12;
                 SumaAñoMesDia[1] = residuo2;
                 SumaAñoMesDia[0] = SumaAñoMesDia[0] + cociente2;
             }
         }
         else
         {
             if (SumaAñoMesDia[1] >= 12)
             {
                 int cociente2 = (int)(SumaAñoMesDia[1] / 12);
                 int residuo2 = SumaAñoMesDia[2] % 12;
                 SumaAñoMesDia[1] = residuo2;
                 SumaAñoMesDia[0] = SumaAñoMesDia[0] + cociente2;
             }
         }
        return SumaAñoMesDia;
    }


    //Calcula el tiempo entre dos fechas en Años, Meses, dias
    public int[] CalculaTiempo2Fechas(DateTime f1, DateTime f2)
    {
        int inicio_año, inicio_mes, inicio_dia, final_año, final_mes, final_dia;
        string Plazotiempo = "No registra";
        int[] AñoMesDia = new int[3]; //Vector donde voy a retornar el N° de años, meses y dias

        // Convirtiendo fechas, y separandolas por Año, Mes y Dia
        DateTime fechaI = Convert.ToDateTime(f1);
        string cadena1 = String.Format("{0:dd/MM/yyyy}", fechaI);
        string[] words = cadena1.Split('/');
        inicio_año = Convert.ToInt32(words[2]);
        inicio_mes = Convert.ToInt32(words[1]);
        inicio_dia = Convert.ToInt32(words[0]);

        DateTime fechaF = Convert.ToDateTime(f2);
        string cadena2 = String.Format("{0:dd/MM/yyyy}", fechaF);

        string[] words2 = cadena2.Split('/');
        final_año = Convert.ToInt32(words2[2]);
        final_mes = Convert.ToInt32(words2[1]);
        final_dia = Convert.ToInt32(words2[0]);


        // Hallando las diferencias entre la fecha inicio y Final, separandolas por Año, Mes y Dia.
        int dif_año = final_año - inicio_año;
        int dif_mes = final_mes - inicio_mes;
        int dif_dia = final_dia - inicio_dia;

        //Dependiendo de los resultados en las diferencias, calculo los Años, Meses y dias
        if (dif_año > 0)
        {
            if (dif_mes > 0)
            {
                if (dif_dia < 0)
                {
                    dif_mes = dif_mes - 1;
                    dif_dia = 30 + final_dia - inicio_dia;
                }
                
            }
            else if (dif_mes == 0)
            {
                if (dif_dia < 0)
                {
                    dif_mes = 11;
                    dif_año = dif_año - 1;
                    dif_dia = 30 + final_dia - inicio_dia;
                }
            }
            else
            {
                dif_mes = 12 + final_mes - inicio_mes;
                dif_año = dif_año - 1;
                if (dif_dia < 0)
                {
                    dif_dia = 30 + final_dia - inicio_dia;
                }
            }

        }
        else if (dif_año == 0)
        {
            if (dif_mes > 0)
            {
                if (dif_dia < 0)
                {
                    dif_mes = dif_mes - 1;
                    dif_dia = 30 + final_dia - inicio_dia;

                }
            }
            else if (dif_mes == 0)
            {
                Plazotiempo = "";
                if (dif_dia == 0)
                {
                    Plazotiempo = " Error ";
                }

            }
            else
            {
                Plazotiempo = " Error ";
            }


        }
        else
        {
            Plazotiempo = " Error ";
        }
        AñoMesDia[0] = dif_año;
        AñoMesDia[1] = dif_mes;
        AñoMesDia[2] = dif_dia;

        return AñoMesDia;
    }

}