
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.NivelEstudio;

public class NivelEstudioDAO {
    
    private final Connection cnn;

    public NivelEstudioDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public List<NivelEstudio> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM nivel_estudio");
        ResultSet resultado = sentencia.executeQuery();
        List<NivelEstudio> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    private NivelEstudio getVO(ResultSet resultado) throws SQLException {
        NivelEstudio nivelE = new NivelEstudio();
        nivelE.setId_nivel_estudio(resultado.getInt("id_nivel_estudio"));
        nivelE.setDescripcion(resultado.getString("descripcion"));
        return nivelE;
    }
    
}
