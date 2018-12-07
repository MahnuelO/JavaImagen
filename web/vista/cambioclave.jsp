<%-- 
 Document   : CambioContraseña
 Created on : 22/07/2018, 03:34:28 PM
 Author     : MAHNUEL
--%>

<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="control.ControlUsuario"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String contextPath = request.getContextPath();
    HttpSession sesion = request.getSession();
    Connection cnn = Conexion.getConexionDB();
    String claveActual = request.getParameter("claveActual");
    String clave = request.getParameter("claveNueva");
    String clave2 = request.getParameter("claveRepetir");
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();
   String claveActualcomparar = obt.getClave();
    String ClaveEncriptadaActual = DigestUtils.md5Hex(claveActualcomparar);
    if(claveActual == null){
    claveActual = "";
    }
    String ClaveEncriptada = DigestUtils.md5Hex(claveActual);
    if (claveActual != null && clave != null && clave2 != null) {
        Usuario vo = new Usuario();
        vo.setClave(clave);
        vo.setId_usuario(id);
        ControlUsuario control = new ControlUsuario(cnn);
        control.modificarClave(vo);
        if (vo != null) {
            response.sendRedirect(request.getContextPath() + "/vista/RegistrarInformacionEmpresa.jsp");
            Conexion.cerrarConexion(cnn);
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="vista/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="vista/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="vista/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="vista/js/jquery-ui.js" type="text/javascript"></script>
<!--        <script src="js/clave.js" type="text/javascript"></script>-->
        <title>Cambio Contraseña</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <div class="header">
            <div class="rectangulo1" id="degrade1">
            </div>
            <div class="rectangulo2" id="degrade2">
                <div class="nombre">
                    <label>Linkers</label>
                </div>
            </div>
            <div class="imagen_logo">
                <img src="imagenes/LogoLinkers.PNG">
            </div>
        </div>
        <form method="POST" onsubmit="return validar()">
            <div class="contenido">
                <div class="formilario_olvidoC">

                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <h1>Cambiar Contraseña</h1>
                            <label>Clave Actual</label>
                            <input class="form-control" id="claveActual" name="claveActual" type="text">
                            <label>Nueva contraseña</label>
                            <input class="form-control" id="claveNueva" name="claveNueva" type="password">
                            <label>Confime nueva contraseña</label>
                            <input class="form-control" id="claveRepetir" name="claveRepetir" type="password">
                        </div>
                        <div class="col-md-4"></div>
                    </div>


                    <br/>
                    <div id="btn_guardar">
                        <button id="id_btn_guardar_OC">Guardar</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="footer">
            <div class="rectangulo_final" id="degrade3">
                <a href="">Contactenos</a>
            </div>
        </div>
    </body>
</html>
