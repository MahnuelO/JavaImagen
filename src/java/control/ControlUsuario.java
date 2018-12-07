package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.UsuarioDAO;
import modelo.vo.Persona;
import modelo.vo.Usuario;
//import sun.util.logging.PlatformLogger;
import utils.AppException;

public class ControlUsuario {

    Connection cnn;
    UsuarioDAO dao;

    public ControlUsuario(Connection cnn) {
        this.cnn = cnn;
        dao = new UsuarioDAO(cnn);
    }

    public ControlUsuario() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void insert(Usuario vo) throws AppException {
        try {
            if (vo.getNumero_identificacion() == null || vo.getNumero_identificacion().isEmpty()
                    || vo.getId_pregunta_seguridad() == 0 || vo.getId_rol() == 0 || vo.getClave() == null || vo.getClave().isEmpty() 
                    || vo.getRespuesta()== null || vo.getRespuesta().isEmpty() || vo.getId_tipo_documento_identidad()== 0 || vo.getFecha_nacimiento()== null
                    || vo.getCorreo()== null || vo.getCorreo().isEmpty()) {
                throw new AppException("Campos incompletos");
            }
            if (dao.queryIdentificacion(vo.getNumero_identificacion()) != null) {
                throw new AppException("Usuario ya existe");
            }
            dao.insert(vo);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }

    public Usuario query(String numero_identificacion, String clave, int rol) throws AppException {
        try {
            Usuario vo = dao.queryIdentificacion(numero_identificacion);
            if (vo == null || !vo.getClave().equals(clave) || vo.getId_rol()!= rol) {
                throw new AppException("Clave o Usuario Incorrecto, recuerde que debe seleccionar un rol");
            }
            return vo;
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
              public Usuario buscarRol(String id) throws AppException{
        try {
            return dao.queryIdentificacion(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
    
    public boolean modificar(Usuario vo) {
        if (vo.getClave() == null) {
            return false;
        }else{
            try {
                dao.modificar(vo);
                return true;
            } catch (SQLException ex) {
                ex.printStackTrace();
                return false;
            }
        }
    }
    public boolean modificarClave(Usuario vo) {
        if (vo.getClave() == null) {
            return false;
        }else{
            try {
                dao.modificarClave(vo);
                return true;
            } catch (SQLException ex) {
                ex.printStackTrace();
                return false;
            }
        }
    }
    public Usuario validarCodigo(double codigoval){
        try {
            Usuario vo = dao.queryCodValidacion(codigoval);
            return vo;
        } catch (Exception ex) {
            Logger.getLogger(ControlUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public Usuario buscarUsuario(int id) throws AppException{
        try {
            return dao.buscarUsuario(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
}
