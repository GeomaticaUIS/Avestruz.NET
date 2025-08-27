<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="Consulta.aspx.cs" Inherits="Consulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .style12
        {
            text-align: left;
            height: 40px;
        }
        .style14
        {
            text-align: left;
            height: 40px;
            width: 292px;
        }
        .style18
        {
            text-align: right;
            width: 225px;
            height: 40px;
        }
        .style19
        {
            text-align: right;
            height: 40px;
            width: 250px;
        }
        .style20
        {
            text-align: left;
            height: 40px;
            width: 300px;
        }
        h2{
            font-size: 20px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center" style="width: 940px; margin-left: 0px; margin-right: 0px">
           
         <h1>Información General del Proyecto</h1><br />
         <fieldset>

         <b><h2><asp:Label ID="lbl_Nombre" runat="server" ></asp:Label></h2></b><br /><br />

         <table style="width: 916px; height: 213px;">

            <tr>
                <td class="style18" style="text-align: left"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>FEX.04 VIE :</b></span></td>
                <td class="style20"><asp:Label ID="lbl_RegVie" runat="server" ></asp:Label></td>
                <td class="style19" style="text-align: left"><span><b>Valor del Proyecto :</b></span></td>
                <td class="style12"><asp:Label ID="lbl_Valor" runat="server" ></asp:Label>

                </td>
            </tr>

           

            <tr>
                <td class="style18" style="text-align: left"><span>&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;<b>Fecha FEX.04 VIE :</b></span></td>
                <td class="style20"><asp:Label ID="lbl_FechaVie" runat="server" ></asp:Label></td>
                <td class="style19" style="text-align: left"><span><b>Fecha Propuesta :</b></span></td>
                <td class="style12"><asp:Label ID="lbl_FechaPropuesta" runat="server" ></asp:Label></td>
            </tr>
   
            <tr>
                <td class="style18" style="text-align: left"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Formato Reg VIE :</b></span></td>
                <td class="style20">
                    <asp:LinkButton ID="LinkBtn_FormatoVie" runat="server" 
                        onclick="LinkBtn_FormatoVie_Click" ForeColor="#666666" ></asp:LinkButton>
                    <asp:Label ID="Lbl_FormatoVie" runat="server" ></asp:Label>
                </td>
                <td class="style19" style="text-align: left"><span><b>Acta Claustro :</b></span></td>
                <td class="style12">
                    <asp:LinkButton ID="LinkBtn_ActaClaustro" runat="server" 
                        onclick="LinkBtn_ActaClaustro_Click" ForeColor="#666666"></asp:LinkButton>
                    <asp:Label ID="Lbl_ActaClaustro" runat="server" ></asp:Label>
                </td>
            </tr>
             
            <tr>
                <td class="style18" style="text-align: left"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Propuesta en Pdf :</b></span></td>
                <td class="style20">
                    <asp:LinkButton ID="LinkBtn_PropuestaPdf" runat="server" 
                        onclick="LinkBtn_PropuestaPdf_Click" ForeColor="#666666"></asp:LinkButton>
                    <asp:Label ID="Lbl_PropuestaPdf" runat="server" ></asp:Label>
                </td>
                 <td class="style19" style="text-align: left"><span><b>Acta Consejo de Escuela :</b></span></td>
                <td class="style14">
                    <asp:LinkButton ID="LinkBtn_ConsejoEscuela" runat="server" 
                        onclick="LinkBtn_ConsejoEscuela_Click" ForeColor="#666666"></asp:LinkButton>
                    <asp:Label ID="Lbl_ActaEscuela" runat="server"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td class="style18" style="text-align: left"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Carta de Presentación :</b></span></td>
                <td class="style20">                    
                    <asp:LinkButton ID="LinkBtn_CartaPresentacion" runat="server" 
                        onclick="LinkBtn_CartaPresentacion_Click" ForeColor="#666666" ></asp:LinkButton>
                    <asp:Label ID="Lbl_CartaPresentacion" runat="server" ></asp:Label>
                </td>
               
                <td class="style19" style="text-align: left"><span><b>Acta Consejo de Facultad :</b></span></td>
                <td class="style12">
                    <asp:LinkButton ID="LinkBtn_ConsejoFacultad" runat="server" 
                        onclick="LinkBtn_ConsejoFacultad_Click" ForeColor="#666666"></asp:LinkButton>
                    <asp:Label ID="Lbl_ActaFacultad" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style18" style="text-align: left"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Memoria Técnica :</b></span></td>
                <td class="style20">
                    <asp:LinkButton ID="LinkButton_MemoTecnica" runat="server" ForeColor="#666666" 
                        onclick="LinkButton_MemoTecnica_Click"></asp:LinkButton>
                    <asp:Label ID="Lbl_MemoTecnica" runat="server" ></asp:Label>
                </td>
                 <td class="style19" style="text-align: left"><span><b>Presupuesto Interno :</b></span></td>
                <td class="style14">
                    <asp:LinkButton ID="LinkButton_Presupuesto" runat="server" ForeColor="#666666" 
                        onclick="LinkButton_Presupuesto_Click"></asp:LinkButton>
                    <asp:Label ID="Lbl_Presupuesto" runat="server"></asp:Label>
                </td>
            </tr>
            
           
               
        </table>

        </fieldset><br />

        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
             
    </div>
</asp:Content>

