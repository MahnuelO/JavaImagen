<%-- 
    Document   : validarSesionMenu
    Created on : 29/04/2018, 01:54:49 PM
    Author     : MAHNUEL
--%>

<%@page import="modelo.vo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
HttpSession sesion = request.getSession();
    Usuario vo = (Usuario) sesion.getAttribute("usuario");
    System.out.print("LINKERS-->" + request.getServletPath());
//     out.println("<h1>HOME "+vo.getRespuesta()+"</h1>");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
