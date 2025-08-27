<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Lista.aspx.cs" Inherits="Lista" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    
    <!--
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-blue.min.css" />
    <script defer src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <script src="../js/jquery.js" type="text/javascript"></script>
    -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <style type="text/css">
        h1{
            font-size: 36px;
            font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
            margin-top: 20px;
            margin-bottom: 10px;
            font-weight: 500;
            line-height: 1.1;
            color: inherit;
            margin: .67em 0;
        }
        
    </style>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" >
            <tr>
                <td class="style4">
                    <asp:Button ID="btnExportar" class="boton" runat="server" OnClick="Exportar_Click" Text="Reporte de Contratos"></asp:Button>
                </td>
                <td align="right">
                    <asp:TextBox ID="Txt_Buscar" class="floatl__input" runat="server" Height="30px" ></asp:TextBox>
                    &nbsp;<asp:Button ID="Btn_Buscar" class="boton buscar" width="10%" runat="server" Text="Buscar" onclick="Btn_Mostrar_Click" />
                    <!--<div class="floatl">
                        
                    </div>-->
                 </td>
            </tr>
        </table><br /><br />
        <h1 style="text-align:center">PROYECTOS</h1><br /><br />
    <br />
        <div align="center">
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto" 
            DataSourceID="SqlDataSource1" >
            <EmptyDataTemplate>
                <div class="alert alert-danger">
                    <strong>No se ha devuelto ningun dato.</strong>
                </div>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;" class="contenedor">
                    <asp:Label ID="Id_ProyectoLabel" runat="server" Text='<%# Eval("Id_Proyecto") %>' Visible="False" />
                    <td><asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' /></td>
                    <td><asp:Label ID="Registro_VIELabel" runat="server" Text='<%# Eval("Registro_VIE") %>' /></td>
                    <td><asp:Button ID="VerProyecto" class="boton opcion" runat="server" Text="Ver" onclick="VerProyecto_Click" /> </td>
                    <td><asp:Button ID="EditarProyecto" runat="server" class="boton opcion" Text="Editar" OnClick="EditarProyecto_Click" /></td>
                    <asp:Label ID="Fecha_Registro_VIELabel" runat="server" Text='<%# Eval("Fecha_Registro_VIE") %>' Visible="False" />
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                       <table ID="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                             <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                 <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th runat="server">Registro VIE</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                       </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
            
                SelectCommand="SELECT [Id_Proyecto], [Nombre], [Registro_VIE], [Fecha_Registro_VIE] FROM [Proyectos] ORDER BY [Id_Proyecto] DESC">
        </asp:SqlDataSource>
            <div style="width: 100%;">
                <asp:datapager id="Paginado" runat="server" pagedcontrolid="ListView1">
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
               </asp:datapager>
            </div>


        
        
    </div>       
</asp:Content>

