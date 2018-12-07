package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import modelo.dao.DepartamentoDAO;
import modelo.vo.Departamento;
import utils.AppException;

public class DepartamentoControl {

    private Connection cnn;
    private DepartamentoDAO DepartamentoDAO;

    public DepartamentoControl(Connection cnn) {
        this.cnn = cnn;
        DepartamentoDAO = new DepartamentoDAO(cnn);
    }

 public List<Departamento> consultar(int id){
        try {
            return DepartamentoDAO.busqueda(id); 
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    } 
public Departamento buscarDepartamento(int id) throws AppException{
        try {
            return DepartamentoDAO.buscarDepartamento(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }

}