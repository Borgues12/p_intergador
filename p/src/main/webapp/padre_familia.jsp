<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Usuarios" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IESS - Sistema de Vacunación</title>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/dashboard-styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");
    String nombreCompleto = (String) session.getAttribute("nombreCompleto");

    // Verificar que hay sesión
    if (usuario == null) {
        response.sendRedirect("Controlador?action=login");
        return;
    }
%>

<!-- Header -->
<header class="header">
    <div class="header__brand">
        <div class="logo-circle">
            <div class="heart"></div>
        </div>
        <h1 class="header__appname">IESS Vacunación</h1>
    </div>

    <div class="header__user">
        <div class="user-dropdown">
            <button class="user-dropdown__trigger" id="userDropdown">
                <i class="fas fa-user-circle"></i>
                <span class="user-name"><%= nombreCompleto %></span>
                <i class="fas fa-chevron-down"></i>
            </button>
            <div class="user-dropdown__menu" id="userDropdownMenu">
                <div class="user-dropdown__header">
                    <h4>Mi Perfil</h4>
                </div>
                <div class="user-dropdown__info">
                    <p><strong>Cédula:</strong> <%= usuario.getCedula_usuario() %></p>
                    <p><strong>Email:</strong> <%= usuario.getCorreo() %></p>
                </div>
                <div class="user-dropdown__divider"></div>
                <a href="Controlador?action=logout" class="user-dropdown__item">
                    <i class="fas fa-sign-out-alt"></i>
                    Cerrar Sesión
                </a>
            </div>
        </div>
    </div>
</header>

<!-- Topbar de Bienvenida -->
<div class="topbar">
    <div class="topbar__left">
        <h2 class="topbar__title">
            Hola, <span class="username"><%= nombreCompleto %></span>
        </h2>
        <p class="topbar__subtitle">
            <i class="fas fa-shield-alt"></i>
            Sistema de Control de Vacunación
        </p>
    </div>
    <div class="topbar__right">
        <div class="quick-stats">
            <div class="stat-item">
                <i class="fas fa-baby"></i>
                <span>2 Hijos</span>
            </div>
            <div class="stat-item">
                <i class="fas fa-syringe"></i>
                <span>8 Vacunas</span>
            </div>
            <div class="stat-item">
                <i class="fas fa-calendar-check"></i>
                <span>1 Cita</span>
            </div>
        </div>
    </div>
</div>

