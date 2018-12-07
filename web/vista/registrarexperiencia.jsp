
<%@page import="modelo.vo.Cargo"%>
<%@page import="control.CargoControl"%>
<%@page import="control.PersonaControl"%>
<%@page import="modelo.vo.Persona"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="modelo.vo.ExperienciaLaboral"%>
<%@page import="java.sql.Date"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.ExperienciaLaboralControl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    String contextPath = request.getContextPath();
    Connection cnn = Conexion.getConexionDB();

    String nombre = request.getParameter("nombre");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String url = request.getParameter("url_archivo_adjunto");
    String fechaIni = request.getParameter("fecha_inicio");
    String fechaFin = request.getParameter("fecha_fin");
    String correo = request.getParameter("correo");
    String comentario = request.getParameter("comentario");
    String nit = request.getParameter("nit");
    
    HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();
    
    ExperienciaLaboralControl c = new ExperienciaLaboralControl(cnn);
    PersonaControl control = new PersonaControl(cnn);
    Persona vo1 = new Persona();
    //vo1 = control.buscarId(id);
    int idPersona = vo1.getId_persona();

    ExperienciaLaboralControl control1 = new ExperienciaLaboralControl(cnn);
    ExperienciaLaboral voPri = new ExperienciaLaboral();
    voPri = control1.consultarIdExperiencia(idPersona);
    
     if (vo1 == null) {
        vo1 = control.buscarId(id);
    }
    
    if (voPri == null) {
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        voPri = new ExperienciaLaboral();
        voPri.setNombre("");
        voPri.setTelefono("");
        voPri.setDireccion("");
        voPri.setUrl_archivo_adjunto("");
        voPri.setFecha_inicio(formato.parse("00-00-0000"));
        voPri.setFecha_fin(formato.parse("00-00-0000"));
        voPri.setCorreo("");
        voPri.setComentario("");
        voPri.setNit("");
    }

    if ((nombre != null) && (telefono != null) && (direccion != null) && (fechaIni != null)
            && (fechaFin != null) && (correo != null) && (nit != null)) {
        ExperienciaLaboral voSec = new ExperienciaLaboral();
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        voSec.setId_persona(idPersona);
        voSec.setNombre(nombre);
        voSec.setTelefono(telefono);
        voSec.setDireccion(direccion);
        voSec.setUrl_archivo_adjunto(url);
        voSec.setFecha_inicio(formato.parse(fechaIni));
        voSec.setFecha_fin(formato.parse(fechaFin));
        voSec.setCorreo(correo);
        voSec.setComentario(comentario);
        voSec.setNit(nit);
        ExperienciaLaboralControl expe = new ExperienciaLaboralControl(cnn);
        expe.insertar(voSec);
        if (voSec != null) {
            response.sendRedirect(request.getContextPath() + "/vista/referenciaspersonales.jsp");     
        }

    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Experiencia Laboral</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/ValidacionReferenciasPersonales.js"></script>
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/VentanaEmergente.js"></script>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <form method="POST">
            <div class="container-fluid">
                <center>
                    <h2>EXPERIENCIA LABORAL</h2>
                </center>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-4">
                        <div>
                            <br><label class="label-control" for="nombre">Nombre de la empresa: </label>
                            <input class="form-control" type="text" id="nombre" name="nombre" value="<%//=voPri.getNombre()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="correo">Correo de la empresa: </label>
                            <input class="form-control"  type="text" id="correo" name="correo" value="<%//=voPri.getCorreo()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="telefono">Teléfono de la empresa: </label>
                            <input class="form-control"  type="text" id="telefono" name="telefono" value="<%//=voPri.getTelefono()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="fecha_inicio">Fecha Inicio: </label>
                            <input class="form-control"  type="date" id="fecha_inicio" name="fecha_inicio" value="<%//=voPri.getFecha_inicio()%>">
                        </div> 
                        <div>Cargo:
                            <select class="form-control" name="cbx_cargo" id="cbx_cargo">
                                <option>Seleccione</option>
                                <% List<Cargo> listaCA = new CargoControl(cnn).query();
                                for (Cargo car : listaCA){
                                %>
                                    <option value="<%=car.getId_cargo()%>"><%=car.getDescripcion()%></option>
                                <%
                                }
                                %>
                            </select>
                        </div> 
                    </div>
                    <div class="col-md-4">
                        <div>
                            <br><label class="label-control" for="nit">Nit: </label>
                            <input class="form-control"  type="text" id="nit" name="nit" value="<%//=voPri.getNit()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="direccion">Dirección de la empresa: </label>
                            <input class="form-control"  type="text" id="direccion" name="direccion" value="<%//=voPri.getDireccion()%>">
                            <!--  <div>
                                   <br><label class="label-control" for="url_archivo_adjunto">Url Archivo: </label>
                                    <//input class="form-control" type="text" id="url_archivo_adjunto" name="url_archivo_adjunto" value="<%=voPri.getUrl_archivo_adjunto()%>">
                                    </div>-->
                            <br><label class="label-control" for="direccion">Url </label>
                            <div class="input-group">
                                <label class="input-group-btn">
                                    <span class="btn btnExaminar">
                                        Examinar<input name="url_archivo_adjunto" id="url_archivo_adjunto" type="file" style="display: none;">
                                    </span>
                                </label>
                                <input type="text" class="form-control" disabled="">
                            </div>
                        </div>
                        
                        <div>
                            <br><label class="label-control" for="fecha_fin">Fecha Fin: </label>
                            <input class="form-control"  type="date" id="fecha_fin" name="fecha_fin" value="<%//=voPri.getFecha_fin()%>">
                        </div>
                        
                        
                        <!--                        <div>
                                                    <br><label class="label-control" for="comentario">Comentario: </label>
                                                    <input class="form-control"  type="text" id="comentario" name="comentario" value="<%//=voPri.getComentario()%>">
                                                </div>-->
                        
                        <div class="btn_botones">
                            <br><br><button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal"><i class="fa fa-search"></i> Mis experiencias laborales</button>
                            <!--<//jsp:include page="includes/ventanaexperiencia.jsp" />-->
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="row"> </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="btn_botones">
                            <br><button class="pull-left" id="btnCancelar">Cancelar</button>
                            <button class="pull-right" id="id_btn_guardar_RP" >Guardar</button>
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>
            </div>
        </form>
    </body>
</html>
        <% 
        Conexion.cerrarConexion(cnn); 
        %>

    