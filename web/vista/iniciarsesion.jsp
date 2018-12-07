<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.vo.Usuario"%> 
<%@page import="control.ControlUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String contextPath = request.getContextPath();
    response.setHeader("Cache-Control", "no-store,no-cache, must-revalidate");
    response.addHeader("Cache-Control", "post-check=0, pre-check=0");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    String identificacion = request.getParameter("numero_identificacion");
    String clave = request.getParameter("clave");
    String error = request.getParameter("e");
    Connection cnn = Conexion.getConexionDB();
   if (identificacion != null && clave != null && error == null) {
        String ClaveEncriptada = DigestUtils.md5Hex(clave);
        ControlUsuario control = new ControlUsuario(cnn);
        Usuario vo1 = control.buscarRol(identificacion);
        int rol1 = vo1.getId_rol();
       Usuario vo = control.query(identificacion, ClaveEncriptada, rol1);
       //Usuario vo = control.query(identificacion, clave, rol1);
        vo.getId_rol(); 
        if (vo != null) { 
            if (rol1 == 1) {
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", vo); 
                response.sendRedirect(request.getContextPath() + "/vista/registrarinformacionempresa.jsp");
            } else if (rol1 == 2) {
                 HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", vo); 
             // response.sendRedirect(request.getContextPath() + "/vista/cambioclave.jsp");
            response.sendRedirect(request.getContextPath() + "/vista/registrardatosbasicos.jsp");
            }
        }
    }
%>
<html>
    <head>
        <title>inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="vista/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/iconos.css" rel="stylesheet" type="text/css"/>
        <script src="vista/js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="vista/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="vista/js/jquery-ui.js" type="text/javascript"></script>
        <script src="vista/js/validarIniciarSesion.js" type="text/javascript"></script>
<!--    <script src="js/codigoEjemplo.js" type="text/javascript"></script>-->
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5 rectangulo2" id="degrade2">
                        <div class="nombre">
                            <h1>Pluggers</h1>
                        </div>    
                    </div>
                    <center>
                        <div class="col-md-2 ">
                            <img src="vista/imagenes/LogoLinkers.PNG" class="mx-auto d-block img-responsive">
                        </div>
                    </center>       
                    <div class="col-md-5 rectangulo1" id="degrade1">
                        <div class="pull-right btn_registrarse">
                            <a href="vista/registrarcuenta.jsp"><button id="btnRegistrarse">Registrarse</button></a>
                            <a><button id="btnIrIniciarSesion">Iniciar sesión</button></a>
                        </div>
                    </div>
                </div>
            </div>    
        </header>
        <section class="main">
            <form method="POST">
                <div id="contenido">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-5">
                                <div class="container-fluid">
                                    <center>
                                        <img src="vista/imagenes/contratado.jpg" class="mx-auto d-block img-responsive">
                                    </center>
                                </div>
                            </div>
                            <div class="col-md-2"><br></div>
                            <form method="POST">
                                <div class="col-md-4">
                                    <br><br><br>
                                    <div class="jumbotron" id="jumbotron">
                                        <div class="container">
                                            <div class="row">
                                                <center>
                                                    <h3>INICIAR SESIÓN</h3><br>
                                                </center>
                                                <div class="form-group col-md-12">
                                                    <label for="numero_identificacion" class="label-control">Número de identificación</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                        <input id="numero_identificacion" type="text" name="numero_identificacion" class="form-control" /><br>
                                                    </div>
                                                </div> 
                                                <div class="form-group col-md-12">
                                                    <label for="clave" class="label-control">Contraseña</label>
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                                        <input id="clave" type="password" name="clave" class="form-control"/>
                                                    </div>
                                                </div>   
                                                <center>
                                                    <a href="vista/OlvidoContraseña.jsp">¿Has olvidado tu contraseña?</a>
                                                    <div class="btn_InicioSesion"><br/>
                                                        <button id="btnIniciarSesion">Iniciar sesión</button>
                                                    </div>
                                                </center>  
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </form>
        </section>
        <footer>
            <div class="container-fluid">
                <div class="rectangulo_final" id="degrade3"> 
                    <a href="" class="contactenos">Contáctenos</a>
                </div> 
            </div>
        </footer> 
    </body>
</html>


