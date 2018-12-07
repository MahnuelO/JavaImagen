
package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.NivelEstudioDAO;
import modelo.vo.NivelEstudio;

public class NivelEstudioControl {
    
    private Connection cnn;
    private NivelEstudioDAO nivelEstudioDAO;

    public NivelEstudioControl(Connection cnn) {
        this.cnn = cnn;
        nivelEstudioDAO = new NivelEstudioDAO(cnn);
    }

    public List<NivelEstudio> query() {
        try {
            return nivelEstudioDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(NivelEstudioControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }
    
}
