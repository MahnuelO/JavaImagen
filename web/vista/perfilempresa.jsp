<%-- 
    Document   : PerfilEmpresa
    Created on : 12-jun-2018, 20:16:23
    Author     : Familia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <title>Perfil Empresa</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <div class="header">
            <div class="encabezado">  
                <div class="rectangulo_nombre" id="degrade_nombre">
                        
                </div>
            </div>
        </div>
        <div class="navegacion">
            <ul>
                <li><a id="RegistrarInfo"> Mi Información</a></li>
<!--                <li><a id="per" > Perfiles de Interes</a></li>-->
                <li><a id="consultarPerfil"> Consultar Perfil</a></li>
                <li><a id="historial"> Historial</a></li>
<!--                <li><a href=""> Actualización de datos</a></li>-->
                <li><a id="CambiarClave"> Cambiar contraseña</a></li>
            </ul>
        </div><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/>        
        <br/><br/><br/><br/><br/>
        <br/><br/><br/><br/><br/>
        <div class="footer">
            <div class="rectangulo_final" id="degrade3">
                <a href="">Contáctenos</a>
            </div> 
        </div>  
    </body>
</html>
