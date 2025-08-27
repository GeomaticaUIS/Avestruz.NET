<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="AgregarProductos.aspx.cs" Inherits="zNuevo_cProductos" %>

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
            width: 250px;
        }
        .style2
        {
            width: 120px;
            padding: 10px;
        }
        .style3
        {
            width: 100px;
        }
          
        .style4
        {
            width: 81px;
        }
          
        .style5
        {
            width: 160px;
        }
          
        .style6
        {
            height: 20px;
        }
          
        .style7
        {
            height: 20px;
            width: 120px;
        }
        .dropdownlist{
            border: 1px solid #e6e6e6;
            border-radius: 3px;
        }
    </style>
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <fieldset><br />
        <h2>PRODUCTO</h2><br /><br /><br />
        <table style="width: 900px">
            <tr>
                <td class="style4"></td>
                <td style="text-align: left" class="style2">
                    <span><b>Nombre Producto :</b></span>
                </td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_Nombre" runat="server" Height="26px" Width="521px" class="floatl__input" ValidationGroup="Validar_InfoGeneral"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Nombre" 
                        ValidationGroup="Validar_InfoGeneral" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4"></td>
                <td style="text-align: left" class="style2">
                    <span><b>Tipo de Producto :</b></span></td>
                <td style="text-align: left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="32px" Width="180px" class="dropdownlist"
                        DataSourceID="SqlDataSource1" DataTextField="Tipo_Producto" DataValueField="Id_TipoProducto">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_TipoProducto], [Tipo_Producto] FROM [Tipo_Producto]">
                    </asp:SqlDataSource>
                </td>
                <td style="text-align: left" class="style3">
                    <span><b>Ubicación :</b></span></td>
                <td style="text-align: left">
                    <asp:TextBox ID="Txb_Ubicacion" runat="server" Height="8px" Width="166px" class="floatl__input"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td class="style4"></td>
                <td style="text-align: left" class="style2">
                <span><b>Descripción :</b></span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_descripcion" runat="server" Height="99px" Width="521px" class="floatl__input" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_descripcion" 
                        ValidationGroup="Validar_InfoGeneral" ForeColor="Red"><b>*</b></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td class="style6"></td><td class="style7"></td><td colspan="3" 
                    style="text-align: left; vertical-align: top;" class="style6"  >
                <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="#000066" 
                    onclick="LinkButton1_Click" ValidationGroup="Validar_InfoGeneral">Agregar Colaboradores</asp:LinkButton>
                     <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="#000066" 
                    Enabled="False" onclick="LinkButton2_Click" Visible="False">Agregar Colaboradores</asp:LinkButton>
                </td></tr>
                        
            </table><br />
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label><br /><br />
        <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" onclick="Btn_Agregar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
        <asp:Button ID="Btn_AgregarOtro" runat="server" Text="Agregar Otro" onclick="Btn_AgregarOtro_Click" ValidationGroup="Validar_InfoGeneral" Enabled="False" Visible="False" class="boton buscar"/>
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
                <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="204px" class="floatl__input" ValidationGroup="Crear_Colaborador"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1" 
                    ForeColor="#CC0000" ValidationGroup="Crear_Colaborador"><b>*</b></asp:RequiredFieldValidator>
                </td>
                <td><b>N° Cedula :</b></td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" ValidationGroup="Crear_Colaborador" MaxLength="11" Height="22px" Width="129px" class="floatl__input"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" 
                        ForeColor="#CC0000" ValidationGroup="Crear_Colaborador"><b>*</b></asp:RequiredFieldValidator><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox2" 
                        ForeColor="#CC0000" ValidationExpression="[0-9]+" 
                        ValidationGroup="Crear_Colaborador"><b>*</b></asp:RegularExpressionValidator>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_AñadirCol" runat="server" Text="Agregar" onclick="Btn_AñadirCol_Click" ValidationGroup="Crear_Colaborador" class="boton buscar"/>
                    <asp:Button ID="Btn_Terminar3" runat="server" Text="Terminar" BorderColor="#CCCCCC" onclick="Btn_Terminar3_Click" class="boton buscar"/>
                
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
                    DataSourceID="SqlDataSource5" DataTextField="Nombre_Colaborador" class="dropdownlist" 
                    DataValueField="Id_Colaborador" Height="22px" Width="210px">
                </asp:DropDownList>
                                <asp:Button ID="Btn_AñadirColaborador" runat="server" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab" Text="+" onclick="Btn_AñadirColaborador_Click" />
                
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                    SelectCommand="SELECT [Nombre_Colaborador], [Id_Colaborador] FROM [Colaboradores]">
                </asp:SqlDataSource>&nbsp;&nbsp;
                </td>
                <td><b>Rol :</b></td>
                <td>&nbsp;<asp:DropDownList ID="DropDownList8" runat="server" class="dropdownlist" 
                        DataSourceID="SqlDataSource6" DataTextField="Nombre_Rol" 
                        DataValueField="Id_Rol_Colaborador">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_Rol_Colaborador], [Nombre_Rol] FROM [Roles_Colaboradores]">
                    </asp:SqlDataSource>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" Text="Agregar" width="18%" onclick="Agregar_Click" class="boton buscar"/>
                    <asp:Button ID="Btn_terminar2" runat="server" Text="Terminar" width="18%" onclick="Btn_terminar2_Click" class="boton buscar"/>
                
                </td>
            </tr>
           </table> 
            <table style="width: 98%">
            <tr><td class="style5"></td>
            <td style="text-align: center">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource4">
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
                    
                    <EmptyDataTemplate>
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    No se han registrado colaboradores para este producto</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    
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
                        <table id="Table2" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="Tr2" runat="server" style="">
                                            <th id="Th1" runat="server">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Nombre
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </th>
                                            <th id="Th2" runat="server">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Rol
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                            <th id="Th3" runat="server">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                N° Cedula
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            </th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr3" runat="server">
                                <td id="Td2" runat="server" style="">
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
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                    SelectCommand="SELECT Colaboradores.Nombre_Colaborador, Roles_Colaboradores.Nombre_Rol, Colaboradores.Cedula_Ciudadania FROM Colaboradores INNER JOIN Participantes ON Colaboradores.Id_Colaborador = Participantes.Colaborador_Id INNER JOIN Roles_Colaboradores ON Participantes.Rol = Roles_Colaboradores.Id_Rol_Colaborador WHERE (Participantes.Productos_Id = @ID_Producto)">
                    <SelectParameters>
                        <asp:SessionParameter Name="ID_Producto" SessionField="Id_producto" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            </tr>
            </table>
            
        
        </fieldset></asp:Panel>
    </div>
<script type="text/javascript">

    $("input[id*='Btn_AgregarOtro']").click(function () {
        $("input[type='text']").val("");
    });
    </script>
</asp:Content>

