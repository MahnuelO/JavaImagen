package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.PreguntaSeguridadDAO;
import modelo.vo.PreguntaSeguridad;

public class PreguntaSeguridadControl {

    private Connection cnn;
    private PreguntaSeguridadDAO preguntaDAO;

    public PreguntaSeguridadControl(Connection cnn) {
        this.cnn = cnn;
        preguntaDAO = new PreguntaSeguridadDAO(cnn);
    }

    public List<PreguntaSeguridad> query() {
        try {
            return preguntaDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(PreguntaSeguridadControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }

}
