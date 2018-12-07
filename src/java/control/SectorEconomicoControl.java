package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.SectorEconomicoDAO;
import modelo.vo.SectorEconomico;
import utils.AppException;


public class SectorEconomicoControl {
        private Connection cnn;
    private SectorEconomicoDAO sectorEconomicoDAO;

    public SectorEconomicoControl(Connection cnn) {
        this.cnn = cnn;
        sectorEconomicoDAO = new SectorEconomicoDAO(cnn);
    }

    public List<SectorEconomico> query() {
        try {
            return sectorEconomicoDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(TipoCategoriaControl.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList();
        }
    }
    
          public SectorEconomico buscarSectorControl(int id) throws AppException{
        try {
            return sectorEconomicoDAO.buscarSector(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }

}
