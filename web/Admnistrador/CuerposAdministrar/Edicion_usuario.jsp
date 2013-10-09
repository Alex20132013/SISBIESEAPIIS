<%@page import="java.math.BigDecimal"%>
<%@page import="Modelo.CTipo_user"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.CUsuario"%>
<%
CUsuario users=new CUsuario();
String codigo=request.getParameter("codigo");
BigDecimal cod_user=new BigDecimal(codigo);
Object[] usuario=users.editar_user(cod_user);
CTipo_user tpuser=new CTipo_user();
List<Object[]> tipo_usuario=tpuser.Select_tipoUser(); 
%>
<form class="contact_form" action="#" method="post" name="contact_form" >
                 <ul>  
                    <li>
                         <h2>Registro Usuario EAPIIS</h2>
                         <span class="required_notification">* Datos Requeridos</span>
                    </li>
                    <li>
                        <label for="name">Codigo Usuario:</label>
                        <% out.print( "<input type='number'  value='"+usuario[0].toString()+"' title='Código Usuario Eapiis. Solo Numerco:' pattern='[0-9]{3,12}' required />"); %>
                        <span class="form_hint">"Codigo Usuario"</span>
                    </li>
                    <li>
                        <label for="name">Nombre:</label>
                        <% out.print("<input type='text' value='"+usuario[1].toString() +"' placeholder='John' title='Nombre Usuario solo Caracteres >3' pattern='[A-Za-z ñÑáéíóúüç]{3,30}' required />"); %>
                        <span class="form_hint">"Ingrese solo Letras>3 dígitos"</span>
                    </li>
                    <li>
                        <label for="name">Apellidos:</label>
                        <%out.print("<input type='text' value='"+usuario[2].toString()+"'placeholder='John' title='Apellidos Usuario solo Caracteres >3' pattern='[A-Za-z ñÑáéíóúüç]{3,30}' required />"); %>
                        <span class="form_hint">"Ingrese solo Letras>3 dígitos"</span>
                    </li>
                    <li>
                        <label for="name">Tipo usuario</label>
                        <select name="cbxtipo_user">
                            <%
                              for(int i=0;i<tipo_usuario.size();i++)
                                 {
                                   
                                   
                                   if(tipo_usuario.get(i)[0].equals(usuario[3]))
                                     {
                            
                                      out.print("<option value='"+tipo_usuario.get(i)[0].toString()+"' selected>"+tipo_usuario.get(i)[1].toString()+"</option>");                          
                                    }
                                  else
                                          
                                    {                                    
                                  
                           
                                 out.print("<option value='"+tipo_usuario.get(i)[0].toString()+"' >"+tipo_usuario.get(i)[1].toString()+"</option>");
                            
                                   }
                                 }

                            
                            %>
                            
                        </select>
                        
                    </li>
                    
                    <li>
                        <label for="name">Direccion:</label>
                       <% out.print(" <input type='text' value='"+usuario[4].toString()+"'  required />"); %>
                        <span class="form_hint">"Ingrese solo letras"</span>
                    </li>
                    <li>
                        <label for="email">Correo:</label>
                        <% out.print("<input type='email' name='correo' value='"+usuario[5].toString()+"' placeholder='john_doe@example.com' required />");  %>
                        <span class="form_hint">"Forma de ingresar "nombre@ejemplo.com"</span>
                    </li>
                    <!--<li>
                        <label for="name">Estado User:</label>
                         
                       <% out.print("<input type='checkbox' checked='"+usuario[6].toString()+"'/>"); %>
                         
                        
                        <span class="form_hint">"Habilite o deshabilite "</span>;
                    </li>-->
                    <li>
                        <label for="name">Contraseña:</label>
                        <input type="password"    pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required  disabled="false"/>
                        <input type="checkbox" name="hab_pass" id="hbPass" onclick="verchebox(this)" value="off"   /><label>Cambiar</label>
                        <span class="form_hint">Ingrese Nueva Contrseña</span>;
                    </li>
                   <!-- <li>
                        <label for="name">Repita Contraseña:</label>
                        <input type="password"  pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required />
                        <span class="form_hint">La Contraseña al menos debe contener una letra mayúscula y un Número"</span>;
                    </li>
                    <li>
                        <label for="name">Huella digital:</label>
                        <% out.print("<input type='text' value='"+usuario[7].toString() +"' />"); %>
                        <span class="form_hint">"Huella Digital"</span>
                    </li>-->
                    <li>
                        <label for="name">Fla fecha de registroecha de regidtro:</label>
                        <% out.print("<input type='date' value='"+usuario[8].toString()+"'/>"); %>
                        <span class="form_hint">"Es "</span>
                    </li>
                    <li>
                        <button  class="submit" type="submit">Agregar Nuevo</button>
                        <button  class="submit" type="reset">Restablecer</button>
                    </li>
                </ul>
            <button onmousedown="llamadaoverlay()">Cerar</button> 
 </form>