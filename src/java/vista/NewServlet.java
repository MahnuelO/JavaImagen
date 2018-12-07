/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import control.DominaControl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.conexion.Conexion;
import modelo.vo.Domina;
import utils.AppException;

/**
 *
 * @author carmen
 */
@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String IdiomaN = request.getParameter("Idioma").trim();
        String NivelN = request.getParameter("Nivel").trim();
        String greetings= "OK";
		if(IdiomaN == null || "".equals(IdiomaN)
                        || NivelN == null || "".equals(NivelN)){
			greetings = "fallo datos inco";
		}else{
                    try {
                      //  int idPersona=5;
                        Connection cnn = Conexion.getConexionDB();
                        DominaControl dc=new DominaControl(cnn);
                        String[] datai = IdiomaN.split("-");
                        String[] datan = NivelN.split("-");
                        int i = 0;
                        while (i<datai.length) {          //Condición trivial: siempre cierta
                            if (Integer.parseInt(datan[i]) != 0 ) {
                                Domina voT = new Domina();
                                voT.setId_nivel(Integer.parseInt(datan[i]));
                                voT.setId_idioma(Integer.parseInt(datai[i]));
                                voT.setId_persona(Integer.parseInt(request.getParameter("persona").trim()));
                                dc.insert(voT);
                            }                               
                            i++;
                            
                        } 
                        Conexion.cerrarConexion(cnn);
                                                
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
                        greetings = "fallo 1";
                    } catch (SQLException ex) {
                        Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
                        greetings = "fallo sql";
                    } catch (AppException ex) {
                Logger.getLogger(NewServlet.class.getName()).log(Level.SEVERE, null, ex);
                greetings = ex.getMessage();
            }
                }
		
		
		response.setContentType("text/plain");
		response.getWriter().write(greetings);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
