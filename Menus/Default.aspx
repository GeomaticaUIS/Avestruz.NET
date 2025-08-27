<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Menus_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
    <!-- Latest compiled and minified JavaScript -->
    
    <!--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="../js/jquery.js" type="text/javascript"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="" />
    <meta name="author" content="" />
    <style>
        .label_user{
                position: relative;
                top: 15.2px;
                left: 9px;
        }
        .navbar{
            width: 960px;
            background-color: #fff;
            margin: 20px auto 0px auto;
            border: 1px solid #496077;
        }
    </style>
<title></title>
</head>
<body role="document" >
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Proyectos Geomatica</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse" aria-expanded="false" style="height: 0.909091px;">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Inicio</a></li>
             <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Proyectos <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Nuevo Proyecto</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Opciones</li>
                <li><a href="#">Consultar</a></li>
                <li><a href="#">Modificar</a></li>
              </ul>
            </li>
            <li><a href="#about">Buscar</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Otros <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Entidades y Colaboradores</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Usuarios</a></li>
              </ul>
            </li>
          </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="http://themes.getbootstrap.com" onclick="#">Salir</a></li>
                <asp:Label ID="lbl_usuario" class="label_user" ForeColor="#9D9D9D" runat="server" Text="">en mantenimiento</asp:Label>
            </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" ></script>
</body>
</html>
