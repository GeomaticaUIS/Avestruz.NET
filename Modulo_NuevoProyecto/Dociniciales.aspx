<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_NuevoProyecto.master" AutoEventWireup="true" CodeFile="Dociniciales.aspx.cs" Inherits="zNuevo_Dociniciales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <style type="text/css">
        .style17
        {
            width: 221px;
            height: 28px;
        }
        .style18
        {
            width: 290px;
            height: 28px;
        }
        .style19
        {
            width: 95px;
            height: 28px;
        }
        .style20
        {
            height: 28px;
        }
        .style21
        {
            width: 101px;
        }
        h1{
            font-size: 36px;
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            margin-top: 20px;
            margin-bottom: 10px;
            font-weight: 500;
            line-height: 1.1;
            color: inherit;
            margin: .67em 0;
        }
        .mdl-button{
            background:none;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <fieldset><br />
        <h1>DOCUMENTOS INCIALES DEL PROYECTO</h1><br /><br /><br />
        <table style="width: 900px">
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Formato VIE :</span>
                </td>
                <td style="text-align: left" class="style18">
                    <asp:FileUpload ID="Subir_FormatoVie" runat="server" Height="25px" Width="241px" Font-Size="Medium" CssClass="uploadFile" />
                </td>
                <td class="style19" style="text-align: center" >         
                    <asp:Button ID="Btn_FormatoVie" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_FormatoVie_Click" />
                </td>
                <td class="style20"><asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Acta Escuela :</span>
                </td>
                <td class="style18" style="text-align: left">
                    <asp:FileUpload ID="Subir_ActaEscuela" runat="server" Height="25px" Width="241px" Font-Size="Medium" />
                </td>
                <td class="style19" style="text-align: center">         
                    <asp:Button ID="Btn_actaEscuela" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_actaEscuela_Click"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Acta Claustro :</span>
                </td>
                <td class="style18" style="text-align: left">
                    <asp:FileUpload ID="Subir_ActaClaustro" runat="server" Height="25px" Width="241px" Font-Size="Medium" />
                </td>
                <td class="style19" style="text-align: center">         
                    <asp:Button ID="Btn_actaClaustro" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_actaClaustro_Click"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Acta Facultad :</span>
                </td>
                    
                <td id="List_" class="style18" style="text-align: left">
                    <asp:FileUpload ID="Subir_ActaFacultad" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" />
                </td>

                <td class="style19" style="text-align: center">         
                    <asp:Button ID="Btn_actaFacultad" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_actaFacultad_Click"/>
                </td>

                <td class="style20">
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Propuesta_Pdf :</span></td>
                    
                <td class="style18" style="text-align: left">
                    <asp:FileUpload ID="Subir_Propuesta" runat="server" Height="25px" 
                        Width="241px" Font-Size="Medium" />
                </td>
                <td class="style19" style="text-align: center">         
                    <asp:Button ID="Btn_Propuesta" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Propuesta_Click"/>
                </td>
                <td class="style20">
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label></td>
                
            </tr>
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Memoria Técnica :</span>
                </td>
                    
                <td id="Td1" class="style18" style="text-align: left">
                    <asp:FileUpload ID="Subir_MemoTecnica" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" />
                </td>

                <td class="style19" style="text-align: center">         
                    <asp:Button ID="Btn_MemoTecnica" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_MemoTecnica_Click"/>
                </td>

                <td class="style20">
                    <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Presupuesto Interno :</span>
                </td>
                    
                <td id="Td2" class="style18" style="text-align: left">
                    <asp:FileUpload ID="Subir_PresupuestoInterno" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" />
                </td>

                <td class="style19" style="text-align: center">         
                    <asp:Button ID="Btn_Presupuesto" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Presupuesto_Click"/>
                </td>

                <td class="style20">
                    <asp:Label ID="Label8" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            </table>

            <br /><br />
        <table style="width: 900px">
            <tr><td class="style21"></td>
                <td class="style17" style="text-align: left; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>Carta Presentacion :</span>
                </td>
                 
                <td class="style18" style="text-align: left">
                    <asp:FileUpload ID="Subir_Carta" runat="server" Height="25px" 
                        Width="241px" Font-Size="Medium" />
                </td>
                <td  rowspan="2" class="style19" 
                    style="text-align: center">         
                    <asp:Button ID="Btn_Carta" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Carta_Click" ValidationGroup="Validar_Propuesta"/>
                </td>
                <td rowspan="2" class="style20">
                <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                    </td>
                
            </tr>
            <tr>
                <td class="style21"></td> 
                <td  style="text-align: left" class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <span><b>Fecha Propuesta :</b></span></td>
                <td  style="text-align: left" class="style7">
                    <asp:TextBox ID="Txt_fechaPropuesta" runat="server" class="floatl__input" Height="23px" Width="170px" 
                        ValidationGroup="Validar_Propuesta"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaPropuesta" PopupButtonID="Txt_fechaPropuesta" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="Txt_fechaPropuesta" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="Validar_Propuesta" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Txt_fechaPropuesta" 
                    ErrorMessage="Fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$"  ValidationGroup="Validar_Propuesta"><b>*</b></asp:RegularExpressionValidator>
                </td>
                
                
            </tr>
        </table><br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" class="boton buscar"/>
        <asp:Button ID="Btn_Terminar" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
        </fieldset>
    </div>
    
</asp:Content>

