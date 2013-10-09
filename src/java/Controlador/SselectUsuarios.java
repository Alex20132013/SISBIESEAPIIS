/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CUsuario;
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
@WebServlet(name = "SselectUsuarios", urlPatterns = {"/SselectUsuarios"})
public class SselectUsuarios extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
           CUsuario users=new CUsuario();
           
           List<Object[]> lista_user=users.SelectDatos();
           String codigo=request.getParameter("codigo");
           if(codigo==null )
           {
           
            for (Object[] objects : lista_user) 
            {
                
                out.print("<tr>");
                out.print("<td>"+objects[0].toString()+"</td>");
                out.print("<td>"+objects[1].toString()+"</td>");
                out.print("<td>"+objects[2].toString()+"</td>");
                out.print("<td>"+objects[3].toString()+"</td>");
                if (objects[4].toString().equals("true")) 
                   {
                    out.print(" <td id='"+objects[0]+"'>Habilitado<input type='checkbox' name='cbxEstado' value='"+Boolean.valueOf(objects[4].toString()) +"' onclick='Habilitar(this,"+objects[0].toString()+")' checked /></td>");
                   }
                else
                   {
                    out.print(" <td id='"+objects[0]+"'>Ihhabilitado<input type='checkbox' name='cbxEstado' value='"+Boolean.valueOf(objects[4].toString()) +"' onclick='Habilitar(this,"+objects[0].toString()+")' /></td>");    
                   }
                
                //out.print("<td>"+objects[5].toString()+"</td>");
                out.print("<td><img src='../Imagenes/sql/editar.png' onclick='EditarAdmin("+objects[0].toString()+")'/></td>");
                out.print("<td><img src='../Imagenes/sql/eliminar.jpg' onclick='DeteleAdmin("+objects[0].toString()+")'/></td>");
                out.print("<td><a href='#'>ver detalle</a></td>");
                out.print("</tr>");
                
            }
           }
           else
           {
             BigDecimal cod_user=new BigDecimal(codigo);
             Object[]usuario=users.editar_user(cod_user);
             
            out.print(" <form class='contact_form' action='#' method='post' name='contact_form' onsubmit='return comprobar(this)'>");
                 out.print("<ul>");  
                    out.print("<li>");
                         out.print("<h2>Registro Usuario EAPIIS</h2>");
                         out.print("<span class='required_notification'>* Datos Requeridos</span>");
                    out.print(" </li>");
                    out.print("<li>");
                       out.print( "<label for='name'>Codigo Usuario:</label>");
                        out.print("<input type='number' name='txtCodigo' value='"+usuario[0].toString() +"'  placeholder='016530' title='Código Usuario Eapiis. Solo Numerco:' pattern='[0-9]{3,12}' required />");
                       out.print("<span class='form_hint'>'Codigo Usuario'</span>");
                    out.print("</li>");
                    out.print("<li>");
                        out.print("<label for='name'>Nombre:</label>");
                        out.print("<input type='text'  placeholder='John' title='Nombre Usuario solo Caracteres' value='"+usuario[1].toString()+"'  pattern='[A-Za-z ñÑáéíóúüç]{3,30}' required />");
                        out.print("<span class='form_hint'>'Ingrese solo Letras>3 dígitos'</span>");
                    out.print(" </li>");
                    out.print("<li>");
                        out.print("<label for='name'>Apellidos:</label>");
                        out.print("<input type='text'  placeholder='Ancco Pocco'  value='"+usuario[2].toString()+"' title='Apellido Usuario solo Caracteres >3 Dígitos' pattern='[A-Za-z ñÑáéíóúüç]{3,30}' required />");
                        out.print("<span class='form_hint'>'Ingrese solo letras'</span>");
                    out.print("</li>");
                    out.print("<li>");
                        out.print("<label for='name'>Direccion:</label>");
                        out.print("<input type='text' value='"+usuario[3].toString()+"'  required />");
                        out.print("<span class='form_hint'>'Ingrese solo letras'</span>");
                    out.print("</li>");
                    out.print("<li>");
                        out.print("<label for='email'>Correo:</label>");
                        out.print("<input type='email' name='correo' value='"+usuario[4].toString()+"' placeholder='john_doe@example.com' required />");
                        out.print("<span class='form_hint'>'Forma de ingresar 'nombre@ejemplo.com'</span>");
                    out.print("</li>");
                    out.print("<li>");
                       out.print(" <label for='name'>Contraseña:</label>");
                        out.print("<input type='password'   required />");
                        out.print("<span class='form_hint'>La Contraseña al menos debe contener una letra mayúscula y un Número'</span>");
                    out.print("</li>");
                    /*<li>
                        <label for="name">Repita Contraseña:</label>
                        <input type="password"  pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required />
                        <span class="form_hint">La Contraseña al menos debe contener una letra mayúscula y un Número"</span>;
                    </li>*/
                    out.print("<li>");
                        out.print("<label for='name'>Huella digital:</label>");
                        out.print("<input type='text'  />");
                        out.print("<span class='form_hint'>'Huella Digital'</span>");
                    out.print("</li>");
                    out.print("<li>");
                        out.print("<button  class='submit' type='submit'>Agregar Nuevo</button>");
                        out.print("<button  class='submit' type='reset'>Restablecer</button>");
                    out.print("</li>");
                out.print("</ul>");
            out.print("</form>");
            out.print("<button onmousedown='llamadaoverlay()'>editar</button>");
             
             
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
