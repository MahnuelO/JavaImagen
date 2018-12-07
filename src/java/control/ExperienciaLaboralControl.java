package control;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import utils.AppException;
import modelo.dao.ExperienciaDAO;
import modelo.vo.ExperienciaLaboral;

public class ExperienciaLaboralControl {

    private Connection cnn;
    private ExperienciaDAO dao;
//    private a dao;

    public ExperienciaLaboralControl(Connection cnn) {
        this.cnn = cnn;
        this.dao = new ExperienciaDAO(cnn);
//        this.dao = new a(cnn);
    }

    public void insertar(ExperienciaLaboral vo) throws AppException {
        try {
            if (vo.getNombre().isEmpty()) {
                throw new AppException("Campo nombre incompleto");
            }
            dao.insertar(vo);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }

//    public boolean modificar(ExperienciaLaboral vo) {
//        if (vo.getNombre() == null || vo.getNombre().isEmpty()
//                || vo.getNombre() == null || vo.getNombre().isEmpty()
//                || vo.getTelefono() == null || vo.getTelefono().isEmpty()
//                || vo.getDireccion() == null || vo.getDireccion().isEmpty()
//                || vo.getUrl_archivo_adjunto() == null || vo.getUrl_archivo_adjunto().isEmpty()
//                || vo.getFecha_inicio() == null
//                || vo.getFecha_fin() == null
//                || vo.getCorreo() == null || vo.getCorreo().isEmpty()
//                || vo.getComentario() == null || vo.getComentario().isEmpty()
//                || vo.getNit() == null || vo.getNit().isEmpty()
//                || vo.getId_experiencia_laboral() == 0) {
//
//            return false;
//        } else {
//            try {
//                dao.modificar(vo);
//                return true;
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//                return false;
//            }
//        }
//
//    }
//
//    public boolean borrar(ExperienciaLaboral vo) {
//        if (vo.getId_experiencia_laboral() == 0) {
//            return false;
//        } else {
//            try {
//                dao.borrar(vo);
//                return true;
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//                return false;
//            }
//        }
//    }
//
    public List<ExperienciaLaboral> consultar(int id) {
        try {
            return dao.busqueda(id);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
//
    public ExperienciaLaboral consultarIdExperiencia(int idexperiencia) throws ParseException {
        try {
            return dao.consultarIdExperiencia(idexperiencia);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }
}
