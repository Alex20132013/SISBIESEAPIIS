/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CLibro;
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
@WebServlet(name = "Stlibro", urlPatterns = {"/Stlibro"})
public class Stlibro extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            int opcion=Integer.parseInt(request.getParameter("option"));
            CLibro libro;
            switch(opcion)
            {
                case 0:break;
                case 1:break;
                case 2:
                       String isblibro=request.getParameter("isbn");
                       libro=new CLibro();
                       boolean bandera=libro.AgregarNuevoLibro(isblibro);
                       
                       if(bandera==true)
                       {
                          out.print(" <script type='text/javascript'>");
                           out.print("alert('El libro a sido agrgado correctamente!');");
                           out.print("$('#frmDtsLbro')[0].reset();");
                           out.print("$('#frmDtsLbro').show();");
       
                           out.print("$('#Autor').hide();");
                         out.print("</script>");  
                       
                       }
                       else
                       {
                          out.print(" <script type='text/javascript'>");
                           out.print("alert('Error al agregar!');");
                           out.print("$('#frmDtsLbro')[0].reset();");
                            out.print("$('#frmDtsLbro').show();"); 
                           out.print("$('#Autor').hide();");
                         out.print("</script>");
                       
                       }
                       
                       
                               
                    break;
                     case 3: break;
                case 4:
                       String isblib=request.getParameter("isbn");
                       libro=new CLibro();
                       boolean indicador=libro.BuscarLibroIsbn(isblib);
                       
                       if(indicador==true)
                       {
                          out.print(" <script type='text/javascript'>");
                           
                           out.print("$('#frmDtsLbro').hide();");
       
                           out.print("$('#Autor').hide();");
                          out.print("</script>");
                         
                         out.print(" <h1>El Libro ya existe</h1>");
                         out.print(" <input type='button' name='btnAceptar' value='Agregar' onclick='VerlibroExiste("+isblib+",1)' />||<input type='button' name='btnAceptar' value='Cancelar' onclick='VerlibroExiste(0,2)' />");
      
                       
                       }
                    
                    break;
                    
                    
            
            }
            
        }
        catch(Exception ex)
        {
          out.close();
        }
        finally {            
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
