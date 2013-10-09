/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Ctemp_pedido;
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
@WebServlet(name = "svlValidar", urlPatterns = {"/svlValidar"})
public class svlValidar extends HttpServlet {

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
//            /*
//             * TODO output your page here. You may use following sample code.
//             */
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet svlValidar</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("tu correo es:" + request.getParameter("txtCorreo")+ "<br/>");
//            out.println("tu correo es:" + request.getParameter("txtPaswd") + "<br/>");
//            
//            
//           // CLibro lib =new  CLibro("1212", "essp1", "las ecuaciones difren", "02151245", "edit 2009", "disponible", "www.libro.com", "perfectas condiciones");
//            
//            //out.println("<li>tu libros es:"+lib.getTitulo_libro()+" edicion:"+lib.getEdit_libro()+"</li>");
//          //  response.sendRedirect("index.jsp"); 
//            
//            out.println("</body>");
//            out.println("</html>");
//            out.print("<% %>");
            Ctemp_pedido listapedidos=new Ctemp_pedido();
            
            List<Object[]> listaPedidos=listapedidos.SelectDatos();
            
            for (int i = 0; i < listaPedidos.size(); i++) 
            {
                Object[] objects = listaPedidos.get(i);
                out.print("dato:"+objects[0].toString());
                out.print("dato:"+objects[1].toString());
                out.print("dato:"+objects[2].toString());
                out.print("<br/>");
                
            }
            
            
            
           
        }
        catch(Exception ex)
        {
         out.print(ex.getMessage());
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
