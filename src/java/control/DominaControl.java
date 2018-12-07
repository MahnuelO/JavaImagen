/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;
 import java.sql.Connection;
import modelo.dao.DominaDAO;
import modelo.vo.Domina;
import utils.AppException;

/**
 *
 * @author carmen
 */
public class DominaControl {
    Connection cnn;
    DominaDAO dao;

    public DominaControl(Connection cnn) {
        this.cnn = cnn;
        dao = new DominaDAO(cnn);
    }

    public void insert(Domina vo) throws AppException {
        try {
            if (vo.getId_idioma()== 0 || vo.getId_nivel()== 0 || vo.getId_persona()== 0 ) {
                throw new AppException("Campos incompletos");
            }
            dao.insert(vo);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
}
