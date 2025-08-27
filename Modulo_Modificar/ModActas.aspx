<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModActas.aspx.cs" Inherits="zModificar_ModActas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
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
       .dropdownlist{
           border: 1px solid #e6e6e6;
           border-radius: 3px;
       }
       td{
           padding: 4px;
           padding-left: 7px;
           padding-right: 3px;
       }
       .page{
           margin: 50px auto 0px auto;
       }
       h1{
            font-size: 36px;
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            line-height: 0.35;
            color: inherit;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
 <div align="center">
 <fieldset>
 <h1 style="text-align:center"> Añadir Acta  </h1><br />
 
     <asp:Label ID="Lbl_Estado" runat="server" ></asp:Label><br />
 <table style="width: 900px" class="table-responsive">
            
            <tr><td class="style5"></td>
                <td style="text-align: right"><span>Tipo de documento :</span></td>
                <td style="text-align: left" class="style4">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="226px" class="dropdownlist"
                        DataSourceID="SqlDataSource2" DataTextField="Tipo_Acta" 
                        DataValueField="Id_Tipo_Acta" ValidationGroup="Validar_Acta" 
                        AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_Tipo_Acta], [Tipo_Acta] FROM [Tipo_Acta]"></asp:SqlDataSource>
                        
                </td>
                <td style="text-align: right" class="style3"><span>Fecha de Suscripción:</span></td>
                <td style="text-align: left">
                    <asp:TextBox ID="Txt_fechaActa" runat="server" Height="21px" Width="128px" class="floatl__input" placeholder ="(día/mes/año)" ValidationGroup="Validar_Acta"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaActa" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="Txt_fechaActa" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="Validar_Acta" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="Txt_fechaActa" ErrorMessage="Ingrese una fecha valida" 
                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Acta"><b>*</b></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr><td class="style5"></td>
                <td style="text-align: right"><span>Descripción :</span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_descripcion" runat="server" Height="89px" Width="521px" class="floatl__input" TextMode="MultiLine" ValidationGroup="Validar_Acta" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Txt_descripcion" ErrorMessage="RequiredFieldValidator" ValidationGroup="Validar_Acta" ForeColor="Red"><b>*</b>Campo obligatorio</asp:RequiredFieldValidator>   
                </td>
            </tr>
            <tr><td class="style5"></td>
                <td style="text-align: right" class="style1">
                 <span>Archivo Pdf :</span></td>
                <td style="text-align: left" class="style4">
                    <asp:FileUpload ID="Subir_ActaPdf" runat="server" Height="30px" Width="222px" />
                    
                </td>
                <td class="style3" style="text-align: right">
                    <asp:Label ID="Label1" runat="server" Text="Fecha de Actividad :"></asp:Label></td>
                <td style="text-align: left"><asp:TextBox ID="tbx_FechaActividad" runat="server" Height="21px" Width="128px" class="floatl__input" placeholder ="(día/mes/año)" ValidationGroup="Validar_Acta"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="tbx_FechaActividad" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="tbx_FechaActividad" ErrorMessage="Ingrese una fecha valida" 
                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Acta"><b>*</b></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
            <td class="style5"></td>
            <td style="text-align: right"><asp:Label ID="Label2" runat="server" 
                    Text="Valor Ejecutado :" Visible="False"></asp:Label></td>
            <td colspan="3"style="text-align: left">
                <asp:TextBox ID="tbx_ValorEjecutado" runat="server" Height="21px" Width="144px" class="floatl__input" ValidationGroup="Validar_Acta" Visible="False" MaxLength="15"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbx_ValorEjecutado"
                          ErrorMessage="" ValidationExpression="[0-9]+"  ValidationGroup="Validar_Acta"><b>*</b></asp:RegularExpressionValidator>
                    </td>
            </tr>
        </table><br /><br />
        <asp:Button ID="Btn_AñadirActa" runat="server" Text="Añadir Acta" onclick="Btn_AñadirActa_Click" ValidationGroup="Validar_Acta" class="boton buscar"/>
        </fieldset>
 </div>

