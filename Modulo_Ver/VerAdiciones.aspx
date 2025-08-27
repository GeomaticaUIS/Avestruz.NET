<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="VerAdiciones.aspx.cs" Inherits="VerAdiciones" %>

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
    <fieldset><br /><br />
    <h1 style="text-align:center">Otrosí, Modificatorios y Adiciones </h1><br /><br /><br /><br /><br /><br /><br />
    <div align="center">
    
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Otrosí" 
            DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <asp:Label ID="Id_OtrosíLabel" runat="server" Text='<%# Eval("Id_Otrosí") %>' Visible="False" />
                    <td><asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' /></td>
                    <td><asp:Label ID="Tipo_AdicionLabel" runat="server" Text='<%# Eval("Tipo_Adicion") %>' /></td>
                    <td><asp:Label ID="DescripciónLabel" runat="server" Text='<%# Eval("Descripción") %>' /></td>
                    <td style="text-align: center"><asp:Label ID="Fecha_Otrosi_AdiciónLabel" runat="server" Text='<%# Eval("Fecha_Otrosi_Adición") %>' /></td>
                    <td><asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#006699" Text='<%# Eval("Archivo_Pdf") %>' onclick="LinkButton1_Click"></asp:LinkButton>&nbsp;</td>
                </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <div class="alert alert-danger">
                    <strong>No se ha devuelto ningun dato.</strong>
                </div>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <asp:Label ID="Id_OtrosíLabel" runat="server" Text='<%# Eval("Id_Otrosí") %>' Visible="False" />
                    <td><asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' /></td>
                    <td><asp:Label ID="Tipo_AdicionLabel" runat="server" Text='<%# Eval("Tipo_Adicion") %>' Visible="True" /></td>
                    <td><asp:Label ID="DescripciónLabel" runat="server"  Text='<%# Eval("Descripción") %>' /></td>
                    <td style="text-align: center"><asp:Label ID="Fecha_Otrosi_AdiciónLabel" runat="server" Text='<%# Eval("Fecha_Otrosi_Adición") %>' /></td>
                    <td><asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#333333" Text='<%# Eval("Archivo_Pdf") %>' onclick="LinkButton1_Click"></asp:LinkButton>&nbsp;</td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="itemPlaceholderContainer" runat="server" border="1" class="table table-hover table-bordered table-responsive">
                    <tr runat="server" style="background-color: #E0FFFF; color: #333333;">
                        <th id="Th2" runat="server">Nombre</th>
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
        
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Continuar" onclick="Btn_Continuar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
    </div>
    </fieldset>

    <script type="text/javascript">
        $(function () {

            $("table[id*='ListView1'] tr").each(function () {
                var $fecha = $(this).find("span[id*='Fecha_Otrosi_AdiciónLabel']");

                var fechalarga = new String($fecha.text()).split(' ');
                $fecha.html(fechalarga[0]);                
            });






        });
    </script>
</asp:Content>

