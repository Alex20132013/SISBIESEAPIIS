
<%// request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
<%@include file="../../llamadajsTablas.jsp" %>
<%@page import="Modelo.Ctemp_pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="Modelo.CEspLibro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="dtVisualizar" >

    <thead>
        <tr>
            <th>Usuario</th>
            <th>Titulo Libro</th>
            <th>Isbn</th>
            <th>Autor(es)</th>
            <th>Cod. Dewey</th>
            <th>Not. Malaga</th>
            <th>Lugar Prestamo</th>
            <th> </th>
            <th></th>
        </tr>
    </thead>
    <%
        Ctemp_pedido ctemp_list = new Ctemp_pedido();
    

        try {
            List<Object[]> list_pedidosLibros = ctemp_list.SelectDatos();

            Iterator<Object[]> listar_libros = list_pedidosLibros.iterator();


            out.println("<tbody>");

            while (listar_libros.hasNext()) 
            {
                Object[] objects = listar_libros.next();
                
                
                
                boolean lugar_prestamo = Boolean.parseBoolean(objects[4].toString());
                
                out.println("<tr >");
                out.println("<td>" + objects[1].toString() + "</td>");
                out.println("<td>" + objects[2].toString() + "</td>");
                out.println("<td>" + objects[3].toString() + "</td>");
                out.println("<td>" + objects[7].toString() + "</td>");
                out.println("<td>" + objects[5].toString() + "</td>");
                out.println("<td>" + objects[6].toString()  + "</td>");
                if (lugar_prestamo) 
                {
                    out.println("<td>Domicilio</td>");
                } else 
                {
                    out.println("<td>Sala</td>");
                }

               
%>
    <td><a href="#" onclick="Procesar_pedido('<% out.print(objects[0].toString());%>', '<% out.print(objects[4].toString());%>')" id="hrDialog" >Prestar</a> </td>
    <td><a href="#" onclick="Eliminar_Prestamo('<% out.print(objects[0].toString());%>')">Cancelar</a> </td>

    <%

                out.println("</tr>");
             
            }
            } catch (Exception ex) 
            {
           out.print(" <tr>");
                 out.print("<td></td>");
                 out.print("<td></td>");
                 out.print("<td></td>");
                 out.print("<td></td>");
                 out.print("<td>"+ex.getMessage()+"</td>");
                 out.print("<td></td>");
                 out.print("<td></td>");
                 out.print("<td></td>");
                 out.print("<td></td>");
        out.print("</tr>");
            
           }
        finally 
        {
            out.close();
        }

            out.println("</tbody>");



        

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
            <th></th>
        </tr>
    </tfoot>
</table>
