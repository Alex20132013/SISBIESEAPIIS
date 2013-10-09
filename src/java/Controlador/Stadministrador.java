/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CAdministrador;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
@WebServlet(name = "Stadministrador", urlPatterns = {"/Stadministrador"})
public class Stadministrador extends HttpServlet {

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
            CAdministrador admin;
            int opcion=Integer.parseInt(request.getParameter("option"));
            
            switch(opcion)
            {
            
                case 0:
                      admin=new CAdministrador();
                      admin.setCategoria(request.getParameter("cat").charAt(0));             
                      List<Object[]> administradores=admin.SelectDatos(); 
            
          
                      for (Object[] objects : administradores) 
                        {
                            if (objects[4].toString().charAt(0)!='S') 
                                {
                       
                   
                                out.print("<tr>");
                                out.print("<td>"+objects[0].toString()+"</td>"); 
                                out.print("<td>"+objects[1].toString()+"</td>");
                                out.print("<td>"+objects[2].toString()+"</td>");                        
                                out.print("<td><input type='checkbox' name='chbxEstado' value='"+objects[3].toString()+"' />Habilitado</td>");   
                            
                        
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
                    break;
                case 1:
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
                         admin=new CAdministrador(cod, nombre_admin, apellidos_admin, correo_admin, paswd, estdoAdmi, categoria, fech_venc);
            
                        boolean bandera=admin.InsertRegisto() ;
                        if (bandera==true) 
                        {
                
                            out.println("Se ha registrado corretamente");
                        }
                        else
                        {
                            out.println("ya existe usuario");
                        }
                    break;
                case 2:
                       String cod_admin=request.getParameter("codigo");
                       admin=new CAdministrador();
                       BigDecimal d=new BigDecimal(cod_admin);
             
                       Object[]administrador=admin.EditarUser(d);
            
           
                       out.print("Codigo:<input type='text' name='txtCod' value='"+administrador[0].toString()+"'/><p></p>"); 
                       out.print("Nombre:<input type='text' name='txtNombre' value='"+administrador[1].toString()+"'/><p></p>");
                       out.print("Apellidos:<input type='text' name='txtApellidos' value='"+administrador[2].toString()+"'/><p></p>");
                       out.print("Correo:<input type='email' name='correo' value='"+administrador[3].toString()+"'/><p></p>");
                       out.print("Estado:<input type='checkbox' name='chbxEstado' checked='"+administrador[4].toString()+ "'  />Habilitado<p></p>");
                       out.print("Cambiar Password:<input type='checkbox' name='chbxPass' checked='false' onclick='Habilitarpassword()' /><input type='password' name='txtPass' id='pwdHabilitar' disabled='false' /><p></p>");
                       out.print("<input type='hidden' name='hdnCat' value='"+administrador[5].toString().charAt(0)+ "'/>");            
                
                       out.print("Fecha reg:<input type='date' name='dateIni' value='"+administrador[6].toString()+"' /><p></p>");
                       out.print("Fecha ven:<input type='date' name='dateVen' value='"+administrador[7].toString()+"' /><p></p>");
                       out.print("<button  class='submit' type='submit' id='idSaveEdit' value='enviar' >Guardar</button>");
                //out.print("<input type='button' value='Guardar' onclick='GuardarEditado()' />!!<input type='button' value='Cancelar' onclick='CancelarEditado()' />");
                       out.print("<input type='hidden' name='option' value='4' /><p></p>");
                      break;
                case 3:
                        String cod_admin1=request.getParameter("cod_admin");
                        BigDecimal codigo_admin=new BigDecimal(cod_admin1);            
                        admin=new CAdministrador();
            
                        if (admin.DeleteAdministrador(codigo_admin)==1) 
                        {
                            out.print("Se ha eliminado correctamente!");
                        }
                        else
                        {
                            out.print("No es Posible eliminara");
                        }
                    break;
                    
               case 4:
                        boolean estdoAdmiE=false;
                        String codigo_ed=request.getParameter("txtCod");           
                        BigDecimal cod_ed=new BigDecimal(codigo_ed); 
                        String nombre_admined=request.getParameter("txtNombre");
                        String apellidos_admined=request.getParameter("txtApellidos");    
                        String correo_admined=request.getParameter("correo");
                        String paswded=request.getParameter("txtPwd");
                        String    estadoed=request.getParameter("chbxEstado");
                        char categoriaed=Character.toUpperCase(request.getParameter("hdnCat").charAt(0));
                        String fech_venced=request.getParameter("dateVen").replace('/', '-');
                         
                        if (estadoed.equals("on")) 
                        {
                            estdoAdmiE=true; 
                        }
                        
                        admin=new CAdministrador(cod_ed, nombre_admined, apellidos_admined, correo_admined, paswded, estdoAdmiE, categoriaed, fech_venced);
                        
                        if (admin.UpdateRegistro()) 
                        {
                         out.print("Se ha guardado correctamente");
                        }
                        else
                        {
                        
                          out.print("No se pudo guradar");     
                        }
                   
                   
            
               break;     
            }
            
            
            
            
            
        }
        catch(Exception ex)
        {
          out.print("ERROR!--"+ex.getMessage());
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
