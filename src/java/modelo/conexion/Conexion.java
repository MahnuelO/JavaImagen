package modelo.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static Connection getConexionDB() throws ClassNotFoundException, SQLException{
        String servidor = "localhost";
        String nombreDB = "PluggersFoto";
        String usuario = "postgres";
        String clave = "postgres";
        String puerto = "5432";
        
         Class.forName("org.postgresql.Driver"); 
        
        Connection cnn = DriverManager.getConnection("jdbc:postgresql://"+servidor+":"+puerto+"/"+nombreDB, usuario, clave);
        cnn.setAutoCommit(false);
        return cnn;
    }
    public static void cerrarConexion(Connection cnn) throws SQLException{
        cnn.commit();
        cnn.close();
    }
    
    public static void cancelarTran(Connection cnn) throws SQLException{
        cnn.rollback();
        cnn.close();
    }
}


//    public static void cerrarCnn(Connection cnn) {
//      //  throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
//
//    public static void reversarCnn(Connection cnn) {
//       // throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
//    }
  // Fin Clase conexion
