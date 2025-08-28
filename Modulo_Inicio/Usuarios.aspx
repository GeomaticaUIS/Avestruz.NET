<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Usuarios.aspx.cs" Inherits="Usuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
    <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
    <script defer="defer" type="text/javascript" src="https://code.getmdl.io/1.1.3/material.min.js"></script>
    <link href="../Styles/Lista.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center">
        <fieldset>
            <h1>Añadir Usuario</h1>
            <br />
            <br />
            <table style="width: 916px">
                <tr>
                    <td class="style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td style="text-align: left" class="style9">
                        <asp:Label ID="Label3" runat="server" Text=""><b>Nombre :</b></asp:Label>
                    </td>
                    <td style="text-align: left" class="style10">
                        <asp:TextBox ID="Txt_Nombre" runat="server" Width="180px" class="floatl__input" Height="5px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Nombre"
                            ValidationGroup="ValidarUsuario" ForeColor="#CC0000"><b>*</b></asp:RequiredFieldValidator>
                    </td>
                    <td style="text-align: left" class="style11">
                        <asp:Label ID="Label4" runat="server" Text=""><b>Apellido :</b></asp:Label>
                    </td>
                    <td style="text-align: left" class="style12">
                        <asp:TextBox ID="Txt_Apellido" runat="server" Width="180px" Height="5px" class="floatl__input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Apellido"
                            ValidationGroup="ValidarUsuario" ForeColor="#CC0000"><b>*</b></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td style="text-align: left" class="style9">
                        <asp:Label ID="Label5" runat="server" Text=""><b>Nombre de Usuario :</b></asp:Label>
                    </td>
                    <td class="style10" style="text-align: left">
                        <asp:TextBox ID="Txt_Usuario" runat="server" Width="180px" Height="5px" class="floatl__input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Usuario"
                            ValidationGroup="ValidarUsuario" ForeColor="#CC0000"><b>*</b></asp:RequiredFieldValidator>
                    </td>
                    <td style="text-align: left" class="style11">
                        <asp:Label ID="Label6" runat="server" Text=""><b>Contraseña :</b></asp:Label>
                    </td>
                    <td class="style12" style="text-align: left">
                        <asp:TextBox ID="txt_contraseña" runat="server" TextMode="Password"
                            Width="180px" Height="5px" class="floatl__input"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                            runat="server" ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txt_contraseña" ForeColor="#CC0000"
                            ValidationGroup="ValidarUsuario"><b>*</b></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td style="text-align: left" class="style7">
                        <asp:Label ID="Label1" runat="server" Text="Cargo :"><b>Rol :</b></asp:Label>
                    </td>
                    <td style="text-align: left" class="style4">
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            DataSourceID="SqlDataSource1" DataTextField="Nombre_Rol"
                            DataValueField="Id_Rol" Height="24px" Width="181px" class="dropdownlist">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                            SelectCommand="SELECT [Id_Rol], [Nombre_Rol] FROM [Rol]"></asp:SqlDataSource>
                    </td>
                    <td style="text-align: left" class="style6">
                        <asp:Label ID="Label2" runat="server" Text=""><b>Correo electronico :</b></asp:Label>
                    </td>
                    <td style="text-align: left" class="style1">
                        <asp:TextBox ID="Txt_Correo" runat="server" Width="180px" Height="5px" class="floatl__input"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Correo"
                            ForeColor="#CC0000" ValidationGroup="ValidarUsuario"><b>*</b></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lbl_mens" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Btn_Crear_Usuario" Text="Crear Usuario" runat="server" OnClick="Btn_Crear_Usuario_Click" ValidationGroup="ValidarUsuario" class="mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect" />
            <br />
        </fieldset>
        <fieldset>
            <h1>Editar Usuario</h1>
            <br />
            <span style="float: left;"><asp:Label ID="lblInfo" runat="server" /></span>
            
            <asp:GridView ID="GridView_Usuarios" runat="server" DataSourceID="ListaUsuarios"
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
                    <asp:BoundField DataField="Username" HeaderText="Usuario" SortExpression="Username" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="Apellido" />
                    <asp:BoundField DataField="Correo_Electronico" HeaderText="Correo Electronico" SortExpression="Correo_Electronico" />

                    <%--campos editables...--%>
                    <asp:TemplateField HeaderText="ROL" SortExpression="Id_Rol">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" CssClass="dropdownlist" runat="server" DataSourceID="ListaRolUsuario" DataTextField="Nombre_Rol" DataValueField="Id_Rol" SelectedValue='<%# Bind("Id_Rol") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" CssClass="dropdownlist" runat="server" DataSourceID="ListaRolUsuario" DataTextField="Nombre_Rol" DataValueField="Id_Rol" Enabled="False" SelectedValue='<%# Bind("Id_Rol") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="ListaUsuarios" runat="server"
                ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
                DeleteCommand="DELETE FROM [Usuarios] WHERE [Id_Usuario] = @Id_Usuario"
                SelectCommand="SELECT [Id_Usuario], [Id_Rol], [Username], [Nombre], [Apellido], [Correo_Electronico] FROM [Usuarios] ORDER BY [Id_Usuario], [Nombre], [Apellido]"
                UpdateCommand="UPDATE [Usuarios] SET [Id_Rol] = @Id_Rol, [Username] = @Username, [Nombre] = @Nombre, [Apellido] = @Apellido, [Correo_Electronico] = @Correo_Electronico WHERE [Id_Usuario] = @Id_Usuario">
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
            <asp:SqlDataSource ID="ListaRolUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>" SelectCommand="SELECT [Id_Rol], [Nombre_Rol] FROM [Rol] ORDER BY [Id_Rol]"></asp:SqlDataSource>
            <!--<p style="text-align: center;">
                <asp:LinkButton ID="btnQuitarSeleccionados" runat="server" CssClass="btn btn-lg btn-danger disabled" OnClientClick="return confirm('¿Quitar cliente/s de la lista?');"><span class="glyphicon glyphicon-trash"></span>&nbsp; Quitar Clientes seleccionados</asp:LinkButton>
            </p>-->

            <!--<%--CheckBox para seleccionar varios registros...--%>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="70px">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkEliminar" runat="server" AutoPostBack="true" OnCheckedChanged="chk_OnCheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>-->


            <br />
            <br />
        </fieldset>

    </div>
</asp:Content>

