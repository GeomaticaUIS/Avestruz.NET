<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Informe.master" AutoEventWireup="true" CodeFile="InformeProyectos.aspx.cs" Inherits="Modulo_Inicio_InformeProyectos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div align="center">
   <h1>Proyectos Contratados</h1><br />
       
       <asp:GridView ID="GV" runat="server" CellPadding="4" ForeColor="#333333" 
           GridLines="None" AutoGenerateColumns="False">
           <Columns>
            <asp:TemplateField HeaderText=" Nombre" ControlStyle-Width="150px">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("nombreProyecto") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Fecha Suscripción" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("fechaSuscripcionContrato") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Entidad Contratante " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("EntidadContratante") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Objeto del Contrato " ControlStyle-Width="210px">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("ObjetoContrato") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Valor Contratado ">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("ValorContratado") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Plazo Contratado " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("Plazo") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Fecha de Inicio " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("FechadeInicio") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Fecha Final " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("FechaFinal") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Tiempo de Suspension " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("TiempoSuspension") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText=" Tiempo de Ejecución " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("TiempoEjecucion") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText=" Valor Ejecutado " ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label ID="Nombre" runat="server" Text='<%# Eval("ValorEjecutado") %>'></asp:Label>
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

