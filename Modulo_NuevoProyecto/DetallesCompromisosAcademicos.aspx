<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="DetallesCompromisosAcademicos.aspx.cs" Inherits="Modulo_NuevoProyecto_CompromisosAcademicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        
        .style1
        {
            width: 300px;
        }
        
        .style2
        {
            width: 50px;
        }
        .style10
        {
            width: 160px;
        }
        .style11
        {
            width: 130px;
        }
        .page{
            margin: 50px auto 0px auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
        <asp:Panel ID="Panel2" runat="server">
        
 <fieldset><br />
 <h1 style="text-align:center"> Añadir Compromiso Academico  </h1><br /><br /><br /><br />
 
     
 <table style="width: 98%" >
            <tr>
            <td class="style2"></td>
                <td style="text-align: right" class="style4"><span>Nombre :</span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_NombreCompromiso" runat="server" 
                        Height="21px" Width="537px" ValidationGroup="Validar_Compromiso" 
                        Enabled="False" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator"
                    ControlToValidate="Txt_NombreCompromiso" ValidationGroup="Validar_Compromiso" 
                        ForeColor="Red"><b>*</b>Ingrese un nombre</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr> <td class="style2"></td>
                <td style="text-align: right" class="style4"><span>Tipo de compromiso :</span></td>
                <td style="text-align: left" class="style1">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="294px" 
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
                    <asp:TextBox ID="Txt_fechaActa" runat="server" Height="21px" Width="155px" placeholder ="(día/mes/año)"
                        ValidationGroup="Validar_Compromiso" Enabled="False"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Txt_fechaActa" Format="dd/MM/yyyy"></asp:CalendarExtender>
                      
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="Txt_fechaActa" ErrorMessage="Ingrese una fecha valida" 
                        ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" 
                        ValidationGroup="Validar_Compromiso"><b>*</b></asp:RegularExpressionValidator>
                </td>
            </tr>
            
            <tr> <td class="style2"></td>
                <td class="style4" style="text-align: right"><span>Descripción :</span></td>
                <td colspan="3" style="text-align: left">
                    <asp:TextBox ID="Txt_descripcion" runat="server" Height="89px" Width="537px" 
                        TextMode="MultiLine" ValidationGroup="Validar_Acta" Enabled="False" ></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td></td>
            <td></td>
            <td colspan="3" style="text-align: left">
                &nbsp;</td>
            </tr>
            </table><br /><br /><asp:Label ID="Lbl_Estado" runat="server" ></asp:Label><br /><br />
            <asp:Button ID="Btn_Modificar" runat="server" Text="Modificar" 
                        BackColor="White" BorderStyle="Solid" Height="30px" Width="109px" 
                        BorderColor="#CCCCCC" onclick="Btn_Modificar_Click" ForeColor="#666666" Font-Bold="True" />
            <asp:Button ID="Btn_Actualizar" runat="server" Text="Actualizar"  
                        BackColor="White" BorderStyle="Solid" Height="30px" Width="105px" 
                        BorderColor="#CCCCCC" onclick="Btn_Actualizar_Click" 
                        ValidationGroup="Validar_Compromiso" Font-Bold="True" 
         ForeColor="#666666" Visible="False" />
            <asp:Button ID="Btn_Terminar" runat="server" Text="Terminar"  
                        BackColor="White" BorderStyle="Solid" Height="30px" Width="105px" 
                        BorderColor="#CCCCCC" onclick="Btn_Terminar_Click" 
         Font-Bold="True" ForeColor="#666666" /><br /><br />
        </fieldset>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server">
        <fieldset>
        <h2> Agregar Autores </h2><br /><asp:Label ID="Lbl_estado2" runat="server"></asp:Label><br />
            
        <table style="width: 98%">
        <tr>
            <td class="style11"></td>
            <td style="text-align: right"> Autor :</td>
            <td>
                <asp:TextBox ID="Tbx_Autor" runat="server" Height="22px" Width="250px"></asp:TextBox>
                </td>
                <td> C.C :</td>
                <td><asp:TextBox ID="Tbx_codigo" runat="server" Height="22px" Width="131px" 
                        MaxLength="11"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_Agregar" runat="server" Text="Agregar" BackColor="White" BorderStyle="Solid" Height="30px"
                        BorderColor="#CCCCCC" onclick="Agregar_Click" Font-Bold="True" ForeColor="#666666"/>
                    <asp:Button ID="Btn_Terminar2" runat="server" Text="Terminar" BackColor="White" BorderStyle="Solid" Height="30px"
                        BorderColor="#CCCCCC" onclick="Btn_Terminar2_Click" Font-Bold="True" ForeColor="#666666"/>
                
                </td>
            </tr>
            </table>
            <table style="width: 98%">
            <tr><td class="style10"></td>
            <td colspan="4" style="text-align: center">
                <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource3">
                    <AlternatingItemTemplate>
                        <tr style="text-align: center">
                            <td>
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
                                    No se han registrado autores para este compromiso academico</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    
                    <ItemTemplate>
                        <tr style="text-align: center">
                            <td>
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
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Nombre 
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </th>
                                            <th id="Th2" runat="server">
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Codigo
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


    <script type="text/javascript">
        $(function () {

            $("table[id*='ListView1'] tr").each(function () {
                var $fecha = $(this).find("span[id*='Fecha_ActaLabel']");

                var fechalarga = new String($fecha.text()).split(' ');
                $fecha.html(fechalarga[0]);
            });

        });
    </script>
    <script src="../Scripts/MarcadeAgua2.js" type="text/javascript"></script>
</asp:Content>

