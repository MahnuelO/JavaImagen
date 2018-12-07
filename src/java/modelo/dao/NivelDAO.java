package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.Nivel;

public class NivelDAO {

    private final Connection cnn;

    public NivelDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public List<Nivel> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM nivel");
        ResultSet resultado = sentencia.executeQuery();
        List<Nivel> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    private Nivel getVO(ResultSet resultado) throws SQLException {
        Nivel nivel = new Nivel();
        nivel.setIdNivel(resultado.getInt("id_nivel"));
        nivel.setDescripcion(resultado.getString("descripcion"));
        return nivel;
    }
}
