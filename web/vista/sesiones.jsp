<%-- 
    Document   : sesiones
    Created on : 24/09/2018, 04:49:36 PM
    Author     : MAHNUEL
--%>

<%@page import="utils.AppException"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="control.ControlUsuario"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    
            response.setHeader("Cache-Control", "no-store,no-cache, must-revalidate");
            response.addHeader("Cache-Control", "post-check=0, pre-check=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            HttpSession sesion = request.getSession();
            String numero_identificacion = request.getParameter("numero_identificacion");
            String clave = request.getParameter("clave");
            try {
                ControlUsuario ac = new ControlUsuario();
                Usuario vo1 = ac.buscarRol(numero_identificacion);
                int rol = vo1.getId_rol();
                if (sesion.getAttribute("usuario") == null && !request.getServletPath().equals("/usuario/login") && !request.getServletPath().equals("/usuario/crear") && !request.getServletPath().equals("/CrearUsuario") && !request.getServletPath().equals("/CrearEmpleado")) {
                      response.sendRedirect("usuario/login");
                } else if (sesion.getAttribute("usuario") != null && (request.getServletPath().equals("/usuario/login"))) {
                    response.sendRedirect(request.getContextPath() + "/iniciarsesion.jsp");
                }
            } catch (AppException e) {

               
            }

        
    
    


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        
    </body>
</html>
