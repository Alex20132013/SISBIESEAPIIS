<% //request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
<%@include file="../../llamadajsTablas.jsp" %>

<%@page import="Modelo.CEspLibro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>

 <table cellpadding="0" cellspacing="0" border="0" class="display" id="dtVisualizar" >
       
<%

   int especialidad=Integer.parseInt(request.getParameter("esp"));   
   
   CEspLibro   libros_especialidad=new CEspLibro();
   
   try
   {
       List<Object[]> Libros=libros_especialidad.SelectLibroEspecialidad(especialidad);
           
   Iterator<Object[]> listar_libros=Libros.iterator();
   
   out.println("<thead>");
               out.println("<tr>");
               out.println("<th>Titulo</th>");              
               out.println("<th>Autores</th>");
               out.println("<th>Disponibles</th>");
               out.println("<th>Total</th>");
               out.println("<th></th>");
               out.println("<th></th>");
               out.println("</tr>");
   out.println("</thead>");
   out.println("<tbody>");           
   
   while(listar_libros.hasNext())
   {
     Object[] libro=listar_libros.next();
   
      out.println("<tr>");                
                 out.println("<td>"+libro[1].toString()+"</td>");                 
                 out.println("<td>"+libro[4].toString()+"</td>");
                 out.println("<td>"+libro[3].toString()+"</td>");
                 out.println("<td>"+libro[2].toString()+"</td>");                 
                 out.print("<td><a href='#'   onclick='detalle_Libro("+libro[0].toString()+")' id='detalleLibro'> Ver Detalles</a></td>");
                 out.print("<td><a href='#' onclick='estado_Libro("+libro[0].toString()+")' id='estadoLibro' data-type='zoomin'>Estado Libro </a></td>");
     
     
     out.println("</tr>"); 
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
 </table>
