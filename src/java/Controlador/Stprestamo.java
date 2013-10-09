/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.CPrestamoLibro;
import Modelo.CUsuario;
import Modelo.Ctemp_pedido;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "Stprestamo", urlPatterns = {"/Stprestamo"})
public class Stprestamo extends HttpServlet {

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
            
            HttpSession htpbibliotecario=request.getSession(true);//creando session pra determinar el bibliotecario
                    
            Object[]bibliotecario=(Object[]) htpbibliotecario.getAttribute("USER");
            
            int opcion=Integer.parseInt(request.getParameter("option"));
            
            
                Ctemp_pedido temp;
                CPrestamoLibro prestamo;
                
            switch(opcion)
            {
                case 0://parac cacelara el prestamo
                       BigDecimal codigousuario=new BigDecimal(request.getParameter("codigousuario"));
                       temp=new Ctemp_pedido();
                       
                       temp.setCodigo(codigousuario);                       
                       boolean bandera=temp.DeleteRegistro();
                       if (bandera) 
                         {
                          out.print("se ha cancelado el prestamo");
                         }
                       else
                         {
                             out.print("No es posible eliminar");
                         }                                                    
                                              
                    
                      break;
                    
                case 1:
                       CUsuario usereapiis=new CUsuario();
                               
                       BigDecimal cod_user=new BigDecimal(request.getParameter("codigo_user"));
                       String codbarra=request.getParameter("codbarra_libro");
                       String fecha_prestamo=request.getParameter("fechaPrstmo");                       
                       usereapiis.setCod_user(cod_user);//para validara que el usuario sea difrente de egresados
                       
                       int tipo_user=usereapiis.tipo_user();
                       
                       String codigo_bibliotecario=bibliotecario[3].toString();
                       boolean blugar=Boolean.parseBoolean(request.getParameter("lgPrestamo"));
                        
                       int  clugar;
                        if (blugar) 
                        {
                           clugar=1;
                        }
                        else
                        {
                            
                            clugar=0;
                        }
                       
                         prestamo=new CPrestamoLibro(cod_user, codbarra, clugar, fecha_prestamo, codigo_bibliotecario);
                        
                         switch(tipo_user)
                         {
                             case 1:
                                    boolean confirmar_prestamo=prestamo.InsertRegisto();
                                    
                                    if (confirmar_prestamo) 
                                    {
                                         out.print("PROCESO CORRECTAMENTE COMPLETADO!...");
                                    }
                                    else
                                    {
                        
                                        out.print("PROCESO NO SE HA COMPLETADO!...PROCESO FALLADO");
                                    }            
                                 break;
                             case 2:
                                    boolean confirmar_prestamo1=prestamo.InsertRegisto();
                                    if (confirmar_prestamo1) 
                                    {
                                         out.print("PROCESO CORRECTAMENTE COMPLETADO!...");
                                    }
                                    else
                                    {                        
                                        out.print("PROCESO NO SE HA COMPLETADO!...PROCESO FALLADO");
                                    }
                                 
                                 break;
                             case 3:
                                    prestamo.setLugar_prestamo(0);
                                    boolean confirmar_prestamo2=prestamo.InsertRegisto();
                                    
                                    
                                    if (confirmar_prestamo2) 
                                    {
                                         out.print("PROCESO COMPLETADO!...\n PRESTAMO VÁLIDO SOLO PARA SALA..\n USUARIO EGRESADO");
                                    }
                                    else
                                    {                        
                                        out.print("PROCESO NO SE HA COMPLETADO!...PROCESO FALLADO");
                                    }
                                 
                                 break;
                             default:
                                 
                                      out.print("PROCESO NO SE HA COMPLETADO!.\n NO EXISTE TIPO DE USUARIO ");
                                 break;
                         
                         
                         }
                         
                        
                        
                      //out.print(cod_user+":"+codbarra+":"+fecha_prestamo+":"+tipo_user+":"+codigo_bibliotecario+":"+clugar);
                       
                    
                    break;
                case 2: //caso para consultar la devolucion del libro
                         
                       String barcode_dev=request.getParameter("txtCodigo");
                        String fecha_actual=request.getParameter("fecha_actual");                        
                        prestamo=new CPrestamoLibro();                        
                        Object[]reg_detalleprestamo=prestamo.ViewPrestamo(barcode_dev, fecha_actual);
                        
                        String observacion="";
                        String lugar_pres="";
                        if (reg_detalleprestamo==null) 
                         {
                         out.print("<h2 style=\"color: #9f1a04\">USUARIO INCORRECTO...NO ES EL USUARIO</h2>");
                         }
                        else
                        { 
                       // out.print("ejecusion correcta hasta el momeno->"+reg_detalleprestamo[2].toString());
                        boolean blugarprstamo=Boolean.parseBoolean(reg_detalleprestamo[1].toString());
                        if (!blugarprstamo) 
                        {
                            lugar_pres="Sala";
                            int horas=Integer.parseInt(reg_detalleprestamo[4].toString());
                            if(horas<=5)
                            {
                              observacion="";
                            }
                            else
                            {
                              observacion=" El usuario ha exedido el tiempo limite";
                            }
                            
                        
                        }
                        else
                        {
                              lugar_pres="Domicilio";
                              int horas=Integer.parseInt(reg_detalleprestamo[4].toString());
                              if (horas<=18) 
                              {
                                observacion="Ningun inconveniente";
                              }
                              else
                              {
                                  
                                  if (reg_detalleprestamo[4].toString().equals("Friday"))//fecha de prestamo es viernes  
                                  {
                                     if (horas<=65) 
                                      {
                                      observacion="Ningun inconveniente";
                                      
                                      }  
                                     else
                                     {
                                        observacion="El usario no ha devuelto a tiempo...Aplique el reglamento";
                                     }
                                             
                                      
                                  }
                                  else
                                  {
                                      observacion="El usario no ha devuelto a tiempo...Aplique el reglamento";
                                  }
                                
                              }
                        
                        }
                        
                        
                        //impriminedo el formulario
                        
                     out.print("<table border='1'>");    
                          out.print("<thead><tr><th></th><th></th></tr></thead>");
                           out.print("<tbody>");
                                      
                                out.print("<tr><td>Pretamo Nro:</td><td>"+reg_detalleprestamo[0].toString()+"</td></tr>");
                                out.print("<tr><td>Usuario</td><td>"+reg_detalleprestamo[6].toString()+"</td></tr>");
                                out.print("<tr><td>Libro</td><td>"+reg_detalleprestamo[5].toString()+"</td></tr>");
                                out.print("<tr><td>Fecha Prestamo</td><td>"+reg_detalleprestamo[2].toString()+"("+reg_detalleprestamo[3].toString()+")</td></tr>");
                                out.print("<tr><td>Fecha Actual</td><td>"+fecha_actual+"</td></tr>");
                                out.print("<tr><td>Prestamo a</td><td>"+lugar_pres+"</td></tr>");
                                out.print("<tr><td> Nro de Horas</td><td>"+reg_detalleprestamo[4].toString()+"</td></tr>");
                                out.print("<tr><td>Observacion</td><td>"+observacion+"</td></tr>");
                                out.print("<tr><td><input type='button' value='Guardar Devolucion' name='bntValidar' onclick=\"ConfirmDevolucion('"+reg_detalleprestamo[0].toString()+"')\" /></td><td><input type='button' value='Observar Usuario' name='bntBloquear' id='obsUsuario' /></td></tr>");
             
                           out.print("</tbody>");
                      out.print("</table>");
                        
                        }   
                        
                        
                        
                        
                      
                         
                    break;
                    
                case 3:
                        String barcode=request.getParameter("barraCode");
                        String fecha_devuelto=request.getParameter("fecha_devuelto");
                        
                        prestamo=new CPrestamoLibro();
                        prestamo.setCodigo_barra(barcode);
                        
                        boolean bdevuelto=prestamo.DevueltoLibro(fecha_devuelto);
                        
                        if (bdevuelto) 
                        {
                         out.print("PROCESO DE DEVOLUCION CORRECTO!");
                        }
                        else
                        {
                         out.print("PROCESO DE DEVOLUCION NO SE HA COMPLETADO!");
                        }
                        
                      //out.print(prestamo.getCodigo_barra()+":"+fecha_devuelto);
                                
                                
                       
                    break;
                 
                default: out.print("Opcion Incorrecta!..");
            }
            
            
        }
        catch(Exception ex  )
        {
          out.print("Ha ocurrido un error->"+ex.getMessage());
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
