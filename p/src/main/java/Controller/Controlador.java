package Controller;

import Model.Usuarios;
import Model.Tipo_usuario;
import Model.Centro_salud;
import ModelDao.UsuariosDao;
import ModelDao.Tipo_usuarioDao;
import ModelDao.CentroSaludDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    String acceso = "";
    String listar_centros = "centro_salud/listar_centros.jsp";
    // AÑADIDO
    String login = "loginv.jsp";
    String registro = "registro.jsp";
    String dashboard = "dashboard.jsp";
    String dashboard_administrador = "administrador.jsp";
    String dashboard_usuario = "padre_familia.jsp";
    String dashboard_personal_salud = "medico.jsp";

    // DAOs
    UsuariosDao usuariosDao = new UsuariosDao();
    Tipo_usuarioDao tipoUsuarioDao = new Tipo_usuarioDao();
    CentroSaludDao centroSaludDao = new CentroSaludDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
           // if (action.equals("listar_centros")) {
                // = listar_centros;
            //}

            if (action == null) {
                acceso = login;
            } else {
                switch (action) {
                    case "login":
                        acceso = login;
                        break;

                    case "mostrar_registro":
                        // Cargar listas para los selects
                        List<Tipo_usuario> tiposUsuario = tipoUsuarioDao.listar();
                        List<Centro_salud> centrosSalud = centroSaludDao.listar();

                        request.setAttribute("tiposUsuario", tiposUsuario);
                        request.setAttribute("centrosSalud", centrosSalud);
                        acceso = registro;
                        break;

                    case "listar_centros":
                        acceso = listar_centros;
                        break;

                    case "logout":
                        HttpSession sessionLogout = request.getSession(false);
                        if (sessionLogout != null) {
                            sessionLogout.invalidate();
                        }
                        response.sendRedirect("Controlador?action=login");
                        return;

                    case "dashboard":
                        HttpSession sessionDashboard = request.getSession(false);
                        if (sessionDashboard == null || sessionDashboard.getAttribute("usuario") == null) {
                            response.sendRedirect("Controlador?action=login");
                            return;
                        }
                        acceso = dashboard;
                        break;

                    // paginas
                    case "dashboard_administrador":
                        HttpSession sessionAdmin = request.getSession(false);
                        if (sessionAdmin == null || sessionAdmin.getAttribute("usuario") == null) {
                            response.sendRedirect("Controlador?action=login");
                            return;
                        }
                        acceso = dashboard_administrador;
                        break;

                    case "dashboard_usuario":
                        HttpSession sessionUsuario = request.getSession(false);
                        if (sessionUsuario == null || sessionUsuario.getAttribute("usuario") == null) {
                            response.sendRedirect("Controlador?action=login");
                            return;
                        }
                        acceso = dashboard_usuario;
                        break;

                    case "dashboard_personal_salud":
                        HttpSession sessionMedico = request.getSession(false);
                        if (sessionMedico == null || sessionMedico.getAttribute("usuario") == null) {
                            response.sendRedirect("Controlador?action=login");
                            return;
                        }
                        acceso = dashboard_personal_salud;
                        break;

                    default:
                        acceso = login;
                        break;
                }
            }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    //ESTABA VACIO Y POR DEFAULT - CAMBION1
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            acceso = login;
        } else {
            switch (action) {
                case "validar_login":
                    validarLogin(request, response);
                    break;

                case "registrar_usuario":
                    registrarUsuario(request, response);
                    break;

                default:
                    acceso = login;
                    break;
            }
        }

        if (!response.isCommitted()) {
            RequestDispatcher vista = request.getRequestDispatcher(acceso);
            vista.forward(request, response);
        }
    }
    //Añdido
    private void validarLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String login = request.getParameter("login");
        String contrasena = request.getParameter("contrasena");

        if (login == null || login.trim().isEmpty() ||
                contrasena == null || contrasena.trim().isEmpty()) {
            request.setAttribute("error", "Por favor complete todos los campos");
            request.setAttribute("login", login);
            acceso = this.login;
            return;
        }

        Usuarios usuario = usuariosDao.validarUsuario(login, contrasena);

        if (usuario != null && usuario.getIdUser() > 0) {
            // Login exitoso
            HttpSession session = request.getSession(true);
            session.setAttribute("usuario", usuario);

            // Crear nombre completo
            String nombreCompleto = usuario.getPrimerNombre();
            if (usuario.getSegundoNombre() != null && !usuario.getSegundoNombre().isEmpty()) {
                nombreCompleto += " " + usuario.getSegundoNombre();
            }
            nombreCompleto += " " + usuario.getPrimerApellido();
            if (usuario.getSegundoApellido() != null && !usuario.getSegundoApellido().isEmpty()) {
                nombreCompleto += " " + usuario.getSegundoApellido();
            }

            session.setAttribute("nombreCompleto", nombreCompleto);
            int tipoUsuario = usuario.getIdTipoUsuario();
            String redirectUrl = "";

            switch (tipoUsuario) {
                case 1: // Administrador
                    redirectUrl = "Controlador?action=dashboard_administrador";
                    break;
                case 2: // Usuario (Padre de familia)
                    redirectUrl = "Controlador?action=dashboard_usuario";
                    break;
                case 3: // Personal de Salud (Médico)
                    redirectUrl = "Controlador?action=dashboard_personal_salud";
                    break;
                default:
                    redirectUrl = "Controlador?action=dashboard_usuario"; // Por defecto Usuario
                    break;
            }

            response.sendRedirect(redirectUrl);
        } else {
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.setAttribute("login", login);
            acceso = this.login;
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Obtener parámetros
            String cedula = request.getParameter("cedula");
            String correo = request.getParameter("correo");
            String primerNombre = request.getParameter("primerNombre");
            String segundoNombre = request.getParameter("segundoNombre");
            String primerApellido = request.getParameter("primerApellido");
            String segundoApellido = request.getParameter("segundoApellido");
            String tipoUsuario = request.getParameter("tipoUsuario");
            String[] centrosSalud = request.getParameterValues("centroSalud");
            String login = request.getParameter("login");
            String contrasena = request.getParameter("contrasena");
            String confirmarContrasena = request.getParameter("confirmarContrasena");

            // Validaciones
            if (!contrasena.equals(confirmarContrasena)) {
                throw new Exception("Las contraseñas no coinciden");
            }

            if (contrasena.length() < 6) {
                throw new Exception("La contraseña debe tener al menos 6 caracteres");
            }

            if (login.length() < 4) {
                throw new Exception("El nombre de usuario debe tener al menos 4 caracteres");
            }

            // Verificar si ya existe el usuario o cédula
            if (usuariosDao.existeUsuario(login, cedula)) {
                throw new Exception("Ya existe un usuario con ese login o cédula");
            }

            // Crear objeto usuario
            Usuarios nuevoUsuario = new Usuarios();
            nuevoUsuario.setCedula_usuario(cedula);
            nuevoUsuario.setCorreo(correo);
            nuevoUsuario.setPrimerNombre(primerNombre);
            nuevoUsuario.setSegundoNombre(segundoNombre);
            nuevoUsuario.setPrimerApellido(primerApellido);
            nuevoUsuario.setSegundoApellido(segundoApellido);
            nuevoUsuario.setIdTipoUsuario(Integer.parseInt(tipoUsuario));
            nuevoUsuario.setLogin(login);
            nuevoUsuario.setContrasena(contrasena);

            // Registrar usuario
            // Registrar usuario y obtener su ID
            int idUsuarioCreado = usuariosDao.addAndGetId(nuevoUsuario);

            if (idUsuarioCreado > 0) {
                // Convertir array a lista
                List<Integer> listaCentros = new ArrayList<>();
                for (String centroId : centrosSalud) {
                    listaCentros.add(Integer.parseInt(centroId));
                }

                // Asociar usuario a centros
                boolean asociado = usuariosDao.asociarUsuarioACentros(idUsuarioCreado, listaCentros);

                if (asociado) {
                    request.setAttribute("exito", "Usuario registrado exitosamente. Puede iniciar sesión.");
                    acceso = this.login;
                } else {
                    throw new Exception("Error al asociar centros de salud");
                }
            } else {
                throw new Exception("Error al registrar el usuario");
            }

        } catch (Exception e) {
            // Mantener datos en caso de error
            request.setAttribute("error", e.getMessage());
            request.setAttribute("cedula", request.getParameter("cedula"));
            request.setAttribute("correo", request.getParameter("correo"));
            request.setAttribute("primerNombre", request.getParameter("primerNombre"));
            request.setAttribute("segundoNombre", request.getParameter("segundoNombre"));
            request.setAttribute("primerApellido", request.getParameter("primerApellido"));
            request.setAttribute("segundoApellido", request.getParameter("segundoApellido"));
            request.setAttribute("login", request.getParameter("login"));
            request.setAttribute("tipoUsuarioSeleccionado", request.getParameter("tipoUsuario"));
            request.setAttribute("centroSaludSeleccionado", request.getParameter("centroSalud"));

            // Recargar listas
            List<Tipo_usuario> tiposUsuario = tipoUsuarioDao.listar();
            List<Centro_salud> centrosSalud = centroSaludDao.listar();
            request.setAttribute("tiposUsuario", tiposUsuario);
            request.setAttribute("centrosSalud", centrosSalud);

            acceso = registro;
        }
    }
}

