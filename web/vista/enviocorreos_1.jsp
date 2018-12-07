<%-- 
    Document   : EnvioCorreos
    Created on : 23-jul-2018, 17:42:12
    Author     : carmen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>correo</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <!--<link href="vista/css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/EstiloCorreo.css" rel="stylesheet" type="text/css"/>
        <link href="vista/css/iconos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/validarIniciarSesion.js" type="text/javascript"></script>
        <!--    <script src="js/codigoEjemplo.js" type="text/javascript"></script>-->
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <header>
            
            <div class="container-fluid" id="fondo">
                <div class="row">
                    <div class="col-md-5 rectangulo2" id="degrade2">

                    </div>
                    <div>
                        <center>
                            <div class="nombre" id="nombre">
                                <label>PLUGGERS</label>
                            </div> 
                        </center>  
                        <center>
                            <div class=" ">
                                <img src="imagenes/LogoLinkers.PNG" class="mx-auto d-block img-responsive">
                            </div>
                        </center>       
                    </div>
                </div>
            </div>
        </header>
        <form method="POST">
            <center>
                <div  class="header">
                    <label id="saludo" for="saludo" >Buen día:</label><br/><br/>
                </div>

                <div class="row">
                    <div id="mensaje">
                        <div class="footer" >
                            <label id= "texto">Incrementa la búsqueda de empleo efectiva.</label><br/>
                            <label id="contacto">Contactanos: pluggerssi@gmail.com<br/> 
                                Linea telefonica: 9075648</label><br/>
                            <label id="firma">Pluggers</label>
                        </div>        
                    </div>

                </div>    
            </center>


            <!--            <div class="form-group col-md-12" id="header">
                            <label for="saludo" class="label-control">Buen día:</label><br/><br/>
                        </div>
            
                        <div class="form-group col-md-12" id="footer">
                            <label id= "texto" for="texto" class="label-control">Incrementa la búsqueda de empleo efectiva.</label><br/>
                            <label id="contacto" for="contacto" class="label-control">Contactanos: pluggerssi@gmail.com<br/> 
                                                                                      Linea telefonica: 9075648</label><br/>
                            <label id="firma" for="firma" class="label-control">Pluggers</label>
                        </div>-->
        </form>

    </body>
</html>
