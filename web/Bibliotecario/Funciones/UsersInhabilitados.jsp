<%-- 
    Document   : UsersInhabilitados
    Created on : 06-jul-2013, 9:17:00
    Author     : 2012
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CUsuario"%>
<% request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
 <table cellpadding="0" cellspacing="0" border="0" class="display" id="dtVisualizar" >
     <thead>
         <tr>
             <th>Codigo</th>
             <th>Nombre(es)</th>
             <th>Apellidos</th>
             <th>Estado</th>
             <th>Fecha Registro</th>
             <th></th>
             <th></th>
         </tr>
     </thead>
      <%

        
    CUsuario userInhabiltados=new CUsuario(); 
   
   try   {
       
       List<Object[]> lstusuariosInhablitds=userInhabiltados.lstUsersInhabiltados();
           
       Iterator<Object[]> listar_users=lstusuariosInhablitds.iterator();
   
             
   
   while(listar_users.hasNext())
   {
     Object[] user=listar_users.next();
   
      out.println("<tr>");                
                 out.println("<td>"+user[0].toString()+"</td>");
                 out.println("<td>"+user[1].toString()+"</td>");
                 out.println("<td>"+user[2].toString()+"</td>");                                                 
                 out.println("<td>"+user[3].toString()+"</td>");
                 out.println("<td><input type='number' id='"+user[0].toString()+"' value='"+user[3].toString()+"' /></td>");
                 out.println("<td>"+user[2].toString()+"</td>");                 
                 out.print("<td><a href='#'   onclick='Indice_libro("+user[0].toString()+")'> Indice</a></td>");
                 out.print("<td><a href='#' onclick='Detalle_LIbro("+user[0].toString()+")' data-type='zoomin'>Enviar Prestamo </a></td>");
     
     
     out.println("</tr>"); 
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
   
    
 
   
%>
     
     <tbody>
         
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
         </tr>
     </tfoot>
     
 </table>
