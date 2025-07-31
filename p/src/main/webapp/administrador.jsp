<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Usuarios" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IESS - Panel Administrativo</title>
    <link rel="stylesheet" href="css/Style.css">
    <style>
        body {
            font-family: var(--font-main);
            margin: 0;
            padding: 20px;
            background: var(--bg-gradient);
            color: var(--text-dark);
            min-height: 100vh;
        }

        .admin-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: white;
            padding: 1rem 2rem;
            border-radius: var(--radius-lg);
            box-shadow: var(--shadow-md);
            margin-bottom: 2rem;
        }

        .admin-brand {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .admin-title {
            font-family: var(--font-heading);
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--text-dark);
            margin: 0;
        }

        .logout-btn {
            background: var(--primary-color);
            color: white;
            padding: 0.6rem 1.2rem;
            text-decoration: none;
            border-radius: var(--radius-md);
            font-weight: 600;
            transition: var(--transition-normal);
            box-shadow: var(--shadow-sm);
        }

        .logout-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: var(--shadow-md);
        }

        .user-info {
            background: white;
            padding: 1rem 2rem;
            border-radius: var(--radius-md);
            box-shadow: var(--shadow-sm);
            margin-bottom: 2rem;
            border-left: 4px solid var(--primary-color);
        }

        .crud-section {
            background: white;
            margin-bottom: 1.5rem;
            border-radius: var(--radius-md);
            box-shadow: var(--shadow-sm);
            overflow: hidden;
            border-left: 4px solid var(--primary-color);
        }

        .section-header {
            background: var(--primary-light);
            color: var(--text-dark);
            padding: 1rem 2rem;
            margin: 0;
            font-size: 1.2rem;
            font-weight: 600;
            border-bottom: 1px solid var(--border-color);
        }

        .section-content {
            padding: 1.5rem 2rem;
        }

        .crud-buttons {
            display: flex;
            gap: 0.8rem;
            flex-wrap: wrap;
        }

        .crud-btn {
            background: white;
            color: var(--primary-color);
            padding: 0.6rem 1.2rem;
            text-decoration: none;
            border-radius: var(--radius-md);
            font-size: 0.9rem;
            font-weight: 600;
            border: 2px solid var(--primary-color);
            transition: var(--transition-normal);
            cursor: pointer;
        }

        .crud-btn:hover {
            background: var(--primary-color);
            color: white;
            transform: translateY(-1px);
            box-shadow: var(--shadow-sm);
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .admin-header {
                flex-direction: column;
                gap: 1rem;
                text-align: center;
            }

            .crud-buttons {
                justify-content: center;
            }

            .crud-btn {
                flex: 1;
                min-width: 80px;
                text-align: center;
            }
        }
    </style>
</head>
<body>

<%
    Usuarios usuario = (Usuarios) session.getAttribute("usuario");
    String nombreCompleto = (String) session.getAttribute("nombreCompleto");

    if (usuario == null) {
        response.sendRedirect("Controlador?action=login");
        return;
    }
%>

<div class="container">
    <!-- Header con Logo -->
    <div class="admin-header">
        <div class="admin-brand">
            <div class="logo-circle">
                <div class="heart"></div>
            </div>
            <h1 class="admin-title">IESS Vacunación - Administración</h1>
        </div>
        <a href="Controlador?action=logout" class="logout-btn">Cerrar Sesión</a>
    </div>

    <!-- Info del Usuario -->
    <div class="user-info">
        <strong>Administrador:</strong> <%= nombreCompleto %> |
        <strong>Cédula:</strong> <%= usuario.getCedula_usuario() %> |
        <strong>Email:</strong> <%= usuario.getCorreo() %>
    </div>

    <!-- Secciones CRUD -->
    <div class="crud-section">
        <h2 class="section-header">Centros de Salud</h2>
        <div class="section-content">
            <div class="crud-buttons">
                <a href="#" class="crud-btn">LISTAR</a>
                <a href="#" class="crud-btn">CREAR</a>
                <a href="#" class="crud-btn">EDITAR</a>
                <a href="#" class="crud-btn">ELIMINAR</a>
            </div>
        </div>
    </div>

    <div class="crud-section">
        <h2 class="section-header">Usuarios</h2>
        <div class="section-content">
            <div class="crud-buttons">
                <a href="#" class="crud-btn">LISTAR</a>
                <a href="#" class="crud-btn">CREAR</a>
                <a href="#" class="crud-btn">EDITAR</a>
                <a href="#" class="crud-btn">ELIMINAR</a>
            </div>
        </div>
    </div>

    <div class="crud-section">
        <h2 class="section-header">Tipos de Usuario</h2>
        <div class="section-content">
            <div class="crud-buttons">
                <a href="#" class="crud-btn">LISTAR</a>
                <a href="#" class="crud-btn">CREAR</a>
                <a href="#" class="crud-btn">EDITAR</a>
                <a href="#" class="crud-btn">ELIMINAR</a>
            </div>
        </div>
    </div>

    <div class="crud-section">
        <h2 class="section-header">Menores</h2>
        <div class="section-content">
            <div class="crud-buttons">
                <a href="#" class="crud-btn">LISTAR</a>
                <a href="#" class="crud-btn">CREAR</a>
                <a href="#" class="crud-btn">EDITAR</a>
                <a href="#" class="crud-btn">ELIMINAR</a>
            </div>
        </div>
    </div>

    <div class="crud-section">
        <h2 class="section-header">Vacunas</h2>
        <div class="section-content">
            <div class="crud-buttons">
                <a href="#" class="crud-btn">LISTAR</a>
                <a href="#" class="crud-btn">CREAR</a>
                <a href="#" class="crud-btn">EDITAR</a>
                <a href="#" class="crud-btn">ELIMINAR</a>
            </div>
        </div>
    </div>

    <div class="crud-section">
        <h2 class="section-header">Dosis</h2>
        <div class="section-content">
            <div class="crud-buttons">
                <a href="#" class="crud-btn">LISTAR</a>
                <a href="#" class="crud-btn">CREAR</a>
                <a href="#" class="crud-btn">EDITAR</a>
                <a href="#" class="crud-btn">ELIMINAR</a>
            </div>
        </div>
    </div>

</div>

</body>
</html>