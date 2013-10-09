/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CAdministrador;
import Modelo.CEdditorial;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author 2012
 */
@WebServlet(name = "Sselect_editorial", urlPatterns = {"/Sselect_editorial"})
public class Sselect_editorial extends HttpServlet {

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
        try 
        {
          
          CEdditorial editorial=new CEdditorial();
          List<Object[]> editoriales=new ArrayList<Object[]>();          
          String codigo=request.getParameter("codigo");
          
            if (codigo==null) 
            {
             
             
             editoriales=editorial.SelectDatos();   
            
          
              for (Object[] objects : editoriales) 
               {
                   
                       
                   
                        out.print("<tr>");                        
                        out.print("<td>"+objects[1].toString()+"</td>");
                        out.print("<td>"+objects[2].toString()+"</td>");                        
                        out.print("<td>"+objects[3].toString()+"</td>");
                        
                        
                        //out.print("<td><img src='../Imagenes/sql/editar.png' onclick='Editar_editorial("+objects[0].toString()+")'/></td>");
                       // out.print("<td><img src='../Imagenes/sql/editar.png' onclick='Editar_editorial("+objects[0].toString()+")'/></td>");
                        out.print("<td><a href='#' onclick='Editar_editorial("+objects[0].toString()+")' id='btnModal'>Editar</a></td>");
                        out.print("<td><img src='../Imagenes/sql/eliminar.jpg' onclick='Editar_editorial("+objects[0].toString()+")'/></td>");               
                        out.print("<td><a href='#' onclick='nuevoEditorial()' id='llamarEditorial'>Nuevo Editorial</a></td>");
                    out.print("</tr>");
                                
              }
          //out.print("hola mundo");
           }
          else
          {
             int id_edirorial=Integer.parseInt(codigo) ;
             
            Object[]administrador=editorial.editar_editorial(id_edirorial);
            
                
                out.print("<input type='hidden' name='txtCod' value='"+administrador[0].toString()+"'/><p></p>"); 
                out.print("Nombre Editorial:<input type='text' name='txtNombre_edit' value='"+administrador[1].toString()+"'/><p></p>");
                out.print("Web editorial:<input type='text' name='txtWeb_edi' value='"+administrador[2].toString()+"'/><p></p>");
                out.print("Pais:<input type='text' name='txtPais' value='"+administrador[3].toString()+"'/><p></p>");  
                out.print("<input type='button' value='Guardar' onclick='GuardarEditado()' />!!<input type='button' value='Cancelar' onclick='CancelarEditado()' />");
                
            
          }
                
          
         }
           
        catch(Exception ex)
        {
          out.print(ex.getMessage());
          this.destroy();
        }
        finally {   
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
