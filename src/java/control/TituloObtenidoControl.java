package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.TituloObtenidoDAO;
import modelo.vo.TituloObtenido;

public class TituloObtenidoControl {
    private Connection cnn;
    private TituloObtenidoDAO tituloObtenidoDAO;

    public TituloObtenidoControl(Connection cnn) {
        this.cnn = cnn;
        tituloObtenidoDAO = new TituloObtenidoDAO(cnn);
    }

    public List<TituloObtenido> queryB() {
        try {
            return tituloObtenidoDAO.queryB();
        } catch (SQLException ex) {
            Logger.getLogger(TituloObtenidoControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }

    public List<TituloObtenido> queryS() {
        try {
            return tituloObtenidoDAO.queryS();
        } catch (SQLException ex) {
            Logger.getLogger(TituloObtenidoControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }

    public List<TituloObtenido> queryP() {
        try {
            return tituloObtenidoDAO.queryP();
        } catch (SQLException ex) {
            Logger.getLogger(TituloObtenidoControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }
    
    
}
