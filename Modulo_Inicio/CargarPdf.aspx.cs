using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;



public partial class CargarPdf : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btn_subir_Click(object sender, EventArgs e)
    {
        //FileUpload1.SaveAs(Server.MapPath("~/Upload_Img/" + FileUpload1.FileName));
        string registro = Session["registroVie"].ToString();
        string nombre = FileUpload1.FileName;
        nombre = nombre.Replace(" ","");
        FileUpload1.SaveAs(Server.MapPath("~/Upload_Img/" + registro + "/Contrato/" + nombre));
        //FileUpload1.SaveAs("C:/Users/internet/Documents/BD Geomatica/Base_Datos_Geomática/Base_Datos/Información_Proyectos Base de Datos/" + FileUpload1.FileName);
        
        
        /*string RegistroVie = "250";
        string path = Path.Combine(Server.MapPath("~/Upload_Img"), RegistroVie);
        Directory.CreateDirectory(path);*/
        //FileUpload1.SaveAs(path);
        
        
        
        
        //FileUpload1.SaveAs(@"\\192.168.19.57\Imagenes_Geo\" + FileUpload1.FileName);
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        // Limpiamos la salida
        Response.Clear();
        // Con esto le decimos al browser que la salida sera descargable
        Response.ContentType = "application/octet-stream";
        // esta linea es opcional, en donde podemos cambiar el nombre del fichero a descargar (para que sea diferente al original)
        Response.AddHeader("Content-Disposition", "attachment; filename=Registro_VIE_02-2008_26-12-08.pdf");
        // Escribimos el fichero a enviar 
        Response.WriteFile("Upload_Img/539/DocumentosIniciales/Registro_VIE_02-2008_26-12-08.pdf");
        // volcamos el stream 
        Response.Flush();
        // Enviamos todo el encabezado ahora
        Response.End();

    }
    protected void Btn_subir0_Click(object sender, EventArgs e)
    {
        TablaProyectos proyectos = new TablaProyectos();

    }
}