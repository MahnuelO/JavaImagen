<%-- 
    Document   : ventana
    Created on : 23-jun-2018, 20:20:22
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
        <title>Educación superior</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <link href="css/iconos.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script src="js/VentanaEmergente.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <%@include file="partesHTML/header.jsp" %>
        <form method="POST">
            <div class="container-fluid">
                <center>
                    <h2>ESTUDIOS DE EDUCACIÓN SUPERIOR</h2>
                </center>

                <div class="row">
                    <div id="t1" class="col-md-2"></div>
                   <div class="col-md-4">

                        <div>
                            <br><label class="label-control">Educación Superior</label>
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
                            <label name="institucion_superior" id="institucion_superior" id="id_asterisco">*</label>
                            <input class="form-control" type="text">
                        </div>
                        <div>
                            <br><label class="label-control" >País</label>
                            <label id="id_asterisco">*</label>
                            <select class="form-control" name="cbx_pais_superior" id="cbx_pais_superior">
                                <option>Seleccione</option>
                                <%   List<Pais> listaps = new PaisControl(cnn).query();
                                    for (Pais paiss : listaps) {
                                %>
                                <option value="<%=paiss.getId_pais()%>"><%= paiss.getNombre()%></option>
                                <%
                                    }
                                %> 
                            </select>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div>
                            <br><label class="label-control" >Título Obtenido</label>
                            <label id="id_asterisco">*</label>
                            <select class="form-control" name="cbx_titulo_obtenido_superior" id="cbx_titulo_obtenido_superior">
                                <option>Seleccione</option>
                                <%
                                    List<TituloObtenido> lista6 = new TituloObtenidoControl(cnn).query();
                                    for (TituloObtenido tipo : lista6) {
                                %>
                                <option value="<%= tipo.getId_titulo_obtenido()%>"><%= tipo.getDescripcion()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>

                        <div>
                            <br><label class="label-control" >Fecha del grado</label>
                            <label id="id_asterisco">*</label>
                            <input class="form-control" name="fecha_de_grado_superior" id="fecha_de_grado_superior" type="date">
                        </div> 
                            <div class="btn_botones">
                            <br><br><button class="pull-right" id="btn_guardarES">Guardar</button>
                        </div>
                    </div>
                    <div id="t4" class="col-md-2"></div>
                </div>
            </div>
            <%@include file="partesHTML/footer.jsp" %>
        </form>
    </body>
</html>
