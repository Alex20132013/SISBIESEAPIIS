/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CEditorial;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 2012
 */
@WebServlet(name = "Sreg_editorial", urlPatterns = {"/Sreg_editorial"})
public class Sreg_editorial extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
             String nombre_editorial=request.getParameter("txtNombre") ;
             String webEditrial=request.getParameter("txtURL") ;
             String direccionEditorial=request.getParameter("txtPais") ;
             String codigo=request.getParameter("codigo") ;
             
           if(codigo!=null)
           {
             CEditorial editorial=new CEditorial(nombre_editorial, webEditrial, direccionEditorial);
             
             if (editorial.InsertRegisto()==true) 
             {
                out.print("Se ha registrado correctamnete!!");
             }
             else
             {
               out.print("No se ha registrado!!");
             }
             
            }
           else
           {
             int id_editorial=Integer.parseInt(codigo);
             CEditorial editorial=new CEditorial(id_editorial, nombre_editorial, webEditrial, direccionEditorial);
             
             if (editorial.UpdateRegistro()==true) 
             {
                out.print("Se ha actualizado correctamnete!!");
             }
             else
             {
               out.print("No se ha Actualizado!!");
             }
               
           } 
            
        }
        catch(Exception ex)
        {
         out.print("hubo un error.."+ex.getMessage()); 
        }
        finally 
        {
            this.destroy(); 
            out.close();
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
