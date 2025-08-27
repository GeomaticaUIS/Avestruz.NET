<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title></title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <link href="Styles/Login.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>
    
</head>
<body>
    <div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">PROYECTOS GEOMÁTICA</h1>
            <div class="account-wall">
                <img class="profile-img" src="Img/3030_orig.png"
                    alt="user"/>
                <form class="form-signin" runat="server">
                <asp:ToolkitScriptManager ID="ToolkitScriptManager" runat="server"></asp:ToolkitScriptManager>
                <asp:TextBox ID="txtUsuario" runat="server" type="text" class="form-control" placeholder="Usuario"  autofocus="autofocus"></asp:TextBox>
				<asp:RequiredFieldValidator ID="RFV_login" runat="server" ErrorMessage="*" ControlToValidate="txtUsuario" ValidationGroup="login" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:FilteredTextBoxExtender ID="FTbxE_login" runat="server" TargetControlID="txtUsuario" FilterMode="ValidChars" FilterType="LowercaseLetters,Numbers,Custom" ValidChars="._-" ></asp:FilteredTextBoxExtender>

                <asp:TextBox ID="txtContraseña"  TextMode="Password" runat="server" type="password" class="form-control" placeholder="Contraseña" ></asp:TextBox>
				<asp:RequiredFieldValidator ID="RFV_password" runat="server" ErrorMessage="*" ControlToValidate="txtContraseña" ValidationGroup="login" ForeColor="Red"></asp:RequiredFieldValidator>
                    
                <asp:Button ID="btnIngresar" CausesValidation="true" ValidationGroup="login" runat="server" Text="Ingresar" class="btn btn-lg btn-primary btn-block" type="submit" onclick="btn_ingresar_Click"></asp:Button>
				<asp:LinkButton ID="LinkButton1" runat="server" class="bg-danger btn-warning" ForeColor="#666666" onclick="LinkButton1_Click1"></asp:LinkButton>
                
                </form>
            </div>
           
        </div>
    </div>
</div>
</body>
</html>
