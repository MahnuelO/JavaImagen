package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.vo.Usuario;

public class UsuarioDAO {

    Connection cnn;

    public UsuarioDAO(Connection cnn) {
        this.cnn = cnn;

    }

    public void insert(Usuario vo) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("INSERT INTO usuario(id_pregunta_seguridad,"
                + "id_rol,id_tipo_documento_identidad,numero_identificacion,clave,respuesta,correo,fecha_nacimiento, codigoval) VALUES (?,?,?,?,md5(?),?,?,?,?)");
        int i = 1;
        sentencia.setInt(i++, vo.getId_pregunta_seguridad());
        sentencia.setInt(i++, vo.getId_rol());
        sentencia.setInt(i++, vo.getId_tipo_documento_identidad());
        sentencia.setString(i++, vo.getNumero_identificacion());
        sentencia.setString(i++, vo.getClave());
        sentencia.setString(i++, vo.getRespuesta());
        sentencia.setString(i++, vo.getCorreo());
        sentencia.setDate(i++, new java.sql.Date(vo.getFecha_nacimiento().getTime()));
        sentencia.setDouble(i++, vo.getCodigoval());
       // sentencia.setInt(i++, vo.getCodigo_editar()); codigo_editar,  ,?
        
        sentencia.executeUpdate();
    }

    public Usuario queryIdentificacion(String numero_identificacion) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM usuario WHERE numero_identificacion=?");
        sentencia.setString(1, numero_identificacion);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVo(resultado);
        }
        return null;
    }

    public Usuario getVo(ResultSet resultado) throws SQLException {
        Usuario vot = new Usuario();
        vot.setId_usuario(resultado.getInt("id_usuario"));
        vot.setNumero_identificacion(resultado.getString("numero_identificacion"));
        vot.setClave(resultado.getString("clave"));
        vot.setId_pregunta_seguridad(resultado.getInt("id_pregunta_seguridad"));
        vot.setId_rol(resultado.getInt("id_rol"));
        vot.setRespuesta(resultado.getString("respuesta"));
        vot.setId_tipo_documento_identidad(resultado.getInt("id_tipo_documento_identidad"));
        vot.setFecha_nacimiento(new java.sql.Date(resultado.getDate("fecha_nacimiento").getTime()));
        vot.setCorreo(resultado.getString("correo"));
        return vot;
    }
    
    public void modificar (Usuario vo) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("UPDATE usuario SET clave=? WHERE numero_identificacion");
        sentencia.setString(1, vo.getClave());
        sentencia.setInt(2, vo.getId_usuario());
        sentencia.executeUpdate();
    }
    
    public void modificarContraseña (Usuario vo) throws SQLException{
        PreparedStatement sentencia = cnn.prepareStatement("UPDATE usuario SET clave=? WHERE numero_identificacion=?");
        sentencia.setString(1, vo.getClave());
        sentencia.setString(2, vo.getNumero_identificacion());
        sentencia.executeUpdate();
    }
    
    public Usuario queryCodValidacion(double codigoval)throws SQLException{
        PreparedStatement sentencia = cnn.prepareStatement("select * from usuario where codigoval=?");
        sentencia.setDouble(1, codigoval);
        ResultSet resultado = sentencia.executeQuery();
        if(resultado.next()){
            return getVo(resultado);
        }
        return null;
    }
     public Usuario buscarUsuario(int id) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM usuario WHERE id_usuario=?");
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVo(resultado);
        }
        return null;
    }
         public void modificarClave (Usuario vo) throws SQLException{
       // PreparedStatement sentencia = cnn.prepareStatement("UPDATE usuario SET clave=? WHERE id_usuario=?");
        PreparedStatement sentencia = cnn.prepareStatement("UPDATE usuario SET clave=md5(?) WHERE id_usuario=?");
        sentencia.setString(1, vo.getClave());
        sentencia.setInt(2, vo.getId_usuario());
        sentencia.executeUpdate();
    }
    
}
