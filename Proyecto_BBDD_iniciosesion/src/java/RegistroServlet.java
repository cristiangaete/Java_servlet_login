/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cristian
 */
@WebServlet(urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
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
        processRequest(request, response);
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
        String rut = request.getParameter("rut");
        String nombre = request.getParameter("nombre");
        String ape_pat = request.getParameter("ape_pat");
        String ape_mat = request.getParameter("ape_mat");
        int fono = Integer.parseInt(request.getParameter("numero"));
        String especialidad = request.getParameter("especialidad");
        
        tablausuario insusuario = new tablausuario(rut, nombre, ape_pat, ape_mat, fono, especialidad);
        boolean resp= Usuario.agregarUsuario(insusuario);
        
        if(resp){
            response.sendRedirect("IniciarSesion.jsp");
        }else{
        PrintWriter out=response.getWriter();
        out.println("USUARIO YA REGISTRADO");
        out.println("<br>");
        out.println("<br>");
        out.println("<div align='center'>");
        out.println("<a href='index.jsp'>volver a registrar usuario</a>");
        out.println("</div>");
        out.println("<br>");
        out.println("<br>");
        out.println("<div align='center'>");
        out.println("<a href='IniciarSesion.jsp'>Iniciar sesion</a>");
        out.println("</div>");
        }
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
