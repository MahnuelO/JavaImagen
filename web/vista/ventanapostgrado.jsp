<%-- 
    Document   : ventanaPostgrado
    Created on : 24-jun-2018, 21:01:49
    Author     : Familia
--%>

<%@page import="control.PaisControl"%>
<%@page import="modelo.vo.Pais"%>
<%@page import="modelo.vo.Pais"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.TituloObtenidoControl"%>
<%@page import="modelo.vo.TituloObtenido"%>
<%@page import="java.util.List"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    Connection cnn = Conexion.getConexionDB();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/VentanaEmergente.js"></script>
        <title>Postgrado</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
          <%@include file="partesHTML/header.jsp" %>
        <form method="POST">
            <div class="container-fluid">
                <center>
                    <h2>ESTUDIOS DE POSTGRADO</h2>
                </center>
                <div class="row">
                    <div id="t1" class="col-md-2"></div>
                    <div id="t2" class="col-md-4">

                        <div>
                            <br><label class="label-control" >Postgrado</label>
                            <div class="input-group">
                                <label class="input-group-btn">
                                    <span class="btn btnExaminar">
                                        Examinar<input type="file" style="display: none;">
                                    </span>
                                </label>
                                <input type="text" class="form-control" disabled="">
                            </div>
                        </div>
                        <div>
                            <br><label class="label-control">Institución</label>
                            <label id="id_asterisco">*</label>
                            <input class="form-control" name="institucion_postgrado" id="institucion_postgrado" type="text">
                        </div>
                        <div>
                            <br><label class="label-control">País</label>
                            <label id="id_asterisco">*</label>
                            <select class="form-control" name="cbx_pais_postgrado" id="cbx_pais_postgrado">
                                <option>Seleccione</option>
                                <%   List<Pais> listapP = new PaisControl(cnn).query();
                                    for (Pais paisp : listapP) {
                                %>
                                <option value="<%=paisp.getId_pais()%>"><%= paisp.getNombre()%></option>
                                <%
                                    }
                                %> 
                            </select>
                        </div>
                    </div>


                    <div id="t3" class="col-md-4">

                        <div>
                            <br><label class="label-control">Título Obtenido</label>
                            <label id="id_asterisco">*</label>
                            <select class="form-control" name="cbx_titulo_obtenido_postgrado" id="cbx_titulo_obtenido_postgrado">
                                <option>Seleccione</option>
                                <%
                                    List<TituloObtenido> lista7 = new TituloObtenidoControl(cnn).query();
                                    for (TituloObtenido tipo : lista7) {
                                %>
                                <option value="<%= tipo.getId_titulo_obtenido()%>"><%= tipo.getDescripcion()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div>
                            <br><label class="label-control">Fecha del grado</label>
                            <label id="id_asterisco">*</label>
                            <input class="form-control" name="fecha_de_grado_postgrado" id="fecha_de_grado_postgrado" type="date">
                        </div>

                    </div>
                    <div id="t4" class="col-md-2"></div>
                </div>
            </div>
            <div class="row">
                <div id="t17" class="col-md-2"></div>
                <div id="t18" class="col-md-8">
                    <div class="btn_botones">
                        <button class="pull-right" id="btn_guardarP">Guardar</button>
                    </div>
                </div>
                <div id="t19" class="col-md-2"></div>
            </div>


        </div>
    </form>
    <%@include file="partesHTML/footer.jsp" %>
</body>
</html>




<!--  <div>
            <label>Postgrado</label>
            <input type="file">
        </div>
        <div>
            <label>Titulo Obtenido</label>
            <label id="id_asterisco">*</label>
            <select>
                <option>Seleccione</option>

            </select>
        </div>
        <div>
            <label>Instirución</label>
            <label id="id_asterisco">*</label>
            <input type="text">
        </div>
        <div>
            <label>Fecha del grado</label>
            <label id="id_asterisco">*</label>
            <input type="date">
        </div>
        <div>
            <label>País</label>
            <label id="id_asterisco">*</label>
            <select>
                <option>Seleccione</option>                                                                  
            </select>
            <div>
                <button id="btn_guardarP">Guardar</button>
            </div>
        </div>-->