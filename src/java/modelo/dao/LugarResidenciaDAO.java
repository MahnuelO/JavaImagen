
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.vo.LugarResidencia;

/**
 *
 * @author Aprendiz
 */
public class LugarResidenciaDAO {
     Connection cnn;
    
    public LugarResidenciaDAO (Connection cnn){
        this.cnn = cnn;
    }
    public void insertar (LugarResidencia vo) throws SQLException{
        PreparedStatement sentencia = cnn.prepareStatement("INSERT INTO lugar_residencia (id_ciudad, se_moveria, "
                + "telefono, direccion, id_persona) VALUES (?,?,?,?,?)");
        sentencia.setInt(1, vo.getId_ciudad());
        sentencia.setString(2, vo.getSe_moveria());
        sentencia.setString(3, vo.getTelefono());
        sentencia.setString(4, vo.getDireccion());
        sentencia.setInt(5, vo.getId_persona());
        sentencia.executeUpdate();
    }
    
        public LugarResidencia getVO(ResultSet resultado) throws SQLException{
        LugarResidencia vot = new LugarResidencia();
            vot.setId_ciudad(resultado.getInt("id_lugar_residencia"));
            vot.setId_ciudad(resultado.getInt("id_ciudad"));
            vot.setSe_moveria(resultado.getString("se_moveria"));
            vot.setTelefono(resultado.getString("telefono"));
            vot.setDireccion(resultado.getString("direccion"));
            vot.setId_persona(resultado.getInt("id_persona"));
            return vot;
            
    }
}
