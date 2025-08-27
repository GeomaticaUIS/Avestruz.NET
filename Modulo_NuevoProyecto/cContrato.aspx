<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_NuevoProyecto.master" AutoEventWireup="true" CodeFile="cContrato.aspx.cs" Inherits="zNuevo_cContrato" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
        .style1
        {
            width: 295px;
        }
        .style2
        {
            width: 294px;
        }
        .style3
        {
            width: 293px;
        }
        .style4
        {
            width: 330px;
        }
        .style5
        {
            width: 200px;
        }
        .style6
        {
            width: 110px;
        }
        .dropdownlist{
            border: 1px solid #e6e6e6;
            border-radius: 3px;
            height: 27px;
            width: 148px;
        }
        #Txt_Objeto{
            resize: none;
        }
     </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <fieldset><br />
        <h1> CONTRATO </h1><br /><br /><br />
             
        <table style="width: 914px">
            <tr>
                <td class="style6"></td>
                <td style="text-align: left" class="style1">&nbsp;<span><b>Nombre :</b></span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_Nombre" runat="server" class="floatl__input" Height="30px" Width="593px"  ForeColor="#333333" ValidationGroup="Validar_Contrato" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Nombre" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
               <td class="style6"></td>
               <td style="text-align: left" class="style1">&nbsp;<span><b>Fecha de Suscripción :</b></span></td>
                <td style="text-align: left" class="style4">
                    <asp:TextBox ID="Txt_fechaPropuesta" class="floatl__input" runat="server" Height="30px" Width="150px"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaPropuesta" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Txt_fechaPropuesta" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="Txt_fechaPropuesta" ErrorMessage="fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Contrato"><b>*</b></asp:RegularExpressionValidator>
                 </td>
                       
               <td style="text-align: left" class="style5">&nbsp;<span><b>Entidad Contratante :</b></span></td>
               <td style="text-align: left">
                    <asp:DropDownList ID="DropDownList2" runat="server" class="dropdownlist" DataSourceID="SqlDataSource2" DataTextField="Nombre_Entidad" DataValueField="Id_Entidad_Contratante" ValidationGroup="Validar_Contrato"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" SelectCommand="SELECT [Id_Entidad_Contratante], [Nombre_Entidad] FROM [Entidad_Contratante]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
               </td>
            </tr>
            <tr>
                <td class="style6"></td>
                <td style="text-align: left" class="style1">&nbsp;<span><b>Fecha de Inicio :</b></span></td>
               <td style="text-align: left" class="style4">
                    <asp:TextBox ID="Txt_FechaInicio" class="floatl__input" runat="server" Height="30px" Width="150px"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="Txt_FechaInicio" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Txt_FechaInicio" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_FechaInicio" ErrorMessage="fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Contrato"><b>*</b></asp:RegularExpressionValidator>
               </td>  
               
                         
                <td style="text-align: left" class="style5">&nbsp;<span><b>Tipo de Contrato:</b></span></td>
                <td style="text-align: left" class="style2">
                    <asp:DropDownList ID="DropDownList1" runat="server" class="dropdownlist" DataSourceID="SqlDataSource1" DataTextField="Tipo_Convenio_Contrato" DataValueField="Id_Tipo_Convenio_Contrato" ValidationGroup="Validar_Contrato"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" SelectCommand="SELECT [Id_Tipo_Convenio_Contrato], [Tipo_Convenio_Contrato] FROM [Tipo_Contrato_Convenio]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style6"></td>
                 <td style="text-align: left" class="style3">&nbsp;<span><b>Fecha de Finalización :</b></span></td>
                <td style="text-align: left" class="style4">
                    <asp:TextBox ID="Txt_FechaFinal" runat="server" class="floatl__input" Height="30px" Width="150px"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="Txt_FechaFinal"  Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <span>(día/mes/año)</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Txt_FechaFinal" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Contrato"  ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txt_FechaFinal" ErrorMessage="fecha Invalida" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Contrato"><b>*</b></asp:RegularExpressionValidator>
                </td>
                 <td style="text-align: left" class="style5">&nbsp;<span><b>Estado :</b></span></td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" DataTextField="Nombre_Estado" DataValueField="Id_Estado_Contrato" class="dropdownlist">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_Estado_Contrato], [Nombre_Estado] FROM [Estado_Contrato]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style6"></td>
                <td style="text-align: left" class="style1">&nbsp;<span><b>Objeto :</b></span></td>
                <td colspan="3" style= "text-align: left"><asp:TextBox ID="Txt_Objeto" runat="server" class="floatl__input" Height="71px" Width="593px" TextMode="MultiLine"></asp:TextBox></td>
            </tr>
            <tr>
            <td class="style6"></td>
                <td style="text-align: left" class="style1">&nbsp;<span><b>Archivo Pdf :</b></span></td>
                <td colspan="3" style="text-align: left">
                    <asp:FileUpload ID="Subir_ContratoPdf" runat="server" Height="28px" 
                        Width="300px" Font-Size="Medium" />
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table><br /><asp:Label ID="Label1" runat="server" Text=""></asp:Label><br /><br />
        <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" onclick="Btn_Agregar_Click" ValidationGroup="Validar_Contrato" class="boton buscar"/> 
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
        </fieldset>
    </div>
</asp:Content>

