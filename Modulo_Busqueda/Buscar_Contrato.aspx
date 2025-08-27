<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Buscar_Contrato.aspx.cs" Inherits="Modulo_Busqueda_Buscar_VIE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
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
    <table width="100%">
        <tr>
            <td class="style4">&nbsp;</td>
            <td align="right">
                <asp:TextBox ID="Txt_Buscar" class="floatl__input" runat="server" Height="30px" ></asp:TextBox>
                &nbsp;<asp:Button ID="Btn_Buscar" class="boton buscar" width="10%" runat="server" Text="Buscar" onclick="Btn_Mostrar_Click" />
            </td>
        </tr>
    </table><br /><br />
<div align="center">
<br />
    <h1 style="text-align:center">PROYECTOS DE INVESTIGACIÓN</h1>
    
    <br /><br /><br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID Proyecto" 
        DataSourceID="SqlDataSource1" EnableModelValidation="True">
        <AlternatingItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                <td><asp:Label ID="ID_ProyectoLabel" runat="server" Text='<%# Eval("[ID Proyecto]") %>' /></td>
                <td><asp:Label ID="Nombre_del_ContratoLabel" runat="server" Text='<%# Eval("[Nombre del Contrato]") %>' /></td>
                <td><asp:Label ID="Entidad_ContratanteLabel" runat="server" Text='<%# Eval("[Entidad Contratante]") %>' /></td>
                <td><asp:Button ID="VerProyecto" class="boton opcion" runat="server" Text="Ver" onclick="VerProyecto_Click" /> </td>
                <td><asp:Button ID="EditarProyecto" runat="server" class="boton opcion" Text="Editar" OnClick="EditarProyecto_Click" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <div class="alert alert-danger">
                <strong>No se ha devuelto ningun dato.</strong>
            </div>
        </EmptyDataTemplate>
        <ItemTemplate>
            <tr style="background-color: #FFFFFF; color: #284775;" class="contenedor">
                <td><asp:Label ID="ID_ProyectoLabel" runat="server" Text='<%# Eval("[ID Proyecto]") %>' /></td>
                <td><asp:Label ID="Nombre_del_ContratoLabel" runat="server" Text='<%# Eval("[Nombre del Contrato]") %>' /></td>
                <td><asp:Label ID="Entidad_ContratanteLabel" runat="server" Text='<%# Eval("[Entidad Contratante]") %>' /></td>
                <td><asp:Button ID="VerProyecto" class="boton opcion" runat="server" Text="Ver" onclick="VerProyecto_Click" /> </td>
                <td><asp:Button ID="EditarProyecto" runat="server" class="boton opcion" Text="Editar" OnClick="EditarProyecto_Click" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                    <th runat="server">ID Proyecto</th>
                    <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre del contrato&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th runat="server">Entidad Contratante</th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
        
        SelectCommand="SELECT Proyectos.Id_Proyecto AS [ID Proyecto], Contrato_Convenio.Nombre AS [Nombre del Contrato], Entidad_Contratante.Nombre_Entidad AS [Entidad Contratante] 
                       FROM Proyectos INNER JOIN Contrato_Convenio ON Proyectos.Id_Proyecto = Contrato_Convenio.Id_Proyecto INNER JOIN Entidad_Contratante ON Contrato_Convenio.Entidad_Contratante = Entidad_Contratante.Id_Entidad_Contratante 
                       WHERE (Contrato_Convenio.Nombre LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI) 
                       ORDER BY [ID Proyecto] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="Nombre" SessionField="Palabra_Buscar" 
                Type="String" />
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