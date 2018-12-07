<%@page import="utils.UtilidadesGenerales"%>
<%@page import="control.PaisControl"%>
<%@page import="modelo.vo.Pais"%>
<%@page import="control.ControlUsuario"%>
<%@page import="modelo.vo.Usuario"%>
<%@page import="control.PersonaControl"%>
<%@page import="modelo.vo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="control.TipoDocumentoControl"%>
<%@page import="modelo.vo.TipoDocumento"%>
<%@page import="control.TipoCategoriaControl"%>
<%@page import="modelo.vo.TipoCategoria"%>
<%@page import="java.util.List"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>

<%
    Connection cnn = Conexion.getConexionDB();
    PersonaControl control = new PersonaControl(cnn);
    TipoCategoria voTC = new TipoCategoria();
    TipoDocumento voTD = new TipoDocumento();
    Persona db = new Persona();
    HttpSession sesion = request.getSession();
    Usuario obt = (Usuario) sesion.getAttribute("usuario");
    int id = obt.getId_usuario();
    db = control.buscarId(id); // Busca en la tabla persona por medio del id del usuario
    Usuario voUsuario = new Usuario();
    ControlUsuario controlUsuario = new ControlUsuario(cnn);
    voUsuario = controlUsuario.buscarUsuario(id); // busca en la tabla usuario por medio del id del usuario 

    FileItemFactory file_factory = new DiskFileItemFactory();

    /*ServletFileUpload esta clase convierte los input file a FileItem*/
    ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
    /*sacando los FileItem del ServletFileUpload en una lista */
    if (request.getHeader("content-type") != null) {
        List items = servlet_up.parseRequest(request);
        Hashtable Parameters = new Hashtable();
        FileItem FItem = null;
        db = new Persona();
        
        Iterator listaItems = items.iterator();
        while (listaItems.hasNext()) {
            FItem = (FileItem) listaItems.next();
            if (FItem.isFormField()) {
                Parameters.put(FItem.getFieldName(), FItem.getString());
            } else {
                if (FItem.getFieldName().equals("imgInp")) {
                    Parameters.put(FItem.getFieldName(), FItem.getInputStream());
                } else {
                    Parameters.put(FItem.getFieldName(), FItem.getString("ISO-8859-1"));
                }
            }
        }
        db.setApellido((String) Parameters.get("apellido"));
        db.setNombre((String) Parameters.get("nombre"));
        db.setNumero_libreta_militar((String) Parameters.get("numero_libreta_militar"));
        db.setEstado_civil((String) Parameters.get("estado_civil"));
        db.setGenero((String) Parameters.get("rd_genero"));
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");
        db.setFecha_expedicion(formato.parse((String) Parameters.get("fecha_expedicion")));
        
        db.setFoto(UtilidadesGenerales.streamToByteArray((InputStream) Parameters.get("imgInp")));
        
    }
    
    if (db == null) {
        voTC = new TipoCategoria();
        voTC.setCategoria("");
        voTD = new TipoDocumento();
        voTD.setDescripcion("");
        db = new Persona();
    } else if ((db != null)) {
        
        int idc = db.getId_categoria_licencia_conduccion();
        TipoCategoriaControl controlTC = new TipoCategoriaControl(cnn);
        voTC = controlTC.buscarCategoria(idc); // Busca categoria

        int idTD = voUsuario.getId_tipo_documento_identidad();
        TipoDocumentoControl controlTD = new TipoDocumentoControl(cnn);
        voTD = controlTD.buscarTipoDoc(idTD); //busca Tipo documento
        
        PersonaControl user = new PersonaControl(cnn);
        user.insert(db);
        Conexion.cerrarConexion(cnn);
        response.sendRedirect(request.getContextPath() + "/vista/registrarlugarresidencia.jsp");
    }
    

