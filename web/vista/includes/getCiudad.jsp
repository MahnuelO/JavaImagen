
<%@page import="control.CiudadControl"%>
<%@page import="modelo.vo.Ciudad"%>
<%@page import="java.util.List"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%
 Connection cnn = Conexion.getConexionDB();
 
      String id_departamento = request.getParameter("id_departamento");

       List<Ciudad> listaC = new CiudadControl(cnn).consultar(Integer.parseInt(id_departamento));
       
       String html = "<option value='0'>Seleccionar</option>"; 
       out.print(html);
       
               for (Ciudad ciudad : listaC) {
                    html = "<option value='"+ciudad.getIdCiudad()+"'>"+ ciudad.getNombre()+"</option>";
                   out.print(html);  
               }
                       %>                 


        

