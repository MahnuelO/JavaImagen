package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import modelo.dao.CiudadDAO;
import modelo.vo.Ciudad;
import utils.AppException;

public class CiudadControl {

    private Connection cnn;
    private CiudadDAO CiudadDAO;

    public CiudadControl(Connection cnn) {
        this.cnn = cnn;
        CiudadDAO = new CiudadDAO(cnn);
    }

 public List<Ciudad> consultar(int id){
        try {
            return CiudadDAO.busqueda(id); 
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    } 

  public Ciudad buscarCiudad(int id) throws AppException{
        try {
            return CiudadDAO.buscarCiudad(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }

}