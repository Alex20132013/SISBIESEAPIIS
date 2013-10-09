 <%@ include file="../../llamadajsTablas.jsp" %>
<%@page import="Modelo.CEspLibro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>

 <table cellpadding="0" cellspacing="0" border="0" class="display" id="dtVisualizar" >
<%
   int especialidad=Integer.parseInt(request.getParameter("esp"));   
   
   CEspLibro   libros_especialidad=new CEspLibro();
   int contador=0;
   
   try
   {
       List<Object[]> Libros=libros_especialidad.SelectLibroEspecialidad(especialidad);
           
   Iterator<Object[]> listar_libros=Libros.iterator();
   
   out.println("<thead>");
               out.println("<tr>");
               out.println("<th>Titulo</th>");              
               out.println("<th>Autores</th>");
               out.println("<th>Dispo.</th>");
               out.println("<th>Total</th>");
               out.println("<th>Indice.</th>");
               out.println("<th>Prestamo</th>");
               out.println("</tr>");
   out.println("</thead>");
   out.println("<tbody>");           
   
   while(listar_libros.hasNext())
   {
     Object[] libro=listar_libros.next();
     contador=Integer.parseInt(libro[3].toString());
      out.println("<tr>");           
                
                 out.println("<td width='210'>"+libro[1].toString()+"</td>");                
                                  
                 out.println("<td>"+libro[4].toString()+"</td>");
                 out.println("<td>"+libro[3].toString()+"<input type='hidden' id='"+libro[0].toString()+"' value='"+libro[3].toString()+"'/></td>");
                 out.println("<td>"+libro[2].toString()+"</td>");                 
                 out.print("<td><a href='#'   onclick='Indice_libro("+libro[0].toString()+")'> Indice</a></td>");
                if(contador>0)
                {
                     out.print("<td><span class='contenido'><a href='#' onclick='Funcion_Prestamo("+libro[0].toString()+","+libro[3].toString()+")' id='dialogSencillo' data-type='zoomin'>Enviar Prestamo</a>");
                }
                else
                {
                  out.print("<td><span class='contenido'><a href='#'  ' data-type='zoomin'>Terminado</a>");
                }
                
                 out.print("<span class='mensaje'>"+libro[5].toString()+" <br/>"+libro[6].toString()+"<br/>"+libro[7].toString()+"</span></span></td>");
                
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

