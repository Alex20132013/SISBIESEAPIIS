/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CUsuario;
import jMail.Mail;
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
 * @author 2012
 */
@WebServlet(name = "Sregistro_usuario", urlPatterns = {"/Sregistro_usuario"})
public class Sregistro_usuario extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
              BigDecimal cod_user=new  BigDecimal(request.getParameter("cod_usuario").toString());
              int tipo_user=Integer.parseInt(request.getParameter("Id_Titpousuario"));
              String nombre_user=request.getParameter("NombreUsuario");
              String apellidos_user=request.getParameter("ApellidoUsuario");
              String direccion=request.getParameter("Direccion");
              String correo=request.getParameter("correo_user");
              String paswd=request.getParameter("contrasenna");
              
              CUsuario user=new CUsuario(cod_user, tipo_user, nombre_user, apellidos_user, direccion, correo, paswd);
              Mail mailEnvio=new Mail(correo , "smaple@gmail.com", "smtp.gmail.com", paswd);
              if(user.InsertRegisto()==true)
              {
               out.print("Se ha Registrado...ahora puede iniciar sesion...confirme con el bibliotecario");
               int respuesta=mailEnvio.sendMail();
                  if (respuesta==0) 
                  {
                    out.print("\nSu correo se Envió Correctamente a:" + correo);       
                  }
                  else
                  {
                    out.print("\n Su correo inválido!...no se pudo enviar mensaje  a:" + correo);
                  
                  }
               
              }
              else
              {
               out.print("Intentelo mas tarde");  
              }
           // out.print("Estoy funcionado");
              
           
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
