<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Modificar.master" AutoEventWireup="true" CodeFile="ModInfoGeneral.aspx.cs" Inherits="zModificar_ModInfoGeneral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
    <script src="../dist/sweetalert.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="../dist/sweetalert.css" />
    
    <script type="text/javascript">
        function toggleCard(header) {
            const content = header.nextElementSibling;
            const icon = header.querySelector('.expand-icon');
            
            if (content.style.display === 'none' || content.style.display === '') {
                content.style.display = 'block';
                icon.style.transform = 'rotate(180deg)';
                header.style.background = 'var(--primary-50)';
                header.style.borderColor = 'var(--primary-200)';
            } else {
                content.style.display = 'none';
                icon.style.transform = 'rotate(0deg)';
                header.style.background = 'var(--gray-50)';
                header.style.borderColor = 'var(--gray-100)';
            }
        }
        
        function deleteAlert() {
            swal({
                title: "¿Estás seguro?",
                text: "No será posible deshacer esta acción!",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Sí, bórralo!",
                cancelButtonText: "No, cancelar!",
                closeOnConfirm: false,
                closeOnCancel: false
            }, function (isConfirm) {
                setTimeout(function () {
                    if (isConfirm) {
                        __doPostBack('EliminarProyecto', '');
                    } else {
                        swal("Cancelado", "Tu proyecto está a salvo :)", "error");
                    }
                }, 900)
            });
        }
        
        function Redireccionar() {
            swal({
                title: "Borrado!",
                text: "El proyecto ha sido borrado.",
                type: "success"
            }, function () {
                location.href = '<%= Page.ResolveUrl("~/Modulo_Inicio/Lista.aspx") %>';
                return false;
            });
        }
        
        function warning(message) {
            swal("Advertencia", "El registro VIE ingresado ya existe, ingrese otro por favor.", "warning");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="projects-app">
        <!-- Header -->
        <header class="app-header">
            <div class="header-main">
                <div class="title-section">
                    <h1 class="main-title">
                        <svg class="title-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                  d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z">
                            </path>
                        </svg>
                        INFORMACIÓN GENERAL DEL PROYECTO
                    </h1>
                    <p class="main-subtitle">Gestiona los datos principales organizados por secciones</p>
                </div>
            </div>
        </header>
        
        <!-- Contenido principal con cards expandibles -->
        <main class="projects-main">
            <div class="grid-container">
                <div class="project-card reveal-active" style="height: auto; grid-column: 1 / -1;">
<div class="card-body" style="height: auto; padding: 0; background: white;">
    
    <!-- Control oculto requerido por el código del servidor -->
    <asp:HiddenField ID="regVieHidden" runat="server" 
        OnValueChanged="regVieHidden_ValueChanged" Visible="False" />
    
    <!-- =========================================================
         SECCIÓN 1 · IDENTIFICACIÓN DEL PROYECTO
         ========================================================= -->
    <div class="form-section" style="padding: var(--space-4); border-bottom: 1px solid var(--gray-200);">
        <div class="section-header" style="display: flex; align-items: center; margin-bottom: var(--space-3);">
            <!-- Icono de badge/ID -->
            <div class="section-icon" style="width: 28px; height: 28px; background: linear-gradient(135deg, var(--primary-500), var(--primary-600)); border-radius: var(--radius-lg); display: flex; align-items: center; justify-content: center; margin-right: var(--space-3); box-shadow: var(--shadow-sm); flex-shrink: 0;">
                <svg fill="none" stroke="white" viewBox="0 0 24 24" style="width: 14px; height: 14px; stroke-width: 2; display: block;">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M10 6H5a2 2 0 00-2 2v9a2 2 0 002 2h14a2 2 0 002-2V8a2 2 0 00-2-2h-5m-4 0V5a2 2 0 114 0v1m-4 0a2 2 0 104 0m-5 8a2 2 0 100-4 2 2 0 000 4zm0 0c1.306 0 2.417.835 2.83 2M9 14a3.001 3.001 0 00-6 0" />
                </svg>
            </div>
            <div>
                <h3 style="margin: 0; color: var(--gray-900); font-weight: 700; font-size: var(--text-base); letter-spacing: -0.02em;">I. IDENTIFICACIÓN</h3>
                <p style="margin: 0; color: var(--gray-600); font-size: var(--text-xs); font-weight: 500;">Denominación del proyecto</p>
            </div>
        </div>
        
        <div class="form-content" style="background: white; padding: var(--space-3); border-radius: var(--radius-lg); box-shadow: var(--shadow-xs); border: 1px solid var(--gray-200); display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <label style="display: block; font-weight: 600; color: var(--gray-800); margin-bottom: var(--space-2); font-size: var(--text-xs); text-transform: uppercase; letter-spacing: 0.03em; text-align: center; width: 100%;">Nombre del Proyecto *</label>
            <asp:TextBox ID="Txt_Nombre" runat="server" 
                style="width: 100%; border: 1px solid var(--gray-300); border-radius: var(--radius-lg); padding: var(--space-2) var(--space-3); font-size: var(--text-sm); background: white; transition: all 0.2s ease; font-weight: 500; text-align: center;"
                ValidationGroup="Validar_InfoGeneral" Enabled="False" 
                placeholder="Denominación oficial del proyecto"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="Txt_Nombre" ValidationGroup="Validar_InfoGeneral" 
                style="color: #dc2626; font-weight: 500; font-size: 10px; margin-top: var(--space-1); display: block; background: #fef2f2; padding: var(--space-1); border-radius: 4px; text-align: center; width: 100%;" 
                Text="⚠ Campo obligatorio"></asp:RequiredFieldValidator>
        </div>
    </div>

    <!-- =========================================================
         SECCIÓN 2 · DATOS DE REGISTRO
         ========================================================= -->
    <div class="form-section" style="padding: var(--space-4); border-bottom: 1px solid var(--gray-200); background: white;">
        <div class="section-header" style="display: flex; align-items: center; margin-bottom: var(--space-3);">
            <!-- Icono de carpeta/archivo -->
            <div class="section-icon" style="width: 28px; height: 28px; background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: var(--radius-lg); display: flex; align-items: center; justify-content: center; margin-right: var(--space-3); box-shadow: var(--shadow-sm); flex-shrink: 0;">
                <svg fill="none" stroke="white" viewBox="0 0 24 24" style="width: 14px; height: 14px; stroke-width: 2; display: block;">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M5 8h14M5 8a2 2 0 110-4h4l2 2h5a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4" />
                </svg>
            </div>
            <div>
                <h3 style="margin: 0; color: var(--gray-900); font-weight: 700; font-size: var(--text-base); letter-spacing: -0.02em;">II. REGISTRO FEX.04</h3>
                <p style="margin: 0; color: var(--gray-600); font-size: var(--text-xs); font-weight: 500;">Número VIE y fecha oficial</p>
            </div>
        </div>
        
        <div class="form-content" style="padding: var(--space-3); border-radius: var(--radius-lg); border: 1px solid var(--gray-200); display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: var(--space-3); width: 100%; place-items: center;">
                <!-- Campo: Número VIE -->
                <div style="background: white; padding: var(--space-3); border-radius: var(--radius-lg); border: 1px solid var(--gray-200); display: flex; flex-direction: column; align-items: center; justify-content: center; width: 100%;">
                    <label style="display: block; font-weight: 600; color: var(--gray-800); margin-bottom: var(--space-2); font-size: var(--text-xs); text-transform: uppercase; text-align: center; width: 100%;">Número FEX.04 VIE *</label>
                    <asp:TextBox ID="Txt_RegistroVie" runat="server" 
                        style="width: 100%; border: 1px solid var(--gray-300); border-radius: var(--radius-lg); padding: var(--space-2); font-size: var(--text-sm); text-align: center; font-family: 'SF Mono', monospace; font-weight: 600;"
                        MaxLength="10" Enabled="False" placeholder="000-000"></asp:TextBox>
                    <div style="margin-top: var(--space-1); display: flex; flex-direction: column; align-items: center; gap: var(--space-1); width: 100%;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="Txt_RegistroVie" ValidationGroup="Validar_InfoGeneral" 
                            style="color: #dc2626; font-size: 10px; font-weight: 500; background: #fef2f2; padding: 2px 4px; border-radius: 4px; text-align: center;" 
                            Text="⚠ Requerido"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="Txt_RegistroVie" ValidationExpression="([0-9]|-)*" 
                            ValidationGroup="Validar_InfoGeneral" 
                            style="color: #dc2626; font-size: 10px; font-weight: 500; background: #fef2f2; padding: 2px 4px; border-radius: 4px; text-align: center;" 
                            Text="⚠ Solo números"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <!-- Campo: Fecha de registro -->
                <div style="background: white; padding: var(--space-3); border-radius: var(--radius-lg); border: 1px solid var(--gray-200); display: flex; flex-direction: column; align-items: center; justify-content: center; width: 100%;">
                    <label style="display: block; font-weight: 600; color: var(--gray-800); margin-bottom: var(--space-2); font-size: var(--text-xs); text-transform: uppercase; text-align: center; width: 100%;">Fecha de Registro *</label>
                    <asp:TextBox ID="Txt_fechaVie" runat="server" 
                        style="width: 100%; border: 1px solid var(--gray-300); border-radius: var(--radius-lg); padding: var(--space-2); font-size: var(--text-sm); text-align: center; font-family: 'SF Mono', monospace; font-weight: 600;"
                        placeholder="DD/MM/AAAA" Enabled="False"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender2" runat="server" 
                        TargetControlID="Txt_fechaVie" Format="dd/MM/yyyy"></asp:CalendarExtender>
                    <div style="margin-top: var(--space-1); display: flex; flex-direction: column; align-items: center; gap: var(--space-1); width: 100%;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="Txt_fechaVie" ValidationGroup="Validar_InfoGeneral" 
                            style="color: #dc2626; font-size: 10px; font-weight: 500; background: #fef2f2; padding: 2px 4px; border-radius: 4px; text-align: center;" 
                            Text="⚠ Requerido"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                            ControlToValidate="Txt_fechaVie" ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" 
                            ValidationGroup="Validar_InfoGeneral" 
                            style="color: #dc2626; font-size: 10px; font-weight: 500; background: #fef2f2; padding: 2px 4px; border-radius: 4px; text-align: center;" 
                            Text="⚠ Formato inválido"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- =========================================================
         SECCIÓN 3 · INFORMACIÓN FINANCIERA
         ========================================================= -->
    <div class="form-section" style="padding: var(--space-4);">
        <div class="section-header" style="display: flex; align-items: center; margin-bottom: var(--space-3);">
            <!-- Icono de gráfico/analítica -->
            <div class="section-icon" style="width: 28px; height: 28px; background: linear-gradient(135deg, #059669, #047857); border-radius: var(--radius-lg); display: flex; align-items: center; justify-content: center; margin-right: var(--space-3); box-shadow: var(--shadow-sm); flex-shrink: 0;">
                <svg fill="none" stroke="white" viewBox="0 0 24 24" style="width: 14px; height: 14px; stroke-width: 2; display: block;">
                    <path stroke-linecap="round" stroke-linejoin="round"
                          d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
                </svg>
            </div>
            <div>
                <h3 style="margin: 0; color: var(--gray-900); font-weight: 700; font-size: var(--text-base); letter-spacing: -0.02em;">III. PRESUPUESTO</h3>
                <p style="margin: 0; color: var(--gray-600); font-size: var(--text-xs); font-weight: 500;">Valor total autorizado</p>
            </div>
        </div>
        
        <div class="form-content" style="background: white; padding: var(--space-3); border-radius: var(--radius-lg); border: 1px solid var(--gray-200); display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <label style="display: block; font-weight: 600; color: var(--gray-800); margin-bottom: var(--space-2); font-size: var(--text-xs); text-transform: uppercase; text-align: center; width: 100%;">Valor Total (COP) *</label>
            <div style="position: relative; width: 100%; display: flex; justify-content: center;">
                <span style="position: absolute; left: var(--space-2); top: 50%; transform: translateY(-50%); font-size: var(--text-base); font-weight: 700; color: #059669; z-index: 1;">$</span>
                <asp:TextBox ID="Txt_Valor" runat="server" 
                    style="width: 100%; border: 1px solid var(--gray-300); border-radius: var(--radius-lg); padding: var(--space-2) var(--space-2) var(--space-2) var(--space-4); font-size: var(--text-base); text-align: center; font-family: 'SF Mono', monospace; font-weight: 700; color: #059669; background: #f0fdf4;"
                    MaxLength="15" Enabled="False" placeholder="0,000,000"></asp:TextBox>
            </div>
            <div style="margin-top: var(--space-1); display: flex; flex-direction: column; align-items: center; gap: var(--space-1); width: 100%;">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="Txt_Valor" ValidationGroup="Validar_InfoGeneral" 
                    style="color: #dc2626; font-size: 10px; font-weight: 500; background: #fef2f2; padding: 2px 4px; border-radius: 4px; text-align: center;" 
                    Text="⚠ Requerido"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="Txt_Valor" ValidationExpression="[0-9]+" 
                    ValidationGroup="Validar_InfoGeneral" 
                    style="color: #dc2626; font-size: 10px; font-weight: 500; background: #fef2f2; padding: 2px 4px; border-radius: 4px; text-align: center;" 
                    Text="⚠ Solo números"></asp:RegularExpressionValidator>
            </div>
        </div>
    </div>
</div>




                    
                    <!-- Botones de acción -->
                    <div class="card-actions" style="display: flex; justify-content: center; gap: var(--space-3); padding: var(--space-5);">
                        <asp:LinkButton ID="Btn_Modificar" runat="server" 
                            OnClick="Btn_Modificar_Click" CssClass="btn btn-secondary">
                            <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                      d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z">
                                </path>
                            </svg>
                            Modificar
                        </asp:LinkButton>
                        
                        <asp:LinkButton ID="Btn_Actualizar" runat="server" 
                            ValidationGroup="Validar_InfoGeneral" OnClick="Btn_Actualizar_Click" 
                            Enabled="False" CssClass="btn btn-primary">
                            <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                      d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15">
                                </path>
                            </svg>
                            Actualizar
                        </asp:LinkButton>
                        
                        <asp:LinkButton ID="Btn_Enviar_Form_Usuario0" runat="server" 
                            OnClick="Btn_Terminar_Click" CssClass="btn btn-secondary">
                            <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                      d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z">
                                </path>
                            </svg>
                            Terminar
                        </asp:LinkButton>
                        
                        <asp:LinkButton ID="Btn_Eliminar_Proyecto" runat="server" 
                            OnClick="Btn_Eliminar_Click" CssClass="btn btn-export" 
                            OnClientClick="deleteAlert(); return false;">
                            <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                      d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                                </path>
                            </svg>
                            Eliminar
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </main>
    </div>
    
    <script src="../Scripts/MarcadeAgua2.js" type="text/javascript"></script>
</asp:Content>
