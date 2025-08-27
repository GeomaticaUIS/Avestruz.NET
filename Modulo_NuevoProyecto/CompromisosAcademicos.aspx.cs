using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Modulo_NuevoProyecto_CompromisosAcademicos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["registroVie"] == null)
        {
            Response.Redirect("~/Modulo_NuevoProyecto/DatosGenerales.aspx");
        }
        if (Session["Id_Compromiso"] != null)
        {
            Session.Remove("Id_Compromiso");
        }
        if (Session["Suma"] != null)
        {
            int idproy = Convert.ToInt32(Session["Id_Proyecto"]);
            
            Panel3.Visible = true;
            Panel1.Visible = false;
           
            
            
            Btn_Agregar.Enabled = false;
            Btn_Agregar.Visible = false;
        }
        else
        {
            Panel3.Visible = false;
            Panel1.Visible = true;
            
        }
    }

    protected void Btn_Registrar_Click(object sender, EventArgs e)
    {
        Btn_Agregar.Visible = false;
        Btn_Terminar.Visible = false;
        int idproy = Convert.ToInt32(Session["Id_Proyecto"]);
        TablaCompromisosAcademicos compromiso = new TablaCompromisosAcademicos();
        TablaInformeCompromisos informe = new TablaInformeCompromisos();
        int suma=0;
        if (TextBox1.Text != "")
        {
            
            int tipo = 1;
            int cantidad= Convert.ToInt32(TextBox1.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch(Exception)
            {
                Label1.Text = "Error al registrar informe1, vuelva a intentarlo";
            }

            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox2.Text != "")
        {

            int tipo = 2;
            int cantidad = Convert.ToInt32(TextBox2.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe2, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox3.Text != "")
        {

            int tipo = 3;
            int cantidad = Convert.ToInt32(TextBox3.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe3, vuelva a intentarlo";
            }
           
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox4.Text != "")
        {

            int tipo = 4;
            int cantidad = Convert.ToInt32(TextBox4.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox5.Text != "")
        {

            int tipo = 5;
            int cantidad = Convert.ToInt32(TextBox5.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }

            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox6.Text != "")
        {

            int tipo = 6;
            int cantidad = Convert.ToInt32(TextBox6.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox7.Text != "")
        {

            int tipo = 7;
            int cantidad = Convert.ToInt32(TextBox7.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox8.Text != "")
        {

            int tipo = 8;
            int cantidad = Convert.ToInt32(TextBox8.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox9.Text != "")
        {

            int tipo = 9;
            int cantidad = Convert.ToInt32(TextBox9.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox10.Text != "")
        {

            int tipo = 10;
            int cantidad = Convert.ToInt32(TextBox10.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox11.Text != "")
        {

            int tipo = 11;
            int cantidad = Convert.ToInt32(TextBox11.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox12.Text != "")
        {

            int tipo = 12;
            int cantidad = Convert.ToInt32(TextBox12.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox13.Text != "")
        {

            int tipo = 13;
            int cantidad = Convert.ToInt32(TextBox13.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        if (TextBox14.Text != "")
        {

            int tipo = 14;
            int cantidad = Convert.ToInt32(TextBox14.Text);
            suma = suma + cantidad;
            try
            {
                informe.RegistroInforme(idproy, tipo, cantidad);
            }
            catch (Exception)
            {
                Label1.Text = "Error al registrar informe, vuelva a intentarlo";
            }
            for (int i = 1; i <= cantidad; i++)
            {
                try
                {
                    compromiso.RegistroInfo(idproy, tipo);
                }
                catch (Exception)
                {
                    Label1.Text = "Error al crear compromiso, vuelva a intentarlo";
                }
            }

        }
        
        Lbl_Total.Text = Convert.ToString(suma);


        if (suma > 0)
        {
            Panel1.Enabled = false;
            Session["Suma"] = suma;
            Panel3.Visible = true;
        }
        else
        {
            Session["Suma"] = null;
            Label1.Text = "No agrego ningun compromiso academico al proyecto";
        }
    }
    
    protected void EditarCompromiso_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_compromiso = ((Label)boton2.Parent.FindControl("Id_Compromiso_AcademicoLabel"));

        int idcompromiso = Convert.ToInt32(id_compromiso.Text);

        Response.Redirect("~/Modulo_NuevoProyecto/DetallesCompromisosAcademicos.aspx?ID_Compromiso=" + idcompromiso);
    }

    protected void VerCompromiso_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_Tipo = ((Label)boton2.Parent.FindControl("Id_Tipo_CompromisoLabel"));

        int idtipo = Convert.ToInt32(id_Tipo.Text);
        Session["id_tipo"] = idtipo;
        Panel4.Visible = true;
        Panel3.Visible = false;
        
    }

    protected void Detallar_Click(object sender, EventArgs e)
    {
        Button boton2 = ((Button)sender);
        Label id_compromiso = ((Label)boton2.Parent.FindControl("Id_Compromiso_AcademicoLabel"));

        int idcompromiso = Convert.ToInt32(id_compromiso.Text);

        Response.Redirect("~/Modulo_NuevoProyecto/DetallesCompromisosAcademicos.aspx?ID_Compromiso=" + idcompromiso);
    }

    protected void Btn_Volver_Click(object sender, EventArgs e)
    {
        Panel3.Visible = true;
        Panel4.Visible = false;
    }

    protected void Btn_Terminar2_Click(object sender, EventArgs e)
    {
        Session.Remove("registroVie");
        Session.Remove("Id_Proyecto");
        if (Session["Id_producto"] != null)
        {
            Session.Remove("Id_producto");
        }
        if (Session["Id_Contrato"] != null)
        {
            Session.Remove("Id_Contrato");
        }
        if (Session["Ultimo"] != null)
        {
            Session.Remove("Ultimo");
        }
        if (Session["Suma"] != null)
        {
            Session.Remove("Suma");
        }
        Response.Redirect("~/Modulo_Inicio/Lista.aspx");
    }
}