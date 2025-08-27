<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Buscar_VIE.aspx.cs" Inherits="Modulo_Busqueda_Buscar_VIE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<table width="100%" >
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td align="right">
                    <asp:TextBox ID="Txt_Buscar" runat="server" Height="20px" Width="250px"></asp:TextBox>
                    &nbsp;<asp:Button ID="Btn_Buscar" runat="server" BackColor="White" 
                     BorderColor="#CCCCCC" BorderStyle="Solid" Height="26px" Text="Buscar" 
                     Width="60px" onclick="Btn_Mostrar_Click" ForeColor="#666666" 
                        Font-Bold="True" />
                </td>
            </tr>
        </table><br /><br />
<div align="center">
<br />
    <h1 style="text-align:center">PROYECTOS DE INVESTIGACIÓN</h1><br /><br /><br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto" 
        DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="background-color: #E0FFFF;color: #333333;">
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
                    <asp:Button ID="VerProyecto" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" Height="25px" Text="Ver" Width="50px" onclick="VerProyecto_Click" />
                </td>
                <td>
                    <asp:Button ID="EditarProyecto" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" Height="25px" Text="Editar" Width="50px" onclick="EditarProyecto_Click"/> 
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
            <tr style="background-color: #FFFFFF;color: #284775;">
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
                    <asp:Button ID="VerProyecto" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" Height="25px" Text="Ver" Width="50px" onclick="VerProyecto_Click" />
                </td>
                <td>
                    <asp:Button ID="EditarProyecto" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" Height="25px" Text="Editar" Width="50px" onclick="EditarProyecto_Click"/> 
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table id="Table2" runat="server">
                <tr id="Tr1" runat="server">
                    <td id="Td1" runat="server">
                        <table ID="itemPlaceholderContainer" runat="server" border="1" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                            <tr id="Tr2" runat="server" style="background-color: #E0FFFF;color: #333333;">
                                <th id="Th1" runat="server">
                                    Id</th>
                                <th id="Th2" runat="server">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nombre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                <th id="Th3" runat="server">
                                    Registro VIE</th>
                            </tr>
                            <tr ID="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr3" runat="server">
                    <td id="Td2" runat="server" 
                        style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                <td>
                    <asp:Label ID="Id_ProyectoLabel" runat="server" 
                        Text='<%# Eval("Id_Proyecto") %>' />
                </td>
                <td>
                    <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                </td>
                <td>
                    <asp:Label ID="Registro_VIELabel" runat="server" 
                        Text='<%# Eval("Registro_VIE") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
        
        SelectCommand="SELECT Proyectos.Id_Proyecto, Proyectos.Nombre, Proyectos.Registro_VIE FROM Proyectos INNER JOIN Contrato_Convenio ON Proyectos.Id_Proyecto = Contrato_Convenio.Id_Proyecto INNER JOIN Entidad_Contratante ON Contrato_Convenio.Entidad_Contratante = Entidad_Contratante.Id_Entidad_Contratante WHERE (Proyectos.Registro_VIE LIKE '%' + @Nombre + '%')">
        <SelectParameters>
            <asp:SessionParameter Name="Nombre" SessionField="Palabra_Buscar" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
                    
</div>

</asp:Content>

