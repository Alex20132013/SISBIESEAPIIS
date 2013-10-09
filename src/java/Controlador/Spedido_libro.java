/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CPrestamoLibro;
import Modelo.CUsuario;
import Modelo.Ctemp_pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author eapiis_server
 */
@WebServlet(name = "Spedido_libro", urlPatterns = {"/Spedido_libro"})
public class Spedido_libro extends HttpServlet {

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
            
            BigDecimal codigo_user= new BigDecimal(request.getParameter("codigo_user"));
            String isbn_libro=request.getParameter("isbn_libro");
            int     opcion=Integer.parseInt(request.getParameter("opcion_select"));
            
            Ctemp_pedido  pedido_libro=new Ctemp_pedido(codigo_user, isbn_libro, opcion);
            CPrestamoLibro verificar=new CPrestamoLibro();
            
            //verificando que el usuario exista y este habilitado para pedir
            
            CUsuario validar_user=new CUsuario();
            validar_user.setCod_user(codigo_user);
            
            boolean validar=validar_user.Validar_usuario();///validaddo si el usuario existe
            
            boolean prestamo=verificar.VerificarDevuelto(codigo_user);
            if (!prestamo && validar==true) 
            {
                boolean indicador=pedido_libro.InsertRegisto();
                if (indicador) 
                {
                  out.print("se ha enviado tu pedido!!..:)");    
                }
                else
                {
                 out.print(" ha sucedido un error con tu pedido!!..:(");
                }
                
            }
            else
            {
                if (!validar) 
                {
                  out.print("FALLÒ EL PEDIDO !...\n...TERMINE SU PROCESO DE VALIDACION \n CON  EL ADMINISTRADOR DEL SISTEMA");   
                }
                else
                {
                 out.print("AUN NO HA DEVUELTO EL LIBRO!.."); 
                }
            
               
            }
            
        }
        catch(Exception ex)
        {
         out.print("PETICION NEGADA!!....YA HIZO SU PEDIDO");   
          out.print(ex.getMessage());
        }
        finally 
        {            
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
