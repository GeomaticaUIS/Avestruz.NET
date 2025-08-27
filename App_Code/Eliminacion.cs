using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Eliminacion
/// </summary>
public class Eliminacion
{
    public Eliminacion()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public bool eliminar(int idproy)
    {
        bool borrado = false;
        try
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = @"Data Source=10.1.90.14;Initial Catalog=PROYECTOSGEOMATICA;User ID=Consolidado;Password=Pr0y3ct0sG30m@t1c4";
            conn.Open();

            string sql = @"DELETE FROM Proyectos WHERE Id_Proyecto = " + idproy;
            SqlCommand command = new SqlCommand(sql, conn);
            if (command.ExecuteNonQuery() == 1)
            {
                borrado = true;
            }
            else
            {
                //System.Windows.Forms.MessageBox.Show("No se pudo eliminar");
            }
        }
        catch (Exception ex)
        {
            //System.Windows.Forms.MessageBox.Show("Error" + ex.Message);
        }
        return borrado;
    }
}