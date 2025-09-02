<%@ Page Title="" Language="C#" MasterPageFile="~/Menus/Menu_Inicial.master" AutoEventWireup="true" CodeFile="Buscar2.aspx.cs" Inherits="Modulo_Inicio_Buscar2" %>

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
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            <circle cx="11" cy="11" r="2" fill="currentColor" opacity="0.3" />
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" opacity="0.4"/>
                        </svg>
                        Proyectos de Investigación
                    </h1>
                    <p class="main-subtitle">Busque y administre proyectos por nombre</p>
                </div>
            </div>

            <!-- Toolbar de Búsqueda -->
            <div class="toolbar">
                <div class="search-section">
                    <div class="search-box">
                        <svg class="search-icon" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            <circle cx="11" cy="11" r="2" fill="currentColor" opacity="0.2" />
                        </svg>
                        <asp:TextBox ID="Txt_Buscar" placeholder="Buscar por nombre, registro VIE o entidad..."
                            class="search-input" runat="server" OnTextChanged="Txt_Buscar_TextChanged"></asp:TextBox>
                    </div>
                    <asp:Button ID="Btn_Buscar" class="btn btn-search" runat="server"
                        Text="Buscar" OnClick="Btn_Mostrar_Click" />
                </div>
            </div>

            <!-- Badge de Búsqueda -->
            <div style="text-align: center; margin-top: var(--space-4);">
                <asp:Label ID="txtBusqueda" runat="server" Text="Label" 
                    class="badge" style="background: var(--primary-100); color: var(--primary-700); 
                    padding: var(--space-2) var(--space-4); border-radius: var(--radius-lg); 
                    font-size: var(--text-sm); font-weight: 500;"></asp:Label>
            </div>
        </header>

        <!-- Grid de Proyectos -->
        <main class="projects-main">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto" DataSourceID="SqlDataSource1">
                <EmptyDataTemplate>
                    <div class="empty-container">
                        <div class="empty-illustration">
                            <svg fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                                    d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                                <circle cx="12" cy="12" r="3" fill="none" stroke="currentColor" opacity="0.3" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1"
                                    d="M8 8l8 8M16 8l-8 8" opacity="0.4" />
                            </svg>
                        </div>
                        <h3 class="empty-title">No se encontraron proyectos</h3>
                        <p class="empty-description">No hay proyectos que coincidan con tu búsqueda actual. Intenta con otros términos.</p>
                        <div style="margin-top: var(--space-4);">
                            <button onclick="document.querySelector('.search-input').focus()" class="btn btn-secondary">
                                <svg class="btn-icon" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                                </svg>
                                Nueva Búsqueda
                            </button>
                        </div>
                    </div>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <article class="project-card">
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
                                        <span class="detail-value">
                                            <asp:Label ID="Id_ProyectoLabel" runat="server" Text='<%# Eval("Id_Proyecto") %>' />
                                        </span>
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
                                                d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                                            <circle cx="12" cy="8" r="1" fill="currentColor" opacity="0.6" />
                                        </svg>
                                    </div>
                                    <div class="detail-content">
                                        <span class="detail-label">Estado</span>
                                        <span class="detail-value">Activo</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Acciones de tarjeta -->
                        <div class="card-actions">
                            <asp:Button ID="VerProyecto" class="btn btn-secondary" 
                                runat="server" Text="Ver Detalles" OnClick="VerProyecto_Click" />
                            <asp:Button ID="EditarProyecto" class="btn btn-primary" 
                                runat="server" Text="Editar" OnClick="EditarProyecto_Click" />
                        </div>
                    </article>
                </ItemTemplate>

                <AlternatingItemTemplate>
                    <article class="project-card">
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
                                        <span class="detail-value">
                                            <asp:Label ID="Id_ProyectoLabel" runat="server" Text='<%# Eval("Id_Proyecto") %>' />
                                        </span>
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
                                                d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4" />
                                            <circle cx="12" cy="8" r="1" fill="currentColor" opacity="0.6" />
                                        </svg>
                                    </div>
                                    <div class="detail-content">
                                        <span class="detail-label">Estado</span>
                                        <span class="detail-value">Activo</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Acciones de tarjeta -->
                        <div class="card-actions">
                            <asp:Button ID="VerProyecto" class="btn btn-secondary" 
                                runat="server" Text="Ver Detalles" OnClick="VerProyecto_Click" />
                            <asp:Button ID="EditarProyecto" class="btn btn-primary" 
                                runat="server" Text="Editar" OnClick="EditarProyecto_Click" />
                        </div>
                    </article>
                </AlternatingItemTemplate>

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
            <div class="pagination-info">
                <svg class="info-icon" fill="none" stroke="currentColor" viewbox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                        d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <span class="results-count">Resultados de búsqueda</span>
            </div>
            
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

        <!-- SQL DataSource original mantenido -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:PROYECTOSGEOMATICAConnectionString %>"
            SelectCommand="SELECT Proyectos.Id_Proyecto, Proyectos.Nombre, Proyectos.Registro_VIE 
                       FROM Proyectos full outer join Contrato_Convenio 
                       ON Proyectos.Id_Proyecto = Contrato_Convenio.Id_Proyecto full outer join Entidad_Contratante 
                       ON Contrato_Convenio.Entidad_Contratante = Entidad_Contratante.Id_Entidad_Contratante 
                       WHERE (Proyectos.Nombre LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI) OR (Contrato_Convenio.Nombre LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI) OR (Contrato_Convenio.Objeto LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI) OR (Entidad_Contratante.Nombre_Entidad LIKE '%' + @Nombre + '%' COLLATE SQL_LATIN1_GENERAL_CP1_CI_AI)
                       ORDER BY Proyectos.Id_Proyecto DESC">
            <SelectParameters>
                <asp:SessionParameter Name="Nombre" SessionField="Palabra_Buscar" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <!-- JavaScript para funcionalidades interactivas -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            initializeScrollReveal();
            initializeSearchEnhancements();
            initializeButtonStates();
        });

        // SCROLL REVEAL para las tarjetas
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

            const projectCards = document.querySelectorAll('.project-card');
            projectCards.forEach(card => {
                observer.observe(card);
            });
        }

        // Mejoras de búsqueda
        function initializeSearchEnhancements() {
            const searchInput = document.querySelector('.search-input');
            if (searchInput) {
                // Enter para buscar
                searchInput.addEventListener('keypress', function (e) {
                    if (e.key === 'Enter') {
                        e.preventDefault();
                        document.querySelector('.btn-search')?.click();
                    }
                });

                // Focus automático al cargar si no hay resultados
                if (document.querySelector('.empty-container')) {
                    setTimeout(() => searchInput.focus(), 500);
                }
            }
        }

        // Estados de botones
        function initializeButtonStates() {
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('click', function () {
                    if (!this.classList.contains('loading')) {
                        this.classList.add('loading');
                        this.style.opacity = '0.7';

                        // Restaurar después de 2 segundos
                        setTimeout(() => {
                            this.classList.remove('loading');
                            this.style.opacity = '1';
                        }, 2000);
                    }
                });
            });
        }
    </script>
</asp:Content>
