package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.TipoCategoriaDAO;
import modelo.vo.TipoCategoria;
import utils.AppException;

public class TipoCategoriaControl {
        private Connection cnn;
    private TipoCategoriaDAO tipocategoriaDAO;

    public TipoCategoriaControl(Connection cnn) {
        this.cnn = cnn;
        tipocategoriaDAO = new TipoCategoriaDAO(cnn);
    }

    public List<TipoCategoria> query() {
        try {
            return tipocategoriaDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(TipoCategoriaControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }
      public TipoCategoria buscarCategoria(int id) throws AppException{
        try {
            return tipocategoriaDAO.buscarCategoria(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
}
