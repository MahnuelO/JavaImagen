package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.IdiomaDAO;
import modelo.vo.Idioma;

public class IdiomaControl {

    private Connection cnn;
    private IdiomaDAO idiomaDAO;

    public IdiomaControl(Connection cnn) {
        this.cnn = cnn;
        idiomaDAO = new IdiomaDAO(cnn);
    }

    public List<Idioma> query() {
        try {
            return idiomaDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(PreguntaSeguridadControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }


}
