/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Controlador.Conexion;
import Modelo.Congreso;
import Modelo.Estado;
import dto.CongresoEstado;
import dto.PaperCongreso;
import dto.TotalViaticos;
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
public class adminCongreso extends HttpServlet {

    
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
        
            String resultado="";
            switch (request.getParameter("estado")) {
                    
                case "insert":
                        Congreso nuevo = new Congreso(0, 0, request.getParameter("txtNombre"), request.getParameter("fechaInicio"), request.getParameter("txtDescripcion"), Float.parseFloat(request.getParameter("txtPrecio")));
                        if(c.addCongreso(nuevo)){
                            resultado = "Agregado Con exito";
                        }
                        else{
                            resultado = "No se pudo agregar el nuevo congreso";
                        }
                        break;
                case "modificar"://Viene de ModificarCongreso
                        int estado = Integer.parseInt(request.getParameter("cboNuevoEstado"));//Recibo los parametros del cbo Estados
                        int idCongreso = Integer.parseInt(request.getParameter("txtIdCongreso"));//Recibo el id del congreso a modificar
                        if (c.modificarEstadoCongreso(estado, idCongreso)) {//ejecuto el metodo del controlador Conexion pa Modificarlo
                            resultado = "Modificado Con exito";
                        }
                        else{
                            resultado =  "No se pudo modificar el nuevo congreso";
                        }
                        break;
            }
            
            request.setAttribute("resultado", resultado);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/ResultadoAltaCongreso.jsp");
            rd.forward(request, response);

         
        
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
        ArrayList<CongresoEstado> listaCongreso;
        ArrayList<Estado> listaEstados;
        ArrayList<TotalViaticos> listaViaticos;
        RequestDispatcher rd;
        switch(request.getParameter("estado")){
            case "modif":
                listaCongreso = c.getCongresos();//Meto todos los congresos a un ArrayList
                listaEstados = c.getEstados();//Meto todos los estados en un ArrayList
                listaViaticos = c.getTotalViaticos();

                request.setAttribute("ListadoModificarCongreso", listaCongreso); // creo un atributo para despues recibirlo con bean en el jsp
                request.setAttribute("Estados", listaEstados);
                request.setAttribute("ListaViaticos", listaViaticos);
                
                rd = getServletContext().getRequestDispatcher("/ModificarCongreso.jsp");//redirecciono al JSP
                rd.forward(request, response);
                break;
            case "listado":
                listaCongreso = c.getCongresos();

                request.setAttribute("ListadoModificarCongreso", listaCongreso);
                
                rd = getServletContext().getRequestDispatcher("/ListadoCongresos.jsp");
                rd.forward(request, response);
                break;
            case "masConvocantes":
                listaCongreso = c.congresoMasConvodado();

                request.setAttribute("ListadoModificarCongreso", listaCongreso);
                
                rd = getServletContext().getRequestDispatcher("/CongresoMasConvocados.jsp");
                rd.forward(request, response);
                break;
            case "convocatoria":
                listaCongreso = c.convocatoria();

                request.setAttribute("ListadoModificarCongreso", listaCongreso);
                
                rd = getServletContext().getRequestDispatcher("/Convocatoria.jsp");
                rd.forward(request, response);
                break;
            case "trabajoMasLargo":
                PaperCongreso listaPapers = c.trabajoMasLargo();

                request.setAttribute("TrabajoMasLargo", listaPapers);
                
                rd = getServletContext().getRequestDispatcher("/TrabajoMasLargo.jsp");
                rd.forward(request, response);
                break;
            case "totalViaticos":
                int[] totalViat = c.totalViaticos();
                
                request.setAttribute("reporteTotalViat", totalViat);
                
                rd = getServletContext().getRequestDispatcher("/TotalViaticos.jsp");
                rd.forward(request, response);
                break;
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
