<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="ModificarActa.aspx.cs" Inherits="zModificar_ModificarActa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
   <style type="text/css">
       
        .style1
        {
            width: 127px;
        }
               
        .style3
        {
            width: 140px;
        }
       
        .style4
        {
            width: 245px;
        }
       
        .style5
        {
            width: 74px;
        }
       
       .auto-style1
       {
           width: 74px;
           height: 51px;
       }
       .auto-style2
       {
           width: 127px;
           height: 51px;
       }
       .auto-style3
       {
           width: 245px;
           height: 51px;
       }
       .auto-style4
       {
           width: 140px;
           height: 51px;
       }
       .auto-style5
       {
           height: 51px;
       }
       .page{
           margin: 50px auto 0px auto;
       }
       td{
           padding:4px;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div align="center">
        <fieldset>
            <br />
            <h1 style="text-align: center">Modificar Acta</h1>
            <br />
            <br />
            <br />
            <asp:Label ID="Lbl_Estado" runat="server"></asp:Label><br />
            <table style="width: 900px">

                <tr>
                    <td class="style5"></td>
                    <td style="text-align: right"><span>Tipo de documento :</span></td>
                    <td style="text-align: left" class="style4">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="226px"
                            DataSourceID="SqlDataSource2" DataTextField="Tipo_Acta"
                            DataValueField="Id_Tipo_Acta" ValidationGroup="Validar_Acta"
                            AutoPostBack="True"
                            Enabled="False">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                            SelectCommand="SELECT [Id_Tipo_Acta], [Tipo_Acta] FROM [Tipo_Acta]"></asp:SqlDataSource>

                    </td>
                    <td style="text-align: right" class="style3"><span>Fecha de Suscripción:</span></td>
                    <td style="text-align: left">
                        <asp:TextBox ID="Txt_fechaActa" runat="server" class="floatl__input" Height="21px" Width="128px" placeholder="(día/mes/año)" ValidationGroup="Validar_Acta" Enabled="False"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaActa" Format="dd/MM/yyyy"></asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="Txt_fechaActa" ErrorMessage="RequiredFieldValidator"
                            ValidationGroup="Validar_Acta" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ControlToValidate="Txt_fechaActa" ErrorMessage="Ingrese una fecha valida"
                            ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Acta"><b>*</b></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="style5"></td>
                    <td style="text-align: right"><span>Descripción :</span></td>
                    <td colspan="3" style="text-align: left">
                        <asp:TextBox ID="Txt_descripcion" runat="server" Height="89px" Width="521px" class="floatl__input" TextMode="MultiLine" ValidationGroup="Validar_Acta" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txt_descripcion" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Acta" ForeColor="Red"><b>*</b>Campo obligatorio</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td style="text-align: right" class="auto-style2">
                        <span>Archivo Pdf :</span></td>
                    <td style="text-align: left" class="auto-style3">
                        <asp:FileUpload ID="Subir_ActaPdf" runat="server" Height="30px" Width="222px"
                            Enabled="False" />
                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                    </td>
                    <td class="auto-style4" style="text-align: right">
                        <asp:Label ID="Label1" runat="server" Text="Fecha de Actividad :"></asp:Label></td>
                    <td style="text-align: left" class="auto-style5">
                        <asp:TextBox ID="tbx_FechaActividad" runat="server" Height="21px" Width="128px" class="floatl__input" placeholder="(día/mes/año)" ValidationGroup="Validar_Acta" Enabled="False"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="tbx_FechaActividad" Format="dd/MM/yyyy"></asp:CalendarExtender>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                            ControlToValidate="tbx_FechaActividad" ErrorMessage="Ingrese una fecha valida"
                            ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Acta"><b>*</b></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: right;">
                        <asp:Label ID="lbl_valorEjecutado" runat="server" Text="valor ejecutado:" Visible="false"></asp:Label></td>
                    <td style="text-align: left;">
                        <asp:TextBox ID="tbx_valorEjecutado" class="floatl__input" runat="server" Visible="false" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*Campo obligatorio" ValidationGroup="Validar_Acta" ControlToValidate="tbx_valorEjecutado"></asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                    <td></td>
                </tr>

            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Btn_Enviar_Form_Usuario" runat="server" Text="Modificar" class="boton buscar" OnClick="Btn_Enviar_Form_Usuario_Click" />
            <asp:Button ID="Btn_Actualizar" runat="server" Text="Actualizar" class="boton buscar" ValidationGroup="Validar_Acta" OnClick="Btn_Actualizar_Click" Enabled="False" />
            <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" class="boton buscar" OnClick="Btn_Terminar_Click" />
        </fieldset>
    </div>
    <script src="../Scripts/MarcadeAgua2.js" type="text/javascript"></script>
</asp:Content>

