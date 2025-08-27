<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="VerProductoEspecifico.aspx.cs" Inherits="zVer_VerProductoEspecifico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
     
      .style2
      {
          width: 260px;
          height: 30px;
      }
      .style3
      {
          height: 30px;
      }
      .page{
          margin: 50px auto 0px auto;
      }
      </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div align="center">
           <fieldset>
        <h2>Detalles del Producto</h2><br /><br /><br /><br />
        <table style="width: 716px">
            <tr>
                <td class="style2" style="text-align: right;">
                <span><b>Nombre :</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="style3"><asp:Label ID="lbl_Nombre" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="style2" style="text-align: right;"><span>
                <b>Descripción :</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="style3"><asp:Label ID="lbl_Descripcion" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="style2" style="text-align: right;">
                <span><b>Tipo de Producto :</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="style3"><asp:Label ID="lbl_Tipo_producto" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="style2" style="text-align: right;">
                <span><b>Ubicación :</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td class="style3"><asp:Label ID="Label4" runat="server" ></asp:Label></td>
            </tr>
            <tr><td colspan="2" class="style3"></td></tr>
            <tr>
            <td colspan="2" class="style3" style="text-align: center" > <span><b>Colaboradores </b></span> </td>
            <td class="style3"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td style="text-align: center"> 
                                    
                                    <asp:Label ID="Nombre_ColaboradorLabel" runat="server" Text='<%# Eval("Nombre_Colaborador") %>' />
                                        
                                </td>
                                <td style="text-align: center">
                                    
                                    <asp:Label ID="Nombre_RolLabel" runat="server" Text='<%# Eval("Nombre_Rol") %>' />
                                </td>
                                <td style="text-align: center">
                                     <asp:Label ID="Cedula_CiudadaniaLabel" runat="server" Text='<%# Eval("Cedula_Ciudadania") %>' />
                                </td>
                                
                            </tr>
                        </AlternatingItemTemplate>
                        
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    No se han registrado colaboradores para este producto</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        
                        
                        
                        <ItemTemplate>
                            <tr style="">
                                <td style="text-align: center"> 
                                    <asp:Label ID="Nombre_ColaboradorLabel" runat="server" Text='<%# Eval("Nombre_Colaborador") %>' />
                                </td>

                                <td style="text-align: center">
                                    <asp:Label ID="Nombre_RolLabel" runat="server" Text='<%# Eval("Nombre_Rol") %>' />
                                </td>
                                <td style="text-align: center">
                                    <asp:Label ID="Cedula_CiudadaniaLabel" runat="server" Text='<%# Eval("Cedula_Ciudadania") %>' />
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
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    Nombre
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    
                                                </th>
                                                <th runat="server">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    Rol
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                </th>
                                                <th runat="server">
                                               
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    N° Cedula 
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    </th>
                                            </tr>
                                            <tr ID="itemPlaceholder" runat="server"></tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
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
                                    <asp:Label ID="Cedula_CiudadaniaLabel" runat="server" 
                                        Text='<%# Eval("Cedula_Ciudadania") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="Nombre_RolLabel" runat="server" 
                                        Text='<%# Eval("Nombre_Rol") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                        
                    </asp:ListView>    
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT Colaboradores.Nombre_Colaborador, Colaboradores.Cedula_Ciudadania, Roles_Colaboradores.Nombre_Rol FROM Colaboradores INNER JOIN Participantes ON Colaboradores.Id_Colaborador = Participantes.Colaborador_Id INNER JOIN Roles_Colaboradores ON Participantes.Rol = Roles_Colaboradores.Id_Rol_Colaborador WHERE (Participantes.Productos_Id = @ID_Producto)">
                        <SelectParameters>
                            <asp:SessionParameter Name="ID_Producto" SessionField="ID_Producto" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
               
            </tr>

            
             
       </table><br /><br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Volver" onclick="Btn_Continuar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
       </fieldset>
       
        
    </div>

</asp:Content>

