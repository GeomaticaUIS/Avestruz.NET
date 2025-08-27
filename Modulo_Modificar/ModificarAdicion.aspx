<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="ModificarAdicion.aspx.cs" Inherits="zModificar_ModificarAdicion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <style type="text/css">
        
        .style1
        {
            width: 250px;
        }
        
        .style2
        {
            width: 250px;
        }
        .style3
        {
            
        }
        td{
            padding:1px;
        }
        .uploadFile{
            display: inline-block;
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
            <h1 style="text-align: center">Modificar Otrosí, Modificatorios y Adiciones</h1>
            <br />
            <br />
            <br />
            <asp:Label ID="Lbl_Estado" runat="server"></asp:Label><br />
            <table style="width: 900px">
                <tr>
                    <td></td>
                    <td style="text-align: right"><span>Nombre :</span></td>
                    <td colspan="3" style="text-align: left">
                        <asp:TextBox ID="Txt_NombreAdicion" runat="server" Height="36px" Width="615px" class="floatl__input" ValidationGroup="Validar_Adicion" Enabled="False"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="Txt_NombreAdicion" ValidationGroup="Validar_Adicion"
                            ForeColor="Red"><b>*</b> Nombre</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="style10" style="text-align: right"><span>Tipo de documento  :</span></td>
                    <td colspan="" style="text-align: left; vertical-align: middle;" class="style2">
                        <asp:DropDownList runat="server"
                            DataSourceID="SqlDataSource2" DataTextField="Tipo_Adicion"
                            DataValueField="Id_Adicion" Height="27px" Width="196px" ID="DropDownList1"
                            AutoPostBack="True"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                            Enabled="False" />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" SelectCommand="SELECT [Id_Adicion], [Tipo_Adicion] FROM [Tipo_Adicion]"></asp:SqlDataSource>

                        &nbsp;&nbsp;
                    
                    </td>
                    <td colspan="2" style="text-align: left" class="style3">&nbsp;&nbsp;<span>Fecha :</span>
                        <asp:TextBox ID="Txt_fechaAdicion" runat="server" Height="21px" Width="86px" class="floatl__input" placeholder="(día/mes/año)" ValidationGroup="Validar_Adicion" Enabled="False"></asp:TextBox>
                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaAdicion" Format="dd/MM/yyyy"></asp:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="Txt_fechaAdicion" ErrorMessage="RequiredFieldValidator"
                            ValidationGroup="Validar_Adicion" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                            ControlToValidate="Txt_fechaAdicion" ErrorMessage="Ingrese una fecha valida"
                            ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>
                        <asp:Label ID="Lbl_Adicional" runat="server" Text="Tiempo Adicional :"></asp:Label>
                        <asp:TextBox ID="Tbx_TiempoAdicional" runat="server" Height="21px" Width="30px" class="floatl__input" placeholder="días" ValidationGroup="Validar_Adicion" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Tbx_TiempoAdicional" ErrorMessage="" ValidationExpression="[0-9]+" ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>
                        <asp:TextBox ID="Tbx_TiempoAdicional2" runat="server" Height="21px" Width="30px" class="floatl__input" placeholder="meses" ValidationGroup="Validar_Adicion" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Tbx_TiempoAdicional2" ErrorMessage="" ValidationExpression="[0-9]+" ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td class="style10" style="text-align: right">
                        <span>Descripción :</span></td>
                    <td colspan="3" style="text-align: left">
                        <asp:TextBox ID="Txt_Descripcion" runat="server" Height="60px" Width="615px" class="floatl__input" TextMode="MultiLine" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="style9" style="text-align: right">
                        <span>Archivo Pdf :</span></td>
                    <td colspan="3" style="text-align: left" class="style1">
                        <asp:FileUpload ID="Subir_AdicionPdf" runat="server" Height="30px" class="uploadFile" style="display:inline-block;"
                            Width="350px" Enabled="False" />

                        <asp:Label ID="Label2" runat="server" Text="Valor Adicional :"></asp:Label>
                        <asp:TextBox ID="Tbx_ValorAdicional" runat="server" Height="21px" Width="119px" class="floatl__input" ValidationGroup="Validar_Adicion" Enabled="False"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Tbx_ValorAdicional" ErrorMessage="" ValidationExpression="[0-9]+" ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>
                    </td>

                </tr>
                <tr>
                    <td></td>

                    <td style="text-align: right" class="style10"></td>

                    <td class="style1">
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>

            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Btn_Enviar_Form_Usuario" runat="server" Text="Modificar" class="boton buscar" OnClick="Btn_Enviar_Form_Usuario_Click" />
            <asp:Button ID="Btn_Actualizar" runat="server" Text="Actualizar" class="boton buscar" ValidationGroup="Validar_Adicion" OnClick="Btn_Actualizar_Click" Enabled="False" />
            <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" class="boton buscar" OnClick="Btn_Terminar_Click" />
        </fieldset>
    </div>
    <script src="../Scripts/MarcadeAgua2.js" type="text/javascript"></script>
</asp:Content>

