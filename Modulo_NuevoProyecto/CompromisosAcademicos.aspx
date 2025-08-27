<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_NuevoProyecto.master" AutoEventWireup="true" CodeFile="CompromisosAcademicos.aspx.cs" Inherits="Modulo_NuevoProyecto_CompromisosAcademicos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 156px;
        }
        .style2
        {
            width: 425px;
        }
        .style3
        {
            width: 65px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <asp:Panel ID="Panel1" runat="server">
    
        <fieldset><br />
        <h1>COMPROMISOS ACADEMICOS DEL PROYECTO</h1><br /><br /><br />
        <table style="width: 900px">
        <thead>
            <tr>
                <th class="style1">
                </th>
                <th class="style2">
                    Tipos de Productos</th>
                <th class="style3">
                    Cantidad</th>
            </tr>
        </thead>
            <tr><td class="style1"></td>
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Artículos en Revistas Científicas Especializadas :</span>
                </td>
                <td style="text-align: center" class="style3">
                    <asp:TextBox ID="TextBox1" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td class="style19" style="text-align: center" >      
                    &nbsp;</td>
                
            </tr>
            <tr><td class="style1"></td>
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Interpretación o Exhibición Gratuita dentro de la UIS :</span>
                </td>
                <td class="style3" style="text-align: center">
                    <asp:TextBox ID="TextBox2" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td class="style19" style="text-align: center">         
                    &nbsp;</td>
                
            </tr>
            <tr><td class="style1"></td>
                <td class="style2" style="text-align:left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Libros de ensayo Universitario :</span>
                </td>
                <td class="style3" style="text-align: center">
                    <asp:TextBox ID="TextBox3" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td class="style19" style="text-align: center">         
                    &nbsp;</td>
               
            </tr>
            <tr><td class="style1"></td>
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Libros de texto Universitario :</span>
                </td>
                    
                <td id="List_" class="style3" style="text-align: center">
                    <asp:TextBox ID="TextBox4" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>

                <td class="style19" style="text-align: center">         
                    &nbsp;</td>

            </tr>
            <tr><td class="style1"></td>
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Libros resultado de una investigación :</span></td>
                    
                <td class="style3" style="text-align: center">
                    <asp:TextBox ID="TextBox5" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td class="style19" style="text-align: center">         
                    &nbsp;</td>
                
            </tr>
            <tr><td class="style1"></td>
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Obras artísticas de creación original artística :</span>
                </td>
                    
                <td id="Td1" class="style3" style="text-align: center">
                    <asp:TextBox ID="TextBox6" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>

                <td class="style19" style="text-align: center">         
                    &nbsp;</td>

            </tr>
            <tr><td class="style1"></td>
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Ponencias publicadas en extenso o resumen estructurado :</span>
                </td>
                    
                <td id="Td2" class="style3" style="text-align: center">
                    <asp:TextBox ID="TextBox7" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>

                <td class="style19" style="text-align: center">         
                    &nbsp;</td>
            </tr>
            
            <tr><td class="style1"></td>
                <td class="style2" style="text-align: left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;<span>Producción de vídeos, cinematrográficas o fonográficas :</span>
                </td>
                 
                <td class="style3" style="text-align: center">
                    <asp:TextBox ID="TextBox8" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td  class="style19"></td>
                
                
            </tr>
            <tr>
                <td class="style1"></td> 
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Producción técnica reportada al repositorio de la UIS :</span>
                </td>
                <td  style="text-align: center" class="style3">
                   
                    <asp:TextBox ID="TextBox9" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td class="style1"></td> 
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Producción de software :</span>
                </td>
                <td  style="text-align: center" class="style3">
                   
                    <asp:TextBox ID="TextBox10" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td class="style1"></td> 
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Propuesta de Investigación Aprobada :</span>
                </td>
                <td  style="text-align: center" class="style3">
                   
                    <asp:TextBox ID="TextBox11" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td class="style1"></td> 
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Publicaciones impresas universitarias :</span>
                </td>
                <td  style="text-align: center" class="style3">
                   
                    <asp:TextBox ID="TextBox12" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td class="style1"></td> 
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Trabajos de grado en pregrado y postgrado :</span>
                </td>
                <td  style="text-align: center" class="style3">
                   
                    <asp:TextBox ID="TextBox13" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
            <tr>
                <td class="style1"></td> 
                <td class="style2" style="text-align: left;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>Traducción de libros para uso docente en la UIS :</span>
                </td>
                <td  style="text-align: center" class="style3">
                   
                    <asp:TextBox ID="TextBox14" runat="server" Height="22px" Width="25px" 
                        MaxLength="2"></asp:TextBox>
                </td>
                <td></td>
                
            </tr>
        </table><hr style="width: 424px" />
        <table style="width: 900px">
        <tr>
                <td class="style1" style="text-align: center"></td> 
                <td class="style2" style="text-align: center;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<span>TOTAL :</span>
                </td>
                <td  style="text-align: center" class="style3">
                   
                    <asp:Label ID="Lbl_Total" runat="server" ></asp:Label>
                </td>
                <td style="text-align: center"></td>
                
            </tr>
        </table><br /><br />
            <asp:Label ID="Label1" runat="server" ></asp:Label><br /><br />
        <asp:Button ID="Btn_Agregar" runat="server" Text="Registrar" onclick="Btn_Registrar_Click" class="boton buscar"/>
        <asp:Button ID="Btn_Terminar" runat="server" Text="Terminar" onclick="Btn_Terminar2_Click" class="boton buscar"/>
        </fieldset></asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
    <fieldset><br /><br />
    <h1>COMPROMISOS ACADEMICOS DEL PROYECTO</h1><br /><br /><br /><br /><br /><br /><br />
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;" class="contenedor">
                    
                        <asp:Label ID="Id_ProyectoLabel" runat="server" 
                            Text='<%# Eval("Id_Proyecto") %>' Visible="False" />
                    
                    
                        <asp:Label ID="Id_Tipo_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Id_Tipo_Compromiso") %>' Visible="False" />
                    
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CantidadLabel" runat="server" Text='<%# Eval("Cantidad") %>' />
                    </td>
                    <td><asp:Button ID="VerProducto" runat="server" Text="Detalles" onclick="VerCompromiso_Click" class="boton opcion"/></td>
                </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <table id="Table1" runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No se han registrado compromisos Academicos.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                   
                        <asp:Label ID="Id_ProyectoLabel" runat="server" 
                            Text='<%# Eval("Id_Proyecto") %>' Visible="False" />
                    
                   
                        <asp:Label ID="Id_Tipo_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Id_Tipo_Compromiso") %>' Visible="False" />
                   
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CantidadLabel" runat="server" Text='<%# Eval("Cantidad") %>' />
                    </td>
                    <td>
                        <asp:Button ID="VerProducto" runat="server" Text="Detalles" onclick="VerCompromiso_Click" class="boton opcion"/>
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table2" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td3" runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="Tr2" runat="server" style="background-color: #E0FFFF;color: #333333;">
                                   
                                    <th id="Th1" runat="server">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        Tipo de Compromiso Academico
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th id="Th2" runat="server">
                                        Cantidad</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td4" runat="server" 
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
                        <asp:Label ID="Id_Tipo_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Id_Tipo_Compromiso") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CantidadLabel" runat="server" Text='<%# Eval("Cantidad") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
            SelectCommand="SELECT Informe_CompromisosAcademicos.Id_Proyecto, Informe_CompromisosAcademicos.Id_Tipo_Compromiso, Tipo_Compromiso_Academico.Tipo_Compromiso_Academico, Informe_CompromisosAcademicos.Cantidad FROM Tipo_Compromiso_Academico INNER JOIN Informe_CompromisosAcademicos ON Tipo_Compromiso_Academico.Id_Tipo_Compromiso = Informe_CompromisosAcademicos.Id_Tipo_Compromiso WHERE (Informe_CompromisosAcademicos.Id_Proyecto = @Id_Proyecto)">
            <SelectParameters>
                <asp:SessionParameter Name="Id_Proyecto" SessionField="Id_Proyecto" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Button1" runat="server" Text="Terminar" onclick="Btn_Terminar2_Click" class="boton buscar"/>
        <br />
    </fieldset>
    </asp:Panel>
    <asp:Panel ID="Panel4" runat="server" Visible="False">
    <fieldset><br /><br />
        <h1>COMPROMISOS ACADEMICOS DEL PROYECTO</h1><br /><br /><br /><br /><br /><br /><br />
        <asp:ListView ID="ListView3" runat="server" 
            DataKeyNames="Id_Compromiso_Academico" DataSourceID="SqlDataSource3">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;" class="contenedor">
                    
                        <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />
                    
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Detalles_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Detalles_Compromiso") %>' />
                    </td>
                    <td>
                        <asp:Button ID="Bnt_Detallar" runat="server" Text="Detalles" onclick="Detallar_Click" class="boton opcion"/>
                    </td>
                </tr>
            </AlternatingItemTemplate>
            
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No se han registrado estos tipos de compromisos
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                    
                        <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />
                    
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Detalles_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Detalles_Compromiso") %>' />
                    </td>
                    <td><asp:Button ID="Bnt_Detallar" runat="server" Text="Detalles" onclick="Detallar_Click" class="boton opcion"/></td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    
                                    <th runat="server">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    Tipo de Compromiso Academico
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th runat="server">
                                        Nombre</th>
                                    <th runat="server">
                                        Detalles</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Id_Compromiso_Academico") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                            Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                    </td>
                    <td>
                        <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Detalles_CompromisoLabel" runat="server" 
                            Text='<%# Eval("Detalles_Compromiso") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
            SelectCommand="SELECT Compromisos_Academicos.Id_Compromiso_Academico, Tipo_Compromiso_Academico.Tipo_Compromiso_Academico, Compromisos_Academicos.Nombre, Compromisos_Academicos.Detalles_Compromiso FROM Compromisos_Academicos INNER JOIN Tipo_Compromiso_Academico ON Compromisos_Academicos.Tipo_Compromiso = Tipo_Compromiso_Academico.Id_Tipo_Compromiso WHERE (Compromisos_Academicos.Tipo_Compromiso = @idtipo) AND (Compromisos_Academicos.Id_Proyecto = @Id_Proyecto)">
            <SelectParameters>
                <asp:SessionParameter Name="idtipo" SessionField="id_tipo" />
                <asp:SessionParameter Name="Id_Proyecto" SessionField="Id_Proyecto" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br /><br /><br /><br /><br /><br /><br /><br />
        <asp:Button ID="Btn_Volver" runat="server" Text="Volver"  
                    BackColor="White" BorderStyle="Solid" Height="31px" Width="104px" 
                    BorderColor="#CCCCCC" onclick="Btn_Volver_Click" Font-Bold="True" ForeColor="#666666" /><br />
    </fieldset>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="False">
            <fieldset>
            <h1>COMPROMISOS ACADEMICOS DEL PROYECTO</h1><br /><br /><br />
                <asp:ListView ID="ListView1" runat="server" 
                    DataKeyNames="Id_Compromiso_Academico" DataSourceID="SqlDataSource1">
                    <AlternatingItemTemplate>
                        <tr style="background-color: #FFFFFF;color: #284775;" class="contenedor">
                            
                                <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server" 
                                    Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />
                            
                            <td>
                                <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                                    Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Detalles_CompromisoLabel" runat="server" 
                                    Text='<%# Eval("Detalles_Compromiso") %>' />
                            </td>
                            <td><asp:Button ID="EditarProducto" runat="server" Text="Detalle" onclick="EditarCompromiso_Click" class="boton opcion"/></td>
                        </tr>
                    </AlternatingItemTemplate>
                    
                    <EmptyDataTemplate>
                        <table runat="server" 
                            style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                            <tr>
                                <td>
                                    No se han registrado el informe de Compromisos Academicos</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    
                    <ItemTemplate>
                        <tr style="background-color: #E0FFFF;color: #333333;" class="contenedor">
                            
                                <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server" 
                                    Text='<%# Eval("Id_Compromiso_Academico") %>' Visible="False" />
                            
                            <td>
                                <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                                    Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Detalles_CompromisoLabel" runat="server" 
                                    Text='<%# Eval("Detalles_Compromiso") %>' />
                            </td>
                            <td><asp:Button ID="EditarProducto" runat="server" Text="Detalle" onclick="EditarCompromiso_Click" class="boton opcion"/></td>
                        </tr>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                            
                                            <th runat="server">
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                Tipo de Compromiso Academico
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                            <th runat="server">
                                            
                                                Nombre
                                            </th>
                                            <th runat="server">
                                            
                                                Detalles
                                            </th>
                                        </tr>
                                        <tr ID="itemPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" 
                                    style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                                    <asp:DataPager ID="DataPager1" runat="server">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                            <td>
                                <asp:Label ID="Id_Compromiso_AcademicoLabel" runat="server" 
                                    Text='<%# Eval("Id_Compromiso_Academico") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Tipo_Compromiso_AcademicoLabel" runat="server" 
                                    Text='<%# Eval("Tipo_Compromiso_Academico") %>' />
                            </td>
                            <td>
                                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                            </td>
                            <td>
                                <asp:Label ID="Detalles_CompromisoLabel" runat="server" 
                                    Text='<%# Eval("Detalles_Compromiso") %>' />
                            </td>
                        </tr>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                    SelectCommand="SELECT Compromisos_Academicos.Id_Compromiso_Academico, Tipo_Compromiso_Academico.Tipo_Compromiso_Academico, Compromisos_Academicos.Nombre, Compromisos_Academicos.Detalles_Compromiso FROM Compromisos_Academicos INNER JOIN Tipo_Compromiso_Academico ON Compromisos_Academicos.Tipo_Compromiso = Tipo_Compromiso_Academico.Id_Tipo_Compromiso WHERE (Compromisos_Academicos.Id_Proyecto = @Id_proyecto)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Id_proyecto" SessionField="Id_proyecto" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </fieldset>
        </asp:Panel>
    
    </div>

</asp:Content>

