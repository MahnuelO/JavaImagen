<%-- 
    Document   : RegistrarHVLugarResidencia
    Created on : 12-jun-2018, 20:20:50
    Author     : Familia
--%>

<%@page import="modelo.vo.Usuario"%>
<%@page import="modelo.vo.Persona"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="control.PersonaControl"%>
<%@page import="org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID"%>
<%@page import="control.CiudadControl"%>
<%@page import="modelo.vo.Ciudad"%>
<%@page import="control.DepartamentoControl"%>
<%@page import="modelo.vo.Departamento"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="control.PaisControl"%>
<%@page import="modelo.vo.Pais"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    Connection cnn = Conexion.getConexionDB();
    String nom = request.getParameter ("nombre");
    String ape = request.getParameter("apellido");
    String fechexpe = request.getParameter("fecha_expedicion");
    String gene = request.getParameter("rd_genero");
    //String libretamili = request.getParameter("rd_libreta_militar");
    String numlibretamili = request.getParameter("numero_libreta_militar");

    String idcate = request.getParameter("id_categoria_licencia_conduccion");
    String paisNacimi = request.getParameter("cbx_pais_nacimiento");
    String estadoCivil = request.getParameter("estado_civil");
    String url = request.getParameter("imgInp");

    String ciudad = request.getParameter("cbx_ciudad");
    String direccion = request.getParameter("txt_direccion");
    String telefono = request.getParameter("txt_telefono");
    String se_moveria = request.getParameter("rd_se_moveria");
    HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    obt.getId_usuario();

    String perfilOcupacional = request.getParameter("area_perfil_ocupacional");

    Persona vo1 = new Persona();
    PersonaControl control = new PersonaControl(cnn);
    vo1 = control.buscarId(obt.getId_usuario());
    Ciudad voC = new Ciudad();
    Departamento voD = new Departamento();
    Pais voP = new Pais();
    //busca Pais

    if (vo1 == null) {
        vo1 = new Persona();
        vo1.setDireccion("");
        vo1.setId_ciudad(0);
        vo1.setTelefono("");
        voP = new Pais();
        voP.setNombre("");
        voD = new Departamento();
        voD.setNombre("");
        voC = new Ciudad();
        voC.setNombre("");
    } else if (vo1 != null) {
        vo1.getId_ciudad();
        CiudadControl controlC = new CiudadControl(cnn);
        voC = controlC.buscarCiudad(vo1.getId_ciudad()); //busca Ciudad
        voC.getNombre();
        voC.getIdDepartamento();
        DepartamentoControl controlD = new DepartamentoControl(cnn);
        voD = controlD.buscarDepartamento(voC.getIdDepartamento());
        PaisControl controlP = new PaisControl(cnn);
        voP = controlP.buscarPais(voD.getIdPais());
    }
    if ((nom != null) && (ape != null) && (fechexpe != null)
            && (gene != null)
            && (paisNacimi != null) && (ciudad != null)
            && (direccion != null) && (se_moveria != null)) {

        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        Persona vo = new Persona();
        vo.setId_usuario(obt.getId_usuario());
        vo.setId_ciudad(Integer.parseInt(ciudad));
        vo.setNombre(nom);
        vo.setApellido(ape);
        vo.setDireccion(direccion);
        vo.setFecha_expedicion(formato.parse(fechexpe));
        vo.setEstado_civil(estadoCivil);
        vo.setPerfil(perfilOcupacional);
        vo.setId_categoria_licencia_conduccion(Integer.parseInt(idcate));
        vo.setGenero(gene);
        vo.setSe_moveria(se_moveria);
        vo.setTelefono(telefono);
        vo.setNumero_libreta_militar(numlibretamili);
        // vo.getLibreta_militar();
        vo.setId_pais(Integer.parseInt(paisNacimi));
//        vo.setUrl(url); 

        PersonaControl user = new PersonaControl(cnn);
        user.insert(vo);
        if (vo != null) {
            Conexion.cerrarConexion(cnn);
            response.sendRedirect(request.getContextPath() + "/vista/registrarestudio.jsp");
        }
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar HV Lugar Residencia</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-select.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="js/ComboBoxDependientes.js"></script>    
        <script type="text/javascript" src="js/ValidacionLugarResidencia.js"></script>
        <script src="js/bootstrap-select.js"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <div class="container-fluid">
            <form method="POST" >
                <center>
                    <h2>LUGAR DE RESIDENCIA</h2>
                </center>
                <div class="row"> 
                    <div id="w1" class="col-md-2"></div>
                    <div id="w6" class="col-md-4">
                        <div>
                            <br><label class="label-control" for="cbx_pais">País</label>
                            <label id="id_asterisco">*</label> 
                            <select class="form-control selectpicker" name="cbx_pais" id="cbx_pais">
                                <% if (voP.getNombre() == "") { %>
                                <option value="-1">Seleccione</option>
                                <%
                                } else {%>
                                <optgroup label="Seleccionado" data-max-options="1">
                                    <option value="<%=voP.getId_pais()%>"> <%=voP.getNombre()%> </option>
                                </optgroup>
                                <% }
                                %>

                                <%  List<Pais> listap = new PaisControl(cnn).query();
                                    for (Pais pais : listap) {
                                %>
                                <option value="<%=pais.getId_pais()%>"><%= pais.getNombre()%></option>
                                <%
                                    }
                                %>                                          
                            </select>
                        </div>

                        <div>
                            <br><label for="cbx_ciudad" class="label-control">Ciudad</label>
                            <label id="id_asterisco">*</label>
                            <select class="form-control" name="cbx_ciudad" id="cbx_ciudad">
                                <% if (voC.getNombre() == "") { %>
                                <option value="-1" >Seleccione </option>
                                <%
                                } else {%>
                                <optgroup label="Seleccionado" data-max-options="1">
                                    <option value="<%=voC.getIdCiudad()%>" ><%=voC.getNombre()%></option>
                                </optgroup>
                                <% }
                                %>
                            </select>
                        </div>
                        <div>
                            <br><label for="txt_telefono" class="label-control">Teléfono</label>
                            <input class="form-control" type="text" name="txt_telefono" id="txt_telefono" value="<%=vo1.getTelefono()%>">
                        </div>
                    </div>
                    <div id="w2" class="col-md-4">


                        <div>
                            <br><label class="label-control" for="cbx_departamento">Departamento</label>
                            <label id="id_asterisco">*</label>
                            <select class="form-control" name="cbx_departamento" id="cbx_departamento">
                                <% if (voD.getNombre() == "") { %>
                                <option value="-1">Seleccione</option>
                                <%
                                } else {%>
                                <optgroup label="Seleccionado" data-max-options="1">
                                    <option value="<%=voD.getIdDepartamento()%>"><%=voD.getNombre()%></option>
                                </optgroup>
                                <% }
                                %>
                            </select>
                        </div>
                        <div>
                            <br><label for="txt_direccion" class="label-control">Dirección</label>
                            <label id="id_asterisco">*</label>
                            <input class="form-control" type="text" name="txt_direccion" id="txt_direccion" value="<%=vo1.getDireccion()%>"><br>
                        </div>

                        <div>
                            <br><label class="label-control">¿Esta dispuesto a cambiar su lugar de residencia por una oferta laboral?</label>
                            <label id="id_asterisco">*</label>
                            <br> <label>Si</label>
                            <input type="radio" name="rd_se_moveria" value="Si">
                            <label>No</label>
                            <input type="radio" name="rd_se_moveria" value="No">
                        </div>

                    </div>
                    <div id="w3" class="col-md-2"></div>

                    <div class="row"> </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-8">
                        <div class="btn_botones">
                            <br><button class="pull-left" id="btnCancelar">Cancelar</button>
                            <button class="pull-right" id="id_btn_guardar_LR" >Guardar</button>
                        </div>
                    </div>
                    <div class="col-md-2"></div>

                </div>
                <input type="hidden" id="nombre" name="nombre" value="<%=nom%>">
                <input type="hidden" id="apellido" name="apellido" value="<%=ape%>">
    <!--            <input type="hidden" size="40" id="numero_identificacion" name="numero_identificacion" value="<%//=numide%>"> -->
                <input type="hidden" id="fecha_expedicion" name="fecha_expedicion" value="<%=fechexpe%>" >
                <input type="hidden" id="rd_genero" name="rd_genero" value="<%=gene%>" >
                <input type="hidden" id="numero_libreta_militar" name="numero_libreta_militar" value="<%=numlibretamili%>"
                       <input type="hidden" id="id_categoria_licencia_conduccion" name="id_categoria_licencia_conduccion" value="<%=idcate%>">
                <input type="hidden" id="area_perfil_ocupacional" name="area_perfil_ocupacional" value="<%=perfilOcupacional%>">
                <input type="hidden" id="id_categoria_licencia_conduccion" name="id_categoria_licencia_conduccion" value="<%=idcate%>">
                <input type="hidden" id="cbx_pais_nacimiento" name="cbx_pais_nacimiento" value="<%=paisNacimi%>">
                <input type="hidden" id="estado_civil" name="estado_civil" value="<%=estadoCivil%>">
                <input type="hidden" id="file" name="file" value="<%=url%>">
            </form>    
        </div>
        <!--//value="No"libreta militar*/-->
    </body>
</html>
