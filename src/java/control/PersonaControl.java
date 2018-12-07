package control;

import java.sql.Connection;
import modelo.dao.PersonaDAO;
import modelo.vo.Persona;
import utils.AppException;

public class PersonaControl {

    Connection cnn;
    PersonaDAO dao;

    public PersonaControl(Connection cnn) {
        this.cnn = cnn;
        dao = new PersonaDAO(cnn);
    }

    public void insert(Persona vo) throws AppException {
        try {
            if (vo.getId_usuario() == 0) {
              //  throw new AppException("Campos incompletos");
            }
            dao.insert(vo);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
           public Persona buscarId(int id) throws AppException{
        try {
            return dao.buscarId(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }

}
