<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Ver.master" AutoEventWireup="true" CodeFile="VerProductos2.aspx.cs" Inherits="Modulo_Ver_VerProductos2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
       <fieldset><br /><br />
    <h1 style="text-align:center"> Productos </h1><br /><br />
         <br /><br /><br /><br /><br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Productos" DataSourceID="SqlDataSource1" onselectedindexchanged="ListView1_SelectedIndexChanged">
            <AlternatingItemTemplate>
                    <tr style="background-color: #E0FFFF;color: #333333;">
                        <td><asp:Label ID="Id_ProductosLabel" runat="server" Text='<%# Eval("Id_Productos") %>' /></td>
                        <td><asp:Label ID="Tipo_ProductoLabel" runat="server" Text='<%# Eval("Tipo_Producto") %>' /></td>
                        <td><asp:Label ID="Nombre_ProductoLabel" runat="server" Text='<%# Eval("Nombre_Producto") %>' /></td>
                        <td><asp:Label ID="Descripción_ProductoLabel" runat="server" Text='<%# Eval("Descripción_Producto") %>' /></td>
                        <td><asp:Label ID="ArchivoLabel" runat="server" ForeColor="#006699" Text='<%# Eval("Archivo") %>'></asp:Label></td>
                        <td><asp:Button ID="VerProducto" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" Height="25px" 
                             Text="Ver" Width="50px" onclick="VerProducto_Click" />
                        </td>
                    </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <table id="Table1" runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td> No se han registrado productos para este Proyecto</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
                        
            <ItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td><asp:Label ID="Id_ProductosLabel" runat="server" Text='<%# Eval("Id_Productos") %>' /></td>
                    <td><asp:Label ID="Tipo_ProductoLabel" runat="server" Text='<%# Eval("Tipo_Producto") %>' /></td>
                    <td><asp:Label ID="Nombre_ProductoLabel" runat="server" Text='<%# Eval("Nombre_Producto") %>' /></td>
                    <td><asp:Label ID="Descripción_ProductoLabel" runat="server" Text='<%# Eval("Descripción_Producto") %>' /></td>
                    <td><asp:Label ID="ArchivoLabel" runat="server" ForeColor="#333333" Text='<%# Eval("Archivo") %>'></asp:Label></td>
                    <td><asp:Button ID="VerProducto" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Solid" Height="25px" 
                        Text="Ver" Width="50px" onclick="VerProducto_Click" />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="Tr2" runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th id="Th1" runat="server">&nbsp;Id&nbsp;</th>
                                    <th id="Th2" runat="server">&nbsp;Nombre del Producto&nbsp;</th>
                                    <th id="Th3" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descripción&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th id="Th4" runat="server">&nbsp;Tipo de Producto&nbsp;</th>
                                    <th id="Th5" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ubicación&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                </tr>
                                <tr runat="server" ID="itemPlaceholder">

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
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
            
                SelectCommand="SELECT Productos.Id_Productos, Tipo_Producto.Tipo_Producto, Productos.Nombre_Producto, Productos.Descripción_Producto, Productos.Archivo FROM Productos INNER JOIN Tipo_Producto ON Productos.Id_TipoProducto = Tipo_Producto.Id_TipoProducto WHERE (Productos.Id_Proyectos = @ID_Proyectos)">
            <SelectParameters>
                <asp:SessionParameter Name="Id_Proyectos" SessionField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar"  
               BackColor="White" BorderStyle="Solid" Height="31px" Width="104px" 
                         BorderColor="#CCCCCC" onclick="Btn_Terminar_Click" 
               Font-Bold="True" ForeColor="#666666" />
        
       <br />
        </fieldset>
    </div>
</asp:Content>

