package modelo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.vo.DetalleCargo;

public class DetalleCargoDAO {
    Connection cnn;

    public DetalleCargoDAO(Connection cnn) {
        this.cnn = cnn;
    }
    private DetalleCargo getVO(ResultSet resultado) throws SQLException {
        DetalleCargo detallecargo = new DetalleCargo();
        detallecargo.setId_detalle_cargo(resultado.getInt("id_detalle_cargo"));
        detallecargo.setId_cargo(resultado.getInt("id_cargo"));
        detallecargo.setDescripcion(resultado.getString("descripcion"));
        return detallecargo;
    }
    
    public List<DetalleCargo> busquedaDC(int idDetalleCargo) throws SQLException {
        PreparedStatement sentencia = cnn.prepareStatement("SELECT * FROM detalle_cargo where id_cargo =?");
        int i =1;
        sentencia.setInt(i++, idDetalleCargo);
        ResultSet resultado = sentencia.executeQuery();
        List<DetalleCargo> listadc = new ArrayList<>();
        while (resultado.next()) {            
        DetalleCargo vo = new DetalleCargo();            
        vo.setId_detalle_cargo(resultado.getInt("id_detalle_cargo"));
        vo.setId_cargo(resultado.getInt("id_cargo"));
        vo.setDescripcion(resultado.getString("descripcion"));
        listadc.add(getVO(resultado));
        }
        return listadc;
    }
        public DetalleCargo buscarDC(int id) throws SQLException {
        String sql = "SELECT id_detalle_cargo, descripcion, id_cargo FROM detalle_cargo WHERE id_detalle_cargo=?";
        PreparedStatement sentencia = cnn.prepareStatement(sql);
        sentencia.setInt(1, id);
        ResultSet resultado = sentencia.executeQuery();
        if (resultado.next()) {
            return getVO(resultado);
        }
        return null;
    }
    
}
