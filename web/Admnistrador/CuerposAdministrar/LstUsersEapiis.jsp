<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.CUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%// request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
<%@include file="../../llamadajsTablas.jsp" %>
<ul>
    <h2>Mantenimiento Usuarios</h2>
</ul>

 <table cellspacing='0' cellpadding='0' id='dtVisualizar' >
                 <thead>
                    <tr>
                            <th>Codigo</th>
                           <th>Nombre</th>
                            <th>Apellidos</th>                           
                            <th>Correo electroniko</th>                           
                            <th>Estado</th>
                            <th>Huella Digital</th>
                            <th></th>
                           <th></th>
                  </tr>
                  </thead>
                 
   <tbody>
 <%
       
              CUsuario users=new CUsuario();
           
              List<Object[]> lista_user=users.SelectDatos();
              
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
                out.print("<td><img src='../Imagenes/sql/eliminar.jpg' onclick='Eliminar_usuario("+objects[0].toString()+")'/></td>");
                out.print("<td><a href='#'>ver detalle</a></td>");
                out.print("</tr>");
                
            }
             
                
          %>     
   </tbody>
            
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
            
             
              
          