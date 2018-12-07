package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.Rol;

public class RolDAO {
    
    private final Connection cnn;

    public RolDAO(Connection cnn) {
        this.cnn = cnn;
    }
    
     public List<Rol> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM rol");
        ResultSet resultado = sentencia.executeQuery();
        List<Rol> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }
     
    private Rol getVO(ResultSet resultado) throws SQLException {
        Rol rol = new Rol();
        rol.setId_rol(resultado.getInt("id_rol"));
        rol.setDescripcion(resultado.getString("descripcion"));
        return rol;
    }
    
    public Rol rolAspirante(String rol) throws SQLException{
    PreparedStatement sentencia = cnn.prepareStatement("SELECT descripcion FROM rol WHERE id_rol=1");
    sentencia.setString(1, rol);
    ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }else{
        return null;
        }
    }
    
    public Rol rolEmpresa(String rol) throws SQLException{
    PreparedStatement sentencia = cnn.prepareStatement("SELECT descripcion FROM rol WHERE id=2");
    sentencia.setString(1, rol);
    ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }else{
        return null;
        }
    }

    
    
}
