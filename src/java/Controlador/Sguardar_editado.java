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
@WebServlet(name = "Sguardar_editado", urlPatterns = {"/Sguardar_editado"})
public class Sguardar_editado extends HttpServlet {

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
          //String badera=request.getParameter("txtEditar");          
          String codigo=request.getParameter("txtCod");           
          BigDecimal cod=new BigDecimal(codigo); 
          String nombre_admin=request.getParameter("txtNombre");
          String apellidos_admin=request.getParameter("txtApellidos");    
          String correo_admin=request.getParameter("correo");
          String paswd=request.getParameter("txtPass");
          boolean    estado=Boolean.parseBoolean(request.getParameter("chbxEstado"));
          char categoria=Character.toUpperCase(request.getParameter("hdnCat").charAt(0));
          String fech_venc=request.getParameter("dateVen").replace('/','-'); 
          
          //CAdministrador admi=new CAdministrador(cod, nombre_admin, apellidos_admin, correo_admin, paswd, estado, categoria, fech_venc);
          boolean bandera=paswd!=null; 
            if (bandera==true) 
            {
               CAdministrador admi=new CAdministrador(cod, nombre_admin, apellidos_admin, correo_admin, paswd, estado, categoria, fech_venc);
               boolean respuesta=admi.UpdateRegistro();
                if (respuesta) 
                {
                 out.print("Actualizacio corecta!!"+estado);     
                }
                else    
                {
                 out.print("no es posible la Actualizacion");   
                }  
            }
            else
            {
               CAdministrador admi=new CAdministrador(cod, nombre_admin, apellidos_admin, correo_admin, "", estado, categoria, fech_venc);
                boolean respuesta=admi.UpdateRegistro();
                if (respuesta) 
                {
                 out.print("Actualizacio corecta!!"+estado);     
                }
                else    
                {
                 out.print("no es posible la Actualizacion!!");   
                }  
            }
           
            
        }
        catch(Exception ex)
        {
            out.println("Error!"+ex.getMessage());
            this.destroy();
        }
        finally {            
            out.close();
            this.destroy();
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
