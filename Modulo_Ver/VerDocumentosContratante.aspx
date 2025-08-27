<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="VerDocumentosContratante.aspx.cs" Inherits="Modulo_Ver_VerDocumentosContratante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            height: 33px;
            width: 400px;
        }
        .style6
        {
            height: 33px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
<fieldset><br />
<h1> Documentos Contratante</h1><br /><br /><br /><br />
<table style="width: 900px">
        <tr>
            <td class="style5" style="text-align: right"><span><b>Carta de solicitud de propuesta :</b></span>&nbsp;&nbsp;</td>
            <td class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="Link_Carta" runat="server" ForeColor="#666666" onclick="Link_Carta_Click"></asp:LinkButton>
                    <asp:Label ID="Label1" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style5" style="text-align: right"><span><b>Términos de referencia :</b>&nbsp;&nbsp;</span></td>
                <td class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="Link_Termino" runat="server" ForeColor="#666666" onclick="Link_Termino_Click"></asp:LinkButton>
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td class="style5" style="text-align: right"><span><b>Estudios previos :</b></span>&nbsp;&nbsp;</td>
            <td class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="Link_estudio" runat="server" ForeColor="#666666" onclick="Link_estudio_Click"></asp:LinkButton>
                <asp:Label ID="Label3" runat="server" ></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: right" class="style5"><span><b>Certificado presupuestal - CDP :</b></span>&nbsp;&nbsp;</td>

            <td class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="Link_Certificado" runat="server" ForeColor="#666666" onclick="Link_Certificado_Click"></asp:LinkButton>
                <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
           </td>
        </tr>
        <tr>
           <td class="style5" style="text-align: right"><span><b>Registro presupuestal - RP :</b></span>&nbsp;&nbsp;</td>
           <td class="style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:LinkButton ID="Link_Registro" runat="server" ForeColor="#666666" onclick="Link_Registro_Click"></asp:LinkButton>
               <asp:Label ID="Label5" runat="server" ></asp:Label></td>
        </tr>
        
        
     </table><br /><br /><br /><br />
     
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" ValidationGroup="Validar_InfoGeneral" onclick="Btn_Continuar_Click" class="boton buscar"/>
                <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Enviar_Form_Usuario0_Click" class="boton buscar"/>
             
    
    </fieldset>
   </div>
</asp:Content>

