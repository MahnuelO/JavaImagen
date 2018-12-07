package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.vo.Estudio;

public class EstudioDAO {
    Connection cnn;

    public EstudioDAO(Connection cnn) {
        this.cnn = cnn;

    }

    public void insert(Estudio vo) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("INSERT INTO estudio"
                + "(id_titulo_obtenido,id_persona,institucion,año,"
                + "url_archivos_adjuntos,id_pais,id_nivel_estudio) "
                + "VALUES (?,?,?,?,?,?,?)");
        int i = 1;
        sentencia.setInt(i++, vo.getId_titulo_obtenido());
        sentencia.setInt(i++, vo.getId_persona());
        sentencia.setString(i++, vo.getInstitucion());
        sentencia.setDate(i++, new java.sql.Date(vo.getAño().getTime()));
        sentencia.setString(i++, vo.getUrl_archivos_adjuntos());
        sentencia.setInt(i++, vo.getId_pais());
//        sentencia.setInt(i++, vo.getId_area());
//        sentencia.setInt(i++, vo.getId_modo_formacion());
        sentencia.setInt(i++, vo.getId_nivel_estudio());
        sentencia.executeUpdate();
    }

    public Estudio queryInstitucion(String institucion) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM estudio WHERE institucion=?");
        sentencia.setString(1, institucion);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVo(resultado);
        }
        return null;
    }
    
    public Estudio getVo(ResultSet resultado) throws SQLException {
        Estudio vot = new Estudio();
        vot.setId_estudio(resultado.getInt("id_estudio"));
        vot.setId_titulo_obtenido(resultado.getInt("id_titulo_obtenido"));
        vot.setId_persona(resultado.getInt("id_persona"));
        vot.setInstitucion(resultado.getString("institucion"));
        vot.setAño(resultado.getDate("año"));
        vot.setId_pais(resultado.getInt("id_pais"));
        return vot;
    }
    
}
