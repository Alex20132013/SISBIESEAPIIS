
package Controlador;

import Modelo.CLibro;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "SprintDeweyBarra", urlPatterns = {"/SprintDeweyBarra"})
public class SprintDeweyBarra extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try 
        {
            
            String isbn=request.getParameter("isbn_libro");
            String cod_barra=request.getParameter("bar_code");
            
            HttpSession printDewey=request.getSession(true);
            CLibro libro=new CLibro();            
            ArrayList<Object[]> printDatos=new ArrayList<>();            
            List<Object[]> registro=null;    
            
            if (printDewey.getAttribute("Dewey_barrra")!=null) //Determinando si hay datos en la session
            {
                printDatos=(ArrayList<Object[]>)printDewey.getAttribute("Dewey_barrra");
                
                printDewey.removeAttribute("Dewey_barrra");//eliminando datos anteriores//recien modificado
                //veerificando q el dato no se repita
                if (this.bandera(printDatos, isbn)==false) 
                {
                    if (!isbn.equals("")) 
                    {
                      registro=libro.Lista_printDewey_Barra(isbn);     //agregando el libro para genera el codigo de barra
                    }                       
                                               
                }
                
            }
            else
            {
                if (!isbn.equals("")) 
                    {
                        registro=libro.Lista_printDewey_Barra(isbn);
                       
                    }
           
            }
          //cancelado codigo de barra del libro actaual
            if (!cod_barra.equals("") ) 
            {
                for (int i = 0; i < printDatos.size(); i++) 
                {
                    if (printDatos.get(i)[0].toString().equals(cod_barra)) 
                    {
                        printDatos.remove(i);//eleminando elemento
                        
                    }
                    
                }
                
                
            }
 
                 
            
         //listando todo los libros que seran imprimidos    
            if (registro!=null && registro.size()>0) 
            {
                for (Object[] objects : registro) 
                {
                 printDatos.add(objects);
                }
                
                printDewey.setAttribute("Dewey_barrra", printDatos );
//                for (Object[] reg_libro : printDatos) 
//                {                   
//   
//                   out.println("<tr>");                
//                   out.println("<td>"+reg_libro[0] .toString()+"</td>");                 
//                   out.println("<td>"+reg_libro [2].toString()+"</td>");
//                   out.println("<td>"+reg_libro [8].toString()+"</td>");
//                   out.println("<td>"+reg_libro [1].toString()+"</td>");                 
//                   out.print("<td><a href='#' onclick=\"Anular_Libro('"+reg_libro [1].toString()+"')\"> Eliminar</a></td>");
//                   out.println("</tr>"); 
//                    
//                }
                
                for (int i =(printDatos.size()-1); i>=0; i--) 
                {
                    Object[] reg_libro =printDatos.get(i);
                    out.println("<tr>");                
                     out.println("<td>"+reg_libro[0] .toString()+"</td>");                 
                     out.println("<td>"+reg_libro [2].toString()+"</td>");
                     out.println("<td>"+reg_libro [8].toString()+"</td>");
                     out.println("<td>"+reg_libro [1].toString()+"</td>");                 
                     out.print("<td><a href='#' onclick=\"Anular_Libro('"+reg_libro [0].toString()+"')\"> Eliminar</a></td>");
                    out.println("</tr>"); 
                    
                }
                
                
                
            }
            else
            {
                
//             for (Object[] reg_libro : printDatos) 
//                {
//                    
//   
//                   out.println("<tr>");                
//                   out.println("<td>"+reg_libro[0] .toString()+"</td>");                 
//                   out.println("<td>"+reg_libro [2].toString()+"</td>");
//                   out.println("<td>"+reg_libro [8].toString()+"</td>");
//                   out.println("<td>"+reg_libro [1].toString()+"</td>");
//                   String temp="'"+reg_libro [0].toString()+"'";
//                   out.print("<td><a href='#'   onclick=\"Anular_Libro('"+reg_libro [0].toString()+"')\"> Eliminar</a></td>");
//                  
//     
//     
//                   out.println("</tr>"); 
//                    
//                }
                
                for (int i =( printDatos.size()-1); i>=0; i--) 
                {
                    Object[] reg_libro=printDatos.get(i);
                    out.println("<tr>");                
                     out.println("<td>"+reg_libro[0] .toString()+"</td>");                 
                     out.println("<td>"+reg_libro [2].toString()+"</td>");
                     out.println("<td>"+reg_libro [8].toString()+"</td>");
                     out.println("<td>"+reg_libro [1].toString()+"</td>");                 
                     out.print("<td><a href='#' onclick=\"Anular_Libro('"+reg_libro [0].toString()+"')\"> Eliminar</a></td>");
                    out.println("</tr>"); 
                    
                }
                
                printDewey.setAttribute("Dewey_barrra", printDatos );//manteniendo la sesion de etiquetas
            
            }
        
                    
             
            
            
           
           
        }
        catch(Exception ex)
        {
            out.print("Error!"+ex.getMessage()+":"+ex.getCause());
        }
        finally {
           // this.destroy();  este inpide q solo un hilo se ejecute 
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

    protected boolean bandera(List<Object[]> lista,String isbn)
    {
        
        for (Object[] registro : lista) 
        {
            if (registro[1].toString().equals(isbn)) 
            {
              return true;    
            }
            
        }
 
    
    return false;
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
