
<%@page import="modelo.vo.Persona"%>
<%@page import="control.PersonaControl"%>
<%@page import="modelo.vo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.ReferenciasPersonalesControl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.vo.ReferenciaPersonal"%>
<!DOCTYPE html>
<%
    String contextPath = request.getContextPath();
    Connection cnn = Conexion.getConexionDB();
    String nom = request.getParameter("nombre");
    String ape = request.getParameter("apellido");
    String tel = request.getParameter("telefono");
    String emp = request.getParameter("empresa_donde_labora");
    String prof = request.getParameter("profesion");
    String cargo = request.getParameter("cargo_actual");
    String correo = request.getParameter("correo");
    HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();

    PersonaControl control = new PersonaControl(cnn);
    Persona vo1 = new Persona();
    vo1 = control.buscarId(id);
    int idPersona = vo1.getId_persona();

    ReferenciasPersonalesControl controlRP = new ReferenciasPersonalesControl(cnn);
    ReferenciaPersonal vo2 = new ReferenciaPersonal();
    vo2 = controlRP.buscarIdPersona(idPersona);

    if (vo2 == null) {
        vo2 = new ReferenciaPersonal();
        vo2.setNombre("");
        vo2.setTelefono("");
        vo2.setEmpresa_donde_labora("");
        vo2.setCargo_actual("");
        vo2.setApellido("");
        vo2.setCorreo("");
        vo2.setProfesion("");
    }

    if ((nom != null) && (ape != null) && (tel != null) && (emp != null) && (prof != null) && (cargo != null) && (correo != null)) {
        ReferenciaPersonal vo = new ReferenciaPersonal();
        vo.setIdPersona(idPersona);
        vo.setNombre(nom);
        vo.setApellido(ape);
        vo.setTelefono(tel);
        vo.setEmpresa_donde_labora(emp);
        vo.setProfesion(prof);
        vo.setCargo_actual(cargo);
        vo.setCorreo(correo);
        ReferenciasPersonalesControl referencia = new ReferenciasPersonalesControl(cnn);
        referencia.insertar(vo);
        if (vo != null) {
            response.sendRedirect(request.getContextPath() + "/perfilaspirante.jsp");
            Conexion.cerrarConexion(cnn);
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/ValidacionReferenciasPersonales.js"></script>
        <title>REFERENCIAS PERSONALES</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <form method="POST" action="perfilaspirante.jsp">
            <div class="container-fluid">
                <center>
                    <h2>REFERENCIAS PERSONALES</h2>
                </center>
                <div class="row">
                    <div class="col-md-2"></div>
                    <div class="col-md-4">
                        <div>
                            <br><label class="label-control" for="nombre">Nombre: </label>
                            <input class="form-control" type="text" id="nombre" name="nombre" value="<%//=vo2.getNombre()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="telefono">Teléfono: </label>
                            <input class="form-control"  type="text" id="telefono" name="telefono" value="<%//=vo2.getTelefono()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="empresa_donde_labora">Empresa donde labora: </label>
                            <input class="form-control"  type="text" id="empresa_donde_labora" name="empresa_donde_labora" value="<%//=vo2.getEmpresa_donde_labora()%>">
                            <div>
                                <br><label class="label-control" for="cargo_actual">Cargo actual: </label>
                                <input class="form-control" type="text" id="cargo_actual" name="cargo_actual" value="<%//=vo2.getCargo_actual()%>">
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">

                        <div>
                            <br><label class="label-control" for="apellido">Apellido: </label>
                            <input class="form-control"  type="text" id="apellido" name="apellido" value="<%//=vo2.getApellido()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="correo">Correo electrónico: </label>
                            <input class="form-control"  type="text" id="correo" name="correo" value="<%//=vo2.getCorreo()%>">
                        </div>
                        <div>
                            <br><label class="label-control" for="profesion">Profesión: </label>
                            <input class="form-control"  type="text" id="profesion" name="profesion" value="<%//=vo2.getProfesion()%>">
                        </div>
                        <div class="btn_botones">
                             <br><br><button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#myModal"><i class="fa fa-search"></i> Mis referencias</button>
                            <jsp:include page="includes/ventanareferenciaspersonales.jsp?id=<%=id%>" />
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="row"> </div>
                    <div class="col-md-2">         
                    </div>
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
