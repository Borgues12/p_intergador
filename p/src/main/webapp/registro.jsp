<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.Tipo_usuario" %>
<%@ page import="Model.Centro_salud" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro - Vacunate CTM</title>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/registro-styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
<%
    // Obtener listas de la base de datos usando tus modelos existentes
    List<Tipo_usuario> tiposUsuario = (List<Tipo_usuario>) request.getAttribute("tiposUsuario");
    List<Centro_salud> centrosSalud = (List<Centro_salud>) request.getAttribute("centrosSalud");

    // Valores seleccionados (para mantener selección en caso de error)
    String tipoUsuarioSeleccionado = (String) request.getAttribute("tipoUsuarioSeleccionado");
    String centroSaludSeleccionado = (String) request.getAttribute("centroSaludSeleccionado");
%>

<div class="layout">
    <!-- Mostrar errores -->
    <% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-danger" role="alert">
        <i class="fas fa-exclamation-triangle"></i>
        <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <!-- Mostrar mensajes de éxito -->
    <% if (request.getAttribute("exito") != null) { %>
    <div class="alert alert-success" role="alert">
        <i class="fas fa-check-circle"></i>
        <%= request.getAttribute("exito") %>
    </div>
    <% } %>

    <!-- Panel izquierdo con logo -->
    <div class="layout__panel layout__panel--left">
        <div class="logo-container">
            <div class="logo-circle">
                <div class="heart"></div>
            </div>
            <p class="logo-slogan">Cuidando tu salud<br>con amor y ciencia</p>
        </div>
    </div>

    <div class="layout__panel layout__panel--right">
        <div class="brand-container">
            <div class="brand">VACUKIDS</div>
        </div>

        <div class="login__title">Crear Nueva Cuenta</div>

        <!-- FORMULARIO DE REGISTRO -->
        <form class="form registro-form" method="post" action="Controlador" id="formRegistro">
            <input type="hidden" name="action" value="registrar_usuario">

            <!-- Información Personal -->
            <div class="form-section">
                <h3 class="form-section__title">
                    <i class="fas fa-user"></i>
                    Información Personal
                </h3>

                <div class="form-row">
                    <div class="form__group">
                        <label class="form__label" for="cedula">Cédula</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-id-card form__icon"></i>
                            <input type="text"
                                   class="form__input"
                                   id="cedula"
                                   name="cedula"
                                   placeholder="Ej: 12345678"
                                   value="<%= request.getAttribute("cedula") != null ? request.getAttribute("cedula") : "" %>"
                                   required>
                        </div>
                    </div>

                    <div class="form__group">
                        <label class="form__label" for="correo">Email</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-envelope form__icon"></i>
                            <input type="email"
                                   class="form__input"
                                   id="correo"
                                   name="correo"
                                   placeholder="correo@ejemplo.com"
                                   value="<%= request.getAttribute("correo") != null ? request.getAttribute("correo") : "" %>"
                                   required>
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form__group">
                        <label class="form__label" for="primerNombre">Primer Nombre</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-user form__icon"></i>
                            <input type="text"
                                   class="form__input"
                                   id="primerNombre"
                                   name="primerNombre"
                                   placeholder="Primer nombre"
                                   value="<%= request.getAttribute("primerNombre") != null ? request.getAttribute("primerNombre") : "" %>"
                                   required>
                        </div>
                    </div>

                    <div class="form__group">
                        <label class="form__label" for="segundoNombre">Segundo Nombre</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-user form__icon"></i>
                            <input type="text"
                                   class="form__input"
                                   id="segundoNombre"
                                   name="segundoNombre"
                                   placeholder="Segundo nombre (opcional)"
                                   value="<%= request.getAttribute("segundoNombre") != null ? request.getAttribute("segundoNombre") : "" %>">
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form__group">
                        <label class="form__label" for="primerApellido">Primer Apellido</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-user form__icon"></i>
                            <input type="text"
                                   class="form__input"
                                   id="primerApellido"
                                   name="primerApellido"
                                   placeholder="Primer apellido"
                                   value="<%= request.getAttribute("primerApellido") != null ? request.getAttribute("primerApellido") : "" %>"
                                   required>
                        </div>
                    </div>

                    <div class="form__group">
                        <label class="form__label" for="segundoApellido">Segundo Apellido</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-user form__icon"></i>
                            <input type="text"
                                   class="form__input"
                                   id="segundoApellido"
                                   name="segundoApellido"
                                   placeholder="Segundo apellido (opcional)"
                                   value="<%= request.getAttribute("segundoApellido") != null ? request.getAttribute("segundoApellido") : "" %>">
                        </div>
                    </div>
                </div>
            </div>

            <!-- Información del Sistema -->
            <div class="form-section">
                <h3 class="form-section__title">
                    <i class="fas fa-cog"></i>
                    Información del Sistema
                </h3>

                <div class="form-row">
                    <div class="form__group">
                        <label class="form__label" for="tipoUsuario">Tipo de Usuario</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-users form__icon"></i>
                            <select class="form__input form__select" id="tipoUsuario" name="tipoUsuario" required>
                                <option value="">Seleccione...</option>
                                <% if (tiposUsuario != null) {
                                    for (Tipo_usuario tipo : tiposUsuario) { %>
                                <option value="<%= tipo.getIdTipoUsuario() %>"
                                        <%= (tipoUsuarioSeleccionado != null && tipoUsuarioSeleccionado.equals(String.valueOf(tipo.getIdTipoUsuario()))) ? "selected" : "" %>>
                                    <%= tipo.getNombreTipoUsuario() %>
                                </option>
                                <% }
                                } %>
                            </select>
                        </div>
                    </div>

                    <div class="form__group">
                        <label class="form__label" for="centroSalud">Centro de Salud</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-hospital form__icon"></i>
                            <select class="form__input form__select" id="centroSalud" name="centroSalud" required>
                                <option value="">Seleccione...</option>
                                <% if (centrosSalud != null) {
                                    for (Centro_salud centro : centrosSalud) { %>
                                <option value="<%= centro.getIdCentroSalud() %>"
                                        <%= (centroSaludSeleccionado != null && centroSaludSeleccionado.equals(String.valueOf(centro.getIdCentroSalud()))) ? "selected" : "" %>>
                                    <%= centro.getNombreCentroSalud() %>
                                </option>
                                <% }
                                } %>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Credenciales -->
            <div class="form-section">
                <h3 class="form-section__title">
                    <i class="fas fa-key"></i>
                    Credenciales de Acceso
                </h3>

                <div class="form-row">
                    <div class="form__group">
                        <label class="form__label" for="login">Usuario</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-user-circle form__icon"></i>
                            <input type="text"
                                   class="form__input"
                                   id="login"
                                   name="login"
                                   placeholder="Nombre de usuario"
                                   value="<%= request.getAttribute("login") != null ? request.getAttribute("login") : "" %>"
                                   required>
                        </div>
                        <small class="form-help">Mínimo 4 caracteres</small>
                    </div>

                    <div class="form__group">
                        <label class="form__label" for="contrasena">Contraseña</label>
                        <div class="form__input-wrapper">
                            <i class="fas fa-lock form__icon"></i>
                            <input type="password"
                                   class="form__input"
                                   id="contrasena"
                                   name="contrasena"
                                   placeholder="Contraseña"
                                   required>
                            <i class="far fa-eye form__toggle" id="togglePassword"></i>
                        </div>
                        <small class="form-help">Mínimo 6 caracteres</small>
                    </div>
                </div>

                <div class="form__group">
                    <label class="form__label" for="confirmarContrasena">Confirmar Contraseña</label>
                    <div class="form__input-wrapper">
                        <i class="fas fa-lock form__icon"></i>
                        <input type="password"
                               class="form__input"
                               id="confirmarContrasena"
                               name="confirmarContrasena"
                               placeholder="Confirme su contraseña"
                               required>
                        <i class="far fa-eye form__toggle" id="toggleConfirmPassword"></i>
                    </div>
                </div>
            </div>

            <!-- Botones -->
            <div class="form-actions">
                <button class="form__button form__button--primary" type="submit">
                    <i class="fas fa-user-plus"></i>
                    Crear Cuenta
                </button>

                <a href="Controlador?action=login" class="form__button form__button--secondary">
                    <i class="fas fa-arrow-left"></i>
                    Volver al Login
                </a>
            </div>
        </form>
    </div>
