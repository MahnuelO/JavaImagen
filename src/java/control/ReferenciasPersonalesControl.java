package control;

import modelo.dao.ReferenciaPersonalDAO;
import modelo.vo.ReferenciaPersonal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;
import utils.AppException;

public class ReferenciasPersonalesControl {
    Connection cnn;
    ReferenciaPersonalDAO dao;
    
    public ReferenciasPersonalesControl(Connection cnn){
        this.cnn = cnn;
        this.dao = new ReferenciaPersonalDAO(cnn);
    }
    
    public void  insertar(ReferenciaPersonal vo) throws AppException{
        try {
            if (vo.getNombre()== null || vo.getNombre().isEmpty()
                    || vo.getApellido()== null || vo.getApellido().isEmpty()
                    || vo.getTelefono()== null || vo.getTelefono().isEmpty()
                    || vo.getCargo_actual()== null || vo.getCargo_actual().isEmpty()
                    || vo.getCorreo()== null || vo.getCorreo().isEmpty()
                    || vo.getIdPersona()== 0) {
                throw new AppException("Campos estan nulo");
            }
            if (dao.queryNombre(vo.getNombre()) !=null) {
                throw new AppException("Referencia ya existe");
            }
            dao.insertar(vo);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
    
    public boolean modificar(ReferenciaPersonal vo){
        if (vo.getNombre()==null || vo.getNombre().isEmpty()
                || vo.getApellido() == null || vo.getApellido().isEmpty()
                || vo.getTelefono() == null || vo.getTelefono().isEmpty()
                || vo.getEmpresa_donde_labora() == null || vo.getEmpresa_donde_labora().isEmpty()
                || vo.getProfesion() == null || vo.getProfesion().isEmpty()
                || vo.getCargo_actual() == null || vo.getCargo_actual().isEmpty()
                || vo.getCorreo() == null || vo.getCorreo().isEmpty()
                || vo.getId_referencia_personal() ==0 ) {
            return false;
        }else {
            try {
                dao.modificar(vo);
                return true;
            } catch (SQLException ex) {
                ex.printStackTrace();
                return false;
            }
        }
    
    }
    
    
    public boolean borrar (ReferenciaPersonal vo){
        if (vo.getId_referencia_personal() == 0) {
            return false;
        }else{
            try {
                dao.borrar(vo);
                return true;
            } catch (SQLException ex) {
                ex.printStackTrace();
                return false;
            }
    }
    }
    
    public List<ReferenciaPersonal> consultar(){
        try {
            return dao.consultar();
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        
    }
    
    public List<ReferenciaPersonal> consultar(int id){
        try {
            return dao.busqueda(id);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    } 

    public ReferenciaPersonal consultarId_referencia_persona (int id_referencia_personal) throws ParseException{
        try {
            return dao.consultarIdReferenciaPersonal(id_referencia_personal);
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    
    }
    
               public ReferenciaPersonal buscarIdPersona(int id) throws AppException{
        try {
            return dao.buscarIdPersona(id);
        } catch (Exception e) {
            throw new AppException(e);
        }
    }
}
