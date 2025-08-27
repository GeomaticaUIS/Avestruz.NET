<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModAdiciones.aspx.cs" Inherits="zModificar_ModAdiciones" %>

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
            width: 250px;
        }
        
        .style2
        {
            width: 230px;
        }
        .style3
        {
            
        }
        .page{
            margin: 48px auto 0px auto;
        }
        .dropdownlist{
            border: 1px solid #e6e6e6;
            border-radius: 3px;
        }
        uploadFile{
            display: inline-block;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div align="center">
 <fieldset>
 <h1 style="text-align:center"> Añadir  otrosí, modificatorios y adiciones   </h1><br /><br />
     <asp:Label ID="Lbl_Estado" runat="server" ></asp:Label>
 <table style="width: 900px" >
            <tr><td></td>
                <td style="text-align: right"><span>Nombre :</span></td>
                <td colspan="3" style="text-align: left"><asp:TextBox ID="Txt_NombreAdicion" runat="server" class="floatl__input" Height="21px" Width="679px" ValidationGroup="Validar_Adicion" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="Txt_NombreAdicion" ValidationGroup="Validar_Adicion" 
                        ForeColor="Red"><b>*</b> Nombre</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td></td>
                <td class="style10" style="text-align: right"><span>Tipo de documento  :</span></td>
                <td colspan="" style="text-align: left; vertical-align: middle;" class="style2">
                    <asp:DropDownList runat="server" class="dropdownlist"
                        DataSourceID="SqlDataSource2" DataTextField="Tipo_Adicion"
                        DataValueField="Id_Adicion" Height="27px" Width="196px" ID="DropDownList1"
                        AutoPostBack="True"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" SelectCommand="SELECT [Id_Adicion], [Tipo_Adicion] FROM [Tipo_Adicion]"></asp:SqlDataSource>
                </td>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Tiempo Adicion :"></asp:Label>
                    <asp:TextBox ID="Tbx_TiempoAdicional" runat="server" Height="21px" Width="48px" class="floatl__input" placeholder ="días" ValidationGroup="Validar_Adicion" MaxLength="2"></asp:TextBox>
                     
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Tbx_TiempoAdicional"  ErrorMessage="" ValidationExpression="[0-9]+"  ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>  
                    <asp:RangeValidator ID="RangeValidator1" runat="server" 
                        ErrorMessage="RangeValidator" MaximumValue="29" MinimumValue="1" 
                        ControlToValidate="Tbx_TiempoAdicional"><b>*</b></asp:RangeValidator>
                    <asp:TextBox ID="Tbx_TiempoAdicional2" runat="server" Height="21px" Width="64px" class="floatl__input" placeholder ="meses" ValidationGroup="Validar_Adicion" MaxLength="2"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Tbx_TiempoAdicional2" ErrorMessage="" ValidationExpression="[0-9]+" ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>
                    <span>Fecha :</span>
                    <asp:TextBox ID="Txt_fechaAdicion" runat="server" Height="21px" Width="116px" placeholder ="(día/mes/año)" class="floatl__input" ValidationGroup="Validar_Adicion"></asp:TextBox>
                     <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaAdicion" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="Txt_fechaAdicion" ErrorMessage="RequiredFieldValidator" 
                        ValidationGroup="Validar_Adicion" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>   
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="Txt_fechaAdicion" ErrorMessage="Ingrese una fecha valida" 
                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>
                </td>
                <td style="text-align: left" class="style3">&nbsp;&nbsp;
                </td>
            </tr>
            
            <tr><td></td>
                <td class="style10" style="text-align: right">
                    <span>Descripción :</span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_Descripcion" runat="server" Height="60px" Width="679px" class="floatl__input" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
     <tr>
         <td></td>
         <td class="style9" style="text-align: right">
             <span>Archivo Pdf :</span></td>
         <td colspan="2" style="text-align: left" class="style1">
             <asp:FileUpload ID="Subir_AdicionPdf" class="uploadFile" runat="server" Height="30px" Width="453px" />
             
         </td>
         <td>
             <asp:Label ID="Label2" runat="server" Text="Valor Adicional :"></asp:Label>
             <asp:TextBox ID="Tbx_ValorAdicional" runat="server" Height="21px" Width="119px" class="floatl__input" ValidationGroup="Validar_Adicion"></asp:TextBox>
             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Tbx_ValorAdicional" ErrorMessage="" ValidationExpression="[0-9]+" ValidationGroup="Validar_Adicion"><b>*</b></asp:RegularExpressionValidator>
         </td>

     </tr>
     
            <tr><td></td>
            
                      <td style="text-align:right " class="style10">
                    
                    </td>
                    
                <td class="style1">
                  </td>
            </tr>
        </table><br /><br />
        <asp:Button ID="Btn_Enviar_Form_Usuario" runat="server" Text="Añadir Adición" onclick="Btn_AñadirAdicion_Click" ValidationGroup="Validar_Adicion" class="boton buscar"/>
        </fieldset>
 
 <fieldset>
 <h1 style="text-align:center"> Modificar otrosí, modificatorios y adiciones </h1><br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Otrosí" 
         DataSourceID="SqlDataSource1" 
         onselectedindexchanged="ListView1_SelectedIndexChanged">
        <AlternatingItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                <td>
                    <asp:Label ID="Id_OtrosíLabel" runat="server" Text='<%# Eval("Id_Otrosí") %>' />
                </td>
                <td>
                    <asp:Label ID="Tipo_AdicionLabel" runat="server" 
                        Text='<%# Eval("Tipo_Adicion") %>' />
                </td>
                <td>
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                </td>
                <td>
                    <asp:Label ID="DescripciónLabel" runat="server" 
                        Text='<%# Eval("Descripción") %>' />
                </td>
                <td style="text-align: center">
                    <asp:Label ID="Fecha_Otrosi_AdiciónLabel" runat="server" 
                        Text='<%# Eval("Fecha_Otrosi_Adición") %>' />
                </td>
                <td>
                    <asp:Label ID="Archivo_PdfLabel" runat="server" 
                        Text='<%# Eval("Archivo_Pdf") %>' />
                </td>
                <td> <asp:Button ID="EditarAdicion" runat="server" Text="Editar" onclick="EditarAdicion_Click" class="boton opcion"/></td>
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
                    <asp:Label ID="Id_OtrosíLabel" runat="server" Text='<%# Eval("Id_Otrosí") %>' />
                </td>
                <td>
                    <asp:Label ID="Tipo_AdicionLabel" runat="server" 
                        Text='<%# Eval("Tipo_Adicion") %>' />
                </td>
                <td>
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                </td>
                <td>
                    <asp:Label ID="DescripciónLabel" runat="server" 
                        Text='<%# Eval("Descripción") %>' />
                </td>
                <td  style="text-align: center">
                    <asp:Label ID="Fecha_Otrosi_AdiciónLabel" runat="server" 
                        Text='<%# Eval("Fecha_Otrosi_Adición") %>' />
                </td>
                <td>
                    <asp:Label ID="Archivo_PdfLabel" runat="server" 
                        Text='<%# Eval("Archivo_Pdf") %>' />
                </td>
                <td> <asp:Button ID="EditarAdicion" runat="server" Text="Editar" onclick="EditarAdicion_Click" class="boton opcion"/></td>
                    
                </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                    <th runat="server">ID</th>
                    <th runat="server">Tipo de Adicion</th>
                    <th runat="server">Nombre</th>
                    <th runat="server">Descripción</th>
                    <th runat="server">Fecha (día/mes/año)</th>
                    <th runat="server">Archivo en Pdf</th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
         ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
         
         SelectCommand="SELECT Otrosí_Adiciones.Id_Otrosí, Tipo_Adicion.Tipo_Adicion, Otrosí_Adiciones.Nombre, Otrosí_Adiciones.Descripción, Otrosí_Adiciones.Fecha_Otrosi_Adición, Otrosí_Adiciones.Archivo_Pdf FROM Otrosí_Adiciones INNER JOIN Tipo_Adicion ON Otrosí_Adiciones.Tipo_Otrosi_Adición = Tipo_Adicion.Id_Adicion WHERE (Otrosí_Adiciones.Convenio_Contrato = @ID_Contrato)">
         <SelectParameters>
             <asp:SessionParameter Name="ID_Contrato" SessionField="ID_Contrato" />
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
                var $fecha = $(this).find("span[id*='Fecha_Otrosi_AdiciónLabel']");

                var fechalarga = new String($fecha.text()).split(' ');
                $fecha.html(fechalarga[0]);
            });

        });
    </script>
    <script src="../Scripts/MarcadeAgua2.js" type="text/javascript"></script>
</asp:Content>

