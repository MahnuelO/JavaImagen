<%-- 
    Document   : PerfilAspirante
    Created on : 12-jun-2018, 20:11:39
    Author     : Familia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloPerfilAspirante.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/AspiranteNavegacion.js"></script>
        <title>PerfilAspirante</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <header>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-2 rectanguloheader1">
                        <center>
                            <img src="imagenes/LogoLinkers.PNG" class="mx-auto d-block img-responsive">
                        </center>
                    </div>
                    <div class="col-md-10 rectanguloheader2">
                        <div class="pull-right btn_cerrar">
                            <a><button id="btncerrar">CE</button></a>
                            <div class="rectangulo_nombre col-md-12 col-ms-10" id="degrade_nombre">
                                <label>Nombre: </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
        </header>
            <form method="POST">
                <header>
                    <br>
                    <nav class="navbar navbar-light" style="background-color: #E87022;">
                        <div class="container-fluid">
                            <div class="navbar-header">
                                <a class="navbar-brand" href="">ASPIRANTE</a>
                  </div>
                            <ul class="nav navbar-nav">
                                <li><a id="RegistrarHV"> HOJA DE VIDA</a></li>
                                <li><a id="Solicitudes"> SOLICITUDES</a></li>
                                <li><a id="CambiarContraseña"> CAMBIAR CONTRASEÑA</a></li>
                            </ul>    
                            <!--                            <ul class="nav navbar-nav navbar-right">     
                                                            <li><a href="">CERRAR SESIÒN</a></li>
                                                            <li><img src="" style="height: 50px; width: 50px; border-radius: 40px "/></li>   
                                                        </ul>-->
                        </div>
                    </nav>﻿
                </header>   

                <div id="contenidoAspirante">

                </div>
            </form>
            <footer>
                <div class="container-fluid">
                    <div class="rectangulo_final" id="degrade3"> 
                        <a href="" class="contactenos">Contáctenos</a>
                    </div> 
                </div>
            </footer>
    </body>
</html>

