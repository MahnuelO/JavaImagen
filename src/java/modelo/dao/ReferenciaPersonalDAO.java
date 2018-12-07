package modelo.dao;

import modelo.vo.ReferenciaPersonal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReferenciaPersonalDAO {
    
    Connection cnn;
    
    public ReferenciaPersonalDAO(Connection cnn){
        this.cnn = cnn;
    }
    
    public void insertar (ReferenciaPersonal vo) throws SQLException{
        PreparedStatement sentencia = cnn.prepareStatement("INSERT INTO referencia_personal (nombre, apellido, "
                + "empresa_donde_labora, telefono, profesion, cargo_actual, correo, id_persona) VALUES (?,?,?,?,?,?,?,?)");
        sentencia.setString(1, vo.getNombre());
        sentencia.setString(2, vo.getApellido());
        sentencia.setString(3, vo.getEmpresa_donde_labora());
        sentencia.setString(4, vo.getTelefono());
        sentencia.setString(5, vo.getProfesion());
        sentencia.setString(6, vo.getCargo_actual());
        sentencia.setString(7, vo.getCorreo());
        sentencia.setInt(8, vo.getIdPersona());
        sentencia.executeUpdate();
    }
    
    public void borrar(ReferenciaPersonal vo) throws SQLException{
       PreparedStatement sentencia = cnn.prepareStatement("DELETE FROM referencia_personal"
               + "WHERE id_referencia_personal=?");
       sentencia.setInt(1, vo.getId_referencia_personal());
       sentencia.executeUpdate();
    }
    
    public void modificar(ReferenciaPersonal vo) throws SQLException{
        PreparedStatement sentencia = cnn.prepareStatement("UPDATE referencia_persona SET nombre=?, "
                + "apellido=?,empresa_donde_labora=?, telefono=?, profesion=?, cargo_actual=?,correo=?"
                + "WHERE id_referencia_personal=?");
        sentencia.setString(1, vo.getNombre());
        sentencia.setString(2, vo.getApellido());
        sentencia.setString(3, vo.getEmpresa_donde_labora());
        sentencia.setString(4, vo.getTelefono());
        sentencia.setString(5, vo.getProfesion());
        sentencia.setString(6, vo.getCargo_actual());
        sentencia.setString(7, vo.getCorreo());
        sentencia.setInt(8, vo.getId_referencia_personal());
        sentencia.executeUpdate();  
    }
    
    public List<ReferenciaPersonal> consultar() throws SQLException{
        List<ReferenciaPersonal> listaReferenciaPersonal = new ArrayList<>();
        
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM referencia_personal");
        ResultSet resultado = sentencia.executeQuery();
        while(resultado.next()){
            ReferenciaPersonal voTempo = new ReferenciaPersonal();
            voTempo.setId_referencia_personal(resultado.getInt("id_referencia_personal"));
            voTempo.setNombre(resultado.getString("nombre"));
            voTempo.setApellido(resultado.getString("apellido"));
            voTempo.setEmpresa_donde_labora(resultado.getString("empresa_donde_labora"));
            voTempo.setTelefono(resultado.getString("telefono"));
            voTempo.setProfesion(resultado.getString("profesion"));
            voTempo.setCargo_actual(resultado.getString("cargo_actual"));
            voTempo.setCorreo(resultado.getString("correo"));
        }
        if (listaReferenciaPersonal.size() >0 ) {
            return listaReferenciaPersonal;
        }else{
            return null;
        }
    }
    
    
        public List<ReferenciaPersonal> busqueda(int idRP) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM referencia_personal where id_persona=?");
        int i =1;
        sentencia.setInt(i++, idRP);
        ResultSet resultado = sentencia.executeQuery();
        List<ReferenciaPersonal> listac = new ArrayList<>();
        while (resultado.next()) {            
        ReferenciaPersonal voTempo = new ReferenciaPersonal();
            voTempo.setId_referencia_personal(resultado.getInt("id_referencia_personal"));
            voTempo.setNombre(resultado.getString("nombre"));
            voTempo.setApellido(resultado.getString("apellido"));
            voTempo.setEmpresa_donde_labora(resultado.getString("empresa_donde_labora"));
            voTempo.setTelefono(resultado.getString("telefono"));
            voTempo.setProfesion(resultado.getString("profesion"));
            voTempo.setCargo_actual(resultado.getString("cargo_actual"));
            voTempo.setCorreo(resultado.getString("correo"));
            listac.add(getVO(resultado));
        }
        return listac;
    }
    
    
//    public List<ReferenciaPersonal> consultarnombre(String nombre) throws SQLException{
//        List<ReferenciaPersonal> listaReferenciaPersonal = new ArrayList<>();
//        
//        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM referencia_personal");
//        ResultSet resultado = sentencia.executeQuery();
//        while (resultado.next()){
//            ReferenciaPersonal voTemp = new ReferenciaPersonal();
//             voTemp.setId_referencia_personal(resultado.getInt("id_referencia_personal"));
//            voTemp.setNombre(resultado.getString("nombre"));
//            voTemp.setApellido(resultado.getString("apellido"));
//            voTemp.setEmpresa_donde_labora(resultado.getString("empresa_donde_labora"));
//            voTemp.setTelefono(resultado.getString("telefono"));
//            voTemp.setProfesion(resultado.getString("profesion"));
//            voTemp.setCargo_actual(resultado.getString("cargo_actual"));
//            voTemp.setCorreo(resultado.getString("correo"));
//            
//            listaReferenciaPersonal.add(voTemp);
//        }
//        if (listaReferenciaPersonal.size() > 0) {
//            return listaReferenciaPersonal;
//            
//        } else{
//            return null;
//        }
//    }
//    
    public ReferenciaPersonal queryNombre(String nombre) throws SQLException{
    PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM referencia_personal WHERE nombre=?");
    sentencia.setString(1, nombre);
    ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }else{
        return null;
        }
    }
    
    public ReferenciaPersonal consultarIdReferenciaPersonal (int id_referencia_personal) throws SQLException{
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM referencia_personal WHERE id_referencia_personal=?");
        sentencia.setInt(1, id_referencia_personal);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }else{
            return null;
        }
    }
    
            public ReferenciaPersonal buscarIdPersona(int id) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM referencia_personal WHERE id_persona=?");
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }
    
    public ReferenciaPersonal getVO(ResultSet resultado) throws SQLException{
        ReferenciaPersonal vot = new ReferenciaPersonal();
         vot.setId_referencia_personal(resultado.getInt("id_referencia_personal"));
            vot.setNombre(resultado.getString("nombre"));
            vot.setApellido(resultado.getString("apellido"));
            vot.setEmpresa_donde_labora(resultado.getString("empresa_donde_labora"));
            vot.setTelefono(resultado.getString("telefono"));
            vot.setProfesion(resultado.getString("profesion"));
            vot.setCargo_actual(resultado.getString("cargo_actual"));
            vot.setCorreo(resultado.getString("correo"));
            return vot;
            
    }
    
    
}
