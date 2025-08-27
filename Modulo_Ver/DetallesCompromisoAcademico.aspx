<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Regresar.master" AutoEventWireup="true" CodeFile="DetallesCompromisoAcademico.aspx.cs" Inherits="Modulo_Ver_DetallesCompromisoAcademico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style4
        {
            height: 26px;
        }
        .style5
        {
            height: 24px;
        }
        .style9
        {
            width: 170px;
        }
        .style10
        {
            height: 30px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
           <fieldset>
        <h2>Detalles del Compromiso Academico</h2><br /><br /><br /><br />
        <table style="width: 716px">
            <tr><td style="text-align: center;" class="style5">
                <span><b>Nombre </b></span></td></tr>
            <tr><td class="style10" style="text-align: center; vertical-align: text-top;"><asp:Label ID="lbl_Nombre" runat="server" ></asp:Label></td>           
            </tr>
            <tr>
                <td class="style5" style="text-align: center;">
                <span><b>Tipo</b></span></td>
                
            </tr>
            <tr>
            <td class="style10" style="text-align: center; vertical-align: text-top;"><asp:Label ID="lbl_Tipo_producto" runat="server" ></asp:Label></td>
            </tr>
            <tr>
                <td class="style5" style="text-align: center;"><span>
                <b>Descripción</b></span></td>
                
            </tr>
            <tr>
            <td  class="style10" style="text-align: center; vertical-align: text-top;"><asp:Label ID="lbl_Descripcion" runat="server" ></asp:Label></td>
            </tr>
            <tr>
            <td class="style5" style="text-align: center;">
                <span><b>Fecha</b></span></td>
                
            </tr>
            <tr>
            <td class="style10" style="text-align: center; vertical-align: text-top;"><asp:Label ID="Label4" runat="server" ></asp:Label></td>
            </tr>
            
               </table>
            <table style="width: 716px">
            <tr><td colspan="2" class="style4" style="text-align: center" > <span><b>Autores </b></span> </td></tr>
                <tr>
                <td class="style9"></td>
                <td>
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                                        <asp:Label ID="Nombre_AutorLabel" runat="server" 
                                        Text='<%# Eval("Nombre_Autor") %>' />
                                </td>
                                <td style="text-align: center">
                                    &nbsp;&nbsp;-&nbsp;&nbsp;
                                    <asp:Label ID="Codigo_AutorLabel" runat="server" 
                                        Text='<%# Eval("Codigo_Autor") %>' />
                                </td>
                                
                            </tr>
                        </AlternatingItemTemplate>
                        
                        
                        
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No se han registrado autores de este Compromiso</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        
                        <ItemTemplate>
                            <tr style="">
                                <td style="text-align: center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
                                    <asp:Label ID="Nombre_AutorLabel" runat="server" 
                                        Text='<%# Eval("Nombre_Autor") %>' />
                                </td>

                                <td style="text-align: center">&nbsp;&nbsp;-&nbsp;&nbsp;
                                    <asp:Label ID="Codigo_AutorLabel" runat="server" 
                                        Text='<%# Eval("Codigo_Autor") %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table ID="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                               
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Nombre_Autor], [Codigo_Autor] FROM [Autores_Compromisos] WHERE ([Id_Compromiso] = @Id_Compromiso)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Id_Compromiso" SessionField="Id_Compromiso" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
               
            </tr>

            
             
       </table><br /><br /><br /><br /><br />
        <asp:Button ID="Btn_Continuar" runat="server" Text="Volver" onclick="Btn_Continuar_Click" ValidationGroup="Validar_InfoGeneral" class="boton buscar"/>
       </fieldset>
       
        
    </div>
</asp:Content>

