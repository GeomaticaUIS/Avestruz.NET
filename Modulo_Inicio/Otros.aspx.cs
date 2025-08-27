using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Otros : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_Agregar_Click(object sender, EventArgs e)
    {
        String nombre = Tbx_Nombre.Text;
        long nCedula = Convert.ToInt64(Tbx_Profesion.Text);

        TablaColaboradores colaborador = new TablaColaboradores();
        colaborador.RegistrarColaborador(nombre, nCedula);

    }

    protected void Btn_AgregarEnt_Click(object sender, EventArgs e)
    {
        String nombre = Tbx_NombreEnt.Text;
        long nit = Convert.ToInt64(Tbx_Nit.Text);

        TablaEntidades entidad = new TablaEntidades();
        entidad.RegistrarEntidad(nombre, nit);
    }
}