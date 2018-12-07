<%-- 
    Document   : OlvidoContraseña
    Created on : 19-jun-2018, 17:58:05
    Author     : Familia
--%>

<%@page import="modelo.vo.Usuario"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="control.ControlUsuario"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String contextPath = request.getContextPath();
    Usuario vo = new Usuario();
    Connection cnn = Conexion.getConexionDB();
    ControlUsuario control = new ControlUsuario(cnn);
    
    String identificacion = request.getParameter("numero_identificacion");
    String clave = request.getParameter("clave");
    String clave2 = request.getParameter("clave2");
    
    if (identificacion != null && clave != null && clave2 != null) {
        vo.setClave(clave);
        if (control.modificar(vo)) {
            response.sendRedirect(request.getContextPath() + "/vista/iniciarsesion.jsp");
            Conexion.cerrarConexion(cnn);
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/ValidacionOlvidoContraseña.js"></script>
        <title>Olvido Contraseña</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <div class="header">
            <div class="rectangulo1" id="degrade1">
                <div class="btn_registrarse">
                    <a href="vista/RegistrarCuenta.jsp"><button>Registrarse</button></a>
                </div>
            </div>
            <div class="rectangulo2" id="degrade2">
                <div class="nombre">
                    <label>Pluggers</label>
                </div>
            </div>
            <div class="imagen_logo">
                <img src="imagenes/LogoLinkers.PNG">
            </div>
        </div>
        <form method="POST">
            <div class="contenido">
                <div class="formilario_olvidoC">
                    <h1>¿Has olvidado tu contraseña?</h1>
                    <label>Identificación</label>
                    <input id="numero_identificacion" name="numero_identificacion" type="text" placeholder="Escriba su identificación"><br/>
                    <label>Nueva contraseña</label>
                    <input id="clave" name="clave" type="password" placeholder="Escriba una contraseña"><br/>
                    <label>Confime nueva contraseña</label>
                    <input id="clave2" name="clave2" type="password" placeholder="Confirme la contraseña"><br/><br/>
                    <div id="btn_guardar">
                        <button id="id_btn_guardar_OC">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="footer">
            <div class="rectangulo_final" id="degrade3">
                <a href="">Contáctenos</a>
            </div> 
        </div>
    </body>
</html>
