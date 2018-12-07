package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.NivelDAO;
import modelo.vo.Nivel;

public class NivelControl {

    private Connection cnn;
    private NivelDAO nivelDAO;

    public NivelControl(Connection cnn) {
        this.cnn = cnn;
        nivelDAO = new NivelDAO(cnn);
    }

    public List<Nivel> query() {
        try {
            return nivelDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(PreguntaSeguridadControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }


}
