/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CAdministrador;
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
@WebServlet(name = "SselectAdmin", urlPatterns = {"/SselectAdmin"})
public class SselectAdmin extends HttpServlet {

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
          CAdministrador admin=new CAdministrador();
          List<Object[]> administradores=new ArrayList<Object[]>();
          
          String codigo=request.getParameter("codigo");
            if (codigo==null) 
            {
             admin.setCategoria(request.getParameter("cat").charAt(0));
             
             administradores=admin.SelectDatos();   
            
          
              for (Object[] objects : administradores) 
               {
                   if (objects[4].toString().charAt(0)!='S') 
                   {
                       
                   
                    out.print("<tr>");
                        out.print("<td>"+objects[0].toString()+"</td>"); 
                        out.print("<td>"+objects[1].toString()+"</td>");
                        out.print("<td>"+objects[2].toString()+"</td>");
                        /*int estado=Integer.parseInt(objects[3].toString());
                            if (estado==1) 
                            {*/
                               out.print("<td><input type='checkbox' name='chbxEstado' value='"+objects[3].toString()+"' />Habilitado</td>");   
                            //}
                            /*else
                            {
                               out.print("<td><input type='checkbox' name='chbxEstado' checked='false'/>Habilitado</td>"); 
                            }*/
                        
                        out.print("<td>"+objects[4].toString()+"</td>");
                        out.print("<td>"+objects[5].toString()+"</td>");
                        out.print("<td>"+objects[6].toString()+"</td>");
                        //out.print("<td><img href='#' src='../Imagenes/sql/editar.png' onclick='EditarAdmin("+objects[0].toString()+")' id='dialogSencillo'/></td>");
                       out.print("<td><a href='#' onclick='EditarAdmin("+objects[0].toString()+")' id='btnModal'>Editar</a></td>");
                        out.print("<td><img src='../Imagenes/sql/eliminar.jpg' onclick='DeteleAdmin("+objects[0].toString()+")'/></td>");
                       out.print("<td><a href='#' onclick='nuevoAdmin()' id='llamarNuevoAdmin'>Registrar Nuevo</a></td>");
                                   out.print("</tr>");
                                }
              }
          //out.print("hola mundo");
           }
          else
          {
             BigDecimal d=new BigDecimal(codigo);
             
            Object[]administrador=admin.EditarUser(d);
            
           
                out.print("Codigo:<input type='text' name='txtCod' value='"+administrador[0].toString()+"'/><p></p>"); 
                out.print("Nombre:<input type='text' name='txtNombre' value='"+administrador[1].toString()+"'/><p></p>");
                out.print("Apellidos:<input type='text' name='txtApellidos' value='"+administrador[2].toString()+"'/><p></p>");
                out.print("Correo:<input type='email' name='correo' value='"+administrador[3].toString()+"'/><p></p>");
                out.print("Estado:<input type='checkbox' name='chbxEstado' checked='"+administrador[4].toString()+ "'  />Habilitado<p></p>");
                out.print("Cambiar Password:<input type='checkbox' name='chbxPass' checked='false' onclick='Habilitarpassword()' /><input type='password' name='txtPass' id='pwdHabilitar' disabled='false' /><p></p>");
                out.print("<input type='hidden' name='hdnCat' value='"+administrador[5].toString().charAt(0)+ " />");
                /*out.print("Categria:<select name='dlsCate'  >");
                         if (administrador[5].toString().charAt(0)=='B' && administrador[5].toString().charAt(0)!='S') 
                         {
                           out.print(" <option value='B'>Bibliotecario</option>");
                           out.print(" <option value='A'>Administrador</option>");
                         }
                         else
                         {                           
                           out.print(" <option value='A'>Administrador</option>");
                           out.print(" <option value='B'>Bibliotecario</option>");
                         } */  
                            
                
                out.print("Fecha reg:<input type='date' name='dateIni' value='"+administrador[6].toString()+"'/><p></p>");
                out.print("Fecha ven:<input type='date' name='dateVen' value='"+administrador[7].toString()+"'/><p></p>");
                out.print("<button  class='submit' type='submit' id='Rolo4545' >Enviar</button>");
                //out.print("<input type='button' value='Guardar' onclick='GuardarEditado()' />!!<input type='button' value='Cancelar' onclick='CancelarEditado()' />");
                out.print("<input type='hidden' name='txtEditar' value='editar' /><p></p>");
            
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
