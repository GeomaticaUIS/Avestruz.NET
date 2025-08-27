using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_Inicio_InformeProyectos2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TablaContratos contratos = new TablaContratos();
        List<Informe2> lista = new List<Informe2>();
        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        List<ListaProyectos> proyectos = new List<ListaProyectos>();
        proyectos = DatosProyectos();
        foreach(var u in proyectos)
        {
            Informe2 info = new Informe2();
            int id_contrato = contratos.Consultar_Id_Contrato(u.Id_Proyecto);
            if (id_contrato == 0)
            {
                info.nombreProyecto = u.Nombre;
                info.Fex_VIE = u.Registro_VIE;
                info.Fecha_VIE = String.Format("{0:dd/MM/yyyy}", u.Fecha_VIE);
                lista.Add(info);
            }
           
            
        }
        GV2.DataSource = lista;
        GV2.DataBind();
    }

    public List<ListaProyectos> DatosProyectos()
    {

        AccesoDatosDataContext dc = new AccesoDatosDataContext();
        var datosProyectos = from u in dc.Proyectos
                             select new ListaProyectos
                             {
                                 Id_Proyecto = u.Id_Proyecto,
                                 Nombre = u.Nombre,
                                 Valor = u.Valor,
                                 Registro_VIE = u.Registro_VIE,
                                 Fecha_VIE = u.Fecha_Registro_VIE,
                             };

        return datosProyectos.ToList();

    }
}