package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.Ciudad;

public class CiudadDAO{

    private final Connection cnn;

    public CiudadDAO(Connection cnn) {
        this.cnn = cnn;
    }
    private Ciudad getVO(ResultSet resultado) throws SQLException {
        Ciudad ciudad = new Ciudad();
        ciudad.setIdCiudad(resultado.getInt("id_ciudad"));
        ciudad.setIdDepartamento(resultado.getInt("id_departamento"));
        ciudad.setNombre(resultado.getString("nombre"));
        return ciudad;
    }
    
        public List<Ciudad> busqueda(int idCiudad) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM ciudad where id_departamento =?");
        int i =1;
        sentencia.setInt(i++, idCiudad);
        ResultSet resultado = sentencia.executeQuery();
        List<Ciudad> listac = new ArrayList<>();
        while (resultado.next()) {            
        Ciudad vo = new Ciudad();            
        vo.setIdCiudad(resultado.getInt("id_ciudad"));
        vo.setIdDepartamento(resultado.getInt("id_departamento"));
        vo.setNombre(resultado.getString("nombre"));
        listac.add(getVO(resultado));
        }
        return listac;
    }
        public Ciudad buscarCiudad(int id) throws SQLException {
        String sql = "SELECT id_ciudad, nombre, id_departamento FROM ciudad WHERE id_ciudad=?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }
}
