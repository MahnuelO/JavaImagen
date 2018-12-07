<%@page import="modelo.vo.ExperienciaLaboral"%>
<%@page import="control.ExperienciaLaboralControl"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="modelo.vo.Persona"%>
<%@page import="control.PersonaControl"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%
    HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();
    Connection cnn = Conexion.getConexionDB();
    PersonaControl control = new PersonaControl(cnn);
    Persona vo1 = new Persona();
    vo1 = control.buscarId(id);
    int idPersona = vo1.getId_persona();

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container">  
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <center>
                        <h4 class="modal-title">MIS REFERENCIAS PERSONALES</h4>
                    </center>
                   
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div class="modal-body">
                        <%  ExperienciaLaboralControl lista1 = new ExperienciaLaboralControl(cnn);
                        for (ExperienciaLaboral listar1 : lista1.consultar(idPersona)) {
                        %>
                        <a href="#demo<%=listar1.getId_experienca_laboral()%>" class="btn btn-primary" data-toggle="collapse"><%=listar1.getNombre()%></a>
                        <div id="demo<%=listar1.getId_experienca_laboral()%>" class="collapse"> 

                            <br><label>Nombre de la empresa: <%=listar1.getNombre()%></label><br>
                            <label>Empresa donde labora: <%=listar1.getTelefono()%></label><br>
                            <label>Profesión: <%=listar1.getDireccion()%></label><br>
                            <label>Cargo actual: <%=listar1.getUrl_archivo_adjunto()%></label><br>
                            <label>Telefono: <%=listar1.getFecha_inicio()%></label><br>
                            <label>Telefono: <%=listar1.getCorreo()%></label><br>
                            <label>Telefono: <%=listar1.getNit()%></label><br>
                            <button class="btn btn-success btn-sm"><a href="<%=request.getContextPath()%>/vista/ReferenciasPersonales.jsp?id="> Actualizar</a></button><br><br>
                        </div>
                        <%
                            }
                        %>  
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">X</button>
<!--                     <button type="button" class="close" data-dismiss="modal">&times;</button>-->
                </div>
            </div>
        </div>
    </div>
</div>
