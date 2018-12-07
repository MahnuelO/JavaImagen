/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import control.ControlUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AppException;
import modelo.vo.Usuario;
import control.ControlUsuario;
import modelo.conexion.Conexion;


/**
 *
 * @author MAHNUEL
 */
@WebServlet(name = "ServletUsuario", urlPatterns = {"/usuario/login", "/usuario/crear"})
public class ServletUsuario extends ServletLogin {

    public void procesarServlet(PrintWriter out, Connection cnn, String urlServlet, HttpServletRequest request, HttpServletResponse response) throws AppException, Exception {

        switch (urlServlet) {
            case "/usuario/login":

                String numero_identificacion = request.getParameter("numero_identificacion");
                String clave = request.getParameter("clave");
                ControlUsuario ac = new ControlUsuario();
                Usuario vo1 = ac.buscarRol(numero_identificacion);
                int rol = vo1.getId_rol();
                //String error = request.getParameter("e");

                if (numero_identificacion != null && clave != null ) {
                    ControlUsuario control = new ControlUsuario(cnn);
                    Usuario vo = control.query(numero_identificacion, clave, rol);
                    if (vo != null) {
                        HttpSession sesion = request.getSession();
                        sesion.setAttribute("usuario", vo);
                        response.sendRedirect(request.getContextPath() + "../../vista/iniciarsesion.jsp");
                    }
                }

                break;
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
    }// </editor-fold>
}
