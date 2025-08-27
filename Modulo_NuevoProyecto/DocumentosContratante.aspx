<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_NuevoProyecto.master" AutoEventWireup="true" CodeFile="DocumentosContratante.aspx.cs" Inherits="Modulo_NuevoProyecto_DocumentosContratante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            width: 222px;
        }
        .auto-style2 {
            width: 190px;
        }
        td{
            padding: 4px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <fieldset><br />
        <h1>DOCUMENTOS CONTRATANTE</h1><br /><br /><br /><br />
        <table style="width: 900px">
            <tr>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Carta de solicitud de propuesta :</span>
                </td>
                <td style="text-align: left" class="style2">
                    <asp:FileUpload ID="Subir_Carta" runat="server" Height="25px" Width="241px" 
                        Font-Size="Medium" />
                </td>
                <td class="auto-style2" style="text-align: center" >         
                    <asp:Button ID="Btn_Carta" runat="server" Text="Subir" onclick="Btn_Carta_Click" Width="35%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                    &nbsp;
                    <asp:Button ID="btn_eliminarCarta" runat="server" Text="BORRAR" OnClick="btn_eliminarCarta_Click" Width="45%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                </td>
                <td class="style20"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Términos de referencia o <br />requerimientos técnicos  :</span>
                </td>
                <td class="style2" style="text-align: left">
                    <asp:FileUpload ID="Subir_Terminos" runat="server" Height="25px" Width="241px" 
                        Font-Size="Medium" />
                </td>
                <td class="auto-style2" style="text-align: center">         
                    <asp:Button ID="Btn_Terminos" runat="server" Text="Subir" onclick="Btn_Terminos_Click" Width="35%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarTerminos" runat="server" Text="BORRAR" OnClick="btn_EliminarTerminos_Click" Width="45%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Estudios previos :</span>
                </td>
                <td class="style2" style="text-align: left">
                    <asp:FileUpload ID="Subir_Estudios" runat="server" Height="25px" Width="241px" 
                        Font-Size="Medium" />
                </td>
                <td class="auto-style2" style="text-align: center">         
                    <asp:Button ID="Btn_Estudios" runat="server" Text="Subir" onclick="Btn_Estudios_Click" Width="35%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarEstudios" runat="server" Text="BORRAR" OnClick="btn_EliminarEstudios_Click" Width="45%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Certificado de disponibilidad <br />presupuestal - CDP :</span>
                </td>
                    
                <td id="List_" class="style2" style="text-align: left">
                    <asp:FileUpload ID="Subir_Certificado" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" />
                </td>

                <td class="auto-style2" style="text-align: center">         
                    <asp:Button ID="Btn_Cdp" runat="server" Text="Subir" onclick="Btn_Cdp_Click" Width="35%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarCDP" runat="server" Text="BORRAR" OnClick="btn_EliminarCDP_Click" Width="45%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                </td>

                <td class="style20">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                   <span>Registro presupuestal - RP :</span></td>
                    
                <td class="style2" style="text-align: left">
                    <asp:FileUpload ID="Subir_RegistroP" runat="server" Height="25px" 
                        Width="241px" Font-Size="Medium" />
                </td>
                <td class="auto-style2" style="text-align: center">         
                    <asp:Button ID="Btn_Rp" runat="server" Text="Subir" onclick="Btn_Rp_Click" Width="35%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                    &nbsp;
                    <asp:Button ID="btn_EliminarRP" runat="server" Text="BORRAR" OnClick="btn_EliminarRP_Click" Width="45%" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                
            </tr>
            
            
            </table>

        <br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" class="boton buscar"/>
        <asp:Button ID="Btn_Terminar" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
        </fieldset>
    </div>
</asp:Content>

