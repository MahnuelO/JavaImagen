package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.Cargo;

public class CargoDAO {
    Connection cnn;

    public CargoDAO(Connection cnn) {
        this.cnn = cnn;
    }
    
    public List<Cargo> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM cargo");
        ResultSet resultado = sentencia.executeQuery();
        List<Cargo> listaCA = new ArrayList<>();
        while (resultado.next()) {
            listaCA.add(getVO(resultado));
        }
        return listaCA;
    }
    
     public Cargo buscarCargo(int idCA) throws SQLException {
        String sql = "SELECT id_cargo, descripcion FROM cargo WHERE id_cargo=?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, idCA);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }

    private Cargo getVO(ResultSet resultado) throws SQLException {
        Cargo cargo = new Cargo();
        cargo.setId_cargo(resultado.getInt("id_cargo"));
        cargo.setDescripcion(resultado.getString("descripcion"));
        return cargo;
    }
    
}