</div>

<!-- JavaScript -->
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Toggle para mostrar/ocultar contraseñas
        const togglePassword = document.getElementById('togglePassword');
        const toggleConfirmPassword = document.getElementById('toggleConfirmPassword');
        const passwordField = document.getElementById('contrasena');
        const confirmPasswordField = document.getElementById('confirmarContrasena');

        if (togglePassword && passwordField) {
            togglePassword.addEventListener('click', function() {
                const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordField.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        }

        if (toggleConfirmPassword && confirmPasswordField) {
            toggleConfirmPassword.addEventListener('click', function() {
                const type = confirmPasswordField.getAttribute('type') === 'password' ? 'text' : 'password';
                confirmPasswordField.setAttribute('type', type);
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        }

        // Validación del formulario
        document.getElementById('formRegistro').addEventListener('submit', function(e) {
            const contrasena = document.getElementById('contrasena').value;
            const confirmar = document.getElementById('confirmarContrasena').value;
            const login = document.getElementById('login').value;

            if (contrasena !== confirmar) {
                e.preventDefault();
                alert('Las contraseñas no coinciden');
                return false;
            }

            if (contrasena.length < 6) {
                e.preventDefault();
                alert('La contraseña debe tener al menos 6 caracteres');
                return false;
            }

            if (login.length < 4) {
                e.preventDefault();
                alert('El nombre de usuario debe tener al menos 4 caracteres');
                return false;
            }
        });
    });
</script>
</body>
</html>
