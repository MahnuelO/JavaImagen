package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.Departamento;

public class DepartamentoDAO{

    private final Connection cnn;

    public DepartamentoDAO(Connection cnn) {
        this.cnn = cnn;
    }
    private Departamento getVO(ResultSet resultado) throws SQLException {
        Departamento pregunta = new Departamento();
        pregunta.setIdDepartamento(resultado.getInt("id_departamento"));
        pregunta.setIdPais(resultado.getInt("id_pais"));
        pregunta.setNombre(resultado.getString("nombre"));
        return pregunta;
    }
    
        public List<Departamento> busqueda(int id) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM departamento where id_pais =?");
        int i =1;
        sentencia.setInt(i++, id);
        ResultSet resultado = sentencia.executeQuery();
        List<Departamento> lista = new ArrayList<>();
        while (resultado.next()) {            
        Departamento vo = new Departamento();            
        vo.setIdDepartamento(resultado.getInt("id_departamento"));
        vo.setIdPais(resultado.getInt("id_pais"));
        vo.setNombre(resultado.getString("nombre"));
            lista.add(getVO(resultado));
        }
        return lista;
    }
        public Departamento buscarDepartamento(int id) throws SQLException {
        String sql = "SELECT id_departamento, nombre, id_pais FROM departamento WHERE id_departamento=?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }
}
