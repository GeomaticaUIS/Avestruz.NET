<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="VerContrato.aspx.cs" Inherits="VerContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style5
        {
        text-align: right;
        width: 133px;
        height: 30px;
        }
        .style6
        {
            text-align: left;
            height: 30px;
        }
        .style7
        {
            text-align: justify;
            height: 55px;
        }
        .style8
        {
            text-align: left;
            height: 30px;
            width: 214px;
        }
        .style9
        {
            
            width: 133px;
            height: 55px;
        }
        .style10
        {
            text-align: right;
            width: 96px;
            height: 30px;
        }
        .style11
        {
            text-align: left;
            height: 30px;
            width: 246px;
        }
        .auto-style1
        {
            height: 30px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div align="center">
        <h1>Contrato</h1><br />
        <fieldset>

        <h2><b><asp:Label ID="lbl_Nombre" runat="server" ></asp:Label></b></h2><br /><br />

        <table style="width: 817px">
             
            <tr>
                <td class="auto-style1" style="text-align: left"><span><b>Entidad :</b></span></td>
                <td class="style11" style="text-align: left"><asp:Label ID="lbl_Entidad" runat="server" ></asp:Label></td>
                <td class="auto-style1" style="text-align: left"><span><b>Fecha Suscripción :</b></span>&nbsp;&nbsp;</td>
                <td class="style11" style="text-align: left"><asp:Label ID="lbl_fechaSuscripcion" runat="server" ></asp:Label></td>
            </tr>
            
            <tr>
                <td class="style13" style="text-align: left"><span><b>Valor contratado:</b></span>&nbsp;&nbsp;</td>
                <td class="style6"><asp:Label ID="lbl_Valor" runat="server" ></asp:Label></td>
                <td class="style13" style="text-align: left"><span><b>Fecha de Inicio :</b></span>&nbsp;&nbsp;</td>
                <td class="style11" style="text-align: left"><asp:Label ID="lbl_FechaInicio" runat="server" ></asp:Label></td>
                
            </tr>
       
            <tr>
                <td class="style13" style="text-align: left"><b>Valor final ejecutado:</b></td>
                <td class="style6"><asp:Label ID="lbl_valorEjecutado" runat="server"></asp:Label></td>
                
                <td class="style13" style="text-align: left"><span><b style="text-align: left">Fecha Final :</b></span>&nbsp;&nbsp;</td>
                <td class="style8"><asp:Label ID="lbl_FechaFinal" runat="server" ></asp:Label></td>
                
            </tr>
            <tr>
                <td class="style9" style="text-align:  left; vertical-align: Top;"><span><br /> <b>Objeto :</b>&nbsp;&nbsp;</span></td>
                <td colspan="3" class="style7" style="text-align: justify; vertical-align: top;"><br /><asp:Label ID="lbl_Objeto" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="style13" style="text-align: left"><span><b>Archivo Pdf :</b></span>&nbsp;&nbsp;</td>
                <td class="style6">
                    <asp:LinkButton ID="LinkButton_ArchivoPdf" runat="server" ForeColor="#666666" 
                    onclick="LinkButton_ArchivoPdf_Click"></asp:LinkButton> 
                    <asp:Label ID="Lbl_ArchivoPdf" runat="server" ></asp:Label>
                </td>
                <td style="text-align:left;"><span><b>Estado :</b></span></td>
                <td style="text-align:left;"><asp:Label ID="Lbl_Estado" runat="server" ></asp:Label></td>
             </tr>
                                                  
        </table>
        </fieldset><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
             
    </div>
</asp:Content>

