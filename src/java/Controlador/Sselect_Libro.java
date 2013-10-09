package Controlador;

import Modelo.CAutor;
import Modelo.CLibro;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "Sselect_Libro", urlPatterns = {"/Sselect_Libro"})
public class Sselect_Libro extends HttpServlet {

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
            
            int contador=0;
            String opcion=request.getParameter("ursOption");
            
            String busqueda=request.getParameter("txtFind");
           
            List<Object[]> lista_libros=null;
            
            if (opcion.equals("titulo")) 
            {
               CLibro libro=new  CLibro();
               lista_libros=libro.Busqueda_por_Titulo(busqueda);
               
               out.print(" <table cellpadding='0' cellspacing='0' border='0' class='display' id='dtVisualizar' >");
               out.println("<thead>");
               out.println("<tr>");
               out.println("<th>Titulo</th>");
               out.println("<th>Especi.</th>");
               out.println("<th>Autores</th>");
               out.println("<th>Dispo.</th>");
               out.println("<th>Total</th>");
               out.println("<th></th>");
               out.println("<th></th>");
               out.println("</tr>");
               out.println("</thead>");
             
               out.println("<tbody>");
                for (Object[] objects : lista_libros) 
                {
                    contador=Integer.parseInt(objects[5].toString());
                 out.println("<tr>");                
                 out.println("<td width='190'>"+objects[1].toString()+"</td>");
                 out.println("<td width='170'>"+objects[2].toString()+"</td>");
                 out.println("<td>"+objects[6].toString()+"</td>");
                 out.println("<td>"+objects[5].toString()+"<input type='hidden' id='"+objects[0].toString()+"' value='"+objects[5].toString()+"' readonly=\"readonly\"/></td>");
                 
                 
                 out.println("<td>"+objects[4].toString()+"</td>");                 
                 out.print("<td><a href='#' onclick='Indice_libro("+objects[0].toString()+")' >Ver Indice</a></td>");
                    if (contador>0) 
                    {
                       out.print("<td><span class='contenido'><a href='#' onclick='Funcion_Prestamo("+objects[0].toString()+")' id='dialogoSencillo'>Enviar Prestamo </a>"
                         + "<span class='mensaje'>"+objects[7].toString()+"<br/>"+objects[8].toString()+"<br/>"+objects[9].toString()+"</span></span></td>"); 
                    }
                    else
                    {
                      out.print("<td><span class='contenido'><a href='#' >Terminado </a>"
                         + "<span class='mensaje'>"+objects[7].toString()+"<br/>"+objects[8].toString()+"<br/>"+objects[9].toString()+"</span></span></td>");
                    }
                 
                 //out.print("<td><a href='#' onclick='Detalle_LIbro()'>Enviar Prestamo </a></td>");
                 out.println("</tr>");
                    
                }
                             
               out.println("</tbody>"); 
               out.print(" </table>");
            }
            else
            {
                int id_autor=Integer.parseInt(busqueda);
                CAutor list_books=new CAutor();
                lista_libros=list_books.lista_libros(id_autor);
                out.print(" <table cellpadding='0' cellspacing='0' border='0' class='display' id='dtVisualizar' >");
                out.println("<thead>");
                out.println("<tr>");
                out.println("<th>Titulo</th>");
                out.println("<th>Especialidad</th>");              
                out.println("<th>Dispo.</th>");
                out.println("<th>Total</th>");
                out.println("<th></th>");
                out.println("<th></th>");
                out.println("</tr>");
                out.println("</thead>");
                out.println("<tbody>");
                for (Object[] objects : lista_libros) 
                {
                    contador=Integer.parseInt(objects[5].toString());
                 out.println("<tr>");
                 out.println("<td width='190'>"+objects[1].toString()+"</td>");
                 out.println("<td width='180'>"+objects[2].toString()+"</td>");
                  out.println("<td>"+objects[5].toString()+"<input type='hidden' id='"+objects[0].toString()+"' value='"+objects[5].toString()+"' readonly=\"readonly\"/></td>");
                
                
                 out.println("<td>"+objects[4].toString()+"</td>");                 
                 out.print("<td><a href='#' onclick='Indice_libro("+objects[0].toString()+")'>Ver Indice</a></td>");  
                    if (contador>0) 
                    {
                        out.print("<td><span class='contenido'><a href='#' onclick='Funcion_Prestamo("+objects[0].toString()+")'id='dialogSencillo' >Enviar Prestamo</a>"
                         + "<span class='mensaje'>"+objects[6].toString()+"<br/>"+objects[7].toString()+"<br/>"+objects[8].toString()+"</span></span></td>");
                    }
                    else
                    {
                      out.print("<td><span class='contenido'><a href='#'  >Terminado</a>"
                         + "<span class='mensaje'>"+objects[6].toString()+"<br/>"+objects[7].toString()+"<br/>"+objects[8].toString()+"</span></span></td>");
                    }
                 
                 out.println("</tr>");   
                } 
                
              out.println("</tbody>"); 
              out.print(" </table>");
            }    
            
            lista_libros.removeAll(lista_libros);
        }
        catch(Exception ex)
        {
           out.print(ex.getMessage());  
        }
        finally {
           // this.destroy();
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
