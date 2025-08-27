<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicio_sinPermisos.master" AutoEventWireup="true" CodeFile="Buscar_Proyecto_Producto.aspx.cs" Inherits="Modulo_Busqueda_Sin_Permisos_Buscar_Proyecto_Producto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td class="style4">&nbsp;</td>
            <td align="right">
                <asp:TextBox ID="Txt_Buscar" class="floatl__input" runat="server" Height="30px"></asp:TextBox>
                &nbsp;<asp:Button ID="Btn_Buscar" class="boton buscar" Width="10%" runat="server" Text="Buscar" OnClick="Btn_Mostrar_Click" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div align="center">
        <br />
        <h1 style="text-align: center">PROYECTOS DE INVESTIGACIÓN</h1>
        <br />
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto"
            DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <AlternatingItemTemplate>
                <tr style="background-color: #E0FFFF; color: #333333;" class="contenedor">
                    <td style="text-align: center">
                        <asp:Label ID="Id_ProyectoLabel" runat="server"
                            Text='<%# Eval("Id_Proyecto") %>' />
                    </td>
                    <td style="text-align: justify">
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="NombreProductoLabel" runat="server"
                            Text='<%# Eval("Nombre_Producto") %>' />
                    </td>
                    <td>
                        <asp:Button ID="VerProyecto" runat="server" Text="Ver" OnClick="VerProyecto_Click" class="boton opcion" />
                    </td>


                </tr>
            </AlternatingItemTemplate>

            <EmptyDataTemplate>
                <div class="alert alert-danger">
                    <strong>No se ha devuelto ningun dato.</strong>
                </div>
            </EmptyDataTemplate>

            <ItemTemplate>
                <tr style="background-color: #FFFFFF; color: #284775;" class="contenedor">
                    <td style="text-align: center" >
                        <asp:Label ID="Id_ProyectoLabel" runat="server"
                            Text='<%# Eval("Id_Proyecto") %>' />
                    </td>
                    <td style="text-align: justify">
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="NombreProductoLabel" runat="server"
                            Text='<%# Eval("Nombre_Producto") %>' />
                    </td>
                    <td>
                        <asp:Button ID="VerProyecto" runat="server" Text="Ver" OnClick="VerProyecto_Click" class="boton opcion" />
                    </td>

                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                        <th runat="server">&nbsp;&nbsp;ID&nbsp;&nbsp;</th>
                        <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th runat="server">Nombre del Producto</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
            SelectCommand="select Proyectos.Id_Proyecto, Proyectos.Nombre, Productos.Nombre_Producto from Proyectos inner join Productos
                        on Proyectos.Id_Proyecto = Productos.Id_Proyectos
                        where (Productos.Nombre_Producto like '%' + @Nombre + '%')">

            <SelectParameters>
                <asp:SessionParameter Name="Nombre" SessionField="Palabra_Buscar" Type="String" />
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
    </div>
</asp:Content>

