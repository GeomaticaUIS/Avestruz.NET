<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="ModificarUsuario.aspx.cs" Inherits="Modulo_Modificar_ModificarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        text-align: center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        &nbsp;<asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
            <fieldset>
                <h1 class="auto-style1">Editar Usuario</h1>
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id_Usuario" DataSourceID="ListaUsuarios" EnableModelValidation="True" PageSize="5" CellPadding="4" ForeColor="#333333" GridLines="Horizontal" style="text-align: center; margin-top: 0px;" Width="912px" BorderWidth="0px" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" InsertVisible="False" ReadOnly="True" SortExpression="Id_Usuario" />
                        <asp:TemplateField HeaderText="Id_Rol" SortExpression="Id_Rol">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="ListaRolUsuario" DataTextField="Nombre_Rol" DataValueField="Id_Rol" SelectedValue='<%# Bind("Id_Rol") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ListaRolUsuario" DataTextField="Nombre_Rol" DataValueField="Id_Rol" Enabled="False" SelectedValue='<%# Bind("Id_Rol") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                        <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                        <asp:BoundField DataField="Correo_Electronico" HeaderText="Correo_Electronico" SortExpression="Correo_Electronico" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <asp:SqlDataSource ID="ListaUsuarios" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" DeleteCommand="DELETE FROM [Usuarios] WHERE [Id_Usuario] = @original_Id_Usuario AND [Id_Rol] = @original_Id_Rol AND [Username] = @original_Username AND [Nombre] = @original_Nombre AND [Apellido] = @original_Apellido AND [Correo_Electronico] = @original_Correo_Electronico" InsertCommand="INSERT INTO [Usuarios] ([Id_Rol], [Username], [Nombre], [Apellido], [Correo_Electronico]) VALUES (@Id_Rol, @Username, @Nombre, @Apellido, @Correo_Electronico)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Id_Usuario], [Id_Rol], [Username], [Nombre], [Apellido], [Correo_Electronico] FROM [Usuarios] ORDER BY [Id_Usuario], [Nombre], [Apellido]" UpdateCommand="UPDATE [Usuarios] SET [Id_Rol] = @Id_Rol, [Username] = @Username, [Nombre] = @Nombre, [Apellido] = @Apellido, [Correo_Electronico] = @Correo_Electronico WHERE [Id_Usuario] = @original_Id_Usuario AND [Id_Rol] = @original_Id_Rol AND [Username] = @original_Username AND [Nombre] = @original_Nombre AND [Apellido] = @original_Apellido AND [Correo_Electronico] = @original_Correo_Electronico">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Id_Usuario" Type="Int32" />
                        <asp:Parameter Name="original_Id_Rol" Type="Int32" />
                        <asp:Parameter Name="original_Username" Type="String" />
                        <asp:Parameter Name="original_Nombre" Type="String" />
                        <asp:Parameter Name="original_Apellido" Type="String" />
                        <asp:Parameter Name="original_Correo_Electronico" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Id_Rol" Type="Int32" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Apellido" Type="String" />
                        <asp:Parameter Name="Correo_Electronico" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id_Rol" Type="Int32" />
                        <asp:Parameter Name="Username" Type="String" />
                        <asp:Parameter Name="Nombre" Type="String" />
                        <asp:Parameter Name="Apellido" Type="String" />
                        <asp:Parameter Name="Correo_Electronico" Type="String" />
                        <asp:Parameter Name="original_Id_Usuario" Type="Int32" />
                        <asp:Parameter Name="original_Id_Rol" Type="Int32" />
                        <asp:Parameter Name="original_Username" Type="String" />
                        <asp:Parameter Name="original_Nombre" Type="String" />
                        <asp:Parameter Name="original_Apellido" Type="String" />
                        <asp:Parameter Name="original_Correo_Electronico" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="ListaRolUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" SelectCommand="SELECT [Id_Rol], [Nombre_Rol] FROM [Rol] ORDER BY [Id_Rol]"></asp:SqlDataSource>
            </fieldset></asp:Panel>
    
    
</asp:Content>

