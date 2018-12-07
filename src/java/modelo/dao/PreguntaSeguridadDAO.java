package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.PreguntaSeguridad;

public class PreguntaSeguridadDAO {

    private final Connection cnn;

    public PreguntaSeguridadDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public List<PreguntaSeguridad> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM pregunta_seguridad");
        ResultSet resultado = sentencia.executeQuery();
        List<PreguntaSeguridad> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    private PreguntaSeguridad getVO(ResultSet resultado) throws SQLException {
        PreguntaSeguridad pregunta = new PreguntaSeguridad();
        pregunta.setIdPreguntaSeguridad(resultado.getInt("id_pregunta_seguridad"));
        pregunta.setDescripcion(resultado.getString("descripcion"));
        return pregunta;
    }
}
