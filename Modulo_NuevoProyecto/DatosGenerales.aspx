<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_NuevoProyecto.master" AutoEventWireup="true" CodeFile="DatosGenerales.aspx.cs" Inherits="zNuevo_DatosGenerales" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 116px;
        }
        .style14
        {
            width: 132px;
        }
        .style15
        {
            width: 80px;
        }
        .style16
        {
            width: 55px;
        }
        .style17
        {
            width: 90px;
        }
        .style18
        {
            width: 90px;
        }
        td{
            padding:4px;
        }
        .hasPlaceholder 
        {
             color: #777;  
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        // This adds 'placeholder' to the items listed in the jQuery .support object. 
        jQuery(function () {
            jQuery.support.placeholder = false;
            test = document.createElement('input');
            if ('placeholder' in test) jQuery.support.placeholder = true;
        });
        // This adds placeholder support to browsers that wouldn't otherwise support it. 
        $(function () {
            if (!$.support.placeholder) {
                var active = document.activeElement;
                $(':text').focus(function () {
                    if ($(this).attr('placeholder') != '' && $(this).val() == $(this).attr('placeholder')) {
                        $(this).val('').removeClass('hasPlaceholder');
                    }
                }).blur(function () {
                    if ($(this).attr('placeholder') != '' && ($(this).val() == '' || $(this).val() == $(this).attr('placeholder'))) {
                        $(this).val($(this).attr('placeholder')).addClass('hasPlaceholder');
                    }
                });
                $(':text').blur();
                $(active).focus();
                $('form:eq(0)').submit(function () {
                    $(':text.hasPlaceholder').val('');
                });
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <fieldset><br />
        <h1>INFORMACION GENERAL DEL PROYECTO</h1><br /><br /><br /><br /><br /><br />
        <table style="width: 920px">
            <tr><td class="style18"></td>
                <td style="text-align: left" class="style17"><span><b>Nombre :</b></span></td>
                <td colspan="5" style="text-align: left">
                    <asp:TextBox ID="Txt_Nombre" class="floatl__input" runat="server" Height="30px" Width="575px" ForeColor="#333333" ValidationGroup="Validar_InfoGeneral" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Nombre" 
                        ValidationGroup="Validar_InfoGeneral" ForeColor="#CC0000"><b>*</b></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td class="style18"></td>
                <td style="text-align: left" class="style17" ><span><b>FEX.04 VIE :</b></span></td>
                <td style="text-align: left" class="style15"><asp:TextBox ID="Txt_RegistroVie" runat="server" class="floatl__input" Height="30px" Width="50px"  MaxLength="10"></asp:TextBox>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="Txt_RegistroVie" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="Validar_InfoGeneral" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txt_RegistroVie" ErrorMessage="Numeros y guiones" ValidationExpression="([0-9]|-)*"  ValidationGroup="Validar_InfoGeneral"><b>*</b></asp:RegularExpressionValidator>
                </td>
                <td style="text-align: left" class="style13"><span><b>Fecha FEX.04 VIE :</b></span>
                </td>
                <td style="text-align: left" class="style14">
                     <asp:TextBox ID="Txt_fechaVie" runat="server" placeholder=" d/M/aaaa " class="floatl__input" Height="30px" Width="100px"></asp:TextBox>
                     <asp:CalendarExtender ID="CalendarExtender2" CssClass="calendario" runat="server" TargetControlID="Txt_fechaVie" Format="dd/MM/yyyy"></asp:CalendarExtender>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                         ControlToValidate="Txt_fechaVie" ErrorMessage="RequiredFieldValidator" 
                         ValidationGroup="Validar_InfoGeneral" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Txt_fechaVie" ErrorMessage="Fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_InfoGeneral"><b>*</b></asp:RegularExpressionValidator>
                </td>
                <td style="text-align: left" class="style16"><span><b>Valor :</b></span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_Valor" class="floatl__input" runat="server" Height="30px" Width="194px" ValidationGroup="Validar_InfoGeneral" MaxLength="15"></asp:TextBox>
                   
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Txt_Valor" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="Validar_InfoGeneral" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_Valor"  ErrorMessage="" ValidationExpression="[0-9]+"  ValidationGroup="Validar_InfoGeneral"><b>*</b></asp:RegularExpressionValidator>
                </td>
                
            </tr>
            
            
        </table><br /><br /><br />
        <asp:Label ID="Label1" CssClass="badge" runat="server" Text=""></asp:Label><br /><br /><br /><br />
        <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" onclick="Btn_Agregar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" Visible="False" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
        </fieldset>
    </div>
   
</asp:Content>

