package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.TipoDocumento;

public class TipoDocumentoDAO {

    private final Connection cnn;

    public TipoDocumentoDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public List<TipoDocumento> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM tipo_documento");
        ResultSet resultado = sentencia.executeQuery();
        List<TipoDocumento> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    public TipoDocumento buscarTipoDoc(int id) throws SQLException {
        String sql = "SELECT id_tipo_documento, descripcion FROM tipo_documento WHERE id_tipo_documento=?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }

    private TipoDocumento getVO(ResultSet resultado) throws SQLException {
        TipoDocumento tipo = new TipoDocumento();
        tipo.setId_tipo_documento(resultado.getInt("id_tipo_documento"));
        tipo.setDescripcion(resultado.getString("descripcion"));
        return tipo;
    }
}
