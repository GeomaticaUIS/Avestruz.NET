<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Lista.aspx.cs" Inherits="Lista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="../Styles/Lista.css" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="projects-app">
        <!-- Header Principal -->
        <header class="app-header">
            <div class="header-main">
                <div class="title-section">
                    <h1 class="main-title">
                        <svg class="title-icon" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.8"
                                d="M3 7v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2H5a2 2 0 00-2 2v-2a2 2 0 012-2h14a2 2 0 012 2v2M3 7l9 6 9-6" />
                            <circle cx="8" cy="13" r="1.5" fill="currentColor" opacity="0.6" />
                            <circle cx="12" cy="15" r="1" fill="currentColor" opacity="0.8" />
                            <circle cx="16" cy="13" r="1.2" fill="currentColor" opacity="0.7" />
                        </svg>
                        Gestión de Proyectos
                    </h1>
                    <p class="main-subtitle">Administre y supervise todos tus proyectos</p>
                </div>
            </div>
            <!-- Toolbar de Acciones Centrado -->
            <div class="toolbar">
                <div class="search-section">
                    <div class="search-box">
                        <svg class="search-icon" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            <circle cx="11" cy="11" r="2" fill="currentColor" opacity="0.2" />
                        </svg>
                        <asp:TextBox ID="Txt_Buscar" placeholder="Buscar por nombre..."
                            class="search-input" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="Btn_Buscar" class="btn btn-search" runat="server"
                        Text="Buscar" OnClick="Btn_Mostrar_Click" />
                    <asp:LinkButton ID="btnExportar" class="btn btn-export" runat="server"
                        OnClick="Exportar_Click">
                <span class="btn-content">
                    <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                              d="M12 10v6m0 0l-3-3m3 3l3-3M3 17V7a2 2 0 012-2h6l2 2h6a2 2 0 012 2v10a2 2 0 01-2 2H5a2 2 0 01-2-2z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                              d="M8 7H5a2 2 0 00-2 2v10a2 2 0 002 2h14a2 2 0 002-2V9a2 2 0 00-2-2h-3" opacity="0.5"/>
                    </svg>
                    Exportar Reporte
                </span>
                    </asp:LinkButton>
                </div>
            </div>
        </header>
        <!-- Grid de Proyectos -->
        <main class="projects-main">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto"
                DataSourceID="SqlDataSource1">
                <EmptyDataTemplate>
                    <div class="empty-container">
                        <div class="empty-illustration">
                            <svg fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                    d="M20 7l-8-4-8 4m16 0l-8 4m8-4v10l-8 4m0-10L4 7m8 4v10M4 7v10l8 4" />
                                <circle cx="12" cy="12" r="2" fill="currentColor" opacity="0.3" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1"
                                    d="M8 8l8 8M16 8l-8 8" opacity="0.4" />
                            </svg>
                        </div>
                        <h3 class="empty-title">No hay proyectos disponibles</h3>
                        <p class="empty-description">No se encontraron proyectos que coincidan con tu búsqueda actual.</p>
                        <button class="btn btn-primary empty-action">
                            <svg class="btn-icon" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 6v6m0 0v6m0-6h6m-6 0H6" />
                            </svg>
                            Crear Nuevo Proyecto
                        </button>
                    </div>
                </EmptyDataTemplate>
                <ItemTemplate>
                    <article class="project-card">
                        <asp:Label ID="Id_ProyectoLabel" runat="server"
                            Text='<%# Eval("Id_Proyecto") %>' Visible="False" />
                        <div class="card-body">
                            <h3 class="project-title">
                                <asp:Label ID="NombreLabel" runat="server" Text='<%# Eval("Nombre") %>' />
                            </h3>
                            <div class="project-details">
                                <div class="detail-row">
                                    <div class="detail-icon">
                                        <svg fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14" />
                                            <circle cx="9" cy="9" r="1" fill="currentColor" />
                                            <circle cx="15" cy="15" r="1" fill="currentColor" />
                                        </svg>
                                    </div>
                                    <div class="detail-content">
                                        <span class="detail-label">ID Proyecto</span>
                                        <span class="detail-value"><%# Eval("Id_Proyecto") %></span>
                                    </div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-icon">
                                        <svg fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M16 5v4a1 1 0 001 1h4" opacity="0.6" />
                                        </svg>
                                    </div>
                                    <div class="detail-content">
                                        <span class="detail-label">Registro VIE</span>
                                        <span class="detail-value">
                                            <asp:Label ID="Registro_VIELabel" runat="server" Text='<%# Eval("Registro_VIE") %>' />
                                        </span>
                                    </div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-icon">
                                        <svg fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                            <circle cx="9" cy="13" r="1" fill="currentColor" />
                                            <circle cx="15" cy="17" r="1" fill="currentColor" />
                                        </svg>
                                    </div>
                                    <div class="detail-content">
                                        <span class="detail-label">Fecha de Registro</span>
                                        <span class="detail-value"><%# Eval("Fecha_Registro_VIE", "{0:dd/MM/yyyy}") %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Acciones de tarjeta -->
                        <div class="card-actions">
                            <asp:LinkButton ID="VerProyecto" class="btn btn-secondary btn-view"
                                runat="server" OnClick="VerProyecto_Click">
                                <span class="btn-content">
                                    <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                              d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                              d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/>
                                    </svg>
                                    Ver Detalles
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="EditarProyecto" class="btn btn-primary btn-edit"
                                runat="server" OnClick="EditarProyecto_Click">
                                <span class="btn-content">
                                    <svg class="btn-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" 
                                              d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z"/>
                                        <circle cx="17" cy="7" r="1" fill="currentColor"/>
                                    </svg>
                                    Editar
                                </span>
                            </asp:LinkButton>
                        </div>
                        <asp:Label ID="Fecha_Registro_VIELabel" runat="server"
                            Text='<%# Eval("Fecha_Registro_VIE") %>' Visible="False" />
                    </article>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="projects-grid">
                        <div class="grid-container">
                            <div id="itemPlaceholder" runat="server"></div>
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </main>
        <!-- Paginación -->
        <footer class="pagination-footer">
            <asp:DataPager ID="Paginado" runat="server" PagedControlID="ListView1" PageSize="12">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Link"
                        FirstPageText="‹‹ Primera"
                        ShowFirstPageButton="true"
                        ShowNextPageButton="false"
                        ShowPreviousPageButton="true"
                        PreviousPageText="‹ Anterior"
                        RenderDisabledButtonsAsLabels="true"
                        ButtonCssClass="pagination-btn" />
                    <asp:NumericPagerField ButtonCount="5"
                        CurrentPageLabelCssClass="pagination-current"
                        NumericButtonCssClass="pagination-number" />
                    <asp:NextPreviousPagerField ButtonType="Link"
                        LastPageText="Última ››"
                        NextPageText="Siguiente ›"
                        ShowLastPageButton="true"
                        ShowNextPageButton="true"
                        ShowPreviousPageButton="false"
                        ButtonCssClass="pagination-btn" />
                </Fields>
            </asp:DataPager>
        </footer>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
            SelectCommand="SELECT [Id_Proyecto], [Nombre], [Registro_VIE], [Fecha_Registro_VIE] FROM [Proyectos] ORDER BY [Id_Proyecto] DESC"></asp:SqlDataSource>
    </div>

    <!-- JavaScript Optimizado para Scroll Reveal -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Inicializar todas las funcionalidades
            initializeScrollReveal();
            initializeScrollableTitles();
            initializeButtonStates();
            initializeSearchEnhancements();
        });

        // SCROLL REVEAL - Funcionalidad principal
        function initializeScrollReveal() {
            const observerOptions = {
                threshold: 0.15,
                rootMargin: '0px 0px -30px 0px'
            };

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('reveal-active');
                        observer.unobserve(entry.target);
                    }
                });
            }, observerOptions);

            // Observar todas las tarjetas
            const projectCards = document.querySelectorAll('.project-card');
            projectCards.forEach(card => {
                observer.observe(card);
            });
        }

        // Títulos con scroll interno
        function initializeScrollableTitles() {
            const titles = document.querySelectorAll('.project-title');
            titles.forEach(title => {
                if (title.scrollHeight > title.clientHeight) {
                    title.setAttribute('data-scrollable', 'true');
                    title.setAttribute('title', title.textContent);
                }
                title.addEventListener('wheel', function (e) {
                    if (this.scrollHeight > this.clientHeight) {
                        e.preventDefault();
                        this.scrollTop += e.deltaY * 0.3;
                    }
                });
            });
        }

        // Estados de botones
        function initializeButtonStates() {
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('click', function () {
                    if (!this.classList.contains('loading')) {
                        this.classList.add('loading');
                        this.style.opacity = '0.7';
                        this.style.pointerEvents = 'none';
                        setTimeout(() => {
                            this.classList.remove('loading');
                            this.style.opacity = '1';
                            this.style.pointerEvents = 'auto';
                        }, 2000);
                    }
                });
            });
        }

        // Mejoras de búsqueda
        function initializeSearchEnhancements() {
            const searchInput = document.querySelector('.search-input');
            if (searchInput) {
                searchInput.addEventListener('keypress', function (e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        document.querySelector('.btn-search')?.click();
                    }
                });
            }
        }
    </script>
</asp:Content>
