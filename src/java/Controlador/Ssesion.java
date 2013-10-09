/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 2012
 */
@WebServlet(name = "Ssesion", urlPatterns = {"/Ssesion"})
public class Ssesion extends HttpServlet {

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
        
        HttpSession sesion=request.getSession(true);  
        
        
       try {
             
         
          if ( sesion.getAttribute("USER")!=null  ) 
          {
              sesion.invalidate();
            
                      
              response.sendRedirect("index.jsp");
            
          }
          else
          {
              String usuario=request.getParameter("username");
              String paswd=request.getParameter("password");
        
               CSession misesion=new CSession(usuario, paswd);
               Object[]user=misesion.Usuario();//es usuario?
            
            if (user!=null) 
            {
                
                
                if (user.length>4) 
                {
                     sesion.setAttribute("USER",user);
                     response.sendRedirect("UsuarioEapiis/index.jsp");
                }
                else
                {
                    if (user[0].equals("A")) 
                    {
                      sesion.setAttribute("USER",user);
                      response.sendRedirect("Admnistrador/index.jsp");     
                    }
                    else
                    {
                        if (user[0].equals("B")) 
                        {
                          sesion.setAttribute("USER",user);
                          response.sendRedirect("Bibliotecario/index.jsp");
                        }
                        else
                        {
                         sesion.setAttribute("USER",user);
                         response.sendRedirect("Admnistrador/index.jsp");
                        }
                    }
                    
                }
               
            }
            else    
            {
                response.sendRedirect("index.jsp");
                //out.println("No existe usuario!!:");
               
            }    
            
            }
       
        }
        catch (Exception ex) 
            {
                out.println("ERROR!:"+ex.getLocalizedMessage());
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
