using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consulta : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID_Proy"] != null && Session["ID"] == null)
        {
            TablaContratos contratos = new TablaContratos();
            int idproy1 = Convert.ToInt32(Request.QueryString["ID_Proy"]);
            Session["ID"] = idproy1;
            Mostrar(idproy1);        
                    
            try
            {
                 Session["ID_Contrato"] = contratos.Consultar_Id_Contrato(idproy1);
            }
            catch (Exception)
            {
                 Session["ID_Contrato"] = null;
            }          
        }

        if (Session["ID"] != null)
        {
            int id_proy2 = Convert.ToInt32(Session["ID"]);
            Mostrar(id_proy2);
        }
        
        
    }

    protected void Mostrar(int id_proy)
    {
        int id_proyecto = id_proy;
        TablaProyectos proyectos = new TablaProyectos();
        
        String[] DatosProyecto = proyectos.DatosProyecto(id_proyecto);
        
        Session["Id_RegistroVie"]= DatosProyecto[7];
        Session["NombreProyecto"]= DatosProyecto[0];

        lbl_Nombre.Text = DatosProyecto[0];
        Decimal valor = Convert.ToDecimal(DatosProyecto[1]);
        string cad = valor.ToString("C2");
        cad = cad.Replace(",00", "");
        lbl_Valor.Text = cad;
        lbl_RegVie.Text = DatosProyecto[7];
        
        
            DateTime fechaVie = Convert.ToDateTime(DatosProyecto[8]);
            lbl_FechaVie.Text = String.Format("{0:dd/MM/yyyy}", fechaVie);
            if (DatosProyecto[3] != null && DatosProyecto[3] != "")
           {
                String FechaPropuesta = DatosProyecto[3];
                lbl_FechaPropuesta.Text = FechaPropuesta.Substring(0, 10);
           }
            else
              lbl_FechaPropuesta.Text = "No se ha registrado aun";
        


        if (DatosProyecto[9] != null)
            LinkBtn_FormatoVie.Text = DatosProyecto[9];
        else
            Lbl_FormatoVie.Text = "No se ha subido el archivo aun";
        

        if (DatosProyecto[10] != null)
            LinkBtn_CartaPresentacion.Text = DatosProyecto[10];
        else
            Lbl_CartaPresentacion.Text = "No se ha subido el archivo aun";


        if (DatosProyecto[2] != null)
            LinkBtn_PropuestaPdf.Text = DatosProyecto[2];
        else
            Lbl_PropuestaPdf.Text = "No se ha subido el archivo aun";
        

        if (DatosProyecto[4] != null)
            LinkBtn_ActaClaustro.Text = DatosProyecto[4];
        else
            Lbl_ActaClaustro.Text = "No se ha subido el archivo aun";
        

        if (DatosProyecto[5] != null)
            LinkBtn_ConsejoEscuela.Text = DatosProyecto[5];
        else
            Lbl_ActaEscuela.Text = "No se ha subido el archivo aun";
        

        if (DatosProyecto[6] != null)
            LinkBtn_ConsejoFacultad.Text = DatosProyecto[6];
        else
            Lbl_ActaFacultad.Text = "No se ha subido el archivo aun";

        if (DatosProyecto[11] != null)
            LinkButton_MemoTecnica.Text = DatosProyecto[11];
        else
            Lbl_MemoTecnica.Text = "No se ha subido el archivo aun";

        if (DatosProyecto[12] != null)
            LinkButton_Presupuesto.Text = DatosProyecto[12];
        else
            Lbl_Presupuesto.Text = "No se ha subido el archivo aun";

    }

    protected void Btn_Continuar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Modulo_Ver/VerContrato.aspx");
    }

    protected void Btn_Terminar_Click(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            Session.Remove("ID");
        }
        if (Session["Id_RegistroVie"] != null)
        {
            Session.Remove("Id_RegistroVie");
        }
        if (Session["NombreProyecto"] != null)
        {
            Session.Remove("NombreProyecto");
        }
        if (Session["ID_Contrato"] != null)
        {
            Session.Remove("ID_Contrato");
        }
        if (Session["ID_Producto"] != null)
        {
            Session.Remove("ID_Producto");
        }
        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }

    protected void LinkBtn_FormatoVie_Click(object sender, EventArgs e)
    {

            TablaProyectos proyectos = new TablaProyectos();
            int usuarioID = Convert.ToInt32(Session["ID"]);
            String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);
        
            string nombreArchivo = DatosProyecto[9];
            string registroVie = DatosProyecto[7];

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
            Response.Flush();
            Response.End();

     }

    protected void LinkBtn_ActaClaustro_Click(object sender, EventArgs e)
    {

            TablaProyectos proyectos = new TablaProyectos();
            int usuarioID = Convert.ToInt32(Session["ID"]);
            String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

            string nombreArchivo = DatosProyecto[4];
            string registroVie = DatosProyecto[7];

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
            Response.Flush();
            Response.End();

    }

    protected void LinkBtn_PropuestaPdf_Click(object sender, EventArgs e)
    {
            TablaProyectos proyectos = new TablaProyectos();
            int usuarioID = Convert.ToInt32(Session["ID"]);
            String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

            string nombreArchivo = DatosProyecto[2];
            string registroVie = DatosProyecto[7];

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
            Response.Flush();
            Response.End();

    }

    protected void LinkBtn_CartaPresentacion_Click(object sender, EventArgs e)
    {
            TablaProyectos proyectos = new TablaProyectos();
            int usuarioID = Convert.ToInt32(Session["ID"]);
            String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

            string nombreArchivo = DatosProyecto[10];
            string registroVie = DatosProyecto[7];

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
            Response.Flush();
            Response.End();
    }

    protected void LinkBtn_ConsejoEscuela_Click(object sender, EventArgs e)
    {
            TablaProyectos proyectos = new TablaProyectos();
            int usuarioID = Convert.ToInt32(Session["ID"]);
            String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

            string nombreArchivo = DatosProyecto[5];
            string registroVie = DatosProyecto[7];

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
            Response.Flush();
            Response.End();

    }

    protected void LinkBtn_ConsejoFacultad_Click(object sender, EventArgs e)
    {
            TablaProyectos proyectos = new TablaProyectos();
            int usuarioID = Convert.ToInt32(Session["ID"]);
            String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

            string nombreArchivo = DatosProyecto[6];
            string registroVie = DatosProyecto[7];

            Response.Clear();
            Response.ContentType = "application/octet-stream";
            Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
            Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
            Response.Flush();
            Response.End();
    }

    protected void LinkButton_MemoTecnica_Click(object sender, EventArgs e)
    {
        TablaProyectos proyectos = new TablaProyectos();
        int usuarioID = Convert.ToInt32(Session["ID"]);
        String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

        string nombreArchivo = DatosProyecto[11];
        string registroVie = DatosProyecto[7];

        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
        Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
        Response.Flush();
        Response.End();
    }

    protected void LinkButton_Presupuesto_Click(object sender, EventArgs e)
    {
        TablaProyectos proyectos = new TablaProyectos();
        int usuarioID = Convert.ToInt32(Session["ID"]);
        String[] DatosProyecto = proyectos.DatosProyecto(usuarioID);

        string nombreArchivo = DatosProyecto[12];
        string registroVie = DatosProyecto[7];

        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AddHeader("Content-Disposition", "attachment; filename=" + nombreArchivo);
        Response.WriteFile("../Pdfs_Subidos/" + registroVie + "/DocumentosIniciales/" + nombreArchivo);
        Response.Flush();
        Response.End();
    }

}