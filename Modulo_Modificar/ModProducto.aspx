<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModProducto.aspx.cs" Inherits="zModificar_ModProducto" %>

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
            width: 140px;
        }
        .style3
        {
            width: 100px;
        }
          
        .style4
        {
            width: 81px;
        }
          
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    <fieldset><br /><br />
    <h1 style="text-align:center"> Productos </h1><br /><br />
    <br /><br /><br /><br /><br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Productos" 
            DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;" class="contenedor">
                        <asp:Label ID="Id_ProductosLabel" runat="server" 
                            Text='<%# Eval("Id_Productos") %>' Visible="False" />
                    <td><asp:Label ID="Nombre_ProductoLabel" runat="server" Text='<%# Eval("Nombre_Producto") %>' /></td>
                    <td><asp:Label ID="Descripción_ProductoLabel" runat="server" Text='<%# Eval("Descripción_Producto") %>' /></td>
                    <td><asp:Label ID="Tipo_ProductoLabel" runat="server" Text='<%# Eval("Tipo_Producto") %>' /></td>
                    <td><asp:Label ID="ArchivoLabel" runat="server" Text='<%# Eval("Archivo") %>' /></td>
                    <td><asp:Button ID="EditarProducto" runat="server" onclick="Btn_Editar_Click" Text="Editar" class="boton opcion"/></td>
                </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <div class="alert alert-danger">
                <strong>No se ha devuelto ningun dato.</strong>
            </div>
            </EmptyDataTemplate>

            <ItemTemplate>
                 <tr style="background-color: #FFFFFF; color: #284775;" class="contenedor">
                        <asp:Label ID="Id_ProductosLabel" runat="server" Text='<%# Eval("Id_Productos") %>' Visible="False" />
                    <td><asp:Label ID="Nombre_ProductoLabel" runat="server" Text='<%# Eval("Nombre_Producto") %>' /></td>
                    <td><asp:Label ID="Descripción_ProductoLabel" runat="server" Text='<%# Eval("Descripción_Producto") %>' /></td>
                    <td><asp:Label ID="Tipo_ProductoLabel" runat="server" Text='<%# Eval("Tipo_Producto") %>' /></td>
                    <td><asp:Label ID="ArchivoLabel" runat="server" Text='<%# Eval("Archivo") %>' /></td>
                    <td><asp:Button ID="EditarProducto" runat="server" onclick="Btn_Editar_Click" Text="Editar" class="boton opcion"/></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                        <th runat="server">&nbsp;Nombre del Producto&nbsp;</th>
                        <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descripción&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th runat="server">&nbsp;Tipo de Producto&nbsp;</th>
                        <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ubicación&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td><asp:Label ID="Id_ProductosLabel" runat="server" Text='<%# Eval("Id_Productos") %>' /></td>
                    <td><asp:Label ID="Tipo_ProductoLabel" runat="server" Text='<%# Eval("Tipo_Producto") %>' /></td>
                    <td><asp:Label ID="Nombre_ProductoLabel" runat="server" Text='<%# Eval("Nombre_Producto") %>' /></td>
                    <td><asp:Label ID="Descripción_ProductoLabel" runat="server" Text='<%# Eval("Descripción_Producto") %>' /></td>
                    <td><asp:Label ID="ArchivoLabel" runat="server" Text='<%# Eval("Archivo") %>' /></td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
            SelectCommand="SELECT Productos.Id_Productos, Tipo_Producto.Tipo_Producto, Productos.Nombre_Producto, Productos.Descripción_Producto, Productos.Archivo FROM Productos INNER JOIN Tipo_Producto ON Productos.Id_TipoProducto = Tipo_Producto.Id_TipoProducto WHERE (Productos.Id_Proyectos = @Id_Proyectos)">
            <SelectParameters>
                 <asp:SessionParameter Name="Id_Proyectos" SessionField="ID" Type="Int32" />
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
    
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <asp:Button ID="Btn_Añadir" runat="server" Text="Añadir Producto" onclick="Btn_Agregar2_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
    <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
        
       <br />
        </fieldset>
    </div>
</asp:Content>

