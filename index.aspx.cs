using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;
using Excel = Microsoft.Office.Interop.Excel;
using System.Windows.Forms;
using Microsoft.Office.Interop.Excel;
using System.Data.OleDb;
using System.Text;



public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    private void ExportarDataGridViewExcel(System.Web.UI.WebControls.GridView gdv)
    {
        object misValue = System.Reflection.Missing.Value;
        try
        {

            SaveFileDialog fichero = new SaveFileDialog();
            fichero.Filter = "Excel (*.xls)|*.xls";
            fichero.FileName = "ArchivoExportado";
            if (fichero.ShowDialog() == DialogResult.OK)
            {
                Microsoft.Office.Interop.Excel.Application aplicacion;
                Microsoft.Office.Interop.Excel.Workbook libros_trabajo;
                Microsoft.Office.Interop.Excel.Worksheet hoja_trabajo;

                aplicacion = new Microsoft.Office.Interop.Excel.Application();
                libros_trabajo = aplicacion.Workbooks.Add("");
                hoja_trabajo =(Microsoft.Office.Interop.Excel.Worksheet)libros_trabajo.Worksheets.get_Item(1);

                //Recorremos el DataGridView rellenando la hoja de trabajo
                for (int i = 0; i < gdv.Rows.Count - 1; i++)
                {
                    for (int j = 0; j < gdv.Columns.Count; j++)
                    {
                        if ((gdv.Rows[i].Cells[j].Text == null) == false)
                        {
                            hoja_trabajo.Cells[i + 1, j + 1] = gdv.Rows[i].Cells[j].Text.ToString();
                        }
                    }
                }
                libros_trabajo.SaveAs(fichero.FileName, Microsoft.Office.Interop.Excel.XlFileFormat.xlWorkbookNormal, misValue, misValue, misValue, misValue, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, misValue, misValue, misValue, misValue, misValue);
                libros_trabajo.Close(true,misValue,misValue);
                aplicacion.Quit();
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
        }
    }
    
    protected void probarClick()
    {
        //funciona!
        SqlConnection cnn;
        string connectionString = null;
        string sql = null;
        string data = null;
        int i = 0;
        int j = 0;

        String FileName = "DemoExportar.xlsx";
        String FilePath = Server.MapPath("/Descargados/" + FileName);
        

        Microsoft.Office.Interop.Excel.Application xlApp;
        Microsoft.Office.Interop.Excel.Workbook xlWorkBook;
        Microsoft.Office.Interop.Excel.Worksheet xlWorkSheet;
        object misValue = System.Reflection.Missing.Value;
        Microsoft.Office.Interop.Excel.Range formatRange;


        xlApp = new Microsoft.Office.Interop.Excel.Application();
        xlWorkBook = xlApp.Workbooks.Add(misValue);
        xlWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);
        connectionString = @"Data Source=10.1.90.14;Initial Catalog=PROYECTOSGEOMATICA_DEVEL;User ID=Consolidado;Password=Pr0y3ct0sG30m@t1c4";
        cnn = new SqlConnection(connectionString);
        cnn.Open();
        sql = "SELECT Contrato_Convenio.Nombre, Contrato_Convenio.Objeto, Entidad_Contratante.Nombre_Entidad, Contrato_Convenio.Valor_Contratado, Contrato_Convenio.Valor_Liquidado, Contrato_Convenio.Fecha_Inicio, Contrato_Convenio.Fecha_Terminación FROM Contrato_Convenio INNER JOIN Entidad_Contratante ON Contrato_Convenio.Entidad_Contratante = Entidad_Contratante.Id_Entidad_Contratante";
        SqlDataAdapter dscmd = new SqlDataAdapter(sql, cnn);
        DataSet ds = new DataSet();
        dscmd.Fill(ds);

        xlWorkSheet.Cells[1, "A"] = "Contrato";
        xlWorkSheet.Cells[1, "B"] = "Objeto";
        xlWorkSheet.Cells[1, "C"] = "Entidad Contratante";
        xlWorkSheet.Cells[1, "D"] = "Valor Contratado";
        xlWorkSheet.Cells[1, "E"] = "Valor Ejecutado";
        xlWorkSheet.Cells[1, "F"] = "Fecha Inicio";
        xlWorkSheet.Cells[1, "G"] = "Fecha final";
        formatRange = xlWorkSheet.get_Range("A1", "G1");
        formatRange.EntireRow.AutoFit();
        formatRange.Cells.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
        formatRange.Borders.LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous;
        formatRange.Font.Bold = true;
        Range rg1 = (Microsoft.Office.Interop.Excel.Range)xlWorkSheet.Cells[1, 6];
        Range rg2 = (Microsoft.Office.Interop.Excel.Range)xlWorkSheet.Cells[1, 7];
        Range rg3 = null;
        //formatRange.NumberFormat = "@";
        //formatRange1 = xlWorkSheet.get_Range("C1", "C1");
        //formatRange1.Columns.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
        
        for (i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
        {
            for (j = 0; j <= ds.Tables[0].Columns.Count - 1; j++)
            {
                data = ds.Tables[0].Rows[i].ItemArray[j].ToString();
                xlWorkSheet.Cells[i + 2, j + 1] = data;
                rg3 = (Microsoft.Office.Interop.Excel.Range)xlWorkSheet.Cells[i+2, j+1];
                rg3.Borders.LineStyle = Microsoft.Office.Interop.Excel.XlLineStyle.xlContinuous;
                if(j >= 2)
                {
                    rg3.Cells.HorizontalAlignment = Microsoft.Office.Interop.Excel.XlHAlign.xlHAlignCenter;
                    rg3.ColumnWidth = 30;
                }
                else
                {
                    rg3.Columns.AutoFit();
                }
                //rg3.NumberFormat = "@";
                
                
            }
            
        }
        rg1.EntireColumn.NumberFormat = "MM/DD/YYYY"; /*para poner formato de fecha*/
        rg2.EntireColumn.NumberFormat = "MM/DD/YYYY"; /*para poner formato de fecha*/
        xlWorkBook.SaveAs(FilePath, Microsoft.Office.Interop.Excel.XlFileFormat.xlOpenXMLWorkbook, misValue, misValue, misValue, misValue, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, misValue, misValue, misValue, misValue, misValue);
        //xlWorkBook.Save();
        //xlWorkBook.Close(true, misValue, misValue);
        xlApp.Quit();
        
        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        
        response.ClearContent();
        response.Clear();
        response.ContentType = "application/vnd.ms-excel";
        response.AddHeader("Content-Disposition", "attachment; filename=" + FileName + ";");
        response.Charset = "UTF-8";
        response.Cache.SetCacheability(HttpCacheability.NoCache);
        response.ContentEncoding = System.Text.Encoding.Default;
        response.TransmitFile(FilePath);
        response.Flush();
        response.End();

        releaseObject(xlWorkSheet);
        releaseObject(xlWorkBook);
        releaseObject(xlApp);

    }
    private void releaseObject(object obj)
    {
        try
        {
            System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
            obj = null;
        }
        catch (Exception ex)
        {
            obj = null;
            MessageBox.Show("Exception Occured while releasing object " + ex.ToString());
        }
        finally
        {
            GC.Collect();
        }
    }

    protected void Exportar_Click(object sender, EventArgs e)
    {
        probarClick();
    }
    /*
    protected void Exportar_Datos()
    {
        // Crear un objeto SqlConnection, y luego pasar la ConnectionString al constructor.            
        SqlConnection Conection = new SqlConnection("PROYECTOSGEOMATICAConnectionString");

        // Utilizar una variable para almacenar la instrucción SQL.
        string SelectString = "SELECT [Id_Proyecto], [Nombre], [Registro_VIE] FROM [Proyectos] ORDER BY [Id_Proyecto] DESC";

        SqlDataAdapter Adaptador = new SqlDataAdapter(SelectString, Conection);

        DataSet DS = new DataSet();

        // Abrir la conexión.
        Conection.Open();
        Adaptador.Fill(DS);
        Conection.Close();

        // Creamos un objeto Excel.
        Microsoft.Office.Interop.Excel.Application Mi_Excel;

        // Creamos un objeto WorkBook. Para crear el documento Excel.           
        Microsoft.Office.Interop.Excel.Workbook LibroExcel;
        // Creamos un objeto WorkSheet. Para crear la hoja del documento.
        Microsoft.Office.Interop.Excel.Worksheet HojaExcel; ;

        // Iniciamos una instancia a Excel, y Hacemos visibles para ver como se va creando el reporte, 
        // podemos hacerlo visible al final si se desea.
        Mi_Excel = new Microsoft.Office.Interop.Excel.Application();
        Mi_Excel.Visible = true;

        /* Ahora creamos un nuevo documento y seleccionamos la primera hoja del 
         * documento en la cual crearemos nuestro informe. 
         */
        // Creamos una instancia del Workbooks de excel. 
        /*           
        LibroExcel = Mi_Excel.Workbooks.Add(0);
        // Creamos una instancia de la primera hoja de trabajo de excel            
        HojaExcel = (Microsoft.Office.Interop.Excel.Worksheet)LibroExcel.Worksheets[1];
        //HojaExcel.Visible = Excel.XlSheetVisibility.xlSheetVisible;

        // Hacemos esta hoja la visible en pantalla 
        // (como seleccionamos la primera esto no es necesario
        // si seleccionamos una diferente a la primera si lo
        // necesitariamos).
        HojaExcel.Activate();

        // Crear el encabezado de nuestro informe.
        // La primera línea une las celdas y las convierte un en una sola.            
        HojaExcel.Range["A1:E1"].Merge();
        // La segunda línea Asigna el nombre del encabezado.
        HojaExcel.Range["A1:E1"].Value = "----------------------------------------------";
        // La tercera línea asigna negrita al titulo.
        HojaExcel.Range["A1:E1"].Font.Bold = true;
        // La cuarta línea signa un Size a titulo de 15.
        HojaExcel.Range["A1:E1"].Font.Size = 15;

        // Crear el subencabezado de nuestro informe
        HojaExcel.Range["A2:E2"].Merge();
        HojaExcel.Range["A2:E2"].Value = "ENCUESTA DE SATISFACCIÓN AL CLIENTE EXTERNO";
        HojaExcel.Range["A2:E2"].Font.Italic = true;
        HojaExcel.Range["A2:E2"].Font.Size = 13;

        Microsoft.Office.Interop.Excel.Range objCelda = HojaExcel.Range["A3", Type.Missing];
        objCelda.Value = "ID";

        objCelda = HojaExcel.Range["B3", Type.Missing];
        objCelda.Value = "Preguntas";

        objCelda = HojaExcel.Range["C3", Type.Missing];
        objCelda.Value = "Opciones";

        objCelda = HojaExcel.Range["D3", Type.Missing];
        objCelda.Value = "Valor de la Respuesta";

        objCelda = HojaExcel.Range["E3", Type.Missing];
        objCelda.Value = "Numero Votos";

        objCelda.EntireColumn.NumberFormat = "###,###,###.00";

        int i = 4;
        foreach (DataRow Row in DS.Tables[0].Rows)
        {
            // Asignar los valores de los registros a las celdas
            HojaExcel.Cells[i, "A"] = Row.ItemArray[0];
            // ID
            HojaExcel.Cells[i, "B"] = Row.ItemArray[1];
            // Pregunta
            HojaExcel.Cells[i, "C"] = Row.ItemArray[2];
            // Opciones
            HojaExcel.Cells[i, "D"] = Row.ItemArray[3];
            // Valor de la Respuesta
            HojaExcel.Cells[i, "E"] = Row.ItemArray[4];
            // Numero Votos

            // Avanzamos una fila
            i++;
        }

        // Seleccionar todo el bloque desde A1 hasta D #de filas.
        Microsoft.Office.Interop.Excel.Range Rango = HojaExcel.Range["A3:E" + (i - 1).ToString()];

        // Selecionado todo el rango especificado
        Rango.Select();

        // Ajustamos el ancho de las columnas al ancho máximo del
        // contenido de sus celdas
        Rango.Columns.AutoFit();

        // Asignar filtro por columna
        Rango.AutoFilter(1);

        // Crear un total general
        //LibroExcel.PrintPreview();
    }
    */
    protected void otroExportar()
    {
        try
        {

            SaveFileDialog fichero = new SaveFileDialog();
            fichero.Filter = "Excel (*.xls)|*.xls";
            fichero.FileName = "ArchivoExportado";
            if (fichero.ShowDialog() == DialogResult.OK)
            {
                SqlConnection cnn;
                string connectionString = null;
                string sql = null;
                string data = null;
                int i = 0;
                int j = 0;


                Microsoft.Office.Interop.Excel.Application xlApp;
                Microsoft.Office.Interop.Excel.Workbook xlWorkBook;
                Microsoft.Office.Interop.Excel.Worksheet xlWorkSheet;
                object misValue = System.Reflection.Missing.Value;

                xlApp = new Microsoft.Office.Interop.Excel.Application();
                xlWorkBook = xlApp.Workbooks.Add(misValue);
                xlWorkSheet = (Microsoft.Office.Interop.Excel.Worksheet)xlWorkBook.Worksheets.get_Item(1);

                connectionString = @"Data Source=10.1.90.14;Initial Catalog=PROYECTOSGEOMATICA_DEVEL;User ID=Consolidado;Password=Pr0y3ct0sG30m@t1c4";
                cnn = new SqlConnection(connectionString);
                cnn.Open();
                sql = "SELECT * FROM Proyectos";
                SqlDataAdapter dscmd = new SqlDataAdapter(sql, cnn);
                DataSet ds = new DataSet();
                dscmd.Fill(ds);

                for (i = 0; i <= ds.Tables[0].Rows.Count - 1; i++)
                {
                    for (j = 0; j <= ds.Tables[0].Columns.Count - 1; j++)
                    {
                        data = ds.Tables[0].Rows[i].ItemArray[j].ToString();
                        xlWorkSheet.Cells[i + 1, j + 1] = data;
                    }
                }

                xlWorkBook.SaveAs(fichero.FileName, Microsoft.Office.Interop.Excel.XlFileFormat.xlWorkbookNormal, misValue, misValue, misValue, misValue, Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlExclusive, misValue, misValue, misValue, misValue, misValue);
                xlWorkBook.Close(true, misValue, misValue);
                xlApp.Quit();
            }
        }
        catch (Exception ex)
        {
            MessageBox.Show("Error al exportar la informacion debido a: " + ex.ToString());
        }
    }
    protected void OtroExportar()
    {
        /*TablaContratos contrato = new TablaContratos();
        int Id_Contrato = Convert.ToInt32(Session["ID_Contrato"]);
        String[] datoscontrato = contrato.DatosContrato(Id_Contrato);

        string nombreArchivo = datoscontrato[7];
        string registroVie = Session["Id_RegistroVie"].ToString();
        */
        String FileName = "Demo.xlsx";
        String FilePath = Server.MapPath("/Descargados/" + FileName);
        System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
        response.ClearContent();
        response.Clear();
        response.ContentType = "application/vnd.ms-excel";
        response.AddHeader("Content-Disposition", "attachment; filename=" + FileName + ";");
        response.TransmitFile(FilePath);
        response.Flush();
        response.End();

    }
    protected void ExportarCombinado()
    {
        String CadenaString = @"Data Source=10.1.90.14;Initial Catalog=PROYECTOSGEOMATICA_DEVEL;User ID=Consolidado;Password=Pr0y3ct0sG30m@t1c4";
        // Crear un objeto SqlConnection, y luego pasar la ConnectionString al constructor.            
        SqlConnection Conection = new SqlConnection(CadenaString);

        // Utilizar una variable para almacenar la instrucción SQL.
        string SelectString = "SELECT * FROM Proyectos";

        SqlDataAdapter Adaptador = new SqlDataAdapter(SelectString, Conection);

        DataSet DS = new DataSet();

        // Abrir la conexión.
        Conection.Open();
        Adaptador.Fill(DS);
        Conection.Close();
        System.IO.FileStream ostrm;

        try
        {
            String sFilename = "Informe_Encuesta.csv";
            String FilePath = Server.MapPath("/Descargados/" + sFilename);
            System.IO.File.Delete(Page.MapPath(FilePath));
            ostrm = new System.IO.FileStream(Page.MapPath(FilePath), System.IO.FileMode.Append);
            System.IO.StreamWriter sw = new System.IO.StreamWriter(ostrm, System.Text.Encoding.Unicode);
            String s = "";

            if (DS.Tables[0] == null)
            {
                return;
            }
            for (int i = 0; i < DS.Tables[0].Columns.Count; i++)
            {
                s = s + DS.Tables[0].Columns[i].ColumnName + ",";
            }

            sw.WriteLine(s.TrimEnd(','));
            s = "";
            for (int i = 0; i < DS.Tables[0].Rows.Count; i++)
            {
                for (int j = 0; j < DS.Tables[0].Columns.Count; j++)
                    s = s + HttpUtility.HtmlDecode(DS.Tables[0].Rows[i][j].ToString()) + ",";
                sw.WriteLine(s.TrimEnd(';'));
                s = "";
            }
            sw.Close();

            Response.Clear();
            Response.AddHeader("Content-Disposition", "attachment; filename=" + sFilename + ";");
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.csv";
            Response.Charset = "UTF-8";
            Response.ContentEncoding = System.Text.Encoding.Unicode;
            Response.WriteFile(FilePath);
            //Response.TransmitFile(FilePath);
            Response.Flush();
            Response.End();
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message, ex);
        }
    }
}