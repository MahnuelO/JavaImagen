/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import modelo.vo.Domina;
/**
 *
 * @author carmen
 */
public class DominaDAO {
    Connection cnn;

    public DominaDAO(Connection cnn) {
        this.cnn = cnn;

    }

    public void insert(Domina vo) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("INSERT INTO domina(id_persona,id_idioma,id_nivel) VALUES (?,?,?)");
        int i = 1;
        sentencia.setInt(i++, vo.getId_persona());
        sentencia.setInt(i++, vo.getId_idioma());
        sentencia.setInt(i++, vo.getId_nivel());
        
        sentencia.executeUpdate();

    }
}
