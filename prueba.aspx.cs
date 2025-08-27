using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Windows.Forms;
using OfficeOpenXml;
using OfficeOpenXml.Drawing;
using OfficeOpenXml.Style;
using System.Data.SqlClient;

public partial class prueba : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Exportar_Click(object sender, EventArgs e)
    {
        ExportarDatos();
    }
    
    private static void SetWorkbookProperties(ExcelPackage p)
    {
        //Here setting some document properties
        p.Workbook.Properties.Author = "Proyectos Geomatica";
        p.Workbook.Properties.Title = "Reporte";
    }
    private static ExcelWorksheet CreateSheet(ExcelPackage p, string sheetName)
    {
        p.Workbook.Worksheets.Add(sheetName);
        ExcelWorksheet ws = p.Workbook.Worksheets[1];
        ws.Name = sheetName; //Setting Sheet's name
        ws.Cells.Style.Font.Size = 11; //Default font size for whole sheet
        ws.Cells.Style.Font.Name = "Century Gotich"; //Default Font name for whole sheet

        return ws;
    }
    private static void CreateHeader(ExcelWorksheet ws, ref int rowIndex, DataTable dt)
    {
        int colIndex = 1;
        foreach (DataColumn dc in dt.Columns) //Creating Headings
        {
            var cell = ws.Cells[rowIndex, colIndex];

            //Setting the background color of header cells to Gray
            Color colFromHex = System.Drawing.ColorTranslator.FromHtml("#ADE8F5");
            var fill = cell.Style.Fill;
            fill.PatternType = ExcelFillStyle.Solid;
            fill.BackgroundColor.SetColor(colFromHex);

            //Setting Top/left,right/bottom borders.
            var border = cell.Style.Border;
            border.Bottom.Style = border.Top.Style = border.Left.Style = border.Right.Style = ExcelBorderStyle.Thin;


            colIndex++;
        }
    }
    private static void ApplyColorColumn(ExcelWorksheet ws, int column, string hex,DataTable dt)
    {
        var cell = ws.Cells[3,column,dt.Rows.Count,column];

        //Setting the background color of header cells to Gray
        Color colFromHex = System.Drawing.ColorTranslator.FromHtml("#"+hex);
        var fill = cell.Style.Fill;
        fill.PatternType = ExcelFillStyle.Solid;
        fill.BackgroundColor.SetColor(colFromHex);
    }
    private static void CreateData(ExcelWorksheet ws, DataTable dt)
    {
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            for (int j = 0; j < dt.Columns.Count; j++)
            {
                var cell = ws.Cells[i + 3, j+1];
                cell.Value = dt.Rows[i][j];
                var border = cell.Style.Border;
                border.Bottom.Style = border.Top.Style = border.Left.Style = border.Right.Style = ExcelBorderStyle.Thin;
                if((j+1) >= 4)
                {
                    cell.Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;
                }
            }
        }
        //Aplica formato a un rango de celdas
        ws.Cells["D:F"].Style.Numberformat.Format = "$#,##0.00";
        ws.Cells["G:H"].Style.Numberformat.Format = "dd/MM/yyyy";
        ws.Cells[2, 1, 2, dt.Columns.Count].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        ws.Cells[2, 1, 2, dt.Columns.Count].Style.Font.Bold = true;
        ws.Cells[2, 1, 2, dt.Columns.Count].Style.Border.Bottom.Style = ws.Cells[2, 1, 2, dt.Columns.Count].Style.Border.Top.Style = ws.Cells[2, 1, 2, dt.Columns.Count].Style.Border.Right.Style = ExcelBorderStyle.Thin;
        
        ws.Column(1).Width = 70;
        ws.Column(2).Width = 70;
        ws.Column(3).Width = 30;
        ws.Column(4).Width = 30;
        ws.Column(5).Width = 30;
        ws.Column(6).Width = 30;
        ws.Column(7).Width = 30;
        ws.Column(8).Width = 30;
    }
    private void ExportarDatos()
    {

        int rowIndex = 2;

        ExcelPackage excel = new ExcelPackage();
        SetWorkbookProperties(excel);
        ExcelWorksheet ws = CreateSheet(excel, "Hoja 1");
        DataSet ds = new DataSet();
        SqlDataAdapter dscmd = ConnectToDB();
        dscmd.Fill(ds);
        DataTable dt = new DataTable();
        dt = ds.Tables[0];
        /*MessageBox.Show("Columnas: " + dt.Columns.Count.ToString());
        MessageBox.Show("Filas: " + dt.Rows.Count.ToString());
        */
        CreateTitles(ws,dt);
        CreateHeader(ws, ref rowIndex, dt);
        CreateData(ws, dt);
        using (var memoryStream = new MemoryStream())
        {
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
            Response.AddHeader("content-disposition", "attachment;  filename=Exported.xlsx");
            excel.SaveAs(memoryStream);
            memoryStream.WriteTo(Response.OutputStream);
            Response.Flush();
            Response.End();
        }
    }
    private void CreateTitles(ExcelWorksheet ws, DataTable dt)
    {
        ws.Cells[1, 1].Value = "REPORTE DE CONTRATOS";
        ws.Cells[1, 1, 1, dt.Columns.Count].Merge = true;
        ws.Cells[1, 1, 1, dt.Columns.Count].Style.Font.Bold = true;
        ws.Cells[1, 1, 1, dt.Columns.Count].Style.HorizontalAlignment = ExcelHorizontalAlignment.Center;
        ws.Cells[1, 1, 1, dt.Columns.Count].Style.Border.Bottom.Style = ws.Cells[1, 1, 1, dt.Columns.Count].Style.Border.Top.Style = ws.Cells[1, 1, 1, dt.Columns.Count].Style.Border.Right.Style = ExcelBorderStyle.Thin;
        ws.Cells[2, 1].Value = "Contrato";
        ws.Cells[2, 2].Value = "Objeto";
        ws.Cells[2, 3].Value = "Entidad Contratante";
        ws.Cells[2, 4].Value = "Valor Inicial Contratado";
        ws.Cells[2, 5].Value = "Valor Final Ejecutado";
        ws.Cells[2, 6].Value = "Valor Ejecutado";
        ws.Cells[2, 7].Value = "Fecha Inicio";
        ws.Cells[2, 8].Value = "Fecha Final";

    }
    private static SqlDataAdapter ConnectToDB()
    {
        string connectionString = null;
        string sql = null;
        SqlConnection cnn;
        connectionString = @"Data Source=10.1.90.14;Initial Catalog=PROYECTOSGEOMATICA_DEVEL;User ID=Consolidado;Password=Pr0y3ct0sG30m@t1c4";
        cnn = new SqlConnection(connectionString);
        cnn.Open();
        sql = "SELECT Contrato_Convenio.Nombre, Contrato_Convenio.Objeto, Entidad_Contratante.Nombre_Entidad, Proyectos.Valor, Contrato_Convenio.Valor_Contratado, Contrato_Convenio.Valor_Liquidado, Contrato_Convenio.Fecha_Inicio, Contrato_Convenio.Fecha_Terminación FROM Contrato_Convenio INNER JOIN Entidad_Contratante ON Contrato_Convenio.Entidad_Contratante = Entidad_Contratante.Id_Entidad_Contratante INNER JOIN Proyectos ON Contrato_Convenio.Id_Proyecto = Proyectos.Id_Proyecto";
        SqlDataAdapter adapter = new SqlDataAdapter(sql, cnn);
        return adapter;
    }
}