/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Conexion;
import Modelo.Congreso;
import Modelo.Paper;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Cheto_2
 */
public class adminPaper extends HttpServlet {

    Conexion c = new Conexion();
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminPaper</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminPaper at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        //processRequest(request, response);
        if (request.getParameter("estado").compareTo("cargarLista") == 0) {
            
            ArrayList<Congreso> listaCongreso = c.getCongresosCBO();
            
            request.setAttribute("listaCongresos", listaCongreso);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/AltaPaper.jsp");
            rd.forward(request, response);
        }
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
        //processRequest(request, response);
        //este viene del Alta Paper
        String usuario = request.getParameter("txtUsuario");
        Paper nuevo = new Paper(0, Integer.parseInt(request.getParameter("cboCongreso")), usuario,request.getParameter("txtTitulo"), Integer.parseInt(request.getParameter("txtCantPag")), request.getParameter("txtNombreAutor"), Integer.parseInt(request.getParameter("txtCantAutoresProfesores")), Integer.parseInt(request.getParameter("txtCantAutoresEstudiantes")));
        int id = c.addPaper(nuevo);
        if (id != -1) {
            String agregado = "Agregado Con exito";
            int total = c.calcularViaticosDePaper(id);
            
            request.setAttribute("agregado", agregado);
            request.setAttribute("total", total);
            
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/ResultadoAltaPaper.jsp");
            rd.forward(request, response);
        }
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
