<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="ContratoVacio.aspx.cs" Inherits="Otros_ContratoVacio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <fieldset><br /><br />
        <h1 style="text-align:center"> Contrato </h1><br /><br /><br /><br /><br />
            <br /><br />
        <span>No se ha registrado el contrato de este proyecto</span>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
        </fieldset>
    </div>
</asp:Content>

