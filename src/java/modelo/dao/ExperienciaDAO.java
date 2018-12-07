package modelo.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.ExperienciaLaboral;

public class ExperienciaDAO {

    Connection cnn;

    public ExperienciaDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public void insertar(ExperienciaLaboral vo) throws SQLException {
            PreparedStatement sentencia
                    = cnn.prepareStatement(
                            "INSERT INTO experiencia_laboral (nombre, telefono,"
                                    + "direccion, url_archivo_adjunto,fecha_inicio,fecha_fin,"
                                    + "correo, comentario, nit, id_persona) VALUES(?,?,?,?,?,?,?,?,?,?)");

            sentencia.setString(1, vo.getNombre());
            sentencia.setString(2, vo.getTelefono());
            sentencia.setString(3, vo.getDireccion());
            sentencia.setString(4, vo.getUrl_archivo_adjunto());
            sentencia.setDate(5, new java.sql.Date(vo.getFecha_inicio().getTime()));
            sentencia.setDate(6, new java.sql.Date(vo.getFecha_fin().getTime()));
            sentencia.setString(7, vo.getCorreo());
            sentencia.setString(8, vo.getComentario());
            sentencia.setString(9, vo.getNit());
            sentencia.setInt(10, vo.getId_persona());
            sentencia.executeUpdate();
    }


    public List<ExperienciaLaboral> busqueda(int id) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM experiencia_laboral WHERE id_persona=?");
        //int i = 1;
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        List<ExperienciaLaboral> listac = new ArrayList<>();
        while (resultado.next()) {
            ExperienciaLaboral voTempo = new ExperienciaLaboral();
            voTempo.setId_persona(resultado.getInt("id_persona"));
            voTempo.setNombre(resultado.getString("nombre"));
            voTempo.setTelefono(resultado.getString("telefono"));
            voTempo.setDireccion(resultado.getString("direccion"));
            voTempo.setUrl_archivo_adjunto(resultado.getString("url_archivo_adjunto"));
            voTempo.setFecha_inicio(resultado.getDate("fecha_inicio"));
            voTempo.setFecha_fin(resultado.getDate("fecha_fin"));
            voTempo.setCorreo(resultado.getString("correo"));
            voTempo.setComentario(resultado.getString("comentario"));
            voTempo.setNit(resultado.getString("nit"));
            listac.add(getVo(resultado));
        }
        return listac;
    }

    public ExperienciaLaboral queryNombre(String nombre) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM experiencia_laboral WHERE nombre=?");
        //int i = 1;
        sentencia.setString(1, nombre);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVo(resultado);
        }
        return null;
    }

    public ExperienciaLaboral consultarIdExperiencia(int id_experiencia) throws SQLException, ParseException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM experiencia_laboral "
                + "WHERE id_experiencia_laboral=?");
        //int i = 1;
        sentencia.setInt(1, id_experiencia);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVo(resultado);
        }
        return null;
    }
    public ExperienciaLaboral getVo(ResultSet resultado) throws SQLException {
        ExperienciaLaboral vot = new ExperienciaLaboral();
        vot.setId_persona(resultado.getInt("id_persona"));
        vot.setNombre(resultado.getString("nombre"));
        vot.setTelefono(resultado.getString("telefono"));
        vot.setDireccion(resultado.getString("direccion"));
        vot.setUrl_archivo_adjunto(resultado.getString("url_archivo_adjunto"));
        vot.setFecha_inicio(resultado.getDate("fecha_inicio"));
        vot.setFecha_fin(resultado.getDate("fecha_fin"));
        vot.setCorreo(resultado.getString("correo"));
        vot.setComentario(resultado.getString("comentario"));
        vot.setNit(resultado.getString("nit"));
        return vot;
    }
}
