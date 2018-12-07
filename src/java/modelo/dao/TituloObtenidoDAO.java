package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.TituloObtenido;

public class TituloObtenidoDAO {
    
    private Connection cnn;

    public TituloObtenidoDAO(Connection cnn) {
        this.cnn = cnn;
    }

    public List<TituloObtenido> queryB() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM titulo_obtenido "
                + "WHERE id_titulo_obtenido BETWEEN 1 AND 3");
//        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM titulo_obtenido");
        ResultSet resultado = sentencia.executeQuery();
        List<TituloObtenido> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    public List<TituloObtenido> queryS() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM titulo_obtenido "
                + "WHERE id_titulo_obtenido BETWEEN 4 AND 9");
//        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM titulo_obtenido");
        ResultSet resultado = sentencia.executeQuery();
        List<TituloObtenido> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    public List<TituloObtenido> queryP() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM titulo_obtenido WHERE id_titulo_obtenido BETWEEN 10 AND 15");
//        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM titulo_obtenido");
        ResultSet resultado = sentencia.executeQuery();
        List<TituloObtenido> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }

    private TituloObtenido getVO(ResultSet resultado) throws SQLException {
        TituloObtenido tipo = new TituloObtenido();
        tipo.setId_titulo_obtenido(resultado.getInt("id_titulo_obtenido"));
        tipo.setDescripcion(resultado.getString("descripcion"));
        return tipo;
    }
    
}
