<%-- 
Document   : RegistrarCuenta
Created on : 12-jun-2018, 17:46:05
Author     : Linkers
--%>
<%@page import="control.EnvioCorreos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="control.TipoDocumentoControl"%>
<%@page import="modelo.vo.TipoDocumento"%>
<%@page import="control.ControlUsuario"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.PreguntaSeguridadControl"%>
<%@page import="modelo.vo.PreguntaSeguridad"%>
<%@page import="control.RolControl"%>

<%@page import="modelo.vo.Rol"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String rol = request.getParameter("id_rol");
    String tipoD = request.getParameter("id_tipo_identificacion");
    String id = request.getParameter("numero_identificacion");
    String fech = request.getParameter("fecha_nacimiento");
    String correo = request.getParameter("correo");
    String repetirCorreo = request.getParameter("correo");
    String clave = request.getParameter("clave");
    String repetirclave = request.getParameter("clave");
    String ps = request.getParameter("id_pregunta_seguridad");
    String respuesta = request.getParameter("respuesta");

    Connection cnn = Conexion.getConexionDB();
    if ((rol != null) && (tipoD != null) && (id != null) && (correo != null) && (repetirCorreo != null) && (clave != null)
            && (repetirclave != null) && (ps != null) && (respuesta != null)) {

        Usuario vo = new Usuario();
        vo.setId_rol(Integer.parseInt(rol));
        vo.setId_tipo_documento_identidad(Integer.parseInt(tipoD));
        vo.setNumero_identificacion(id);
        vo.setCorreo(correo);
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        vo.setFecha_nacimiento(formato.parse(fech));
        vo.setId_rol(Integer.parseInt(rol));
        vo.setId_pregunta_seguridad(Integer.parseInt(ps));
        vo.setClave(clave);
        vo.setRespuesta(respuesta);
        ControlUsuario user = new ControlUsuario(cnn);
        user.insert(vo);
        cnn.commit();
       EnvioCorreos env = new EnvioCorreos();
       env.enviarCorreos(vo);
        if (vo != null) {
            response.sendRedirect(request.getContextPath() + "/vista/mensajecorreo.jsp");

        }

    }
%>

