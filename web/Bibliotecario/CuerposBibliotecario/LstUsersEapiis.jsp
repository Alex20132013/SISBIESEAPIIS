<% request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.CUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<ul>
    <h2>Mantenimiento Usuarios</h2>
</ul>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="dtVisualizar" >
    <thead>
        <tr>
            <th>Código Usuario</th>
            <th>Tipo Usuario</th>
            <th>Nombres Usuario  </th>
            <th>Direccion Usuario</th>
            <th>Correo Usuario</th>
            <!--<th>Huella Digital</th>-->
        </tr>
    </thead>
    <tbody>
        <%
            int tipo=Integer.parseInt(request.getParameter("parametro"))  ;      
            CUsuario usuario = new CUsuario();
           // usuario.setTipo_user(tipo);
            try
            {
            
            ArrayList<Object[]> lstUsuarios = usuario.SelectDatosTipo(tipo);
            
            
            
            
            
            for (Object[] lsUser : lstUsuarios) 
            {
                out.print("<tr>");
                out.print("<td>" + lsUser[0].toString() + "</td>");
                out.print("<td>" + lsUser[1].toString() + "</td>");
                out.print("<td>" + lsUser[2].toString() + "</td>");
                out.print("<td>" + lsUser[3].toString() + "</td>");
                out.print("<td>" + lsUser[4].toString() + "</td>");

                out.print("</tr>");
            }
          }
            catch(Exception ex)
            {
             out.print("Error"+ex.getMessage());
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
            <!--<th></th>-->
        </tr>
    </tfoot>
</table>