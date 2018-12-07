package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.Idioma;

public class IdiomaDAO {

    private final Connection cnn;

    public IdiomaDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public List<Idioma> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM idioma");
        ResultSet resultado = sentencia.executeQuery();
        List<Idioma> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    private Idioma getVO(ResultSet resultado) throws SQLException {
        Idioma idioma = new Idioma();
        idioma.setIdIdioma(resultado.getInt("id_idioma"));
        idioma.setNombreIdioma(resultado.getString("nombre_idioma"));
        return idioma;
    }
}
