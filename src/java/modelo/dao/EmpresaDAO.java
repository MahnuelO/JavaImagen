/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.vo.Empresa;

/**
 *
 * @author NATALIA
 */
public class EmpresaDAO {

    Connection cnn;

    public EmpresaDAO(Connection cnn) {
        this.cnn = cnn;

    }

    public void insert(Empresa vo) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("INSERT INTO empresa(id_sector_economico,id_usuario,id_ciudad,nombre_encargado,razon_social,"
                + "descripcion,apellido,direccion,nit, telefono) VALUES (?,?,?,?,?,?,?,?,?,?)");
        int i = 1;
        sentencia.setInt(i++, vo.getIdSectorEconomico());
        sentencia.setInt(i++, vo.getIdUsuario());
        sentencia.setInt(i++, vo.getIdCiudad());
        sentencia.setString(i++, vo.getNombreEncargado());
        sentencia.setString(i++, vo.getRazonSocial());
        sentencia.setString(i++, vo.getDescripcion());
        sentencia.setString(i++, vo.getApellido());
        sentencia.setString(i++, vo.getDireccion());
        sentencia.setString(i++, vo.getNit());
        sentencia.setString(i++, vo.getTelefono());
        sentencia.executeUpdate();
    }
    
        public Empresa buscarId(int id) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM empresa WHERE id_usuario=?");
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVo(resultado);
        }
         return null;
    }
        public Empresa getVo(ResultSet resultado) throws SQLException {
        Empresa vot = new Empresa();
        vot.setIdEmpresa(resultado.getInt("id_empresa"));
        vot.setIdSectorEconomico(resultado.getInt("id_sector_economico"));
        vot.setIdUsuario(resultado.getInt("id_usuario"));
        vot.setIdCiudad(resultado.getInt("id_ciudad"));
        vot.setNombreEncargado(resultado.getString("nombre_encargado"));
        vot.setRazonSocial(resultado.getString("razon_social"));
        vot.setDescripcion(resultado.getString("descripcion"));
        vot.setApellido(resultado.getString("apellido"));
        vot.setDireccion(resultado.getString("direccion"));
        vot.setNit(resultado.getString("nit"));
        vot.setTelefono(resultado.getString("telefono"));
        return vot;
    }
}

