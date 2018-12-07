package vista;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.vo.Usuario;
import control.ControlUsuario;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import utils.AppException;
import modelo.conexion.Conexion;
import java.sql.Connection;

/*
 *
 * @author MAHNUEL
 */
@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public abstract class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, AppException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.setHeader("Cache-Control", "no-store,no-cache, must-revalidate");
            response.addHeader("Cache-Control", "post-check=0, pre-check=0");
            response.setHeader("Pragma", "no-cache");
            response.setHeader("Expires", "0");

            HttpSession sesion = request.getSession();
            String numero_identificacion = request.getParameter("numero_identificacion");
            String clave = request.getParameter("clave");
            try {
                ControlUsuario ac = new ControlUsuario();
                Usuario vo1 = ac.buscarRol(numero_identificacion);
                int rol = vo1.getId_rol();
                if (sesion.getAttribute("usuario") == null && !request.getServletPath().equals("/usuario/login") && !request.getServletPath().equals("/usuario/crear") && !request.getServletPath().equals("/CrearUsuario") && !request.getServletPath().equals("/CrearEmpleado")) {
                      response.sendRedirect("usuario/login");
                } else if (sesion.getAttribute("usuario") != null && (request.getServletPath().equals("/usuario/login"))) {
                    response.sendRedirect(request.getContextPath() + "../../vista/iniciarsesion.jsp");
                }
                // if (request.getParameter("btnIniciarSesion") != null) {
//                    Usuario vo = ac.query(numero_identificacion, clave, rol);
//                 
//                    if (sesion.getAttribute("usuario") != null) {
//
//                        if (rol == 1) {
//                            response.sendRedirect("/vista/registrarinformacionempresa.jsp");
//                        }
//                        if (rol == 2) {
//                            response.sendRedirect("/vista/registrardatosbasicos.jsp");
//                        }
//
//                    } else {
//                         response.sendRedirect("/vista/iniciarsesion.jsp");
//                    }
                //}
            } catch (AppException e) {

                response.sendRedirect(request.getContextPath() + "../../vista/iniciarsesion.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
}
