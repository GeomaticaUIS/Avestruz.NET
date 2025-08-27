<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="VerCompromisosAcademicos.aspx.cs" Inherits="Modulo_Ver_VerCompromisosAcademicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <script type="text/javascript" defer="defer" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    
    <asp:Panel ID="Panel3" runat="server">
    <fieldset><br /><br />
    <h1>Compromisos Academicos del Proyecto</h1><br /><br /><br /><br /><br /><br /><br />
          
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
               <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                        <asp:Label ID="Id_Tipo_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Id_Tipo_Compromiso") %>' Visible="False" />
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="CantidadLabel" runat="server" Text='<%# Eval("Cantidad") %>' />
                    </td>
                    <td>
                        <asp:Button ID="VerProducto" runat="server" Text="Detalles" onclick="VerGrupos_Click" class="boton opcion"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <div class="alert alert-danger">
                    <strong>No se ha devuelto ningun dato.</strong>
                </div>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                
                  <tr style="background-color: #FFFFFF;color: #284775;" class="contenedor">
                        <asp:Label ID="Id_Tipo_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Id_Tipo_Compromiso") %>' Visible="False"/>
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td style="text-align: center">
                        <asp:Label ID="CantidadLabel" runat="server" Text='<%# Eval("Cantidad") %>' />
                    </td>
                    <td><asp:Button ID="VerProducto" runat="server" Text="Detalles" onclick="VerGrupos_Click" class="boton opcion"/></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                        <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    Tipo de Compromiso Academico
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cantidad&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
            SelectCommand="SELECT Informe_CompromisosAcademicos.Id_Tipo_Compromiso, Tipo_Compromiso_Academico.Tipo_Compromiso_Academico, Informe_CompromisosAcademicos.Cantidad FROM Informe_CompromisosAcademicos INNER JOIN Tipo_Compromiso_Academico ON Informe_CompromisosAcademicos.Id_Tipo_Compromiso = Tipo_Compromiso_Academico.Id_Tipo_Compromiso WHERE (Informe_CompromisosAcademicos.Id_Proyecto = @ID)">
            <SelectParameters>
                <asp:SessionParameter Name="ID" SessionField="ID" />
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
                       
        
        <br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Button1" runat="server" Text="Terminar" onclick="Btn_Terminar2_Click" class="boton buscar"/>
        <br />
    </fieldset>
    </asp:Panel>



    <asp:Panel ID="Panel4" runat="server" Visible="False">
        <fieldset>
            <br />
            <br />
            <h1>COMPROMISOS ACADEMICOS DEL PROYECTO</h1>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2"
                DataKeyNames="Id_Compromiso_Academico">
                <AlternatingItemTemplate>

                    <tr style="background-color: #E0FFFF; color: #333333;" class="contenedor">
                        <td>
                            <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server"
                                Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Detalles_CompromisoLabel" runat="server"
                                Text='<%# Eval("Detalles_Compromiso") %>' />
                        </td>
                        <td>
                            <asp:Button ID="VerProducto" runat="server" Text="Detalles" OnClick="VerCompromiso_Click" class="boton opcion" />
                        </td>
                        <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server"
                            Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />

                    </tr>
                </AlternatingItemTemplate>

                <EmptyDataTemplate>
                    <div class="alert alert-danger">
                        <strong>No se ha devuelto ningun dato.</strong>
                    </div>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <tr style="background-color: #FFFFFF; color: #284775;" class="contenedor">
                        <td>
                            <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server"
                                Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                        </td>
                        <td>
                            <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                        </td>
                        <td>
                            <asp:Label ID="Detalles_CompromisoLabel" runat="server"
                                Text='<%# Eval("Detalles_Compromiso") %>' />
                        </td>
                        <td>
                            <asp:Button ID="VerProducto" runat="server" Text="Detalles" OnClick="VerCompromiso_Click" class="boton opcion" />
                        </td>
                        <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server"
                            Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                        <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                            <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    Tipo de Compromiso Academico
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detalles&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                        </tr>
                        <tr id="itemPlaceholder" runat="server">
                        </tr>
                    </table>

                </LayoutTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                SelectCommand="SELECT Tipo_Compromiso_Academico.Tipo_Compromiso_Academico, Compromisos_Academicos.Nombre, Compromisos_Academicos.Detalles_Compromiso, Compromisos_Academicos.Id_Compromiso_Academico FROM Compromisos_Academicos INNER JOIN Tipo_Compromiso_Academico ON Compromisos_Academicos.Tipo_Compromiso = Tipo_Compromiso_Academico.Id_Tipo_Compromiso WHERE (Compromisos_Academicos.Id_Proyecto = @ID) AND (Compromisos_Academicos.Tipo_Compromiso = @idTipo)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="ID" SessionField="ID" />
                    <asp:SessionParameter Name="idTipo" SessionField="id_tipo" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div style="width: 100%;">
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView2">
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
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Btn_Volver" runat="server" Text="Volver" OnClick="Btn_Volver_Click" class="boton buscar" />
            <br />
        </fieldset>
    </asp:Panel>
    </div>
    
</asp:Content>

