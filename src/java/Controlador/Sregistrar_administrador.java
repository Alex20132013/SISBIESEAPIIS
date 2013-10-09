/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CAdministrador;
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
@WebServlet(name = "Sregistrar_administrador", urlPatterns = {"/Sregistrar_administrador"})
public class Sregistrar_administrador extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
         //String badera=request.getParameter("txtEditar");
          boolean estdoAdmi=false;
          String codigo=request.getParameter("txtCod");
           
          BigDecimal cod=new BigDecimal(codigo); 
          String nombre_admin=request.getParameter("txtNombre");
          String apellidos_admin=request.getParameter("txtApellidos");    
          String correo_admin=request.getParameter("correo");
          String paswd=request.getParameter("txtPwd");
          String    estado=request.getParameter("estadoAdmi");
          char categoria=Character.toUpperCase(request.getParameter("dlsCate").charAt(0));
          String fech_venc=request.getParameter("dateVen").replace('/', '-');
          
            if (estado.equals("habilitado")) 
            {
               estdoAdmi=true; 
            }
           CAdministrador admin=new CAdministrador(cod, nombre_admin, apellidos_admin, correo_admin, paswd, estdoAdmi, categoria, fech_venc);
            
             boolean bandera=admin.InsertRegisto() ;
            if (bandera==true) 
            {
                
                 out.println("Se ha registrado corretamente");
            }
            else
            {
                 out.println("ya existe usuario");
            }
            
            
        }
        catch(Exception ex)
        {
         out.println("ha ocurrdo un error:"+ex.getMessage());
        }
        finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
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
