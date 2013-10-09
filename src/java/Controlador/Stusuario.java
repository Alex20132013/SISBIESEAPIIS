
package Controlador;

import Modelo.CTipo_user;
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
@WebServlet(name = "Stusuario", urlPatterns = {"/Stusuario"})
public class Stusuario extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            int option=Integer.parseInt(request.getParameter("option"));
            CUsuario usuario;
            switch(option)
            {
                case 0:break;
                    
                case 1:
                       usuario=new CUsuario(); 
                        int codigo=Integer.parseInt(request.getParameter("codigo"));//opteniendo codigo de usuario
                        boolean bandera=Boolean.parseBoolean(request.getParameter("estado"));//recuperando el estado actual del usuario
                        
                        boolean estado=usuario.HalitarUser(codigo, bandera);//ejecutado la operacion segun al estado usuario                        
                        
                        
                        if (bandera && estado) 
                                    {
                                        
                                      out.print("Habilitado <input type='checkbox' name='cbxEstado' value='"+bandera+"' onclick='Habilitar(this,"+codigo+")' checked /></td>");
                                    }
                        else
                                    {
                                      out.print(" Inhabilitado<input type='checkbox' name='cbxEstado' value='"+bandera +"' onclick='Habilitar(this,"+codigo+")'/></td>");    
                                    }
                    break;
                case 2://caso para listar todo los usuarios de la bilioteca
                        usuario=new CUsuario();
                        List<Object[]> lstUsuarios=usuario.SelectDatos();
                        
                        for (Object[] lsUser : lstUsuarios) 
                        {
                         out.print("<tr>");
                                  out.print("<td>"+lsUser[0].toString()+"</td>");
                                  out.print("<td>"+lsUser[1].toString()+"</td>");
                                  out.print("<td>"+lsUser[2].toString()+"</td>");
                                  out.print("<td>"+lsUser[3].toString()+"</td>");
                                  out.print("<td>"+lsUser[4].toString()+"</td>");
                                  out.print("<td>"+lsUser[5].toString()+"</td>");
                         out.print("</tr>");
                        }
                        
                    
                       break;
                case 3:
                       
                    
                        BigDecimal codigo_user=new BigDecimal(request.getParameter("codigo"));
                        usuario=new CUsuario();                       
                        
                        Object[]usuario_select=usuario.editar_user(codigo_user);
                        
                        out.print("<ul>");
                        out.print("<li>");
                        out.print("<label for='Id_tipoUsuario'>Huella Digital:</label>");
                        if (usuario_select[7]!=null) 
                        {
                          out.print("<input type='text' id='HuellaDigital' placeholder='00010101010' value='"+usuario_select[7].toString()+"' required />");
                        }
                        else
                        {
                            out.print("<input type='text' id='HuellaDigital' placeholder='00010101010' required />");
                        
                        }
                        
                        out.print("</li>");
                        
                        out.print("<li>"); 
                          
                        boolean estadouser=Boolean.valueOf(usuario_select[6].toString());
                        if (estadouser) 
                        {
                         out.print("<label for='name' id='lbEstadoUser' style=\"color: #04acec\">Usuario:Habilitado</label>");   
                         out.print("<input type='checkbox' id='cbxEstuser' name='cbxEstadoUser' value='ON' checked='checked' onclick=\"ActivarEstado(this)\" />");
                          
                        }
                        else
                        {
                         out.print("<label for='name' id='lbEstadoUser' style=\"color: #ff3366\">Usuario:Inhabilitado</label>");
                         out.print("<input type='checkbox' id='cbxEstuser' name='cbxEstadoUser' value='OFF' onclick=\"ActivarEstado(this)\"  />");
                        
                        }
                        
                        
                        out.print("</li>");
                        
                        out.print("<li>"); 
                        out.print("<label for='name'>Habilitar Edición de Datos</label>");                         
                        out.print("<input type='checkbox'  id='checkUser'>");
                        out.print("</li>"); 
                         
                        out.print("<li>");
                        out.print("<label for='NombreUsuario'>Nombre Usuario:</label>");
                        out.print("<input type='text' id='idNombre' name='NombreUsuario' value='"+usuario_select[1].toString()+"'   pattern='|^[a-zA-Z Ã±ÃÃ¡Ã©Ã­Ã³ÃºÃ¼Ã§]*$|'    required onFocus='controlT(this, 0)'/>");
                        out.print("</li>");
                        
                        out.print("<li>");
                        out.print("<label for='ApellidoUsuario'>Apellido Usuario:</label>");
                        out.print("<input type='text' id='idApellido' name='ApellidoUsuario' value='"+usuario_select[2].toString()+"'  maxlength='60' required onFocus='controlT(this, 0)'/>");
                        out.print("</li>");
                        
                        
                        
                        out.print("<li>");
                        out.print("<label for='Email'>Correo Electonico:</label>");
                        out.print("<input type='email' id='Emailuser' placeholder='Eapiis@unamba.com' value='"+usuario_select[5].toString()+"' title='Su Correo debe contener  dÃ­gitos,letras,@ y .:' required onFocus='controlT(this, 0)'/>");
                        out.print("<span class='form_hint'>Ingrese su Correo Electronico Ejm: 'Eapiis@unamba.com'</span>");
                        out.print("</li>");
                        
                         out.print("<button class='submit' type='submit' id='bEnviar' onsubmit='return Submite();'>Guardar Edición</button>");
                        
                        
                        
                        
                    
                    
                       break;
                       case 4:
                             BigDecimal codigo_user1=new BigDecimal(request.getParameter("codigo"));
                             String nombre=request.getParameter("nombre");
                             String apellidos=request.getParameter("apellidos");
                             String correo=request.getParameter("correo");
                             String hdigital=request.getParameter("huella_digital");
                             String opestado=request.getParameter("estado");
                             boolean bandera_estado=false;
                             
                             if (opestado.equals("ON")) 
                             {
                               bandera_estado=true;
                           
                             }                
                             usuario=new CUsuario();
                             boolean respuesta_user=usuario.Habitado_userRegistrado(codigo_user1, hdigital, nombre, apellidos, correo, bandera_estado);
                             
                             if (respuesta_user) 
                             {
                               out.print("Operación exitos");
                             }
                             else
                             {
                              out.print("Operación no se ha guardado");
                             }
                           //  out.print(codigo_user1+"-"+nombre+"-"+apellidos+"-"+correo+"-"+hdigital+"-"+opestado);
                        break;
                           
                       case 5:
                              usuario=new CUsuario();
                              BigDecimal codigo_userSelect=new BigDecimal(request.getParameter("codigo"));
                              String correo_user=request.getParameter("correo");
                              String password_user=request.getParameter("password");
                              
                              usuario.setCod_user(codigo_userSelect);
                              usuario.setCorreo(correo_user);
                              usuario.setPaswd(password_user);
                              
                              boolean respuesta_validacion=usuario.Validar_Edicion_datos();
                              
                              if (respuesta_validacion) 
                              {
                                  out.print("<button class='submit' type='submit' id='bEnviar' onclick=''>Actualizar</button>");
                                  out.print("<button class='reset' type='reset'>Limpiar el Formulario</button>");
                                  
                              }
                              else
                              {
                                  out.print("<label style=\"background-color: #9f1a04\">Password ó correo son Incorrectos</label>");
                                 
                              }
                              
                           
                        break;
                           
                       case 6:                         
                              
                              BigDecimal codigo_userupdate=new BigDecimal(request.getParameter("codigo"));
                              String nombre_update=request.getParameter("nombre");
                              String apellido_user=request.getParameter("apellidos");
                              int tipo_user=Integer.parseInt(request.getParameter("tipo_user"));
                              String correo_update=request.getParameter("correo");
                              String password_update=request.getParameter("password");
                              String direcion_update=request.getParameter("direccion");
                              usuario=new CUsuario(codigo_userupdate, tipo_user, nombre_update, apellido_user,direcion_update,correo_update, password_update);
                                                   
                              
                              boolean respuesta_update=usuario.UpdateRegistro();
                              
                              if (respuesta_update) 
                              {
                                  out.print("Se ha actualizado correctamente..\n...se ha envado a su correo su password");
                                  
                                  
                              }
                              else
                              {
                                  out.print("Actualización no se ha terminado...Error!");
                                 
                              }
                              
                              //out.print(codigo_userupdate+":"+nombre_update+":"+apellido_user+":"+direcion_update+":"+correo_update+":"+password_update+":"+tipo_user);
                              
                           
                        break;
                           
                       case 7:                      
                    
                         BigDecimal codigo_useredit=new BigDecimal(request.getParameter("codigo"));
                         usuario=new CUsuario();                       
                        
                         Object[]usuario_select_edit=usuario.editar_user(codigo_useredit);
                           if (usuario_select_edit!=null) 
                           {
                                 CTipo_user tipo_usuario=new CTipo_user();
                                 ArrayList<Object[]> list_tipo=tipo_usuario.Select_tipoUser();                          
                               
                               out.print("<li>");
                                    out.print("<label for='Id_tipoUsuario'> Tipo Usuario:</label>");
                                    out.print("<select id='Id_Titpousuario' placeholder='123432221' title='Se necesita Id_Tipo Usu..'     >");
                                     for (int i = 0; i < list_tipo.size(); i++) 
                                     {
                                         if (list_tipo.get(i)[0].equals(usuario_select_edit[9])) 
                                         {
                                           out.print("<option value='"+list_tipo.get(i)[0].toString() +"' selected>"+list_tipo.get(i)[1].toString()+"</option>");
                                             
                                         }
                                         else
                                         {
                                           out.print("<option value='"+list_tipo.get(i)[0].toString() +"'>"+list_tipo.get(i)[1].toString()+"</option>");
                                     
                                         }
                                       }
                                    out.print("</select>");
                                 out.print("</li>");
                                 
                                 out.print("<li>");  
                                    out.print("<label for='NombreUsuario'>Nombre Usuario:</label>");
                                    out.print("<input type='text' id='idNombre' autocomplete='false' value='"+usuario_select_edit[1].toString()+"'  onclass='campo' placeholder='Juan' title='El nombre debe estar formado únicamente por letras:' pattern='|^[a-zA-Z ñÑáéíóúüç]*$|'  required />");
                                 out.print("</li>");
                        
                                 out.print("<li>");
                                    out.print("<label for='Apellidos'>Apellido Usuario:</label>");
                                    out.print("<input type='text' id='idApellido' value='"+usuario_select_edit[2].toString()+"' autocomplete='false' class='campo' placeholder='Ancco Arias' title='El Apellido debe estar formado únicamente por letras:' pattern='|^[a-zA-Z ñÑáéíóúüç]*$|' maxlength='60' required />");
                                 out.print("</li>");
                        
                                 out.print("<li>");                       
                                    out.print("<label for='Direcion'>Direcion:</label>");
                                    out.print("<input type='text' id='idDireccion' value='"+usuario_select_edit[4].toString()+"' placeholder='Jr. Lima N°123' autocomplete='false' title='La dirección debe conetener únicamente dígitos y letras:'   />");
                                    out.print("<span class='form_hint'>Ingrese su Direccion Ejm: 'Jr. Lima N°123'</span>");
                                 out.print("</li>");
                        
                                 out.print("<li>"); 
                                    out.print("<label for='Email'>Correo Electronico:</label>");
                                    out.print("<input type='email' id='idCorreo' value='"+usuario_select_edit[5].toString()+"' autocomplete='false' placeholder='Eapiis@unamba.com' title='Su Correo debe contener  dígitos,letras,@ y .:' required />");
                                    out.print("<span class='form_hint'>Ingrese su Correo Electronico Ejm: 'Eapiis@unamba.com'</span>");
                                 out.print("</li>"); 
                         
                                 out.print("<li id='idPassword'>");
                                    out.print("<label for='password'>Contraseña Anterior:</label>");
                                    out.print("<input type='password' id='idpwdusuario' autocomplete='false' placeholder='*******'  title='Ingrese una Contraseña con Seguridad al menos una letra mayúscula y un Número Ejem:'Mario123''  onchange='Verificar_Validez(this)' />");
                                    out.print("<span class='form_hint'>La Contraseña al menos debe contener una letra mayúscula y un Número</span>");
                                out.print("</li>");
                        
                                out.print("<li>");
                                    out.print("<label for='repassword' >Nueva Contraseña:</label>");
                                    out.print("<input type='password' autocomplete='false' id='idNuevo_pw' placeholder='*******'  title='Ingrese una Contraseña con Seguridad al menos una letra mayúscula y un Número Ejem:Mario123'  />");
                 
                                out.print("</li>");
                        
                            // out.print("Hola mundo:"+list_tipo.size());                        
                        
                                
                           }
                         else
                           {
                           
                           out.print("no existe usuario");
                           }
                        
                        
                        
                    
                    
                       break;
                           
                 case 8:
                      usuario=new CUsuario();
                      BigDecimal codigo_userdel=new BigDecimal(request.getParameter("codigo"));
                      usuario.setCod_user(codigo_userdel);
                       if (usuario.DeleteRegistro()) 
                       {
                         out.print("Operacion exitosa!..:)");
                       }
                     else
                       {
                       out.print("No se ha elminado el usuario!..:(");
                       
                       }
                           
                            
            default:
                    out.print("Operación no completado");
                    break;
            }
            
        } 
        catch(Exception ex)
        {
            out.print("Erro!->"+ex.getMessage());
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
