<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_NuevoProyecto.master" AutoEventWireup="true" CodeFile="ContratoVacio2.aspx.cs" Inherits="Otros_ContratoVacio2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
        <fieldset><br /><br />
        <h1 style="text-align:center">
            <asp:Label ID="Label1" runat="server" Text=" Documentos Contratante "></asp:Label></h1><br /><br /><br /><br /><br /><br /><br />
        <span><asp:Label ID="Label2" runat="server" Text="Primero debe registrar el contrato de este proyecto"></asp:Label></span>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" BackColor="White" 
                BorderStyle="Solid" Height="31px" Width="104px" 
                        BorderColor="#CCCCCC" onclick="Btn_Continuar_Click" 
                ValidationGroup="Validar_InfoGeneral" Font-Bold="True" ForeColor="#666666" />
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" 
                BackColor="White" BorderStyle="Solid" Height="31px" 
                        Width="104px" BorderColor="#CCCCCC" onclick="Btn_Terminar_Click" 
                Font-Bold="True" ForeColor="#666666" />
        </fieldset>
    </div>
</asp:Content>

