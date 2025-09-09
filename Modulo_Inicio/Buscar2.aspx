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
        <header class="app-header">
            <div class="header-main">
                <div class="title-section">
                    <h1 class="main-title">
                        <svg class="title-icon" width="24" height="24" fill="none" stroke="currentColor" viewbox="0 0 24 24" stroke-width="2">
                            <circle cx="11" cy="11" r="8" />
                            <path d="M21 21l-4.35-4.35" />
                        </svg>
                        Búsqueda de Proyectos
                    </h1>
                    <p class="main-subtitle">encuentre proyectos por nombre, contrato o entidad</p>
                </div>
            </div>
            <div class="toolbar">
                <div class="search-section">
                    <div class="search-box">
                        <svg class="search-icon" width="20" height="20" fill="none" stroke="currentColor" viewbox="0 0 24 24" stroke-width="2">
                            <circle cx="11" cy="11" r="8" />
                            <path d="M21 21l-4.35-4.35" />
                        </svg>
                        <asp:TextBox ID="Txt_Buscar" placeholder="Buscar por nombre..."
                            class="search-input" runat="server" OnTextChanged="Txt_Buscar_TextChanged"></asp:TextBox>
                    </div>
                    <asp:Button ID="Btn_Buscar" class="btn btn-search" runat="server"
                        Text="Buscar" OnClick="Btn_Mostrar_Click" />
                </div>
            </div>
            <!-- Badge independiente -->
            <asp:Label ID="txtBusqueda" runat="server" Text="Label"
                class="detail-label" Style="display: block; text-align: center; margin: 16px 0; font-size: 12px; color: #1e40af; background: #f0f9ff; padding: 8px 16px; border-radius: 8px; max-width: fit-content; margin-left: auto; margin-right: auto;"></asp:Label>
        </header>

        <main class="projects-main">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="Id_Proyecto"
                DataSourceID="SqlDataSource1" OnDataBound="ListView1_DataBound">
                <EmptyDataTemplate>
                    <div class="empty-container">
                        <div class="empty-illustration">
                            <svg width="64" height="64" fill="none" stroke="currentColor" viewbox="0 0 24 24" stroke-width="2">
                                <circle cx="11" cy="11" r="8" />
                                <path d="M21 21l-4.35-4.35" />
                            </svg>
                        </div>
                        <h3 class="empty-title">No se encontraron proyectos</h3>
                        <p class="empty-description">No hay proyectos que coincidan con tu búsqueda actual. Intenta con otros términos.</p>
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
                                        <svg width="16" height="16" fill="none" stroke="currentColor" viewbox="0 0 24 24" stroke-width="2">
                                            <path d="M12 2L2 7L12 12L22 7L12 2Z" />
                                            <path d="M2 17L12 22L22 17" />
                                            <path d="M2 12L12 17L22 12" />
                                        </svg>
                                    </div>
                                    <div class="detail-content">
                                        <span class="detail-label">ID Proyecto</span>
                                        <span class="detail-value"><%# Eval("Id_Proyecto") %></span>
                                    </div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-icon">
                                        <svg width="16" height="16" fill="none" stroke="currentColor" viewbox="0 0 24 24" stroke-width="2">
                                            <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
                                            <polyline points="14,2 14,8 20,8" />
                                            <line x1="16" y1="13" x2="8" y2="13" />
                                            <line x1="16" y1="17" x2="8" y2="17" />
                                            <polyline points="10,9 9,9 8,9" />
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
                                        <svg width="16" height="16" fill="none" stroke="currentColor" viewbox="0 0 24 24" stroke-width="2">
                                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2" />
                                            <line x1="16" y1="2" x2="16" y2="6" />
                                            <line x1="8" y1="2" x2="8" y2="6" />
                                            <line x1="3" y1="10" x2="21" y2="10" />
                                        </svg>
                                    </div>
                                    <div class="detail-content">
                                        <span class="detail-label">Fecha de Registro</span>
                                        <span class="detail-value"><%# Eval("Fecha_Registro_VIE", "{0:dd/MM/yyyy}") %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-actions">
                            <asp:LinkButton ID="VerProyecto" class="btn btn-secondary btn-view"
                                runat="server" OnClick="VerProyecto_Click">
                                <span class="btn-content">
                                    <svg class="btn-icon" width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
                                        <circle cx="12" cy="12" r="3"/>
                                    </svg>
                                    Ver Detalles
                                </span>
                            </asp:LinkButton>
                            <asp:LinkButton ID="EditarProyecto" class="btn btn-primary btn-edit"
                                runat="server" OnClick="EditarProyecto_Click">
                                <span class="btn-content">
                                    <svg class="btn-icon" width="16" height="16" fill="none" stroke="currentColor" viewBox="0 0 24 24" stroke-width="2">
                                        <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"/>
                                        <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"/>
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
            SelectCommand="SELECT Proyectos.Id_Proyecto, Proyectos.Nombre, Proyectos.Registro_VIE, Proyectos.Fecha_Registro_VIE
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
