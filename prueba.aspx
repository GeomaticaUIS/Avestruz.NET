<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="prueba.aspx.cs" Inherits="prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%" >
            <tr>
                <td class="style4">
                    &nbsp;</td>
                <td align="right">
                    <asp:Button ID="Exportar" runat="server" OnClick="Exportar_Click" Text="Exportar" />
                    &nbsp;</td>
            </tr>
        </table><br /><br />
        <h1 style="text-align:center">PROYECTOS</h1><br />
    <br />
    <asp:Panel ID="Panel1" runat="server">
        <asp:GridView ID="Lista_Grid" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id_Proyecto" DataSourceID="Lista" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id_Proyecto" HeaderText="Id_Proyecto" InsertVisible="False" ReadOnly="True" SortExpression="Id_Proyecto" />
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Registro_VIE" HeaderText="Registro_VIE" SortExpression="Registro_VIE" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        </asp:GridView>
        <asp:SqlDataSource ID="Lista" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" SelectCommand="SELECT [Id_Proyecto], [Nombre], [Registro_VIE] FROM [Proyectos] ORDER BY [Id_Proyecto] DESC"></asp:SqlDataSource>
    </asp:Panel>
    <br />
        <div align="center">
        <br />


        
        
    </div>       
</asp:Content>
