<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="BusquedaEspecifica.aspx.cs" Inherits="Modulo_Busqueda_BusquedaEspecifica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            height: 38px;
        }
        .style5
        {
            width: 45px;
        }
        .dropdownlist{
            border: 1px solid #e6e6e6;
            border-radius: 3px;
        }
        .label_user{
            top: 16.2px;
        }
    </style>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div align="center">
    
    <fieldset><br /><br />
    <h1> Buscar Proyecto por</h1><br /><br />
    <table style="width: 637px" >
    
        <tr><td class="style5"></td>
            <td class="style4"><span><b>Nombre del Proyecto :</b></span></td>
            <td class="style4">
                <asp:TextBox ID="Tbx_BuscarNombre" class="floatl__input" runat="server" Height="28px" Width="288px"></asp:TextBox> 
                <asp:Button ID="Btn_Buscar" runat="server" Text="Buscar" onclick="Btn_BuscarNombre_Click" class="boton buscar"/>         
            </td>
        </tr>
        <tr><td class="style5">&nbsp;</td>
            <td class="style4"><span><b>Objeto del Contrato :</b></span></td>
            <td class="style4">
                <asp:TextBox ID="Tbx_BuscarObjeto" class="floatl__input" runat="server" Height="28px" Width="288px" OnTextChanged="Tbx_Buscar2_TextChanged"></asp:TextBox> 
                <asp:Button ID="Btn_Buscar2" runat="server" Text="Buscar" onclick="Btn_BuscarObjeto_Click" class="boton buscar"/>         
            </td>
        </tr>
        
        <tr><td class="style5"></td>
            <td class="style4"><span><b>Nombre de Contrato :</b></span></td>
            <td class="style4">
                <asp:TextBox ID="Tbx_BuscarContrato" class="floatl__input" runat="server" Height="28px" Width="288px"></asp:TextBox> 
                <asp:Button ID="bttBuscarContrato" runat="server" Text="Buscar" onclick="Btn_BuscarContrato_Click" class="boton buscar"/>         
            </td>
        </tr>
        <tr>
            <td class="style5"></td>
            <td class="style4"><span><b>Entidad Contratante :</b></span></td>
            <td class="style4">
                <asp:DropDownList ID="Entidades" runat="server" class="dropdownlist" Height="28px" Width="288px" 
                        DataSourceID="SqlDataSource1" DataTextField="Nombre_Entidad" DataValueField="Id_Entidad_Contratante">
                    </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" 
                        SelectCommand="SELECT [Id_Entidad_Contratante], [Nombre_Entidad] FROM [Entidad_Contratante]">
                    </asp:SqlDataSource> 
                <asp:Button ID="Button1" runat="server" Text="Buscar" onclick="Btn_BuscarEntidad_Click" class="boton buscar"/>         
            </td>
        </tr>
        <tr>
            <td class="style5"></td>
            <td class="style4"><span><b>Productos :</b></span></td>
            <td class="style4">
                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="Opciones" runat="server" class="dropdownlist" AutoPostBack="True" OnSelectedIndexChanged="Opciones_SelectedIndexChanged" Height="28px" Width="288px">
                            <asp:ListItem> -- </asp:ListItem>
                            <asp:ListItem> Asociados a un proyecto </asp:ListItem>
                            <asp:ListItem > Proyectos por productos </asp:ListItem>
                        </asp:DropDownList>
                        <br /><br />
                        <asp:TextBox ID="Tbx_BuscarProductos" class="floatl__input" runat="server" Height="28px" Width="288px"></asp:TextBox>
                        <asp:Button ID="bttBuscarProductos" runat="server" Text="Buscar" onclick="Btn_BuscarProducto_Click" class="boton buscar"/>
                    </ContentTemplate>
                    
                </asp:UpdatePanel>
                      
            </td>
        </tr>
    </table><br /><br />
        <br />
        <br /><br />
        
    </fieldset>
</div>
</asp:Content>

