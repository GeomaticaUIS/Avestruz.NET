<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="InformeProyectos2.aspx.cs" Inherits="Modulo_Inicio_InformeProyectos2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center"><br />
   <h1>Proyectos no Contratados</h1><br /><br /><br />
        <asp:GridView ID="GV2" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderText=" Nombre del Proyecto" ControlStyle-Width="620px">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("nombreProyecto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Registro VIE" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="120px">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("Fex_VIE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Fecha VIE " ItemStyle-HorizontalAlign="Center" ControlStyle-Width="120px">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("Fecha_VIE") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           </Columns>
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            
        </asp:GridView>
    </div> 
</asp:Content>

