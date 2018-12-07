package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.RolDAO;
import modelo.vo.Rol;

public class RolControl {
    private Connection cnn;
    private RolDAO rolDAO;
    
    public RolControl(Connection cnn){
    this.cnn = cnn;
    rolDAO = new RolDAO(cnn);
    }
    public List<Rol> query() {
        try {
            return rolDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(PreguntaSeguridadControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }


}
