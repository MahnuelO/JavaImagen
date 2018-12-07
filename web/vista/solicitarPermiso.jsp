<%-- 
    Document   : solicitarPermiso
    Created on : 19/09/2018, 04:18:58 PM
    Author     : Asus-PC
--%>

<%@page import="modelo.vo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();
%>
<jsp:include page="sesiones.jsp" flush="true"/>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <center><h5 class="modal-title">SOLICITUD DE ACTUALIZACIÓN</h5></center>
        </div>
        <div class="modal-body">
          <p>La solicitud para la actualización de datos se ha realizado, pronto obtendra una respuesta</p>
          <label><%=id%></label>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
