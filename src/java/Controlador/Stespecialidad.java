
package Controlador;

import Modelo.CEspLibro;
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
@WebServlet(name = "Stespecialidad", urlPatterns = {"/Stespecialidad"})
public class Stespecialidad extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            int opcion=Integer.parseInt(request.getParameter("option"));
            CEspLibro esplibro;
           
            switch(opcion)
            {
                case 1:
                     String nombre_especialidad=request.getParameter("txtEsp");
                     String descpEsp=request.getParameter("txaDescp");
                     esplibro=new CEspLibro(nombre_especialidad, descpEsp);
                     
                     if (esplibro.InsertRegisto()) 
                     {
                      out.print("Registro correcto");   
                     }
                     else
                     {
                     out.print("Ha ocurrido una exepcion");
                     }
                     
                    break;  
                case 2:
                       String nombre_esp=request.getParameter("txtNombre_esp");
                       String descp_esp=request.getParameter("txaDscpesp");
                       int id_esp=Integer.parseInt(request.getParameter("txtCod"));
                       esplibro=new CEspLibro(nombre_esp, descp_esp, id_esp);
                       if (esplibro.UpdateRegistro()) 
                        {
                       out.print("Actualizacio Correcta!");   
                        }
                     else
                     {
                     out.print("Ha ocurrido una exepcion");
                     }   
                     
                    break;
                case 3:
                       
                        int id_especialidad=Integer.parseInt(request.getParameter("id_especialidad"));
                        esplibro=new CEspLibro();
                        esplibro.setId_esp(id_especialidad);
                       if (esplibro.DeleteRegistro()) 
                        {
                         out.print("Se ha eliminado  Correctamente!");   
                        }
                     else
                     {
                     out.print("Ha ocurrido una exepcion al eliminar");
                     } 
                    
                    break;
              default:out.print("no se ha ejecutado niguna operaion");;      
            
            }
           
            
        }
        catch(Exception ex)
        {
            out.print(ex.getMessage()); 
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