<html>
    <head>
        <title>inicio</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <link href="css/iconos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/ValidacionFRM.js"></script>
        <script type="text/javascript" src="js/ValidacionRegistro.js"></script>
        <link href="Librerias/hint.css-2.5.0/hint.min.css" rel="stylesheet" type="text/css"/>
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
                            <img src="imagenes/LogoLinkers.PNG" class="mx-auto d-block img-responsive">
                        </div>
                    </center>    
                    <div class="col-md-5 rectangulo1" id="degrade1">
                        <div class="pull-right btn_registrarse">
                            <a href="iniciarsesion.jsp"><button id="btnRegistrarse">Iniciar sesión</button></a>
                            
                        </div>
                    </div>
                </div>
            </div>    
        </header>
        <section class="main">

            <form id="formularioRC" method="POST" action="" onsubmit="return accionValidarR()">
                <br><div id="hola" class="container-fluid">
                    <div id="h1" class="col-md-1"></div>
                    <div id="h2" class="col-md-4">

                        <div class="img-responsive">
                            <img id="idImagen" src="imagenes/empresarios.png">
                        </div>

                    </div>

                    <div id="h3" class="col-md-6">
                        <div id="c1" class="form-group col-md-6">

                            <br><label class="label-control" for="id_tipo_identificacion">Tipo de identificación</label>
                            <label class="label-control" id="id_asterisco">*</label>
                            <span class="hint--top hint--info" data-hint="Seleccione el tipo de documento">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <div id="hh1">
                                <select id="id_tipo_identificacion" name="id_tipo_identificacion" class="form-control" >
                                    <option value="-1">Seleccione</option>
                                    <%
                                        List<TipoDocumento> lista = new TipoDocumentoControl(cnn).query();
                                        for (TipoDocumento tipo : lista) {
                                    %>
                                    <option onclick="buscarSelect()" id="hola" value="<%= tipo.getId_tipo_documento()%>"><%= tipo.getDescripcion()%></option>
                                    <%
                                        }
                                    %>          
                                </select>
                            </div>

                            <br><label for="clave">Contraseña</label>
                            <label id="id_asterisco">*</label>
                            <span class="hint--top hint--info" data-hint="Escriba una contraseña que contenga de 8 a 16 caracteres">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>
                            <!--                            <a href="#" data-toggle="tooltip" title="Escriba una contraseña que contenga de 8 a 16 caracteres"><img src="imagenes/pregunta.png" width="15" height="15"/></a>-->
                            <input id="clave" name="clave" minlength="8" maxlength="16" type="password" placeholder="Escriba una contraseña" class="form-control">

                            <br><label for="correo">Correo</label>
                            <label id="id_asterisco">*</label>
                            <span class="hint--top hint--info" data-hint="Ingrese un correo electrónico válido">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <input id="correo" name="correo" maxlength="30" type="email" placeholder="ejemplo@ejemplo.co" class="form-control">

                            <!-- aqui va la pregunta -->    
                            <br><label for="id_pregunta_seguridad">Pregunta de seguridad</label>
                            <span class="hint--top hint--info" data-hint="Seleccione una pregunta de seguridad">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <select id="id_pregunta_seguridad" name="id_pregunta_seguridad" class="form-control">
                                <option value="-1">Seleccione</option>
                                <%    List<PreguntaSeguridad> lista2 = new PreguntaSeguridadControl(cnn).query();
                                    for (PreguntaSeguridad tipo : lista2) {
                                %>
                                <option value="<%= tipo.getIdPreguntaSeguridad()%>"><%= tipo.getDescripcion()%></option>
                                <%
                                    }
                                %>        
                            </select>


                            <br><label for="fecha_nacimiento">Fecha de nacimiento</label>
                            <label id="id_asterisco">*</label>
                            <input id="fecha_nacimiento" name="fecha_nacimiento" type="date" class="form-control" >


                        </div>
                        <div id="c2" class="form-group col-md-6">
                            <br><label for="numero_identificacion">Número de identificación</label>
                            <label id="id_asterisco">*</label>
                            <span class="hint--top hint--info" data-hint="Ingrese el número de identificación">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <input id="numero_identificacion" name="numero_identificacion" maxlength="10" type="text" placeholder="Escriba su número de identificación" class="form-control">
                            <!--poner confirmar contraseña-->


                            <br><label for="clave2">Confirmar contraseña</label>
                            <label id="id_asterisco">*</label>
                            <span class="hint--top hint--info" data-hint="Vuelve a escribir la contraseña">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <input id="clave2" name="clave2" minlength="8" maxlength="16" type="password" placeholder="Confirme la contraseña" class="form-control">

                            <!-- Confirmar Correo -->


                            <br><label for="correo">Confirmar Correo</label>
                            <label id="id_asterisco">*</label>
                            <span class="hint--top hint--info" data-hint="Vuelva a escribir el correo">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <input id="correo" name="correo2" maxlength="30" type="email" placeholder="ejemplo@ejemplo.co" class="form-control">

                            <br><label for="respuesta">Respuesta</label>
                            <label id="id_asterisco">*</label>
                            <span class="hint--top hint--info" data-hint="Escriba la respuesta para la pregunta de seguridad">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <input id="respuesta" name="respuesta" type="text" placeholder="Respuesta de la pregunta" class="form-control"><br>



                        </div>
                        <div class="col-md-12">
                            <input type="checkbox" name="terminosCondiciones" value="1">
                            <a href="">Acepto términos y condiciones</a>
                            <span class="hint--top hint--info" data-hint="Al hacer clic acepta los terminos y condiciones">
                                <img src="imagenes/pregunta.png" width="15" height="15"/>
                            </span>

                            <label id="id_asterisco">*</label><br/>
                            <input type="checkbox" name="mensajes" value="1">
                            <label>Desea recibir mensajes de nuestros aliados por correo electrónico</label><br><br>
                        </div>    
                        <div  id="b1" class="pull-left btn_botones" >
                            <button onclick="history.back()" >Cancelar</button>
                        </div> 
                        <div id="b2" class="pull-right btn_botones" >
                            <button id="id_btn_registrar">Registrar</button>
                        </div>
                    </div>
                </div>
                <select id="id_rol" name="id_rol" style="visibility:hidden">
                    <option value="-1">Seleccione</option>
                    <%
                        List<Rol> lista3 = new RolControl(cnn).query();
                        for (Rol tipo : lista3) {
                    %>
                    <option value="<%= tipo.getId_rol()%>"><%= tipo.getDescripcion()%></option>
                    <%
                        }
                    %>          
                </select>
                <div id="respuesta"></div>
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

<script>
    var select = document.getElementById('id_tipo_identificacion');
    select.addEventListener('change',
            function () {
                var n = document.getElementById("id_tipo_identificacion").selectedIndex;
                if (n === 4) {
                    var contenedorFile = document.getElementById('hh1');
                    var x = document.createElement("INPUT");
                    x.setAttribute("type", "text");
                    x.setAttribute("id", "validar");
                    x.setAttribute("class", "form-control");
                    contenedorFile.appendChild(x);

                    var inputRol = document.getElementById("id_rol");
                    inputRol.value = "1";
                }
                else {
                    var inputRol = document.getElementById("id_rol");
                    inputRol.value = "2";
                }
            });
</script>
    Conexion.cerrarConexion(cnn);