<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModInfoGeneral.aspx.cs" Inherits="zModificar_ModInfoGeneral" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
            .style1 {
                width: 110px;
            }

            .style3 {
                width: 122px;
            }

            .style6 {
                width: 90px;
            }

            .style7 {
                width: 73px;
            }

            .style9 {
                width: 90px;
            }

            td {
                padding: 4px;
            }

            .main {
                padding: 93px 0px;
            }
        </style>
        <link href="../Styles/Lista.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css" />
        <script src="../dist/sweetalert.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../dist/sweetalert.css" />
        <script type="text/javascript">
            function deleteAlert() {
                swal({
                    title: "¿Estas seguro?",
                    text: "No sera posible deshacer esta accion!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Si, borralo!",
                    cancelButtonText: "No, cancelar!",
                    closeOnConfirm: false,
                    closeOnCancel: false
                }, function (isConfirm) {
                    setTimeout(function () {
                        if (isConfirm) {
                            __doPostBack('EliminarProyecto', '');
                        } else {
                            swal("Cancelado", "Tu proyecto esta a salvo :)", "error");
                        }
                    }, 900)
                });
            }
            function Redireccionar() {
                swal({
                    title: "Borrado!",
                    text: "El proyecto ha sido borrado.",
                    type: "success"
                },
                    function () {
                        location.href = '<%= Page.ResolveUrl("~/Modulo_Inicio/Lista.aspx") %>';
                        return false;
                    });
            }
            function warning(message) {
                aler("El registro VIE ingresado ya existe, ingrese otro por favor.");
                //__doPostBack('guardarRegVie',dato);
            }
        </script>
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div align="center">

            <fieldset>
                <br />
                <h1>INFORMACION GENERAL DEL PROYECTO</h1>
                <br />
                <br />
                <br />
                <br />
                <br />
                <table style="width: 905px">
                    <tr>
                        <td class="style6"></td>
                        <td style="text-align: left" class="style9">
                            <span>
                                <b>Nombre :</b>
                            </span>
                        </td>
                        <td colspan="5" style="text-align: left">
                            <asp:TextBox ID="Txt_Nombre" class="floatl__input" runat="server" Height="30px" Width="584px" ValidationGroup="Validar_InfoGeneral"
                                Enabled="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Txt_Nombre"
                                ValidationGroup="Validar_InfoGeneral" ForeColor="#CC0000">
                                <b>*</b>
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6"></td>
                        <td style="text-align: left" class="style9">
                            <span>
                                <b>FEX.04 VIE :</b>
                            </span>
                        </td>
                        <td style="text-align: left" class="style6">
                            <asp:TextBox ID="Txt_RegistroVie" class="floatl__input" runat="server" Height="30px" Width="57px"
                                MaxLength="10" Enabled="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Txt_RegistroVie" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="Validar_InfoGeneral" ForeColor="Red">
                                <b>*</b>
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txt_RegistroVie" ErrorMessage="Solo valores numericos"
                                ValidationExpression="([0-9]|-)*" ValidationGroup="Validar_InfoGeneral">
                                <b>*</b>
                            </asp:RegularExpressionValidator>
                        </td>
                        <td style="text-align: left" class="style3">
                            <span>
                                <b>Fecha FEX.04 VIE :</b>
                            </span>
                        </td>
                        <td style="text-align: left" class="style1">
                            <asp:TextBox ID="Txt_fechaVie" runat="server" class="floatl__input" Height="30px" Width="80px" placeholder="día/mes/año"
                                Enabled="False"></asp:TextBox>
                            <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="Txt_fechaVie" Format="dd/MM/yyyy"></asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Txt_fechaVie" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="Validar_InfoGeneral" ForeColor="Red">
                                <b>*</b>
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Txt_fechaVie" ErrorMessage="Fecha Invalida"
                                ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ValidationGroup="Validar_InfoGeneral">
                                <b>*</b>
                            </asp:RegularExpressionValidator>
                        </td>
                        <td style="text-align: left" class="style7">&nbsp;&nbsp;&nbsp;&nbsp;
                            <span>
                                <b>Valor :</b>
                            </span>
                        </td>
                        <td style="text-align: left">
                            <asp:TextBox ID="Txt_Valor" runat="server" Height="30px" Width="191px" class="floatl__input" ValidationGroup="Validar_InfoGeneral"
                                MaxLength="15" Enabled="False"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Txt_Valor" ErrorMessage="RequiredFieldValidator"
                                ValidationGroup="Validar_InfoGeneral" ForeColor="Red">
                                <b>*</b>
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txt_Valor" ErrorMessage=""
                                ValidationExpression="[0-9]+" ValidationGroup="Validar_InfoGeneral">
                                <b>*</b>
                            </asp:RegularExpressionValidator>
                        </td>

                    </tr>

                </table>
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:HiddenField ID="regVieHidden" runat="server" OnValueChanged="regVieHidden_ValueChanged" Visible="False" />
                <br />
                <br />
                <asp:Button ID="Btn_Modificar" runat="server" Text="Modificar" onclick="Btn_Modificar_Click" class="boton buscar" />
                <asp:Button ID="Btn_Actualizar" runat="server" Text="Actualizar" ValidationGroup="Validar_InfoGeneral" onclick="Btn_Actualizar_Click"
                    Enabled="False" class="boton buscar" />
                <asp:Button ID="Btn_Enviar_Form_Usuario0" runat="server" Text="Terminar" onclick="Btn_Terminar_Click" class="boton buscar"
                />
                <asp:Button ID="Btn_Eliminar_Proyecto" runat="server" Text="Eliminar" onclick="Btn_Eliminar_Click" class="boton buscar" />

            </fieldset>
        </div>
        <script src="../Scripts/MarcadeAgua2.js" type="text/javascript"></script>
    </asp:Content>