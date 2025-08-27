<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Modulo_Inicio_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Ejemplo 2: Gridview moderno y funcional maquetado con Bootstrap</h3>
            <p>&nbsp;En este ejemplo, vamos a gestionar la tabla Clientes de la BD Northwind, mediante un control de servidor <strong>Gridview</strong>.</p>
            <h3>
                <span style="float: left;">
                    <asp:Label ID="lblInfo" runat="server" /></span>
                <span style="float: right;"><small>Total clientes:</small>
                    <asp:Label ID="lblTotalClientes" runat="server" CssClass="label label-warning" /></span>
            </h3>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <asp:GridView ID="GridView_Usuarios" runat="server" DataSourceID="SqlDataSource1"
                AutoGenerateColumns="False"
                CssClass="table table-bordered bs-table"
                DataKeyNames="Id_Usuario"
                OnRowDeleted="GridView_Clientes_RowDeleted"
                OnRowUpdated="GridView_Clientes_RowUpdated"
                OnRowEditing="GridView_Clientes_RowEditing"
                OnDataBound="GridView_Clientes_DataBound"
                AllowPaging="true">

                <HeaderStyle BackColor="#337ab7" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#ffffcc" />
                <EmptyDataRowStyle ForeColor="Red" CssClass="table table-bordered" />
                <EmptyDataTemplate>
                    ¡No hay Usuarios!  
                </EmptyDataTemplate>

                <%--Paginador...--%>
                <PagerTemplate>
                    <div class="row" style="margin-top: 20px;">
                        <div class="col-lg-1" style="text-align: right;">
                            <h5>
                                <asp:Label ID="MessageLabel" Text="Ir a la pág." runat="server" /></h5>
                        </div>
                        <div class="col-lg-1" style="text-align: left;">
                            <asp:DropDownList ID="PageDropDownList" Width="50px" AutoPostBack="true" OnSelectedIndexChanged="PageDropDownList_SelectedIndexChanged" runat="server" CssClass="form-control" /></h3>
                        </div>
                        <div class="col-lg-10" style="text-align: right;">
                            <h3>
                                <asp:Label ID="CurrentPageLabel" runat="server" CssClass="label label-warning" /></h3>
                        </div>
                    </div>
                </PagerTemplate>

                <Columns>
                    <%--CheckBox para seleccionar varios registros...--%>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70px">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkEliminar" runat="server" AutoPostBack="true" OnCheckedChanged="chk_OnCheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--botones de acción sobre los registros...--%>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="200px">
                        <ItemTemplate>
                            <%--Botones de eliminar y editar cliente...--%>
                            <asp:Button ID="btnDelete" runat="server" Text="Quitar" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('¿Eliminar cliente?');" />
                            <asp:Button ID="btnEdit" runat="server" Text="Editar" CssClass="btn btn-info" CommandName="Edit" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <%--Botones de grabar y cancelar la edición de registro...--%>
                            <asp:Button ID="btnUpdate" runat="server" Text="Grabar" CssClass="btn btn-success" CommandName="Update" OnClientClick="return confirm('¿Seguro que quiere modificar los datos del cliente?');" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancelar" CssClass="btn btn-default" CommandName="Cancel" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <%--campos no editables...--%>
                    <asp:BoundField DataField="Id_Usuario" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id_Usuario" />
                    <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                    <asp:BoundField DataField="Correo_Electronico" HeaderText="Correo_Electronico" SortExpression="Correo_Electronico" />
                    <!--<asp:BoundField DataField="ClienteID" HeaderText="Nº" InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" ControlStyle-Width="70px" />
                    <asp:BoundField DataField="CustomerID" HeaderText="Cód." InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" ControlStyle-Width="70px" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Compañía" ReadOnly="True" SortExpression="CompanyName" ControlStyle-Width="300px" />
                    <asp:BoundField DataField="Country" HeaderText="Pais" ReadOnly="True" SortExpression="Country" />-->

                    <%--campos editables...--%>
                    <asp:TemplateField HeaderText="ROL" SortExpression="Id_Rol">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="ListaRolUsuario" DataTextField="Nombre_Rol" DataValueField="Id_Rol" SelectedValue='<%# Bind("Id_Rol") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="ListaRolUsuario" DataTextField="Nombre_Rol" DataValueField="Id_Rol" Enabled="False" SelectedValue='<%# Bind("Id_Rol") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- fin de campos copiados (Usuarios.aspx) --%>
                    <!--<asp:TemplateField HeaderStyle-Width="300px" HeaderText="Contacto">
                        <ItemTemplate>
                            <asp:Label ID="lblContactName" runat="server"><%# Eval("ContactName")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtContactName" runat="server" Text='<%# Bind("ContactName")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderStyle-Width="150px" HeaderText="Teléfono">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server"><%# Eval("Phone")%></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtPhone" runat="server" Text='<%# Bind("Phone")%>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>-->
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                <%--
                DeleteCommand="DELETE FROM [Clientes] WHERE [ClienteID] = @ClienteID"
                SelectCommand="SELECT * FROM [Clientes]"
                UpdateCommand="UPDATE [Clientes] SET [ContactName] = @ContactName, [Phone] = @Phone WHERE [ClienteID] = @ClienteID" 
                --%>
                DeleteCommand="DELETE FROM [Usuarios] WHERE [Id_Usuario] = @original_Id_Usuario AND [Id_Rol] = @original_Id_Rol AND [Username] = @original_Username AND [Nombre] = @original_Nombre AND [Apellido] = @original_Apellido AND [Correo_Electronico] = @original_Correo_Electronico"
                SelectCommand="SELECT [Id_Usuario], [Id_Rol], [Username], [Nombre], [Apellido], [Correo_Electronico] FROM [Usuarios] ORDER BY [Id_Usuario], [Nombre], [Apellido]"
                UpdateCommand="UPDATE [Usuarios] SET [Id_Rol] = @Id_Rol, [Username] = @Username, [Nombre] = @Nombre, [Apellido] = @Apellido, [Correo_Electronico] = @Correo_Electronico WHERE [Id_Usuario] = @original_Id_Usuario AND [Id_Rol] = @original_Id_Rol AND [Username] = @original_Username AND [Nombre] = @original_Nombre AND [Apellido] = @original_Apellido AND [Correo_Electronico] = @original_Correo_Electronico">
                <!--<DeleteParameters>
                    <asp:Parameter Name="ClienteID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ContactName" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                </UpdateParameters>-->
                <DeleteParameters>
                    <asp:Parameter Name="original_Id_Usuario" Type="Int32" />
                    <asp:Parameter Name="original_Id_Rol" Type="Int32" />
                    <asp:Parameter Name="original_Username" Type="String" />
                    <asp:Parameter Name="original_Nombre" Type="String" />
                    <asp:Parameter Name="original_Apellido" Type="String" />
                    <asp:Parameter Name="original_Correo_Electronico" Type="String" />
                </DeleteParameters>
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
            <p style="text-align: center;">
                <asp:LinkButton ID="btnQuitarSeleccionados" runat="server" CssClass="btn btn-lg btn-danger disabled" OnClientClick="return confirm('¿Quitar cliente/s de la lista?');"><span class="glyphicon glyphicon-trash"></span>&nbsp; Quitar Clientes seleccionados</asp:LinkButton>
            </p>
        </div>
    </form>
</body>
</html>