<div align="center">
<fieldset>
 <h1 style="text-align:center"> Modificar Acta</h1><br />
 
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Actas" 
        DataSourceID="SqlDataSource1" 
        onselectedindexchanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
           <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                <td>
                    <asp:Label ID="Id_ActasLabel" runat="server" Text='<%# Eval("Id_Actas") %>' />
                </td>
                <td>
                    <asp:Label ID="Tipo_ActaLabel" runat="server" Text='<%# Eval("Tipo_Acta") %>' />
                </td>
                <td>
                    <asp:Label ID="DescripciónLabel" runat="server" 
                        Text='<%# Eval("Descripción") %>' />
                </td>
                <td  style="text-align: center">
                    <asp:Label ID="Fecha_ActaLabel" runat="server" 
                        Text='<%# Eval("Fecha_Acta") %>' />
                </td>
                <td>
                    <asp:Label ID="Archivo_PdfLabel" runat="server" 
                        Text='<%# Eval("Archivo_Pdf") %>' />
                </td>
                <td><asp:Button ID="EditarActa" runat="server" Text="Editar" onclick="EditarActa_Click" class="boton opcion"/></td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <div class="alert alert-danger">
                <strong>No se ha devuelto ningun dato.</strong>
            </div>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;" class="contenedor">
                <td>
                    <asp:Label ID="Id_ActasLabel" runat="server" Text='<%# Eval("Id_Actas") %>' />
                </td>
                <td>
                    <asp:Label ID="Tipo_ActaLabel" runat="server" Text='<%# Eval("Tipo_Acta") %>' />
                </td>
                <td>
                    <asp:Label ID="DescripciónLabel" runat="server" 
                        Text='<%# Eval("Descripción") %>' />
                </td>
                <td  style="text-align: center">
                    <asp:Label ID="Fecha_ActaLabel" runat="server" 
                        Text='<%# Eval("Fecha_Acta") %>' />
                </td>
                <td>
                    <asp:Label ID="Archivo_PdfLabel" runat="server" 
                        Text='<%# Eval("Archivo_Pdf") %>' />
                </td>
                <td>
                    <asp:Button ID="EditarActa" runat="server" Text="Editar" onclick="EditarActa_Click" class="boton opcion"/>
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                    <th runat="server">ID</th>
                    <th runat="server">Tipo de documento</th>
                    <th runat="server">Descripción</th>
                    <th runat="server">Fecha (día/mes/año)</th>
                    <th runat="server">Archivo en Pdf</th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="Id_ActasLabel" runat="server" Text='<%# Eval("Id_Actas") %>' />
                </td>
                <td>
                    <asp:Label ID="Tipo_ActaLabel" runat="server" Text='<%# Eval("Tipo_Acta") %>' />
                </td>
                <td>
                    <asp:Label ID="DescripciónLabel" runat="server" 
                        Text='<%# Eval("Descripción") %>' />
                </td>
                <td>
                    <asp:Label ID="Fecha_ActaLabel" runat="server" 
                        Text='<%# Eval("Fecha_Acta") %>' />
                </td>
                <td>
                    <asp:Label ID="Archivo_PdfLabel" runat="server" 
                        Text='<%# Eval("Archivo_Pdf") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
        
    </asp:ListView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
        
        SelectCommand="SELECT Actas.Id_Actas, Tipo_Acta.Tipo_Acta, Actas.Descripción, Actas.Fecha_Acta, Actas.Archivo_Pdf FROM Actas INNER JOIN Tipo_Acta ON Actas.Tipo_Acta = Tipo_Acta.Id_Tipo_Acta WHERE (Actas.Nombre_Contrato_Convenio = @Id_Contrato)">
        <SelectParameters>
            <asp:SessionParameter Name="Id_Contrato" SessionField="ID_Contrato" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="width: 100%;">
        <asp:DataPager ID="Paginado" runat="server" PagedControlID="ListView1">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="link"
                    FirstPageText="Primera Pág."
                    ShowFirstPageButton="true"
                    ShowNextPageButton="false"
                    ShowPreviousPageButton="true"
                    RenderDisabledButtonsAsLabels="true"
                    ButtonCssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" />
                <asp:NumericPagerField ButtonCount="10" CurrentPageLabelCssClass="label label-warning" />
                <asp:NextPreviousPagerField ButtonType="link"
                    LastPageText="Última pág."
                    ShowLastPageButton="true"
                    ShowNextPageButton="true"
                    ShowPreviousPageButton="false"
                    ButtonCssClass="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" />

            </Fields>
        </asp:DataPager>
    </div>
    </fieldset>
    </div>
    <script type="text/javascript">
        $(function () {

            $("table[id*='ListView1'] tr").each(function () {
                var $fecha = $(this).find("span[id*='Fecha_ActaLabel']");

                var fechalarga = new String($fecha.text()).split(' ');
                $fecha.html(fechalarga[0]);
            });

        });
    </script>
    <script src="../Scripts/MarcadeAgua2.js" type="text/javascript"></script>
</asp:Content>

