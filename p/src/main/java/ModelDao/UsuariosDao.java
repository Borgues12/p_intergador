package ModelDao;
import java.math.BigInteger; //añadido
import Config.Conexion;
import Interfaces.CrudUsuarios;
import Model.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDao implements CrudUsuarios {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    public List listar() {
        ArrayList<Usuarios> users = new ArrayList<Usuarios>();
        String sql = "SELECT * FROM usuarios";

        try{
            con = cn.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Usuarios f = new Usuarios();
                f.setIdUser(rs.getInt(1));
                f.setIdTipoUsuario(rs.getInt(2));
                f.setCedula_usuario(rs.getString(3));
                f.setPrimerNombre(rs.getString(4));
                f.setSegundoNombre(rs.getString(5));
                f.setPrimerApellido(rs.getString(6));
                f.setSegundoApellido(rs.getString(7));
                f.setCorreo(rs.getString(8));
                f.setLogin(rs.getString(9));
                users.add(f);
            }
        } catch (Exception e) {
            System.out.println("Error al listar usuarios: " + e.getMessage());
        }
        return users;
    }

    @Override
    public Usuarios list(int idUser) {
        String sql = "SELECT * FROM usuarios WHERE ID_USUARIO = ?"+idUser;
        Usuarios f = new Usuarios();

        try{
            con = cn.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idUser); //añadido
            rs = ps.executeQuery();
            while (rs.next()) {
                f.setIdUser(rs.getInt(1));
                f.setIdTipoUsuario(rs.getInt(2));
                f.setCedula_usuario(rs.getString(3));
                f.setPrimerNombre(rs.getString(4));
                f.setSegundoNombre(rs.getString(5));
                f.setPrimerApellido(rs.getString(6));
                f.setSegundoApellido(rs.getString(7));
                f.setCorreo(rs.getString(8));
                f.setLogin(rs.getString(9));
                f.setContrasena(rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println("Error al listar por ID: " + e.getMessage());
        }
        return f;
    }

    @Override
    public boolean add(Usuarios f) {
        String sql = "INSERT INTO usuarios (ID_TIPO_USUARIO, CEDULA_USUARIOS, P_NOMBRE, S_NOMBRE, P_APELLIDO, S_APELLIDO, CORREO_USUARIO, LOGIN, CLAVE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = cn.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, f.getIdTipoUsuario());
            ps.setString(2, f.getCedula_usuario());
            ps.setString(3, f.getPrimerNombre());
            ps.setString(4, f.getSegundoNombre());
            ps.setString(5, f.getPrimerApellido());
            ps.setString(6, f.getSegundoApellido());
            ps.setString(7, f.getCorreo());
            ps.setString(8, f.getLogin());
            ps.setString(9, encriptarMD5(f.getContrasena())); //AÑADIDO ENCRIPTADO
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return true;
    }

    public int addAndGetId(Usuarios f) {
        String sql = "INSERT INTO usuarios (ID_TIPO_USUARIO, CEDULA_USUARIOS, P_NOMBRE, S_NOMBRE, P_APELLIDO, S_APELLIDO, CORREO_USUARIO, LOGIN, CLAVE) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = cn.getCon();
            ps = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setInt(1, f.getIdTipoUsuario());
            ps.setString(2, f.getCedula_usuario());
            ps.setString(3, f.getPrimerNombre());
            ps.setString(4, f.getSegundoNombre());
            ps.setString(5, f.getPrimerApellido());
            ps.setString(6, f.getSegundoApellido());
            ps.setString(7, f.getCorreo());
            ps.setString(8, f.getLogin());
            ps.setString(9, encriptarMD5(f.getContrasena()));
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return 0;
    }

    @Override
    public boolean edit(Usuarios f) {
        String sql = "UPDATE usuarios SET ID_TIPO_USUARIO = ?, CEDULA_USUARIOS = ?, P_NOMBRE = ?, S_NOMBRE = ?, P_APELLIDO = ?, S_APELLIDO = ?, CORREO_USUARIO = ?, LOGIN = ? WHERE ID_USUARIO = ?"+f.getIdUser();

        try  {
            con = cn.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, f.getIdTipoUsuario());
            ps.setString(2, f.getCedula_usuario());
            ps.setString(3, f.getPrimerNombre());
            ps.setString(4, f.getSegundoNombre());
            ps.setString(5, f.getPrimerApellido());
            ps.setString(6, f.getSegundoApellido());
            ps.setString(7, f.getCorreo());
            ps.setString(8, f.getLogin());
            ps.setString(9, encriptarMD5(f.getContrasena()));
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error al editar usuario: " + e.getMessage());
        }
        return true;
    }

    @Override
    public boolean delete(int idUser) {
        String sql = "DELETE FROM usuarios WHERE ID_USUARIO = ?"+idUser;
        try {
            con = cn.getCon();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();

        } catch (Exception e) {
            System.out.println("Error al eliminar usuario: " + e.getMessage());
        }
        return false;
    }
    //AÑADIDO
    private String encriptarMD5(String texto) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(texto.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
    public Usuarios validarUsuario(String login, String contrasena) {
        String sql = "SELECT * FROM usuarios WHERE LOGIN = ? AND CLAVE = ?";
        Usuarios usuario = new Usuarios();

        try {
            con = cn.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, login);
            ps.setString(2, encriptarMD5(contrasena));
            rs = ps.executeQuery();

            if (rs.next()) {
                usuario.setIdUser(rs.getInt(1));
                usuario.setIdTipoUsuario(rs.getInt(2));
                usuario.setCedula_usuario(rs.getString(3));
                usuario.setPrimerNombre(rs.getString(4));
                usuario.setSegundoNombre(rs.getString(5));
                usuario.setPrimerApellido(rs.getString(6));
                usuario.setSegundoApellido(rs.getString(7));
                usuario.setCorreo(rs.getString(8));
                usuario.setLogin(rs.getString(9));
                usuario.setContrasena(rs.getString(10));
            }
        } catch (Exception e) {
            System.out.println("Error al validar usuario: " + e.getMessage());
        }
        return usuario;
    }
    public boolean existeUsuario(String login, String cedula) {
        String sql = "SELECT COUNT(*) FROM usuarios WHERE LOGIN = ? OR CEDULA_USUARIOS = ?";

        try {
            con = cn.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, login);
            ps.setString(2, cedula);
            rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            System.out.println("Error al verificar existencia de usuario: " + e.getMessage());
        }
        return false;
    }

    public boolean asociarUsuarioACentros(int idUser, List<Integer> idCentroSalud) {
        String sql = "INSERT INTO usuario_centrosalud (ID_USUARIO, ID_CENTRO_SALUD) VALUES (?, ?)";

        try {
            con = cn.getCon();
            con.setAutoCommit(false);
            ps = con.prepareStatement(sql);

            for (Integer idCentro : idCentroSalud) {
                ps.setInt(1, idUser);
                ps.setInt(2, idCentro);
                ps.addBatch();
            }
            ps.executeBatch();
            con.commit();
            return true;

        } catch (Exception e) {
            System.out.println("Error al asociar usuario a centros: " + e.getMessage());
            return false;
        }
    }
}