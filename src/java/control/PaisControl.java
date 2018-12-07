package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.PaisDAO;
import modelo.vo.Pais;
import utils.AppException;

public class PaisControl {

    private Connection cnn;
    private PaisDAO paisDAO;

    public PaisControl(Connection cnn) {
        this.cnn = cnn;
        paisDAO = new PaisDAO(cnn);
    }

    public List<Pais> query() {
        try {
            return paisDAO.query();
        } catch (SQLException ex) { 
            Logger.getLogger(PreguntaSeguridadControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }
    public Pais buscarPais(int id) throws AppException {
        try {
            return paisDAO.buscarPais(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }

}
