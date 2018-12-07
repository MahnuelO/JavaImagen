package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.Pais;

public class PaisDAO {
    
    Connection cnn;

    public PaisDAO(Connection cnn) {
        this.cnn = cnn;
    }
    
    public List<Pais> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM pais");
        ResultSet resultado = sentencia.executeQuery();
        List<Pais> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }
    
     public Pais buscarPais(int id) throws SQLException {
        String sql = "SELECT id_pais, nombre FROM pais WHERE id_pais=?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }

    private Pais getVO(ResultSet resultado) throws SQLException {
        Pais pais = new Pais();
        pais.setId_pais(resultado.getInt("id_pais"));
        pais.setNombre(resultado.getString("nombre"));
        return pais;
    }
    
}
