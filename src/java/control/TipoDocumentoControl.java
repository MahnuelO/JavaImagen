package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.TipoDocumentoDAO;
import modelo.vo.TipoDocumento;
import utils.AppException;

public class TipoDocumentoControl {

    private Connection cnn;
    private TipoDocumentoDAO identificacionDAO;

    public TipoDocumentoControl(Connection cnn) {
        this.cnn = cnn;
        identificacionDAO = new TipoDocumentoDAO(cnn);
    }

    public List<TipoDocumento> query() {
        try {
            return identificacionDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(TipoDocumentoControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }

      public TipoDocumento buscarTipoDoc(int id) throws AppException{
        try {
            return identificacionDAO.buscarTipoDoc(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
}
