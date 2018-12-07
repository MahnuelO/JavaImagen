
package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.dao.EstudioDAO;
import modelo.vo.Estudio;
import utils.AppException;

public class EstudioControl {
    
    private Connection cnn;
    private EstudioDAO estudioDAO;

    public EstudioControl(Connection cnn) {
        this.cnn = cnn;
        estudioDAO = new EstudioDAO(cnn);
    }

    //public List<Estudio> query(String institucion) {
    //    try {
    //        return estudioDAO.queryInstitucion(institucion);
    //    } catch (SQLException ex) {
    //        ex.printStackTrace();
    //        return new ArrayList();
    //    }
    //}
    
    public void insert(Estudio vo) throws AppException {
        try {
            if (vo.getId_persona() == 0 || vo.getId_nivel_estudio() == 0 
                    || vo.getUrl_archivos_adjuntos() == null 
                    || vo.getId_titulo_obtenido() == 0 || vo.getId_pais() == 0 
                    || vo.getInstitucion() == null || vo.getAño()== null) {
                throw new AppException("Campos incompletos");
            }
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
    
}
