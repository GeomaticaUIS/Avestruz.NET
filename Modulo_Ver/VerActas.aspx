<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="VerActas.aspx.cs" Inherits="VerActas" %>

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
        <fieldset><br /><br />
        <h1 style="text-align:center"> Actas </h1><br /><br /><br /><br /><br /><br /><br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="Id_Actas">
        <AlternatingItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
                <asp:Label ID="Id_ActasLabel" runat="server" Text='<%# Eval("Id_Actas") %>' Visible="False" />
                <td><asp:Label ID="Tipo_ActaLabel" runat="server" Text='<%# Eval("Tipo_Acta") %>' />&nbsp;</td>
                <td><asp:Label ID="DescripciónLabel" runat="server" Text='<%# Eval("Descripción") %>' /></td>
                <td style="text-align: center"><asp:Label ID="Fecha_ActaLabel" runat="server" Text='<%# Eval("Fecha_Acta") %>' /></td>
                <td><asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#006699" Text='<%# Eval("Archivo_Pdf") %>' onclick="LinkButton1_Click1"></asp:LinkButton>&nbsp;</td>
            </tr>
        </AlternatingItemTemplate>
            
        <EmptyDataTemplate>
            <div class="alert alert-danger">
                <strong>No se ha devuelto ningun dato.</strong>
            </div>
        </EmptyDataTemplate>
            
        <ItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <asp:Label ID="Id_ActasLabel" runat="server" Text='<%# Eval("Id_Actas") %>' Visible="False" />
                <td><asp:Label ID="Tipo_ActaLabel" runat="server" Text='<%# Eval("Tipo_Acta") %>' />&nbsp;</td>
                <td><asp:Label ID="DescripciónLabel" runat="server" Text='<%# Eval("Descripción") %>' /></td>
                <td style="text-align: center"><asp:Label ID="Fecha_ActaLabel" runat="server" Text='<%# Eval("Fecha_Acta") %>' /></td>
                <td><asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#333333" Text='<%# Eval("Archivo_Pdf") %>' onclick="LinkButton1_Click1"></asp:LinkButton>&nbsp;</td>
                </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                    <th runat="server">Tipo de documento</th>
                    <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descripción&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                    <th runat="server">Fecha (día/mes/año)</th>
                    <th runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Archivo en Pdf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                </tr>
                <tr id="itemPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>
        </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                SelectCommand="SELECT Actas.Id_Actas, Tipo_Acta.Tipo_Acta, Actas.Descripción, Actas.Fecha_Acta, Actas.Archivo_Pdf FROM Actas INNER JOIN Tipo_Acta ON Actas.Tipo_Acta = Tipo_Acta.Id_Tipo_Acta WHERE (Actas.Nombre_Contrato_Convenio = @ID_Contrato)">
                <SelectParameters>
                    <asp:SessionParameter Name="ID_Contrato"
                        SessionField="ID_Contrato" />
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
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
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
</asp:Content>

