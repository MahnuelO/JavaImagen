<%-- 
    Document   : RegistrarHVDondeEstudie
    Created on : 23-jun-2018, 18:26:10
    Author     : Familia
--%>

<%@page import="control.PersonaControl"%>
<%@page import="modelo.vo.Persona"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="control.NivelEstudioControl"%>
<%@page import="modelo.vo.NivelEstudio"%>
<%@page import="control.EstudioControl"%>
<%@page import="modelo.vo.Estudio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.TituloObtenidoControl"%>
<%@page import="modelo.vo.TituloObtenido"%>
<%@page import="control.PaisControl"%>
<%@page import="modelo.vo.Pais"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<%
    String contextPath = request.getContextPath();
    Connection cnn = Conexion.getConexionDB();

    

    //String urlCo = request.getParameter("url_archivo_complementario");
    //String fechIn = request.getParameter("fecha_inicio");
    //String fechFn = request.getParameter("fecha_fin");
    HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();

    PersonaControl control = new PersonaControl(cnn);
    Persona vo1 = new Persona();
    int idPersona = vo1.getId_persona();

    if (vo1 == null) {
        vo1 = control.buscarId(id);
    }

    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloRegistroEstudio.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/VentanaEmergente.js"></script>
        <script type="text/javascript" src="js/ValidacionNivelEstudio.js"></script>
        <script type="text/javascript" src="js/EstudiosWizard.jsp"></script>
        <!--<script type="text/javascript" src="js/InsertarFormularios.js"></script>-->
        
        <title>Registrar HV Donde Estudie</title>
    </head>
    <body>
        
        <form method="POST"  action="" id="formularioE">
            <h1><span>ESTUDIO</span></h1>
            <div id="nivel">
                <h3>Elija su nivel de estudio</h3>
                 <select class="form-control" name="cbx_titulo_obtenido_bachillerato" id="cbx_titulo_obtenido_bachillerato">
                    <option>Seleccione</option>  
                    <%  List<NivelEstudio> listaNE = new NivelEstudioControl(cnn).query();
                    for (NivelEstudio tipoN : listaNE) {
                    %>
                        <option value="<%= tipoN.getId_nivel_estudio()%>"><%= tipoN.getDescripcion()%></option>
                    <%
                        }
                    %> 
                 </select>
                
            <div class="tab" id="id_tab_bachillerato">
                <h2>Bachillerato</h2>
            <div>Institución:
              <p><input placeholder="Escriba su institución" oninput="this.className = ''" name="fname" required></p>
            </div>
            <div>Título Obtenido:
              <p><select class="form-control" oninput="this.className = ''" name="cbx_titulo_obtenido_bachillerato" id="cbx_titulo_obtenido_bachillerato" required>
                    <option>Seleccione</option>  
                    <%  List<TituloObtenido> listaEB = new TituloObtenidoControl(cnn).queryB();
                    for (TituloObtenido tipoEB : listaEB) {
                    %>
                        <option value="<%= tipoEB.getId_titulo_obtenido()%>"><%= tipoEB.getDescripcion()%></option>
                    <%
                        }
                    %> 
                 </select></p>
            </div>
            <div>País:
                <p><select class="form-control" oninput="this.className = ''" name="cbx_pais_bachillerato" id="cbx_pais_bachillerato" required>
                        <option>Seleccione</option>
                        <%  List<Pais> listapb = new PaisControl(cnn).query();
                                    for (Pais paisb : listapb) {
                        %>
                                <option value="<%=paisb.getId_pais()%>"><%= paisb.getNombre()%></option>
                        <%
                                    }
                        %>    
                 </select></p>
            </div>
            <div>Fecha del grado:
                <p><input type="date" oninput="this.className = ''" name="yyyy" required></p>
            </div>
            <div>
              <!--<p><label class="input-group-btn">
                    <span class="btn btnExaminar">
                        Examinar     
                    </span>  
                 </label></p>-->    
                 <input name="url_archivo_bachillerato" id="url_archivo_bachillerato" type="file" style="display: //none;" required>
            </div>
                 
            </div>
                 
            <div class="tab" id="id_tab_superior">
                <h2>Educación Superior</h2>
            <div>Institución:
                <p><input placeholder="Escriba su institución" oninput="this.className = ''" name="fname" required></p>
            </div>
            <div>Título Obtenido:
              <p><select class="form-control" name="cbx_titulo_obtenido_superior" id="cbx_titulo_obtenido_superior" required>
                    <option>Seleccione</option>
                    <%  List<TituloObtenido> listaES = new TituloObtenidoControl(cnn).queryS();
                    for (TituloObtenido tipoES : listaES) {
                    %>
                    <option value="<%= tipoES.getId_titulo_obtenido()%>"><%= tipoES.getDescripcion()%></option>
                    <%
                    }
                    %>
                 </select></p>
            </div>
            <div>País:
                <p><select class="form-control" name="cbx_pais_superior" id="cbx_pais_superior" required>
                    <option>Seleccione</option>
                    <%   List<Pais> listaps = new PaisControl(cnn).query();
                    for (Pais paiss : listaps) {
                    %>
                        <option value="<%=paiss.getId_pais()%>"><%= paiss.getNombre()%></option>
                    <%
                    }
                    %> 
                 </select></p>
            </div>
            <div>Fecha del grado:
              <p><input type="date" oninput="this.className = ''" name="yyyy" required></p>
            </div>
            <div>
                <!--<p><label class="input-group-btn">
                <span class="btn btnExaminar">
                Examinar <input name="url_archivo_bachillerato" id="url_archivo_bachillerato" type="file" style="display: //none;">       
                </span>                
                </label></p>-->
                <input name="url_archivo_bachillerato" id="url_archivo_bachillerato" type="file" style="display: //none;" required>
            </div>
                 
            </div>
                 
            <div class="tab" id="id_tab_postgrado">
                <h2>Postgrado</h2>           
            <div>Institución:
              <p><input placeholder="Escriba su institución" oninput="this.className = ''" name="fname" required></p>
            </div>
            <div>Título Obtenido:
              <p><select class="form-control" name="cbx_titulo_obtenido_postgrado" id="cbx_titulo_obtenido_postgrado" required>
                    <option>Seleccione</option>
                    <%  List<TituloObtenido> listaEP = new TituloObtenidoControl(cnn).queryP();
                        for (TituloObtenido tipo : listaEP) {
                    %>
                        <option value="<%= tipo.getId_titulo_obtenido()%>"><%= tipo.getDescripcion()%></option>
                    <%
                        }
                    %>
                 </select></p>
            </div>
            <div>País:
              <p><select class="form-control" name="cbx_pais_postgrado" id="cbx_pais_postgrado" required>
                    <option>Seleccione</option>
                    <%   List<Pais> listapp = new PaisControl(cnn).query();
                    for (Pais paisp : listapp) {
                    %>
                        <option value="<%=paisp.getId_pais()%>"><%= paisp.getNombre()%></option>
                    <%
                    }
                    %> 
                 </select></p>
            </div>
            <div>Fecha del grado:
                <p><input type="date" oninput="this.className = ''" name="yyyy" required></p>
            </div>
                 <div>
                    <!--<p><label class="input-group-btn">
                          <span class="btn btnExaminar">
                              Examinar <input name="url_archivo_bachillerato" id="url_archivo_bachillerato" type="file" style="display: //none;">       
                          </span>                
                        </label></p> -->
                        <input name="url_archivo_bachillerato" id="url_archivo_bachillerato" type="file" style="display: //none;">
                  </div>
                  
            </div>
                 
            <div style="overflow:auto;">
              <div style="float:right;">
                <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                <button type="button" id="nextBtn2" onclick="nextPrev(2)">Next</button>
                <!--<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>-->
              </div>
            </div>
            <div style="text-align:center;margin-top:50px;">
              <span class="step">B</span>
              <span class="step">S</span>
              <span class="step">P</span>
              <!--<span class="step">C</span>-->
            </div>
            </div>
        </form>

