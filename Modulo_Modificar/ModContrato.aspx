<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModContrato.aspx.cs" Inherits="zModificar_ModContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 294px;
        }
        .style8
        {
            width: 330px;
        }
        .style9
        {
            width: 190px;
        }
        .style10
        {
            width: 120px;
        }
        .style11
        {
            width: 275px;
        }
        .dropdownlist{
            border: 1px solid #e6e6e6;
            border-radius: 3px;
        }
        td{
            padding:3px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <fieldset><br />
        <h1> CONTRATO </h1><br /><br /><br /><br />
        <table style="width: 914px">
            <tr>
                <td class="style10"></td>
                <td style="text-align: left" class="style11">&nbsp;<span><b>Nombre :</b></span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_Nombre" runat="server" Height="30px" Width="593px" class="floatl__input" ForeColor="#333333" ValidationGroup="Validar_Contrato" Enabled="False" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Nombre" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
               <td class="style10"></td>
               <td style="text-align: left" class="style11">&nbsp;<span><b>Fecha de Suscripción :</b></span></td>
                <td style="text-align: left" class="style8">
                    <asp:TextBox ID="Txt_fechaPropuesta" runat="server" Height="30px" Width="150px" class="floatl__input" Enabled="False" ValidationGroup="Validar_Contrato"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaPropuesta" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Txt_fechaPropuesta" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Txt_fechaPropuesta" ErrorMessage="fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Contrato"><b>*</b></asp:RegularExpressionValidator>
                 </td>
                      
               <td style="text-align: left" class="style9">&nbsp;<span><b>Entidad Contratante :</b></span></td>
               <td style="text-align: left">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="36px" Width="152px" class="dropdownlist" DataSourceID="SqlDataSource2" DataTextField="Nombre_Entidad" DataValueField="Id_Entidad_Contratante" ValidationGroup="Validar_Contrato" Enabled="False"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString1 %>" SelectCommand="SELECT [Id_Entidad_Contratante], [Nombre_Entidad] FROM [Entidad_Contratante]"></asp:SqlDataSource>
               </td>
            </tr>
            <tr>
                <td class="style10"></td>
                <td style="text-align: left" class="style11">&nbsp;<span><b>Fecha de Inicio :</b></span></td>
               <td style="text-align: left" class="style8">
                    <asp:TextBox ID="Txt_FechaInicio" runat="server" Height="30px" Width="150px" class="floatl__input" Enabled="False" ValidationGroup="Validar_Contrato"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="Txt_FechaInicio" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Txt_FechaInicio" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_FechaInicio" ErrorMessage="fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Contrato"><b>*</b></asp:RegularExpressionValidator>
               </td>   
                
                         
                <td style="text-align: left" class="style9">&nbsp;<span><b>Tipo de Contrato:</b></span></td>
                <td style="text-align: left" class="style2">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="dropdownlist" Height="36px" Width="152px" DataSourceID="SqlDataSource1" DataTextField="Tipo_Convenio_Contrato" DataValueField="Id_Tipo_Convenio_Contrato" ValidationGroup="Validar_Contrato" Enabled="False"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString1 %>" SelectCommand="SELECT [Id_Tipo_Convenio_Contrato], [Tipo_Convenio_Contrato] FROM [Tipo_Contrato_Convenio]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style10"></td>
                <td style="text-align: left" class="style11">&nbsp;<span><b>Fecha de Finalización :</b></span></td>
                <td style="text-align: left" class="style8">
                    <asp:TextBox ID="Txt_FechaFinal" runat="server" Height="30px" Width="150px" class="floatl__input" Enabled="False" ValidationGroup="Validar_Contrato"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="Txt_FechaFinal"  Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Txt_FechaFinal" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato"  ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txt_FechaFinal" ErrorMessage="fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Contrato"><b>*</b></asp:RegularExpressionValidator>
                </td>
                 <td style="text-align: left" class="style9">&nbsp;<span><b>Estado :</b></span></td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" class="dropdownlist" DataSourceID="SqlDataSource3" DataTextField="Nombre_Estado" DataValueField="Id_Estado_Contrato" Height="36px" Width="152px" Enabled="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString1 %>" 
                        SelectCommand="SELECT [Id_Estado_Contrato], [Nombre_Estado] FROM [Estado_Contrato]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style10"></td>
                <td style="text-align: left" class="style11">&nbsp;<span><b>Objeto :</b></span></td>
                <td colspan="3" style= "text-align: left"><asp:TextBox ID="Txt_Objeto" class="floatl__input" runat="server" Height="71px" Width="593px" TextMode="MultiLine" Enabled="False"></asp:TextBox></td>
            </tr>
            <tr>
            <td class="style10"></td>
                <td style="text-align: left" class="style11">&nbsp;<span><b>Archivo Pdf :</b></span></td>
                <td colspan="3" style="text-align: left">
                    <asp:FileUpload ID="Subir_ContratoPdf" runat="server" Height="28px" 
                        Width="300px" Font-Size="Medium" Enabled="False" />
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table><br /><br /><br />
                
        <br /><asp:Label ID="Label1" runat="server" Text=""></asp:Label><br /><br />
        <asp:Button ID="Btn_Modificar" runat="server" Text="Modificar" onclick="Btn_Modificar_Click" class="boton buscar"/> 
        <asp:Button ID="Btn_Actualizar" runat="server" Text="Actualizar" onclick="Btn_Actualizar_Click" Enabled="False" ValidationGroup="Validar_Contrato" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
    </fieldset>
    </div>
</asp:Content>

