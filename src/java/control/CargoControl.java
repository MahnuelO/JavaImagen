package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.CargoDAO;
import modelo.vo.Cargo;
import utils.AppException;

public class CargoControl {
    private Connection cnn;
    private CargoDAO cargoDAO;

    public CargoControl(Connection cnn) {
        this.cnn = cnn;
        cargoDAO = new CargoDAO(cnn);
    }

    public List<Cargo> query() {
        try {
            return cargoDAO.query();
        } catch (SQLException ex) {
            Logger.getLogger(PreguntaSeguridadControl.class.getName()).log(Level.ALL.SEVERE, null, ex);
            return new ArrayList<>();
        }
    }
    public Cargo buscarCargo(int idCA) throws AppException {
        try {
            return cargoDAO.buscarCargo(idCA);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
    
}
