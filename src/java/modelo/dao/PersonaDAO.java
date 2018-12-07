package modelo.dao;

import java.io.ByteArrayInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.vo.Persona;

public class PersonaDAO {

    Connection cnn;

    public PersonaDAO(Connection cnn) {
        this.cnn = cnn;

    }

    public void insert(Persona vo) throws SQLException {
        String sql = "INSERT INTO persona("
                + "nombre, apellido,  fecha_expedicion"
                + ",estado_civil, perfil, genero"
                + ",numero_libreta_militar, foto) VALUES (?,?, ?,?,?,?,?,?)";

        PreparedStatement sentencia = cnn.prepareStatement(sql);
        int i = 1;
        //sentencia.setInt(i++, vo.getId_usuario()); id_usuario, ?,
        //sentencia.setInt(i++, vo.getId_ciudad()); , id_cuidad  ?,
        sentencia.setString(i++, vo.getNombre());
        sentencia.setString(i++, vo.getApellido());
        //sentencia.setString(i++, vo.getDireccion()); direccion,?,
        sentencia.setDate(i++, new java.sql.Date(vo.getFecha_expedicion().getTime()));
        sentencia.setString(i++, vo.getEstado_civil());
        sentencia.setString(i++, vo.getPerfil());
       // sentencia.setInt(i++, vo.getId_categoria_licencia_conduccion()); , id_categoria_licencia_conduccion ,?
        sentencia.setString(i++, vo.getGenero());
        //sentencia.setString(i++, vo.getSe_moveria()); , se_moveria ,?
        //sentencia.setString(i++, vo.getTelefono());, telefono ,?
        sentencia.setString(i++, vo.getNumero_libreta_militar());
        
        //sentencia.setInt(i++, vo.getId_pais()); id_pais, ?,
        sentencia.setBinaryStream(i++, new ByteArrayInputStream(vo.getFoto()));
        sentencia.executeUpdate();

    }

    public Persona buscarId(int id) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM persona WHERE id_usuario=?");
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }

    private Persona getVO(ResultSet resultado) throws SQLException {
        Persona persona = new Persona();
        persona.setId_usuario(resultado.getInt("id_usuario"));
        persona.setId_persona(resultado.getInt("id_persona"));
        persona.setId_ciudad(resultado.getInt("id_cuidad"));
        persona.setNombre(resultado.getString("nombre"));
        persona.setApellido(resultado.getString("apellido"));
        persona.setDireccion(resultado.getString("direccion"));
        persona.setFecha_expedicion(new java.sql.Date(resultado.getDate("fecha_expedicion").getTime()));
        persona.setEstado_civil(resultado.getString("estado_civil"));
        persona.setPerfil(resultado.getString("perfil"));
        persona.setId_categoria_licencia_conduccion(resultado.getInt("id_categoria_licencia_conduccion"));
        persona.setGenero(resultado.getString("genero"));
        persona.setSe_moveria(resultado.getString("se_moveria"));
        persona.setTelefono(resultado.getString("telefono"));
        persona.setNumero_libreta_militar(resultado.getString("numero_libreta_militar"));
//        persona.setUrl(resultado.getString("url"));
        persona.setFoto(resultado.getBytes("foto"));
        persona.setId_pais(resultado.getInt("id_pais"));
        return persona;
    }
}
