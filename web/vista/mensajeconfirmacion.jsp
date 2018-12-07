<%-- 
    Document   : mensajeconfirmacion
    Created on : 22/08/2018, 10:10:26 PM
    Author     : NATALIA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Link</title>
         <link href="vista/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <div class="container-fluid">
            <div class="alert alert-success" role="alert">
                Su correo ha sido validado correctamente, puede iniciar sesión
            </div>
            <div class="">
                <!--                <a href="http://localhost:8080/LinkersUp/vista/iniciarsesion.jsp"><input></a>-->
                <a href="http://localhost:8080/Pluggers/vista/iniciarsesion.jsp"><input type="button" value="Aceptar" class="btn-warning"></a>
            </div>
        </div>
    </body>
</html>
