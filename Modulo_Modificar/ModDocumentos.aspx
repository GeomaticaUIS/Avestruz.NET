<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModDocumentos.aspx.cs" Inherits="zModificar_ModDocumentos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">     
        
        .style2
        {
            width: 290px;
        }
        .style4
        {
            width: 221px;
            height: 28px;
        }
        .style5
        {
            width: 290px;
            height: 28px;
        }
        .style6
        {
            width: 95px;
            height: 28px;
        }
        .style8
        {
            height: 28px;
        }
        .style9
        {
            width: 221px;
            height: 27px;
        }
        .style10
        {
            width: 290px;
            height: 27px;
        }
        .style11
        {
            width: 95px;
            height: 27px;
        }
        .style12
        {
            height: 27px;
        }
        .style14
        {
            width: 221px;
        }        
        .style15
        {
            width: 60px;
        }
        .auto-style1
        {
            width: 153px;
            height: 28px;
        }
        .auto-style2
        {
            width: 153px;
            height: 27px;
        }
        .auto-style3
        {
            width: 176px;
            height: 28px;
        }
        .auto-style4
        {
            width: 176px;
            height: 27px;
        } 
        .auto-style6
        {
            width: 154px;
        }
        .auto-style7
        {
            width: 154px;
            height: 28px;
        }
        td{
            padding:3px;
        }
        .dropdownlist{
            border: 1px solid #e6e6e6;
            border-radius: 3px;
        }
    </style>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div align="center">
    <fieldset><br />
            <h1>DOCUMENTOS INCIALES DEL PROYECTO</h1>
        <br /><br /><br />
        <table style="width: 900px">
            <tr><td class="style15"></td>
                <td class="auto-style1" style="text-align: left; font-weight: bold;"><span>Formato VIE :</span></td>
                <td style="text-align: left" class="style5"><asp:FileUpload ID="Subir_FormatoVie" 
                        runat="server" Height="25px" Width="241px" Font-Size="Medium" 
                        Enabled="False" /></td>
                <td class="auto-style3" style="text-align: center" >         
                        <asp:Button ID="Btn_FormatoVie" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_FormatoVie_Click" Enabled="False" />
                        &nbsp;
                        <asp:Button ID="btn_DeleteFormVIE" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeleteFormVIE_Click" />
                </td>
                <td class="style8"><asp:Label ID="Lbl_FormatoVie" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr><td class="style15"></td>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Acta Escuela</span><span> :</span></td>
                     
                <td class="style5" style="text-align: left">
                    <asp:FileUpload ID="Subir_ActaEscuela" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style3" style="text-align: center">         
                    <asp:Button ID="Btn_ActaEscuela" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_ActaEscuela_Click" Enabled="False"  />
                    &nbsp;
                    <asp:Button ID="btn_DeleteActaEscuela" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeleteActaEscuela_Click" />
                </td>
                <td class="style8">
                    <asp:Label ID="Lbl_ActaEscuela" runat="server" Text=""></asp:Label></td>
               
            </tr>
            
            <tr><td class="style15"></td>
                <td class="auto-style2" style="text-align: left; font-weight: bold;">
                    <span>Acta Claustro :</span></td>
                     
                <td class="style10" style="text-align: left">
                    <asp:FileUpload ID="Subir_ActaClaustro" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style4" style="text-align: center">         
                    <asp:Button ID="Btn_ActaClaustro" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_ActaClaustro_Click" Enabled="False"  />
                    &nbsp;
                    <asp:Button ID="btn_DeleteActaClaustro" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeleteActaClaustro_Click" />
                </td>
                <td class="style12">
                    <asp:Label ID="Lbl_ActaClaustro" runat="server" Text=""></asp:Label></td>
            </tr>
            
            <tr><td class="style15"></td>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Acta Facultad :</span></td>
                    
                <td id="List_" class="style5" style="text-align: left">
                    <asp:FileUpload ID="Subir_ActaFacultad" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style3" style="text-align: center">         
                    <asp:Button ID="Btn_ActaFacultad" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_ActaFacultad_Click" Enabled="False" />
                    &nbsp;
                    <asp:Button ID="btn_DeleteActaFacultad" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeleteActaFacultad_Click" />
                </td>
                <td class="style8">
                    <asp:Label ID="Lbl_ActaFacultad" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr><td class="style15"></td>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Propuesta_Pdf :</span></td>
                    
                <td class="style5" style="text-align: left">
                    <asp:FileUpload ID="Subir_Propuesta_Pdf" runat="server" Height="25px" 
                        Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style3" style="text-align: center">         
                    <asp:Button ID="Btn_Propuesta_Pdf" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Propuesta_Pdf_Click" Enabled="False" />
                    &nbsp;
                    <asp:Button ID="btn_DeletePropuesta_pdf" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeletePropuesta_pdf_Click" />
                </td>
                <td class="style8">
                    <asp:Label ID="Lbl_Propuesta_Pdf" runat="server" Text=""></asp:Label></td>
                
            </tr>
            <tr><td class="style15"></td>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Memoria Técnica :</span></td>
                    
                <td id="Td1" class="style5" style="text-align: left">
                    <asp:FileUpload ID="Subir_Memo" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style3" style="text-align: center">         
                    <asp:Button ID="Btn_MemoTecnica" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_MemoTecnica_Click" Enabled="False" />
                    &nbsp;
                    <asp:Button ID="btn_DeleteMenoTecnica" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeleteMenoTecnica_Click" />
                </td>
                <td class="style8">
                    <asp:Label ID="Lbl_MemoTecnica" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr><td class="style15"></td>
                <td class="auto-style1" style="text-align: left; font-weight: bold;">
                    <span>Presupuesto Interno :</span></td>
                    
                <td id="Td2" class="style5" style="text-align: left">
                    <asp:FileUpload ID="Subir_Presupuesto" runat="server" Height="25px" 
                     Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style3" style="text-align: center">         
                    <asp:Button ID="Btn_Presupuesto" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Presupuesto_Click" Enabled="False" 
                            ValidationGroup="Validar_Propuesta" />
                    &nbsp;
                    <asp:Button ID="btn_DeletePresupuesto" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeletePresupuesto_Click" />
                </td>
                <td class="style8">
                    <asp:Label ID="Lbl_Presupuesto" runat="server" Text=""></asp:Label></td>
            </tr>
            </table><br /><br />
            <table style="width: 900px">
            <tr><td class="style15"></td>
                <td class="auto-style7" style="text-align: left; font-weight: bold;">
                    <span>Carta Presentacion :</span>
                </td>
                 
                <td class="style5" style="text-align: left">
                    <asp:FileUpload ID="Subir_Carta" runat="server" Height="25px" 
                        Width="241px" Font-Size="Medium" Enabled="False" />
                </td>
                <td class="auto-style3" style="text-align: center">         
                    <asp:Button ID="Btn_Carta" runat="server" Text="Subir" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" onclick="Btn_Carta_Click" Enabled="False"  />
                    &nbsp;
                    <asp:Button ID="btn_DeleteCarta" runat="server" Text="Borrar" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" Enabled="False" OnClick="btn_DeleteCarta_Click" />
                </td>
                <td class="style8">
                    <asp:Label ID="Lbl_Carta" runat="server" Text=""></asp:Label></td>
                
            </tr>
            
            <tr><td class="style15"></td>
                <td  style="text-align: left" class="auto-style6">
                    <span><b>Fecha Propuesta :</b></span></td>
                <td  style="text-align: left" class="style2">
                    <asp:TextBox ID="Txt_fechaPropuesta" class="dropdownlist" runat="server" Height="23px" Width="170px" Enabled="False" ValidationGroup="Validar_Propuesta"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaPropuesta" PopupButtonID="Txt_fechaPropuesta" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="Txt_fechaPropuesta" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="Validar_Propuesta" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="Txt_fechaPropuesta" ErrorMessage="Fecha Invalida" 
                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$"  
                        ValidationGroup="Validar_Propuesta"><b>*</b></asp:RegularExpressionValidator>
                </td>
                <td colspan="2">
                    <asp:Label ID="Label_fecha" runat="server"></asp:Label>
                </td>
            </tr>
        </table><br /><br /><br /><br />
        <asp:Button ID="Btn_Modificar" runat="server" Text="Modificar" onclick="Btn_Modificar_Click" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
            </fieldset>
        </div>
</asp:Content>

