<%@page import="modelo.vo.Usuario"%>
<%@page import="modelo.vo.Persona"%>
<%@page import="control.PersonaControl"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="modelo.vo.ReferenciaPersonal"%>
<%@page import="control.ReferenciasPersonalesControl"%>
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
                        <%  ReferenciasPersonalesControl lista1 = new ReferenciasPersonalesControl(cnn);
                            for (ReferenciaPersonal listar1 : lista1.consultar(idPersona)) {
                        %>
                        <a href="#demo<%=listar1.getId_referencia_personal()%>" class="btn btn-primary" data-toggle="collapse"><%=listar1.getNombre()%> <%=listar1.getApellido()%></a>
                        <div id="demo<%=listar1.getId_referencia_personal()%>" class="collapse"> 

                            <br><label>Nombre Completo: <%=listar1.getNombre()%> <%=listar1.getApellido()%></label><br>
                            <label>Empresa donde labora: <%=listar1.getEmpresa_donde_labora()%></label><br>
                            <label>Profesión: <%=listar1.getProfesion()%></label><br>
                            <label>Cargo actual: <%=listar1.getCargo_actual()%></label><br>
                            <label>Telefono: <%=listar1.getTelefono()%></label><br>
                            <button class="btn btn-success btn-sm"><a href="<%=request.getContextPath()%>/vista/ReferenciasPersonales.jsp?id=<%=listar1.getId_referencia_personal()%>"> Actualizar</a></button><br><br>
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