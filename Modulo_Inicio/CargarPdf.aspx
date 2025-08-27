<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CargarPdf.aspx.cs" Inherits="CargarPdf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td> Propuesta Pdf :</td>
            <td> 
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="Btn_subir" runat="server" onclick="Btn_subir_Click" 
                    Text="Subir" />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
        <td> 
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Descargar pdf 183-carta presentacion</asp:LinkButton>
                <asp:Button ID="Btn_subir0" runat="server" Text="Cambiar" 
                onclick="Btn_subir0_Click" />
                </td>
        </tr>
    </table>
    
    </div>
    </form>
</body>
</html>
