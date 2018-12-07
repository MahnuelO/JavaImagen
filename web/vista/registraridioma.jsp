<%-- 
    Document   : RegistrarHVLugarResidencia
    Created on : 12-jun-2018, 20:20:50
    Author     : Familia
--%>
<%@page import="control.NivelControl"%>
<%@page import="modelo.vo.Nivel"%>
<%@page import="modelo.vo.Idioma"%>
<%@page import="control.IdiomaControl"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="js/validarIniciarSesion.js" type="text/javascript"></script>
        <title>Registrar HV Idioma</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <form method="POST">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4"></div>
                    <div class="col-md-4">
                        <center>
                        <h2>IDIOMA</h2>
                        </center>
                    </div>
                    <div class="col-md-4"></div>

                </div>
                <div></div>
                <div class="nombre_HV">

                </div> 
                <div>
                    <div class="row">
                    </div>
                    <label>Idioma</label>
                    <label id="id_asterisco">*</label>
                    <select name="cbx_idioma" id="cbx_idioma">
                        <option value="-1">Seleccione</option>
                        <%
                            List<Idioma> listaI = new IdiomaControl(cnn).query();
                            for (Idioma idioma : listaI) {
                        %>
                        <option value="<%=idioma.getIdIdioma()%>"><%= idioma.getNombreIdioma()%></option>
                        <%
                            }
                        %>                                          
                    </select>
                </div>
                <div id="div_mas">
                    <label>Nivel</label>
                    <label id="id_asterisco">*</label>
                    <select name="cbx_nivel" id="cbx_nivel">
                        <option value="-1">Seleccione</option>
                        <%
                            List<Nivel> listaN = new NivelControl(cnn).query();
                            for (Nivel nivel : listaN) {
                        %>
                        <option value="<%=nivel.getIdNivel()%>"><%= nivel.getDescripcion()%></option>
                        <%
                            }
                        %>                                          
                    </select>
                </div> 
                <div  class="btn_botones">
<!--                    <input id="btn_mas" name="btn_mas" type="button" value="+">-->
                    <a id="btn">guardar</a>
                    <a href="RegistrarHVPerfil.jsp"><button>Continuar</button></a>
                </div>
                <div id="nuevo">
                    <label id="lbl_per"><%=request.getParameter("id")%></label>
                    <div hidden="hidden"><label id="lbl_fin">0</label>
                        <label id="lbl_niv">0</label></div>
                    <div><label id="lbl_finN">IDIOMA: </label>
                        <label id="lbl_nivN">NIVEL: </label></div>

                </div>
                <div id="aj"><label id="ajl"></label></div>
                <div>
                    <a href="#" id="btn_fin">Finalizar</a>

                </div>
                <script>
                    $(document).ready(function () {
                        $('#btn').click(function () {
                            var idi = $('#cbx_idioma').val();
                            var idiN = $('#cbx_idioma option:selected').text();
                            var niv = $('#cbx_nivel').val();
                            var nivN = $('#cbx_nivel option:selected').text();
                            //$('#nuevo').append("<div><label>"+idi+"-"+niv+"</label></div>");
                            //$.ajax({
                            //  url "Domina",
                            //   data:{
                            //       id_idioma:idi,
                            //       id_nivel:niv
                            //   },
                            //   succes:,//funcion que se va a ejecutar despues que el ajax haya terminado su trabajo
                            //   datatype:"json"
                            //});

                            var lbl = $('#lbl_fin').text();
                            var lbl1 = $('#lbl_niv').text();
                            $('#lbl_fin').text(lbl + "-" + idi);
                            $('#lbl_niv').text(lbl1 + "-" + niv);
                            var lblN = $('#lbl_finN').text();
                            var lblN1 = $('#lbl_nivN').text();
                            $('#lbl_finN').text(lblN + " " + idiN);
                            $('#lbl_nivN').text(lblN1 + " " + nivN);
                            alert("prueba" + idi + niv);
                        });

                        $('#btn_fin').click(function () {
                            var dat = $('#nuevo div label').text();
                            alert(dat);
                            $.ajax({
                                url: '/Linkers/NewServlet',
                                data: {
                                    persona: $('#lbl_per').text(),
                                    Idioma: $('#lbl_fin').text(),
                                    Nivel: $('#lbl_niv').text()
                                },
                                success: function (responseText) {
                                    $('#ajl').text(responseText);
                                    location.href = "http://localhost:8080/Linkers/vista/ReferenciasPersonales.jsp?id=" + $('#lbl_per').text();
                                }
                            });
                        });
                    });
                </script>
            </div>
        </form>
    </body>
</html>