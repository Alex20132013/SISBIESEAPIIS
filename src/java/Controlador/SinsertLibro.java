/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CLibro;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author 2012
 */
@WebServlet(name = "SinsertLibro", urlPatterns = {"/SinsertLibro"})
public class SinsertLibro extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
    
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {                
                
                String isb_libro=request.getParameter("isbnLibro");    
                String titulo_libro=request.getParameter("titloLibro");
                int esp_libro=Integer.parseInt(request.getParameter("selComboEsp"));
                int edit_libro=Integer.parseInt(request.getParameter("selComboEtrial"));
                String edicion=request.getParameter("edcnLibro"); 
                String cod_dewey=request.getParameter("codDewey");
                String not_malga=request.getParameter("txtNotacion").toUpperCase();
                int    stock=Integer.parseInt(request.getParameter("totlLibro"));    
                String indce_libro="/Localhost";
                int anio_public=Integer.parseInt( request.getParameter("txtAnPublic"));
                String vol_tomo= request.getParameter("txtTomoVol").toUpperCase();
                int    nro_pag=Integer.parseInt( request.getParameter("NroPag"));
                BigDecimal  precio=new BigDecimal(request.getParameter("prcLibro"));
                String descrip= request.getParameter("txtDescp");
                int cod_admin=89215;
     
                CLibro libro=new CLibro(isb_libro, titulo_libro, esp_libro, edit_libro, edicion, cod_dewey, not_malga, stock, indce_libro, anio_public, vol_tomo, nro_pag, precio, descrip, cod_admin);
                
                boolean indicador=false;   //bandera para validar si el librto a registrar tiene autores
                HttpSession  autor_libro=request.getSession(true);
                List<Object[]> autores=null;
   
                if(autor_libro.getAttribute("datos")!=null)
                 {
                   autores=(ArrayList<Object[]>)autor_libro.getAttribute("datos");
                   indicador=(autores.size()>0);//SI hay algun autor     
                 }
   
                 if(indicador==true)
                 {       
             
                      boolean bandera=libro.InsertRegisto();//registrando el nuevo libro

                      for(int i=0;i<autores.size();i++)//insertando auntores
                      {

                           Object[] registro=autores.get(i);       
                           int idautor=Integer.parseInt(registro[0].toString()) ;
                           String isbnlibro=registro[1].toString();
                           int banderin=libro.Agregar_autor(isbnlibro, idautor);//insertando en la tabla autor_libro

                             if(banderin!=1)
                             {                         
                               break;
                             }      


                        }
                         autor_libro.removeValue("datos");// eliminado el almacenamiento  autores;
                         out.print(" <script type='text/javascript'>");
                         out.print("alert('insercion correcta');");
                         out.print("$('#frmDtsLbro')[0].reset();");

                         out.print("$('#Autor').hide();");
                         out.print("</script>");
                         out.print("se ha registrado correctamente:"+titulo_libro+":"+nro_pag+":"+precio+":"+anio_public+":"+descrip+":"+vol_tomo );//  

                 }
            else
           {
    // out.print("no se ha registrado...el libro no tiene auto(res)");
   
                     out.print(" <script type='text/javascript'>");
                      out.print("alert('no se ha registrado...el libro no tiene auto(res)');");
                      out.print("$('#frmDtsLbro')[0].reset();");
       //out.print("$('#frmDtsLbro').hide()");
                       out.print("$('#Autor').hide();");
                      out.print("</script>");
           }    
   
   
  
   
 }
catch(Exception ex)
{
  
   //out.print("existe error!:"+ex.getMessage());
    // HttpSession  autor_libro=request.getSession(true);
    request.removeAttribute("datos");//sesion de autores
   //out.print("existe error!:"+ex.getMessage());
   String[] errores=ex.getMessage().split(" "); 
  if(errores[0].equals("Duplicate")  )
    {
     out.print(" <script type='text/javascript'>");
       
       out.print("$('#frmDtsLbro').hide();");
       //out.print("$('#frmDtsLbro').hide()");
       out.print("$('#Autor').hide();");
     out.print("</script>");  
        
      out.print(" <h1>El Libro ya existe</h1>");
      out.print(" <input type='button' name='btnAceptar' value='Agregar' onclick='VerlibroExiste("+request.getParameter("isbnLibro")+",1)' />||<input type='button' name='btnAceptar' value='Cancelar' value='Cancelar' onclick='VerlibroExiste(0,2)' />");
          
      
  
    }
  else
  {
   out.print("Retorno:"+ex.getMessage());
  
  }
   
} 
finally 
{            
  out.close();
 // this.destroy();
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
