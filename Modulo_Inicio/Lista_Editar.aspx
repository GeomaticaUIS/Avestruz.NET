<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Lista_Editar.aspx.cs" Inherits="Modulo_Inicio_Lista_Editar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table width="100%" >
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td align="right">
                    <asp:TextBox ID="Txt_Buscar" class="floatl__input" runat="server" Height="5px" ></asp:TextBox>
                    &nbsp;<asp:Button ID="Btn_Buscar" runat="server" width="10%" Text="Buscar" onclick="Btn_Mostrar_Click" class="boton buscar"/>
                </td>
            </tr>
        </table><br /><br />
        <h1 style="text-align:center">PROYECTOS DE INVESTIGACIÓN</h1><br /><br /><br />
        <div align="center">
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto" 
            DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                    <td style="text-align: center"><asp:Label ID="Id_ProyectoLabel" runat="server" Text='<%# Eval("Id_Proyecto") %>' /></td>
                    <td style="text-align: justify"><asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' /></td>
                    
                    <td style="text-align: center"><asp:Label ID="Registro_VIELabel" runat="server" Text='<%# Eval("Registro_VIE") %>' /></td>
                    
                    <td>                                  
                        <asp:Button ID="EditarProyecto" runat="server" Text="Editar" onclick="EditarProyecto_Click" class="boton opcion"/>    
                    </td>

                </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <table id="Table1" runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No se han devuelto datos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;" class="contenedor">
                    <td style="text-align: center"><asp:Label ID="Id_ProyectoLabel" runat="server" Text='<%# Eval("Id_Proyecto") %>' /></td>
                    <td style="text-align: justify"><asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' /></td>
                    
                    <td style="text-align: center"><asp:Label ID="Registro_VIELabel" runat="server" Text='<%# Eval("Registro_VIE") %>' /></td>
                    
                    <td>
                         <asp:Button ID="EditarProyecto" runat="server" Text="Editar" onclick="EditarProyecto_Click" class="boton opcion"/>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                        <th runat="server">ID</th>
                        <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th runat="server">Registro VIE</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
            SelectCommand="SELECT [Id_Proyecto], [Nombre], [Valor], [Fecha_Propuesta], [Registro_VIE] FROM [Proyectos]">
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
        
    </div>
</asp:Content>

