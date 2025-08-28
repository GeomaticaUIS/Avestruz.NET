<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Otros.aspx.cs" Inherits="Otros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
  
    <link href="../Styles/Lista.css" rel="stylesheet" />
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align= "center">

<fieldset>
    <h1> Agregar Colaborador</h1><br />
    <table style="width: 370px">
    <tr>
        <td class="style2"><span>Nombre :</span></td>
        <td class="style1">
            <asp:TextBox ID="Tbx_Nombre" CssClass="floatl__input" runat="server" Height="30px" Width="200px" 
                MaxLength="100" ValidationGroup="Validar_Colaborador"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="Falta Nombre" ControlToValidate="Tbx_Nombre" 
                ValidationGroup="Validar_Colaborador" ForeColor="#CC0000"><b>*</b></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2"><span>N° Cedula :</span></td>
        <td class="style1">
            <asp:TextBox ID="Tbx_Profesion" CssClass="floatl__input" runat="server" Height="30px" Width="200px" 
                MaxLength="11" ValidationGroup="Validar_Colaborador"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="RequiredFieldValidator" ControlToValidate="Tbx_Profesion" 
                ValidationGroup="Validar_Colaborador" ForeColor="#CC0000"><b>*</b></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                runat="server" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="[0-9]+" ForeColor="#CC0000" 
                ControlToValidate="Tbx_Profesion" ValidationGroup="Validar_Colaborador"><b>*</b></asp:RegularExpressionValidator>
        </td>
        
    </tr>
    
    </table><br />
    <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" onclick="Btn_Agregar_Click" ValidationGroup="Validar_Colaborador" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
</fieldset>

<fieldset>
    <h1>Agregar Entidad</h1><br />
    <table style="width: 370px">
    <tr>
        <td class="style1"><span>Nombre :</span></td>
        <td class="style1">
            <asp:TextBox ID="Tbx_NombreEnt" CssClass="floatl__input" runat="server" Height="30px" Width="200px" 
                MaxLength="150" ValidationGroup="Validar_Entidad"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Entidad" 
                ControlToValidate="Tbx_NombreEnt"><b>*</b></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>Nit :</span></td>
        <td class="style1">
            <asp:TextBox ID="Tbx_Nit" CssClass="floatl__input" runat="server" Height="30px" Width="200px" 
                MaxLength="30" ValidationGroup="Validar_Entidad"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="Tbx_Nit"  ErrorMessage="" ValidationExpression="[0-9]+"  
                ValidationGroup="Validar_Entidad"><b>*</b></asp:RegularExpressionValidator>
        </td>
    </tr>
    </table><br />
    <asp:Button ID="Btn_AgregarEnt" runat="server" Text="Agregar" onclick="Btn_AgregarEnt_Click" ValidationGroup="Validar_Entidad" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect"/>
</fieldset>
</div>
</asp:Content>

