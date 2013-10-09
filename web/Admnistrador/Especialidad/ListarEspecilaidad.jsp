<%-- 
    Document   : ListarEspecilaidad
    Created on : 07-jun-2013, 15:38:28
    Author     : 2012
--%>

<%@page import="java.util.List"%>
<%@page import="Modelo.CEspLibro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
try 
        {
          
          CEspLibro especialidad=new CEspLibro();
          List<Object[]> lstEspecialidad=null;          
          String codigo=request.getParameter("codigo");
          
            if (codigo==null) 
            {
             
             
             lstEspecialidad=especialidad.SelectEspecialidad();    
            
          
              for (Object[] objects : lstEspecialidad) 
               {
                   
                       
  %>
               <tr>                        
                   <td><% out.print( objects[1].toString()); %></td>
                   <td><% out.print( objects[2].toString()); %></td>                
                   <td><img src='../Imagenes/sql/editar.png' onclick='Editar_esp(<% out.print( objects[0].toString()); %>)'/></td>")
                   <td><img src='../Imagenes/sql/eliminar.jpg' onclick='Eliminar_esp(<% out.print( objects[0].toString()); %>)' />
                   <td><a href="#" onclick="nuevoEspecialidad()" id="llamarNuevoEspecialidad">Nuevo Especialidad</a></td>
          
  <%
                      
                                
              }
         
           }
          else
          {
             int id_especialidad=Integer.parseInt(codigo) ;
             
             
               Object[]reg_especialidad=especialidad.BuscarEspecialidad(id_especialidad);
                            
                out.print("<input type='hidden' name='txtCod' value='"+reg_especialidad[0].toString()+"'/><p></p>"); 
                out.print("Nombre Especialidad:<input type='text' name='txtNombre_esp' value='"+reg_especialidad[1].toString()+"' /><p></p>");
                out.print("Descripcion:<textarea name='txaDscpesp' >"+reg_especialidad[2].toString()+"</textarea><p></p>");
                  
                out.print("<input type='button' value='Guardar' onclick='GuardarEditado()' />!!<input type='button' value='Cancelar' onclick='CancelarEditado()' />");
                
            
          }
                
          
         }
           
        catch(Exception ex)
        {
          out.print(ex.getMessage());
          
        }
        finally {   
             
            out.close();
        }
%>