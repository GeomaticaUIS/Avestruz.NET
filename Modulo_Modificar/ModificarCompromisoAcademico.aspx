<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="ModificarCompromisoAcademico.aspx.cs" Inherits="Modulo_Modificar_ModificarCompromisoAcademico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            width: 300px;
        }

        .style2 {
            width: 50px;
        }

        .dropdownlist {
            border: 1px solid #e6e6e6;
            border-radius: 3px;
        }
        td{
            padding:4px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div align="center">
 <fieldset><br />
 <h2 style="text-align:center"> Añadir Compromiso Academico  </h2><br /><br />
 
     <asp:Label ID="Lbl_Estado" runat="server" ></asp:Label><br />
 <table style="width: 98%" >
            <tr>
            <td class="style2"></td>
                <td style="text-align: right" class="style4"><span>Nombre :</span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_NombreCompromiso" runat="server" 
                        Height="21px" Width="537px" class="floatl__input" ValidationGroup="Validar_Adicion" 
                        Enabled="False" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="Txt_NombreCompromiso" ValidationGroup="Validar_Adicion" 
                        ForeColor="Red"><b>*</b>Ingrese un nombre</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr> <td class="style2"></td>
                <td style="text-align: right" class="style4"><span>Tipo de compromiso :</span></td>
                <td style="text-align: left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="294px" class="dropdownlist"
                        DataSourceID="SqlDataSource1" DataTextField="Tipo_Compromiso_Academico" 
                        DataValueField="Id_Tipo_Compromiso" ValidationGroup="Validar_Acta" 
                        Enabled="False"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_Tipo_Compromiso], [Tipo_Compromiso_Academico] FROM [Tipo_Compromiso_Academico]">
                    </asp:SqlDataSource>
                        
                </td>
                <td style="text-align: right"><span>Fecha :</span></td>
                <td style="text-align: left" class="style3">
                    <asp:TextBox ID="Txt_fechaActa" runat="server" Height="21px" Width="136px" class="floatl__input" placeholder ="(día/mes/año)"
                        ValidationGroup="Validar_Acta" Enabled="False"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaActa" Format="dd/MM/yyyy"></asp:CalendarExtender>
                      
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="Txt_fechaActa" ErrorMessage="Ingrese una fecha valida" 
                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_Acta"><b>*</b></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr> <td class="style2"></td>
                <td class="style4" style="text-align: right"><span>Descripción :</span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_descripcion" runat="server" Height="89px" Width="537px" class="floatl__input"
                        TextMode="MultiLine" ValidationGroup="Validar_Acta" Enabled="False" ></asp:TextBox>
                </td>
            </tr>
            </table><br /><br /><br />
            <asp:Button ID="Btn_Modificar" runat="server" Text="Modificar" onclick="Btn_Modificar_Click" class="boton buscar"/>
            <asp:Button ID="Btn_Actualizar" runat="server" Text="Actualizar" ValidationGroup="Validar_Acta" onclick="Btn_Actualizar_Click" Enabled="False" class="boton buscar"/>
        
        <asp:Button ID="Btn_Terminar" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
        </fieldset>
        <asp:Panel ID="Panel2" runat="server">
    <fieldset>
        <h2> Agregar Autores </h2><br /><br />
        <table style="width: 98%">
        <tr>
            <td></td>
            <td style="text-align: right"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Autor :</td>
            <td>
                <asp:TextBox ID="Tbx_Autor" runat="server" Height="22px" Width="250px" class="floatl__input"></asp:TextBox>
                </td>
                <td> C.C :</td>
                <td><asp:TextBox ID="Tbx_codigo" runat="server" Height="22px" Width="131px" class="floatl__input"
                        MaxLength="11"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" onclick="Agregar_Click" class="boton buscar"/>
                    <asp:Button ID="Button1" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"/>
                
                </td>
            </tr>
            <tr>
            <td></td>
            <td colspan="4"> &nbsp;</td>
            </tr>
            <tr><td></td>
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
                        <table id="Table1" runat="server" style="">
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    No se han registrado autores para este compromiso academico</td>
                            </tr>
                        </table>
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
                        <table id="Table2" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td1" runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                        <tr id="Tr2" runat="server" style="">
                                            <th id="Th1" runat="server">
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                                            <th id="Th2" runat="server">
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                C.C
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
                </td></tr>
        </table>
        </fieldset>
    </asp:Panel>
 </div>

</asp:Content>

