<%@page import="Modelo.CUsuario"%>
<%@page import="Modelo.Ctemp_pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
<%@page import="Modelo.CEspLibro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>

 <table cellpadding="0" cellspacing="0" border="0" class="display" id="dtVisualizar" >
        
                 <thead>
                    <tr>
                            <th>Codigo</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>                            
                            <th>Correo electronico</th>                           
                            <th>Estado</th>                            
                            <th></th>
                            <th></th>
                            <th></th>
                    </tr>
                  </thead>
     

<%      
   
   CUsuario   usuarios=new CUsuario();
     
   try
   {
    List<Object[]> list_Usuarios=usuarios.SelectDatos();
           
   Iterator<Object[]> listar_usuarios=list_Usuarios.iterator();
   
   
   out.println("<tbody>");           
   
   while(listar_usuarios.hasNext())
   {
     Object[] objects=listar_usuarios.next();
   
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
                
                
                out.print("<td><img src='../Imagenes/sql/editar.png' onclick='EditarAdmin("+objects[0].toString()+")' id='Procesar_PedidoL'/></td>");
                out.print("<td><img src='../Imagenes/sql/eliminar.jpg' onclick='EditarAdmin("+objects[1].toString()+")' id=''/></td>");
                out.print("<td><a href='#'>ver detalle</a></td>");
                out.print("</tr>");
   }
           
  out.println("</tbody>");
       
       
       
   }
   catch(Exception ex)
   {
    out.print(ex.getMessage());
   }
   finally
   {
    out.close();
   }
   
   %>
   
   <tfoot>
          <tr>
                     <th></th>
                     <th></th>
                     <th></th>                            
                     <th></th>                           
                     <th></th>
                      
                            <th></th>
                            <th></th>
                            <th></th>
          </tr>
   </tfoot>
   </table>