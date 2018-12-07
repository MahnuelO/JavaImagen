package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.TipoCategoria;

public class TipoCategoriaDAO {

    private final Connection cnn;

    public TipoCategoriaDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public List<TipoCategoria> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM categoria_licencia_conduccion");
        ResultSet resultado = sentencia.executeQuery();
        List<TipoCategoria> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    public TipoCategoria buscarCategoria(int id) throws SQLException {
        String sql = "SELECT * FROM categoria_licencia_conduccion where id_categoria_licencia_conduccion = ?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }

    private TipoCategoria getVO(ResultSet resultado) throws SQLException {
        TipoCategoria tipo = new TipoCategoria();
        tipo.setId_categoria_licencia_conduccion(resultado.getInt("id_categoria_licencia_conduccion"));
        tipo.setCategoria(resultado.getString("categoria"));
        return tipo;
    }
}
