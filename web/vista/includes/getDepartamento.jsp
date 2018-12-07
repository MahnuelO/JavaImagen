
<%@page import="control.DepartamentoControl"%>
<%@page import="modelo.vo.Departamento"%>
<%@page import="java.util.List"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%
 Connection cnn = Conexion.getConexionDB();
 
      String id_pais = request.getParameter("id_pais");
  
       List<Departamento> listaD = new DepartamentoControl(cnn).consultar(Integer.parseInt(id_pais));
       
       String html = "<option value='0'> Seleccionar</option>"; 
       out.print(html);
               for (Departamento departamento : listaD) {
                    html = "<option value='"+departamento.getIdDepartamento()+"'>"+departamento.getNombre()+"</option>";
                   out.print(html);  
               }
//                 
                        %>                 


        

