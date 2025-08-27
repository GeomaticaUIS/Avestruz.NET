<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModDocumentosContratante.aspx.cs" Inherits="Modulo_Modificar_ModDocumentosContratante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <style type="text/css">
        .style1
        {
            width: 320px;
        }
        .style2
        {
            width: 280px;
        }
        .style3
        {
            width: 100px;
        }
        .style4
        {
            width: 50px;
        }
        .auto-style1 {
            width: 252px;
        }
        .auto-style3 {
            width: 233px;
        }
        .auto-style4 {
            width: 225px;
        }
        .page{
            margin: 50px auto 0px auto;
        }
        td{
            padding: 2px;
        }
        .mdl-button{
            background:none;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <fieldset><br />
        <h1>DOCUMENTOS CONTRATANTE</h1><br /><br /><br /><br />
        <table style="width: 900px">
            <tr>
                <td style="text-align: left; font-weight: bold;" class="auto-style3">
                    <span>Carta de solicitud de propuesta :</span>
                </td>
                <td style="text-align:left;display:inline-table;" class="auto-style1">
                    <asp:FileUpload ID="Subir_Carta" runat="server" Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style4" style="text-align: center" >         
                    <asp:Button ID="Btn_Carta" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Carta_Click" 
                        Enabled="False"/>
                    &nbsp;
                    <asp:Button ID="btn_eliminarCarta" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="false" OnClick="btn_eliminarCarta_Click"/>
                </td>
                <td class="style20"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td style="text-align: left;font-weight: bold;"class="auto-style3">
                    <span>Términos de referencia o <br />requerimientos técnicos:</span>
                </td>
                <td style="text-align: left;display:inline-table;" class="auto-style1">
                    <asp:FileUpload ID="Subir_Terminos" runat="server" Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style4" style="text-align: center">         
                    <asp:Button ID="Btn_Terminos" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Terminos_Click" Enabled="False"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarTerminos" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="false" OnClick="btn_EliminarTerminos_Click"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; font-weight: bold;" class="auto-style3">
                    <span>Estudios previos :</span>
                </td>
                <td style="text-align: left;display:inline-table;" class="auto-style1">
                    <asp:FileUpload ID="Subir_Estudios" runat="server" Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style4" style="text-align: center">         
                    <asp:Button ID="Btn_Estudios" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Estudios_Click" Enabled="False"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarEstudios" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="false" OnClick="btn_EliminarEstudios_Click"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; font-weight: bold;" class="auto-style3">
                    <span>Certificado de disponibilidad <br />presupuestal - CDP:</span>
                </td>
                    
                <td id="List_" style="text-align: left;display:inline-table;" class="auto-style1">
                    <asp:FileUpload ID="Subir_Certificado" runat="server" Width="241px" Font-Size="Medium" Enabled="False" />
                </td>

                <td class="auto-style4" style="text-align: center">         
                    <asp:Button ID="Btn_Cdp" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Cdp_Click" Enabled="False"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarCDP" runat="server" Text="Borrar"  class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="false" OnClick="btn_EliminarCDP_Click"/>
                </td>

                <td class="style20">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left; font-weight: bold;" class="auto-style3">
                   <span>Registro presupuestal - RP :</span></td>
                    
                <td style="text-align: left;display:inline-table;" class="auto-style1">
                    <asp:FileUpload ID="Subir_RegistroP" runat="server" Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style4" style="text-align: center">         
                    <asp:Button ID="Btn_Rp" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Rp_Click" Enabled="False"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarRP" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="false" OnClick="btn_EliminarRP_Click"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                
            </tr>
            
            
            </table>

        <br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Modificar"  class="boton buscar" onclick="Btn_Continuar_Click" />
        <asp:Button ID="Btn_Terminar" runat="server" Text="Continuar"  class="boton buscar" />
        </fieldset>
    </div>
</asp:Content>

