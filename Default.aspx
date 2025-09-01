<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Proyectos Geomática - Login</title>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="Styles/Login.css" rel="stylesheet" />
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <div class="text-center">
                <div class="logo-container">
                    <img class="profile-img" src="Img/3030_orig.png" alt="Proyectos Geomática" />
                </div>
                <h1 class="login-title">PROYECTOS GEOMÁTICA</h1>
                <p class="login-subtitle">Acceso al sistema</p>
            </div>

            <form class="form-signin" runat="server">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager" runat="server"></asp:ToolkitScriptManager>

                <div class="form-group">
                    <label for="txtUsuario" class="form-label">Usuario</label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control modern-input" placeholder="Ingrese su usuario" autofocus="autofocus"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_login" runat="server" ErrorMessage="El usuario es requerido" ControlToValidate="txtUsuario" ValidationGroup="login" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:FilteredTextBoxExtender ID="FTbxE_login" runat="server" TargetControlID="txtUsuario" FilterMode="ValidChars" FilterType="LowercaseLetters,Numbers,Custom" ValidChars="._-"></asp:FilteredTextBoxExtender>
                </div>

                <div class="form-group">
                    <label for="txtContraseña" class="form-label">Contraseña</label>
                    <asp:TextBox ID="txtContraseña" TextMode="Password" runat="server" CssClass="form-control modern-input" placeholder="Ingrese su contraseña"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_password" runat="server" ErrorMessage="La contraseña es requerida" ControlToValidate="txtContraseña" ValidationGroup="login" CssClass="error-message" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="btnIngresar" CausesValidation="true" ValidationGroup="login" runat="server" Text="Iniciar Sesión" CssClass="btn-login" OnClick="btn_ingresar_Click"></asp:Button>

                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="forgot-password" OnClick="LinkButton1_Click1">¿Olvidaste tu contraseña?</asp:LinkButton>
            </form>
        </div>
    </div>
</body>
</html>
