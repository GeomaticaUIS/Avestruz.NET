<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModCompromisosAcademicos.aspx.cs" Inherits="Modulo_Modificar_ModCompromisosAcademicos" %>

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
            width: 300px;
        }
        
        .style2
        {
            width: 50px;
        }
        .page{
            margin: 50px auto 0px auto;
        }
        .dropdownlist{
            border: 1px solid #e6e6e6;
            border-radius: 3px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center">
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <fieldset>
                <h1 style="text-align: center">Añadir Compromiso Academico  </h1>
                <br />

                <asp:Label ID="Lbl_Estado" runat="server"></asp:Label>
                <table style="width: 98%">
                    <tr>
                        <td class="style2"></td>
                        <td style="text-align: right" class="style4"><span>Nombre :</span></td>
                        <td colspan="3" style="text-align: left">
                            <asp:TextBox ID="Txt_NombreCompromiso" runat="server" Height="21px" Width="537px" class="floatl__input" ValidationGroup="Validar_Adicion"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                                ControlToValidate="Txt_NombreCompromiso" ValidationGroup="Validar_Adicion"
                                ForeColor="Red"><b>*</b>Ingrese un nombre</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2"></td>
                        <td style="text-align: right" class="style4"><span>Tipo de compromiso :</span></td>
                        <td style="text-align: left" class="style1">
                            <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="294px" class="dropdownlist" DataSourceID="SqlDataSource1" DataTextField="Tipo_Compromiso_Academico" DataValueField="Id_Tipo_Compromiso" ValidationGroup="Validar_Acta">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                                SelectCommand="SELECT [Id_Tipo_Compromiso], [Tipo_Compromiso_Academico] FROM [Tipo_Compromiso_Academico]"></asp:SqlDataSource>

                        </td>
                        <td style="text-align: right"><span>Fecha :</span></td>
                        <td style="text-align: left" class="style3">
                            <asp:TextBox ID="Txt_fechaActa" runat="server" Height="21px" Width="152px" class="floatl__input" placeholder="(día/mes/año)" ValidationGroup="Validar_Acta"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                ControlToValidate="Txt_fechaActa" ErrorMessage="Ingrese una fecha valida"
                                ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Acta"><b>*</b></asp:RegularExpressionValidator>
                        </td>
                    </tr>

                    <tr>
                        <td class="style2"></td>
                        <td class="style4" style="text-align: right"><span>Descripción :</span></td>
                        <td colspan="3" style="text-align: left">
                            <asp:TextBox ID="Txt_descripcion" runat="server" Height="89px" Width="537px" class="floatl__input" TextMode="MultiLine" ValidationGroup="Validar_Acta"></asp:TextBox>
                        </td>
                    </tr>

                </table>
                <br />
                <asp:Button ID="Btn_AñadirActa" runat="server" Text="Añadir Compromiso" Width="20%" OnClick="Btn_AñadirActa_Click" ValidationGroup="Validar_Acta" class="boton buscar" />
            </fieldset>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Visible="False">
            <fieldset>
                <h2>Agregar Autores </h2>
                <br />
                <br />
                <table style="width: 98%">
                    <tr>
                        <td></td>
                        <td style="text-align: right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Autor :</td>
                        <td>
                            <asp:TextBox ID="Tbx_Autor" runat="server" Height="22px" Width="250px" class="floatl__input"></asp:TextBox>
                        </td>
                        <td>C.C :</td>
                        <td>
                            <asp:TextBox ID="Tbx_codigo" runat="server" Height="22px" Width="131px" class="floatl__input"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" OnClick="Agregar_Click" class="boton buscar" />
                            <asp:Button ID="Btn_Terminar" runat="server" Text="Terminar" OnClick="Btn_Terminar_Click" class="boton buscar" />

                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4" style="text-align: center">
                            <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                                <AlternatingItemTemplate>
                                    <tr style="text-align: center">
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Nombre_AutorLabel" runat="server"
                                    Text='<%# Eval("Nombre_Autor") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="Codigo_AutorLabel" runat="server"
                                                Text='<%# Eval("Codigo_Autor") %>' />
                                        </td>
                                    </tr>
                                </AlternatingItemTemplate>

                                <EmptyDataTemplate>
                                    <div class="alert alert-danger">
                                        <strong>No se ha devuelto ningun dato.</strong>
                                    </div>
                                </EmptyDataTemplate>

                                <ItemTemplate>
                                    <tr style="text-align: center">
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Nombre_AutorLabel" runat="server"
                                    Text='<%# Eval("Nombre_Autor") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="Codigo_AutorLabel" runat="server"
                                                Text='<%# Eval("Codigo_Autor") %>' />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                                        <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                            <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Nombre 
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </th>
                                            <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Codigo
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </th>

                                        </tr>
                                        <tr id="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                <SelectedItemTemplate>
                                    <tr style="">
                                        <td>
                                            <asp:Label ID="Nombre_AutorLabel" runat="server"
                                                Text='<%# Eval("Nombre_Autor") %>' />
                                        </td>
                                        <td>
                                            <asp:Label ID="Codigo_AutorLabel" runat="server"
                                                Text='<%# Eval("Codigo_Autor") %>' />
                                        </td>
                                    </tr>
                                </SelectedItemTemplate>
                            </asp:ListView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                                SelectCommand="SELECT [Nombre_Autor], [Codigo_Autor] FROM [Autores_Compromisos] WHERE ([Id_Compromiso] = @Id_Compromiso)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Id_Compromiso" SessionField="Id_Compromiso"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <div style="width: 100%;">
                                <asp:DataPager ID="Paginado" runat="server" PagedControlID="ListView2">
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
                        </td>
                    </tr>
                </table>
            </fieldset>
        </asp:Panel>

    </div>

    <div align="center">
        <asp:Panel ID="Panel3" runat="server">
            <fieldset>
                <br />
                <br />
                <h1 style="text-align: center">Compromisos Academicos </h1>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:ListView ID="ListView1" runat="server"
                    DataKeyNames="Id_Compromiso_Academico" DataSourceID="SqlDataSource2">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #E0FFFF; color: #333333;" class="contenedor">

                            <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server"
                                Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />

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
                                <asp:Button ID="EditarCompromiso" runat="server" OnClick="EditarCompromiso_Click" Text="Editar" class="boton opcion" />
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

                            <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server"
                                Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />

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
                                <asp:Button ID="EditarCompromiso" runat="server" OnClick="EditarCompromiso_Click" Text="Editar" class="boton opcion" />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                            <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                                <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tipo de Compromiso&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </th>
                                <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Detalle del compromiso&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>

                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                        
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #E2DED6; font-weight: bold; color: #333333;">
                            <td>
                                <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server"
                                    Text='<%# Eval("Id_Compromiso_Academico") %>' />
                            </td>
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
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                    SelectCommand="SELECT Compromisos_Academicos.Id_Compromiso_Academico, Tipo_Compromiso_Academico.Tipo_Compromiso_Academico, Compromisos_Academicos.Nombre, Compromisos_Academicos.Detalles_Compromiso FROM Compromisos_Academicos INNER JOIN Tipo_Compromiso_Academico ON Compromisos_Academicos.Tipo_Compromiso = Tipo_Compromiso_Academico.Id_Tipo_Compromiso WHERE (Compromisos_Academicos.Id_Proyecto = @Id_Proyecto)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Id_Proyecto" SessionField="ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div style="width: 100%;">
                    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="ListView1">
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
                <asp:Button ID="Btn_AgregarCompromiso" runat="server" Text="Agregar Compromiso" Width="20%" OnClick="Btn_Agregar2_Click" class="boton buscar" />
                <asp:Button ID="Btn_Terminar2" runat="server" Text="Terminar" OnClick="Btn_Terminar2_Click" class="boton buscar" /><br />
            </fieldset>
        </asp:Panel>
    </div>

</asp:Content>