%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <!--        <link href="css/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>-->
        <link href="css/bootstrap-select.css" rel="stylesheet" type="text/css"/>
        <link href="css/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <link href="css/EstiloInicioSesion.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/AspiranteNavegacion.js"></script>
        <script type="text/javascript" src="js/ComboBoxDependientes.js"></script>  

        <title>Registrar HV Datos Basicos</title>
        <script src="js/bootstrap-select.js"></script>

    </head>
    <body>
        <jsp:include page="sesiones.jsp" flush="true"/>
        <form method="POST" action="" enctype="multipart/form-data">
            <section class="main">
                <div class="container-fluid">
                    <center>
                        <h2>DATOS BÁSICOS</h2><br>
                    </center>
                    <div style="height:50%; margin-left: 10px; padding-left: 5px">
                        <input type='file' id="imgInp" name="imgInp" />
                        <img id="blah" src="#" alt="your image" style="width:100px; height:100px"  />
                    </div>
                    <div class="row">
                        <div id="a1" class="col-md-2"></div>
                        <div id="a2" class="col-md-4">

                            <div class="input-group">-->
                                <label class="label-control" for="id_tipo_identificacion">Tipo y número de identificación</label>
                                <label id="id_asterisco">*</label>
                                <div class="input-group">

                                    <input class="form-control" type="text" size="40" id="id_tipo_identificacion" name="id_tipo_identificacion" value="<%=voTD.getDescripcion()%>" disabled="">     
                                    <!--          <input name="remitosucursal" id="remitosucursal" type="text" required class="form-control" placeholder="Sucursal">-->
                                    <span class="input-group-addon">N°</span>
                                    <!--          <input name="remitonumero" id="remitonumero" type="text" required class="form-control" placeholder="Numero">-->
                                    <input class="form-control" type="text" size="40" id="numero_identificacion" name="numero_identificacion" value="<%=voUsuario.getNumero_identificacion()%>" disabled=""> 
                                </div>
                                <div>
                                    <br><label class="label-control" for="cbx_pais_nacimiento">País de nacimiento</label>
                                    <label id="id_asterisco">*</label> 
                                    <select class="form-control selectpicker" name="cbx_pais_nacimiento" id="cbx_pais_nacimiento">
                                        <option value="-1">Seleccione</option>
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
                                    <br><br><label class="label-control" for="genero">Genero</label>
                                    <label id="id_asterisco">*</label>
                                    <label class="label-control">M</label>
                                    <input class="radio-inline" type="radio" id="rd_genero" name="rd_genero" value="Masculino"> 
                                    <label class="label-control">F</label>
                                    <input class="radio-inline" type="radio" id="rd_genero" name="rd_genero" value="Femenino">
                                </div>
                                <div>
                                    <br><label class="label-control" for="id_categoria">Categoría</label>
                                    <select class="form-control selectpicker"  id="id_categoria_licencia_conduccion" name="id_categoria_licencia_conduccion">

                                        <% if (voTC.getCategoria() == "") { %>
                                        <option>Seleccione</option>
                                        <%
                                        } else {%>
                                        <optgroup label="Seleccionado" data-max-options="1">
                                            <option><%=voTC.getCategoria()%></option>
                                        </optgroup>
                                        <% }
                                        %>
                                        <%    
                                            List<TipoCategoria> lista5 = new TipoCategoriaControl(cnn).query();
                                            for (TipoCategoria tip : lista5) {
                                        %>
                                        <option value="<%= tip.getId_categoria_licencia_conduccion()%>"><%= tip.getCategoria()%></option>
                                        <%
                                            }
                                        %>                  
                                    </select>
                                </div>
                                <div>
                                    <br><label class="label-control" for="correo_electronico">Correo electrónico</label>
                                    <label id="id_asterisco">*</label>
                                    <input class="form-control" type="text" size="40" id="correo" name="correo" value="<%=voUsuario.getCorreo()%>" disabled=""> 
                                </div>
                            </div>
                            <div id="a3" class="col-md-4">
                                <div style="height:50%; margin:10px; padding:5px">
                                    <br><label class="label-control" for="nombre">Nombres</label>
                                    <label class="label-control" id="id_asterisco">*</label>
                                    <input class="form-control" type="text" size="40" id="nombre" name="nombre" value="<%=db.getNombre()%>">

                                    <br><label class="label-control" for="apellido">Apellidos</label>
                                    <label id="id_asterisco">*</label>
                                    <input class="form-control" type="text" size="40" id="apellido" name="apellido" value="<%=db.getApellido()%>">
                                </div>
                                <div>
                                    <br><label class="label-control" for="fecha_expedicion">Fecha de expedición del documento</label>
                                    <label id="id_asterisco">*</label>
                                    <input class="form-control" type="date" size="40" id="fecha_expedicion" name="fecha_expedicion" value="<%=db.getFecha_expedicion()%>">
                                </div>  
                                <div>
                                    <br><label class="label-control" for="fecha_nacimiento">Fecha de nacimiento</label>
                                    <label id="id_asterisco">*</label>
                                    <input class="form-control" type="date" size="40" id="fecha_nacimiento" name="fecha_nacimiento" value="<%=voUsuario.getFecha_nacimiento()%>" disabled="">
                                </div>
                                <div>
                                    <br> <label class="label-control" for="estado_civil">Estado civil</label>
                                    <label id="id_asterisco">*</label>
                                    <input class="form-control" type="text" size="40" id="estado_civil" name="estado_civil" value="<%=db.getEstado_civil()%>"> 
                                </div>
                                <div>
                                    <br> <label class="label-control" for="numero_libreta_militar">Número de libreta militar</label>
                                    <input class="form-control" type="text" size="40" id="numero_libreta_militar" name="numero_libreta_militar" value="<%=db.getNumero_libreta_militar()%>">
                                </div>
                            </div>
                            <div id="a4" class="col-md-2"></div>
                        </div>
                        <div class="row"> 
                            <div id="b1" class="col-md-2"></div>
                            <div id="b2" class="col-md-8">
                                <div>
                                    <br> <label class="label-control">Descripción</label>
                                    <label id="id_asterisco">*</label><br>
                                    <textarea class="form-control" rows="5" name="area_perfil_ocupacional" placeholder="1500 Carácteres" >
                                        <%
                                            if (db.getPerfil() == null) {
                                                
                                            } else {%>
                               
                                        <%= db.getPerfil()%>
                                        <% }
                                        %>
                                    </textarea>
                                </div> 
                                <div class="pull-left btn_botones">
                                    <br><a><button>Cancelar</button></a>
                                </div>
                                <div class="pull-right btn_botones">
                                    <br> <button type="button" class="" data-toggle="modal" data-target="#myModal">Solicitar Persmiso</button>
                                    <jsp:include page="solicitarPermiso.jsp"/>
                                    <!--                                <br><button id="id_btn_solicitar_c">Solicitar Permiso</button>-->
                                </div>     
                                <div class="pull-right btn_botones">
                                    <br><button id="id_btn_continuar_DB">Guardar</button>
                                </div> 
                            </div>
                            <div id="b4" class="col-md-2"></div>
                        </div>      
                        </section>
                        </form>
                        <script type="text/javascript" src="js/foto.js" ></script>
                        </body>
                        </html>
