<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="Modificarproducto.aspx.cs" Inherits="zModificar_Modificarproducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            width: 83px;
        }
        
      
        .style5
        {
            width: 160px;
        }
        
      
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div align="center">
        <fieldset><br />
        <h2>Editando Producto</h2><br /><br /><br />
        <table style="width: 900px">
            <tr>
                <td class="style4"></td>
                <td style="text-align: left" class="style2">
                    <span><b>Nombre Producto :</b></span>
                </td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_Nombre" runat="server" Height="30px" Width="541px" 
                        ValidationGroup="Validar_InfoGeneral" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Nombre" 
                        ValidationGroup="Validar_InfoGeneral" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4"></td>
                <td style="text-align: left" class="style2">
                    <span><b>Tipo de Producto :</b></span></td>
                <td style="text-align: left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="36px" Width="180px" 
                        DataSourceID="SqlDataSource1" DataTextField="Tipo_Producto" 
                        DataValueField="Id_TipoProducto" Enabled="False">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_TipoProducto], [Tipo_Producto] FROM [Tipo_Producto]">
                    </asp:SqlDataSource>
                </td>
                <td style="text-align: left" class="style3">
                    <span><b>Ubicación :</b></span></td>
                <td style="text-align: left">
                    <asp:TextBox ID="Txb_Ubicacion" runat="server" Height="30px" Width="183px" 
                        Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td class="style4"></td>
                <td style="text-align: left" class="style2">
                <span><b>Descripción :</b></span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_descripcion" runat="server" Height="99px" Width="541px" 
                        TextMode="MultiLine" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            
                        
            </table><br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br /><br />
 <asp:Button ID="Btn_Modificar" runat="server" Text="Modificar" onclick="Btn_Modificar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_Actualizar" runat="server" Text="Actualizar" onclick="Btn_Actualizar_Click" ValidationGroup="Validar_InfoGeneral" Enabled="False" class="boton buscar"/>
        <asp:Button ID="Btn_Terminar" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
                        </fieldset>
                        <asp:Panel ID="Panel1" runat="server">
        <fieldset>
        <h2> Agregar Colaborador </h2><br />
            
        <table style="width: 98%">
        <tr>
            <td></td>
            <td style="text-align: right"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <b>Nombre :</b></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="204px" 
                    ValidationGroup="Crear_Colaborador"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1" 
                    ForeColor="#CC0000" ValidationGroup="Crear_Colaborador"><b>*</b></asp:RequiredFieldValidator>
                </td>
                <td><b>N° Cedula :</b></td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="Crear_Colaborador" 
                        MaxLength="11" Height="22px" Width="129px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" ValidationGroup="Crear_Colaborador"><b>*</b></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox2" 
                        ForeColor="#CC0000" ValidationExpression="[0-9]+" 
                        ValidationGroup="Crear_Colaborador"><b>*</b></asp:RegularExpressionValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_AñadirCol" runat="server" Text="Agregar" onclick="Btn_AñadirCol_Click" ValidationGroup="Crear_Colaborador" class="boton buscar"/>
                    <asp:Button ID="Btn_Terminar3" runat="server" Text="Terminar" onclick="Btn_Terminar3_Click" class="boton buscar"/>
                
                </td>
            </tr>
            </table>
        </fieldset>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
        <fieldset>
        <h2> Agregar Colaboradores </h2><br /><br />
        <table style="width: 98%">
        <tr>
            <td></td>
            <td style="text-align: right"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <b>Colaborador :</b></td>
            <td>
                <asp:DropDownList ID="DropDownList7" runat="server" 
                    DataSourceID="SqlDataSource5" DataTextField="Nombre_Colaborador" 
                    DataValueField="Id_Colaborador" Height="22px" Width="210px">
                </asp:DropDownList>
                   <asp:Button ID="Btn_AñadirColaborador" runat="server" Text="+" Height="27px" 
                    Width="25px" onclick="Btn_AñadirColaborador_Click" />
                
                
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                    SelectCommand="SELECT [Nombre_Colaborador], [Id_Colaborador] FROM [Colaboradores]">
                </asp:SqlDataSource>&nbsp;&nbsp;
                </td>
                <td><b>Rol :</b></td>
                <td>&nbsp;<asp:DropDownList ID="DropDownList8" runat="server" 
                        DataSourceID="SqlDataSource6" DataTextField="Nombre_Rol" 
                        DataValueField="Id_Rol_Colaborador">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_Rol_Colaborador], [Nombre_Rol] FROM [Roles_Colaboradores]">
                    </asp:SqlDataSource>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" onclick="Agregar_Click" class="boton buscar"/>
                    <asp:Button ID="Button1" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
                
                </td>
            </tr>
             </table>
            <table style="width: 98%">
            <tr><td class="style5"></td>
            <td colspan="4" style="text-align: center">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                    <AlternatingItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="Nombre_ColaboradorLabel" runat="server" 
                                    Text='<%# Eval("Nombre_Colaborador") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Nombre_RolLabel" runat="server" 
                                    Text='<%# Eval("Nombre_Rol") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Cedula_CiudadaniaLabel" runat="server" 
                                    Text='<%# Eval("Cedula_Ciudadania") %>' />
                            </td>
                        </tr>
                    </AlternatingItemTemplate>
                    
                    
                    <EditItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                    Text="Actualizar" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Cancelar" />
                            </td>
                            <td>
                                <asp:TextBox ID="Nombre_ColaboradorTextBox" runat="server" 
                                    Text='<%# Bind("Nombre_Colaborador") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="Nombre_RolTextBox" runat="server" 
                                    Text='<%# Bind("Nombre_Rol") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="Cedula_CiudadaniaTextBox" runat="server" 
                                    Text='<%# Bind("Cedula_Ciudadania") %>' />
                            </td>
                        </tr>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    No se han registrado colaboradores para este producto</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                    Text="Insertar" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Borrar" />
                            </td>
                            <td>
                                <asp:TextBox ID="Nombre_ColaboradorTextBox" runat="server" 
                                    Text='<%# Bind("Nombre_Colaborador") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="Nombre_RolTextBox" runat="server" 
                                    Text='<%# Bind("Nombre_Rol") %>' />
                            </td>
                            <td>
                                <asp:TextBox ID="Cedula_CiudadaniaTextBox" runat="server" 
                                    Text='<%# Bind("Cedula_Ciudadania") %>' />
                            </td>
                        </tr>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="Nombre_ColaboradorLabel" runat="server" 
                                    Text='<%# Eval("Nombre_Colaborador") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Nombre_RolLabel" runat="server" 
                                    Text='<%# Eval("Nombre_Rol") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Cedula_CiudadaniaLabel" runat="server" 
                                    Text='<%# Eval("Cedula_Ciudadania") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr runat="server" style="">
                                            <th runat="server">
                                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Nombre
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </th>
                                            <th runat="server">
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Rol
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                            <th runat="server">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                N° Cedula
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="">
                            <td>
                                <asp:Label ID="Nombre_ColaboradorLabel" runat="server" 
                                    Text='<%# Eval("Nombre_Colaborador") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Nombre_RolLabel" runat="server" 
                                    Text='<%# Eval("Nombre_Rol") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Cedula_CiudadaniaLabel" runat="server" 
                                    Text='<%# Eval("Cedula_Ciudadania") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                    SelectCommand="SELECT Colaboradores.Nombre_Colaborador, Roles_Colaboradores.Nombre_Rol, Colaboradores.Cedula_Ciudadania FROM Colaboradores INNER JOIN Participantes ON Colaboradores.Id_Colaborador = Participantes.Colaborador_Id INNER JOIN Roles_Colaboradores ON Participantes.Rol = Roles_Colaboradores.Id_Rol_Colaborador WHERE (Participantes.Productos_Id = @ID_Producto)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ID_Producto" SessionField="ID_Producto" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                    
                    SelectCommand="SELECT Colaboradores.Nombre_Colaborador, Colaboradores.Profesión, Roles_Colaboradores.Nombre_Rol FROM Colaboradores INNER JOIN Participantes ON Colaboradores.Id_Colaborador = Participantes.Colaborador_Id INNER JOIN Roles_Colaboradores ON Participantes.Rol = Roles_Colaboradores.Id_Rol_Colaborador WHERE (Participantes.Productos_Id = @ID_Producto)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ID_Producto" SessionField="ID_Producto" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td></tr>
        </table>
        </fieldset></asp:Panel>
</div>
</asp:Content>

