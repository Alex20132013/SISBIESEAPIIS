
package Controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 *
 * @author EAPIIS-Biblioteca
 */
 @WebServlet(name = "prueba", urlPatterns = {"/prueba"}) 
public class prueba extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     ServletOutputStream out = response.getOutputStream();         
         ServletOutputStream soutImage = response.getOutputStream();
       
        try {
                 HttpSession hsPrintDewey=request.getSession(true);
            
            List<Object[]> linsertTemp=null;
           // List<Object[]> linsertTemp=null;
            
            if (hsPrintDewey.getAttribute("Dewey_barrra")!=null ) 
            {
               linsertTemp=(ArrayList<Object[]>)hsPrintDewey.getAttribute("Dewey_barrra");               
                
            }   
            
            
            
            for (int i = 0; i < linsertTemp.size(); i++) 
            {
                Object[] objects = linsertTemp.get(i);
                out.println(objects[0].toString());
                out.println(objects[1].toString());
                out.println(objects[2].toString());
                out.println(objects[3].toString());
                
                out.println("<br/>");
                
                
                
                
            }
        }
        
        catch (Exception ex) 
            {
                soutImage.println("ERROR!:"+ex.getLocalizedMessage());
            }
        finally {            
            soutImage.close();
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