<script>
    var currentTab = 0; 
    showTab(currentTab);

    function showTab(n) {

      var x = document.getElementsByClassName("tab");
      x[n].style.display = "block";

      if (n === 0) {
        document.getElementById("prevBtn").style.display = "none";
        document.getElementById("nextBtn2").style.display = "none";
      } else {
        document.getElementById("prevBtn").style.display = "inline";
      }
      
      if (n === 1) {
        document.getElementById("nextBtn2").style.display = "none";
      } else {
        document.getElementById("prevBtn").style.display = "inline";
      }
      
      if (n === (x.length - 1)) {
        document.getElementById("nextBtn").innerHTML = "Submit";
      } else {
        document.getElementById("nextBtn").innerHTML = "Next";
      }

      fixStepIndicator(n);
    }

    function nextPrev(n) {
      var x = document.getElementsByClassName("tab");

      if (n === 1){
      ajax({
          data: $("formularioE").serialize(),
	  type: "POST",
          url: "vista/InsertarEstudiosBasico.java"
	    });
      }     
       
      x[currentTab].style.display = "none";
      // Increase or decrease the current tab by 1:
      currentTab = currentTab + n;
      // if you have reached the end of the form...
      if (currentTab >= x.length) {
        // ... the form gets submitted:
        document.getElementById("formularioE").submit();
        return false;
      }
      // Otherwise, display the correct tab:
      showTab(currentTab);
    }
    
    function nextPrev2(n) {
      var x = document.getElementsByClassName("tab");

      if (n === 2){
      ajax({
          data: $("formularioE").serialize(),
	  type: "POST",
	  url: "vista/InsertarEstudiosSuperior.java"
	    });
     }
      x[currentTab].style.display = "none";
      // Increase or decrease the current tab by 1:
      currentTab = currentTab + n;
      // if you have reached the end of the form...
      if (currentTab >= x.length) {
        // ... the form gets submitted:
        document.getElementById("formularioE").submit();
        return false;
      }
      // Otherwise, display the correct tab:
      showTab(currentTab);
    }

    function nextPrev3(n) {
      var x = document.getElementsByClassName("tab");

      if (n === 3 && !validateForm()) return false;

      x[currentTab].style.display = "none";
      // Increase or decrease the current tab by 1:
      currentTab = currentTab + n;
      // if you have reached the end of the form...
      if (currentTab >= x.length) {
        // ... the form gets submitted:
        document.getElementById("formularioE").submit();
        return false;
      }
      // Otherwise, display the correct tab:
      showTab(currentTab);
    }
    

    /*function validateForm() {
      // This function deals with validation of the form fields
      var x, y, i, valid = true;
      x = document.getElementsByClassName("tab");
      y = x[currentTab].getElementsByTagName("input");
      // A loop that checks every input field in the current tab:
      for (i = 0; i < y.length; i++) {
        // If a field is empty...
        if (y[i].value === "") {
          // add an "invalid" class to the field:
          y[i].className += " invalid";
          // and set the current valid status to false
          valid = false;
        }
      }
      // If the valid status is true, mark the step as finished and valid:
      if (valid) {
        document.getElementsByClassName("step")[currentTab].className += " finish";
      }
      return valid; // return the valid status
    }*/

    function fixStepIndicator(n) {
      // This function removes the "active" class of all steps...
      var i, x = document.getElementsByClassName("step");
      for (i = 0; i < x.length; i++) {
        x[i].className = x[i].className.replace(" active", "");
      }
      //... and adds the "active" class on the current step:
      x[n].className += " active";
    }
</script>
    </body>
</html>
