/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CEspLibro;
import Modelo.CLibro;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eapiis_server
 */
@WebServlet(name = "Sreaderfile", urlPatterns = {"/Sreaderfile"})
public class Sreaderfile extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        response.setContentType("image/jpg");
       // PrintWriter out = response.getWriter();
        ServletOutputStream souImages=response.getOutputStream();
        BufferedInputStream binFoto=null;
        try 
        {
            String nameurl=request.getParameter("option");
            String namedir=request.getParameter("dir");
            // CLibro   ndsd=new CLibro();
            //String titulo=ndsd.getTitulo_libro();
            //String namedir=request.getParameter("titulo_Libro");
            
            binFoto=new BufferedInputStream(new FileInputStream("/home/Eapiis_Server/INDICESLIBROS/"+namedir+"/"+nameurl));
            byte[]b=new byte[8000];
            int contador=0;
            while ((contador=binFoto.read(b))!=-1) 
            {                
                souImages.write(b, 0, contador);
            }
            
            binFoto.close();
        }
        catch(Exception ex)
        {
            souImages.print(ex.getMessage());
        }
        finally {            
            souImages.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