<!-- Contenido Principal -->
<div class="main-container">
    <div class="container">
        <!-- Dashboard Grid -->
        <div class="dashboard-grid">
            <!-- Tarjeta: Mis Hijos -->
            <div class="dashboard-card fade-in-up">
                <div class="dashboard-card__icon">
                    <i class="fas fa-baby"></i>
                </div>
                <h3 class="dashboard-card__title">Mis Hijos</h3>
                <p class="dashboard-card__description">
                    Administra los perfiles de tus hijos y consulta sus esquemas de vacunación completos.
                </p>
                <button class="btn btn--primary" onclick="location.href='#'">
                    <i class="fas fa-eye"></i>
                    Ver Perfiles
                </button>
            </div>

            <!-- Tarjeta: Próximas Vacunas -->
            <div class="dashboard-card fade-in-up">
                <div class="dashboard-card__icon dashboard-card__icon--success">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <h3 class="dashboard-card__title">Próximas Vacunas</h3>
                <p class="dashboard-card__description">
                    Revisa las citas programadas y recibe recordatorios automáticos.
                </p>
                <button class="btn btn--primary" onclick="location.href='#'">
                    <i class="fas fa-calendar"></i>
                    Ver Calendario
                </button>
            </div>

            <!-- Tarjeta: Certificados -->
            <div class="dashboard-card fade-in-up">
                <div class="dashboard-card__icon dashboard-card__icon--info">
                    <i class="fas fa-file-medical"></i>
                </div>
                <h3 class="dashboard-card__title">Certificados</h3>
                <p class="dashboard-card__description">
                    Descarga certificados oficiales de vacunación en formato PDF.
                </p>
                <button class="btn btn--primary" onclick="location.href='#'">
                    <i class="fas fa-download"></i>
                    Descargar
                </button>
            </div>

            <!-- Tarjeta: Centros IESS -->
            <div class="dashboard-card fade-in-up">
                <div class="dashboard-card__icon dashboard-card__icon--purple">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <h3 class="dashboard-card__title">Centros IESS</h3>
                <p class="dashboard-card__description">
                    Encuentra los centros de vacunación más cercanos a tu ubicación.
                </p>
                <button class="btn btn--primary" onclick="location.href='#'">
                    <i class="fas fa-search"></i>
                    Buscar Centros
                </button>
            </div>

            <!-- Tarjeta: Próxima Cita -->
            <div class="dashboard-card fade-in-up">
                <div class="dashboard-card__icon dashboard-card__icon--warning">
                    <i class="fas fa-exclamation-triangle"></i>
                </div>
                <h3 class="dashboard-card__title">Próxima Cita</h3>
                <div class="dashboard-card__description">
                    <p><strong>Fecha:</strong> 15 de Julio, 2025</p>
                    <p><strong>Hora:</strong> 10:00 AM</p>
                    <p><strong>Menor:</strong> María Pérez</p>
                    <p><strong>Vacuna:</strong> Hepatitis B (2da dosis)</p>
                    <p><strong>Centro:</strong> IESS Quito Norte</p>
                </div>
                <button class="btn btn--primary" onclick="location.href='#'">
                    <i class="fas fa-calendar-plus"></i>
                    Reprogramar
                </button>
            </div>

            <!-- Tarjeta: Información -->
            <div class="dashboard-card fade-in-up">
                <div class="dashboard-card__icon dashboard-card__icon--orange">
                    <i class="fas fa-info-circle"></i>
                </div>
                <h3 class="dashboard-card__title">Información Importante</h3>
                <div class="dashboard-card__description">
                    <p>• Mantén actualizados los datos de tus hijos</p>
                    <p>• Recuerda llevar cédula y carnet de vacunación</p>
                    <p>• Los certificados están disponibles 24/7</p>
                    <p>• Consulta dudas en centros IESS</p>
                </div>
                <button class="btn btn--primary" onclick="location.href='#'">
                    <i class="fas fa-question-circle"></i>
                    Ayuda
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <p>&copy; 2025 IESS - Instituto Ecuatoriano de Seguridad Social. Todos los derechos reservados.</p>
    </div>
</footer>

<!-- JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Dropdown de usuario
        const userDropdown = document.getElementById('userDropdown');
        const userDropdownMenu = document.getElementById('userDropdownMenu');

        if (userDropdown && userDropdownMenu) {
            userDropdown.addEventListener('click', function(e) {
                e.preventDefault();
                userDropdownMenu.classList.toggle('show');
            });

            // Cerrar dropdown al hacer clic fuera
            document.addEventListener('click', function(e) {
                if (!userDropdown.contains(e.target)) {
                    userDropdownMenu.classList.remove('show');
                }
            });
        }

        // Animaciones para las tarjetas del dashboard
        const dashboardCards = document.querySelectorAll('.dashboard-card');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach((entry, index) => {
                if (entry.isIntersecting) {
                    setTimeout(() => {
                        entry.target.classList.add('fade-in-up');
                    }, index * 150);
                    observer.unobserve(entry.target);
                }
            });
        }, {
            threshold: 0.1
        });

        dashboardCards.forEach(card => {
            observer.observe(card);
        });

        // Efecto hover mejorado para las tarjetas
        dashboardCards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-8px) scale(1.02)';
            });

            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0) scale(1)';
            });
        });
    });
</script>
</body>
</html>