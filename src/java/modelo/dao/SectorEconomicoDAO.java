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
import java.util.ArrayList;
import java.util.List;
import modelo.vo.SectorEconomico;


public class SectorEconomicoDAO {

    private final Connection cnn;
    
      public SectorEconomicoDAO(Connection cnn) {
        this.cnn = cnn;
    }
      
        public List<SectorEconomico> query() throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM sector_economico");
        ResultSet resultado = sentencia.executeQuery();
        List<SectorEconomico> lista = new ArrayList<>();
        while (resultado.next()) {
            lista.add(getVO(resultado));
        }
        return lista;
    }
     
        public SectorEconomico buscarSector(int id) throws SQLException {
        String sql = "select id_sector_economico, sector_economico from sector_economico where id_sector_economico =?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }    
        
    private SectorEconomico getVO(ResultSet resultado) throws SQLException {
        SectorEconomico sector = new SectorEconomico();
        sector.setIdSectorEconomico(resultado.getInt("id_sector_economico"));
        sector.setSectorEconomico(resultado.getString("sector_economico"));
        return sector;
    }

}
