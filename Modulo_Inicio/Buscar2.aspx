<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Buscar2.aspx.cs" Inherits="Modulo_Inicio_Buscar2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />

    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table width="100%">
        <tr>
            <td class="style4">&nbsp;</td>
            <td align="right">
                <asp:TextBox ID="Txt_Buscar" runat="server" Height="30px" class="floatl__input" OnTextChanged="Txt_Buscar_TextChanged"></asp:TextBox>
                &nbsp;<asp:Button ID="Btn_Buscar" runat="server" width="10%" Text="Buscar" onclick="Btn_Mostrar_Click" class="boton buscar"/>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <div align="center">
        <br />
        <h1 style="text-align: center">PROYECTOS DE INVESTIGACIÓN</h1>
        <br />
        <asp:Label ID="txtBusqueda" runat="server" Text="Label" class="badge"></asp:Label>
        <br />
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto"
            DataSourceID="SqlDataSource1">
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
                        <asp:Label ID="Registro_VIELabel" runat="server"
                            Text='<%# Eval("Registro_VIE") %>' />
                    </td>
                    <td>
                        <asp:Button ID="VerProyecto" runat="server" Text="Ver" OnClick="VerProyecto_Click" class="boton opcion" />
                    </td>
                    <td>
                        <asp:Button ID="EditarProyecto" runat="server" Text="Editar" OnClick="EditarProyecto_Click" class="boton opcion" />
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
                    <td style="text-align: center">
                        <asp:Label ID="Id_ProyectoLabel" runat="server"
                            Text='<%# Eval("Id_Proyecto") %>' />
                    </td>
                    <td style="text-align: justify">
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="Registro_VIELabel" runat="server"
                            Text='<%# Eval("Registro_VIE") %>' />
                    </td>
                    <td>
                        <asp:Button ID="VerProyecto" runat="server" Text="Ver" OnClick="VerProyecto_Click" class="boton opcion" />
                    </td>
                    <td>
                        <asp:Button ID="EditarProyecto" runat="server" Text="Editar" OnClick="EditarProyecto_Click" class="boton opcion" />
                    </td>

                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                        <th runat="server">Id</th>
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
            SelectCommand="SELECT Proyectos.Id_Proyecto, Proyectos.Nombre, Proyectos.Registro_VIE 
                       FROM Proyectos full outer join Contrato_Convenio 
                       ON Proyectos.Id_Proyecto = Contrato_Convenio.Id_Proyecto full outer join Entidad_Contratante 
                       ON Contrato_Convenio.Entidad_Contratante = Entidad_Contratante.Id_Entidad_Contratante 
                       WHERE (Proyectos.Nombre LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI) OR (Contrato_Convenio.Nombre LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI) OR (Contrato_Convenio.Objeto LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI) OR (Entidad_Contratante.Nombre_Entidad LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI)
                       ORDER BY Proyectos.Id_Proyecto DESC">
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

