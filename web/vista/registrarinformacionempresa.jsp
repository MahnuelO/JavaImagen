<%-- 
    Document   : RegistrarInformacionEmpresa
    Created on : 15/07/2018, 06:57:06 PM
    Author     : NATALIA
--%>

<%@page import="control.DepartamentoControl"%>
<%@page import="modelo.vo.Departamento"%>
<%@page import="control.CiudadControl"%>
<%@page import="modelo.vo.Ciudad"%>
<%@page import="control.EmpresaControl"%>
<%@page import="modelo.vo.Empresa"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="control.SectorEconomicoControl"%>
<%@page import="modelo.vo.SectorEconomico"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="control.PaisControl"%>
<%@page import="modelo.vo.Pais"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection cnn = Conexion.getConexionDB();
    String nit = request.getParameter("nit");
    String sectorEconomico = request.getParameter("sectorEconomico");
    String nombre = request.getParameter("nombreEncargado");
    String apellido = request.getParameter("apellido");
    String direccion = request.getParameter("direccion");
    String razonSocial = request.getParameter("razonSocial");
    String ciudad = request.getParameter("cbx_ciudad");
    String telefono = request.getParameter("telefono");
    String descripcion = request.getParameter("descripcion");
    HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();

    EmpresaControl control = new EmpresaControl(cnn);
    Empresa vo1 = new Empresa();
    vo1 = control.buscarId(id);

    Departamento voD = new Departamento();
    Ciudad voC = new Ciudad();
    Pais voP = new Pais();
    SectorEconomico sector1 = new SectorEconomico();

    if (vo1 == null) {
        vo1 = new Empresa();
        vo1.setNit("");
        vo1.setIdSectorEconomico(0);
        vo1.setApellido("");
        vo1.setDireccion("");
        vo1.setRazonSocial("");
        vo1.setNombreEncargado("");
        vo1.setIdCiudad(0);
        vo1.setTelefono("");
        vo1.setDescripcion("");
//      voP = new Pais();
//        voP.setNombre("");
//        voD = new Departamento();
//        voD.setNombre("");
//        voC = new Ciudad();
//        voC.setNombre("");
    } else if (vo1 != null) {

        CiudadControl controlC = new CiudadControl(cnn);
        voC = controlC.buscarCiudad(vo1.getIdCiudad()); //busca Ciudad
        voC.getNombre();
        voC.getIdDepartamento();

        DepartamentoControl controlD = new DepartamentoControl(cnn);
        voD = controlD.buscarDepartamento(voC.getIdDepartamento()); //busca departamento

        PaisControl controlP = new PaisControl(cnn);
        voP = controlP.buscarPais(voD.getIdPais()); //busca Pais

        SectorEconomicoControl controlSector = new SectorEconomicoControl(cnn);
        sector1 = controlSector.buscarSectorControl(vo1.getIdSectorEconomico());
        
                }

        if ((nit != null) && (sectorEconomico != null) && (nombre != null) && (apellido != null)
                && (direccion != null) && (razonSocial != null) && (ciudad != null) && (telefono != null)
                && (descripcion != null)) {
            Empresa vo = new Empresa();
            vo.setIdUsuario(obt.getId_usuario());
            vo.setNit(nit);
            vo.setIdSectorEconomico(Integer.parseInt(sectorEconomico));
            vo.setNombreEncargado(nombre);
            vo.setApellido(apellido);
            vo.setDireccion(direccion);
            vo.setRazonSocial(razonSocial);
            vo.setIdCiudad(Integer.parseInt(ciudad));
            vo.setTelefono(telefono);
            vo.setDescripcion(descripcion);
            EmpresaControl empresa = new EmpresaControl(cnn);
            empresa.insert(vo);
            if (vo != null) {
                Conexion.cerrarConexion(cnn);
                response.sendRedirect(request.getContextPath() + "/registrarinformacionempresa.jsp");
            }}
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap-select.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/AspiranteNavegacion.js"></script>
        <script type="text/javascript" src="js/ValidacionDatosBasicos.js"></script>
        <script type="text/javascript" src="js/ComboBoxDependientes.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/jquery-ui.js" type="text/javascript"></script>
        <title>Registrar Información Empresa</title>
    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <form method="POST">
            <div class="container-fluid">
                <center>
                    <h2>REGISTRAR INFORMACIÓN DE LA EMPRESA</h2>
                </center>

                <div class="row">
                    <div id="t1" class="col-md-2"></div>
                    <div id="t2" class="col-md-4">

                        <div>
                            <br><label for="nit" class="label-control">Nit</label>
                            <label id="id_asterisco">*</label>
                            <input type="text" class="form-control" id="nit" name="nit" value="<%=vo1.getNit()%>" >
                        </div>
                        <div>
                            <br><label for="sectorEconomico" class="label-control">Sector económico</label>
                            <label id="id_asterisco">*</label>
                            <select class="form-control" id="sectorEconomico" name="sectorEconomico" value="<%=vo1.getIdSectorEconomico()%>">                         
                                <%
                                    if (sector1.getSectorEconomico() == "") {
                                %>
                                <option value="-1">Seleccione</option>
                                <%
                                } else {%>
                                <option value="-1"><%=sector1.getSectorEconomico()%></option> 
                                <% }
                                %>
                                <%  List<SectorEconomico> listaSE = new SectorEconomicoControl(cnn).query();
                                    for (SectorEconomico sector : listaSE) {
                                %>
                                <option value="<%=sector.getIdSectorEconomico()%>"><%= sector.getSectorEconomico()%></option>
                                <%
                                    }
                                %>


                            </select>
                        </div>
                        <div>
                            <br><label for="apellido" class="label-control">Apellido</label>
                            <label id="id_asterisco">*</label>
                            <input type="text" class="form-control" id="apellido" name="apellido" value="<%=vo1.getApellido()%>">
                        </div>

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
                            <br><label for="direccion" class="label-control">Dirección </label>
                            <label id="id_asterisco">*</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" value="<%=vo1.getDireccion()%>">
                        </div>

                    </div>
                    <div id="t3" class="col-md-4">
                        <div>
                            <br><label for="razonSocial" class="label-control">Razón social</label>
                            <label id="id_asterisco">*</label>
                            <input type="text" class="form-control" id="razonSocial" name="razonSocial" value="<%=vo1.getRazonSocial()%>" >
                        </div>
                        <div>
                            <br><label for="nombreEncargado" class="label-control">Nombre </label>
                            <label id="id_asterisco">*</label>
                            <input type="text" class="form-control" id="nombreEncargado" name="nombreEncargado" value="<%=vo1.getNombreEncargado()%>" >
                        </div>

                        <div>
                            <br><label class="label-control" for="cbx_pais">País</label>
                            <label id="id_asterisco">*</label> 
                            <select class="form-control selectpicker" name="cbx_pais" id="cbx_pais">
                                <% if (voP.getNombre() == "") { %>
                                <option value="-1">Seleccione</option>
                                <%
                                } else {%>
                                <optgroup label="Seleccionado" data-max-options="1">
                                    <option value="<%=voP.getId_pais()%>"><%=voP.getNombre()%></option>
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
                            <br><label for="telefono" class="label-control">Teléfono</label>
                            <label id="id_asterisco">*</label>
                            <input type="text" id="telefono" name="telefono" class="form-control" value="<%=vo1.getTelefono()%>">
                        </div>   

                    </div>
                    <div id="t4" class="col-md-2"></div>
                </div>

                <div class="row">
                    <div id="t17" class="col-md-2"></div>
                    <div id="t18" class="col-md-8">
                        <div>
                            <br><label for="descripcion" class="label-control">Descripción </label>
                            <label id="id_asterisco">*</label>
                            <input type="text" class="form-control" id="descripcion" name="descripcion" value="<%=vo1.getDescripcion()%>">
                        </div>
                    </div>
                    <div id="t19" class="col-md-2"></div>
                </div>

                <div class="row">
                    <div id="t1" class="col-md-2"></div>
                    <div id="t2" class="col-md-8">
                        <div class="pull-left btn_botones">
                            <br><a><button>Cancelar</button></a>
                        </div>
                        <div class="pull-right btn_botones">
                            <br><button id="id_btn_continuar">Continuar</button>
                        </div> 
                    </div>
                    <div id="t3" class="col-md-2"></div>
                </div>
            </div>
        </form>
    </body>
</html>

