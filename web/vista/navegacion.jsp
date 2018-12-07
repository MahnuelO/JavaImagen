
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-select.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/ComboBoxDependientes.js"></script>    
        <script type="text/javascript" src="js/ValidacionLugarResidencia.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/NavegacionHV.js"></script>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <div class="container">
            <br>
            <div class="row">
                <div class="col-md-12">
                    <div role="tabpanel">
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active"><a href="#seccion1" aria-controls="" data-toggle="tab" role="tab">Datos Básicos</a></li>
                            <li role="presentation"><a href="#seccion2" aria-controls="seccion2" data-toggle="tab" role="tab">Lugar de Residencia</a></li>
                            <li role="presentation"><a href="#seccion3" aria-controls="seccion3" data-toggle="tab" role="tab">Estudios</a></li>
                            <li role="presentation"><a href="#seccion4" aria-controls="seccion4" data-toggle="tab" role="tab">Idiomas</a></li>
                            <li role="presentation"><a href="#seccion5" aria-controls="seccion5" data-toggle="tab" role="tab">Experiencia Laboral</a></li>
                            <li role="presentation"><a href="#seccion6" aria-controls="seccion6" data-toggle="tab" role="tab">Referencias personales</a></li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="seccion1">
                                <h3>Hola</h3>
                                <jsp:include page="/vista/registrarcuenta.jsp"/> 
                            </div>
                            <div role="tabpanel" class="tab-pane" id="seccion2">
                                <jsp:include page="/vista/registrarlugarresidencia.jsp"/> 
                            </div>
                            <div role="tabpanel" class="tab-pane" id="seccion3">
                                <jsp:include page="/vista/registrarestudio.jsp"/> 
                            </div>
                            <div role="tabpanel" class="tab-pane" id="seccion4">
                                <jsp:include page="/vista/registraridioma.jsp"/> 
                            </div>
                            <div role="tabpanel" class="tab-pane" id="seccion5">
                                <jsp:include page="/vista/registrarexperiencia.jsp"/> 
                            </div>
                            <div role="tabpanel" class="tab-pane" id="seccion6">
                                <jsp:include page="/vista/referenciaspersonales.jsp"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
