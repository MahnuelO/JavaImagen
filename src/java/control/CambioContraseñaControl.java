package control;

import java.sql.Connection;
import java.sql.SQLException;
import modelo.dao.UsuarioDAO;
import modelo.vo.Usuario;

public class CambioContraseñaControl {
    Connection cnn;
    UsuarioDAO dao;

    public CambioContraseñaControl(Connection cnn) {
        this.cnn = cnn;
        dao = new UsuarioDAO(cnn);
    }
    
        public boolean modificar(Usuario vo) {
            
        if (vo.getClave() == null) {
            return false;
        }else{
            try {
                dao.modificarContraseña(vo);
                return true;
            } catch (SQLException ex) {
                ex.printStackTrace();
                return false;
            }
        }
    }
}
