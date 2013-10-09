<%@page import="java.util.List"%>
<%@page import="Modelo.CLibro"%>
<!--Llamadas de los Java Script por tener confilto aparte-->
<% request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" class="_parent"><span></span>Libros mas prestados</a>
              <ul>
            <%@ include file="../../UsuarioEapiis/especialidad.jsp" %>
             </ul>

    </div>
              <script type="text/javascript">
      /*  $(document).ready(function()
        {

            $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                    function(data)
                    {

                        $("#demo").html(data);
                    });
        });*/
                      </script>>
   
    <div id="Catalogo" >
        <fieldset>
            <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
                <ul>
                    <li>
                        <h2>Formulario Libros Rolando</h2>
                    <!--    <ul>
                            <i><a onclick="LibrosCuerpo()" class="cursor">Todos los Libros</a></i> 
                            <i><a onclick="LibrosAdquiridosCuerpo()" class="cursor">Libros Adquiridos</a></i>
                            <i><a onclick="LibrosDevueltosCuerpo()" class="cursor">Libros Devueltos</a></i>
                            <i><a onclick="LibrosObservadosCuerpo()" class="cursor">Libros Observados</a></i>
                            <i><a onclick="RegistroLibrosCuerpo()" class="cursor">Registro Libros</a></i>
                        </ul>-->

                </ul>
            </form>

            <div id="container">
                <div id="demo">
                    <%
                                         
                    
                    CLibro libros_en_prestamo=new CLibro();                  
                    
                    
                    out.print("<table cellpadding='0' cellspacing='0' border='0' class='display' id='example'>");
                        out.print("<thead>");
                            out.print("<tr>");
                                out.print("<th>Titulo</th>");
                                out.print("<th>Còdigo usuario</th>");
                                out.print("<th>Nombre</th>");
                                out.print("<th>Apellidos</th>");
                                out.print("<th>Codido barra</th>");
                                out.print("<th>Fecha de pretamo</th>");
                                
                            out.print("</tr>");
                        out.print("</thead>");
                        out.print("<tbody  id='tbContenido'>");
                         try
                         { 
                              List<Object[]>listLibrosPrestamo=libros_en_prestamo.ListLibrosPrestados();
                             for(int i=0; i<listLibrosPrestamo.size();i++)
                               {
                                   Object[] registro=listLibrosPrestamo.get(i);
                                  out.print("<tr>");
                                     out.println("<td>");
                                     out.println(registro[0].toString());
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println(registro[1].toString());
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println(registro[2].toString());
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println(registro[3].toString());
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println(registro[4].toString());
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println(registro[5].toString());
                                     out.println("</td>");
                                  out.print("</tr>");
                               
                               }
                              }
                         catch(Exception ex)
                        {
                     out.print("<tr>");
                                     out.println("<td>");
                                     out.println("No hay");
                                     out.println("</td>");                                     
                                     out.println("<td>");
                                     out.println("Libros");
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println("prestados");
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println("en este momento");
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println(ex.getMessage());
                                     out.println("</td>");
                                     out.println("<td>");
                                     out.println("");
                                     out.println("</td>");
                                  out.print("</tr>");
                          }
                                       
                        out.print("</tbody>");
                        out.print("<tfoot>");
                            out.print("<tr>");
                                out.print("<th></th>");
                                out.print("<th></th>");
                                out.print("<th></th>");
                                out.print("<th></th>");
                                out.print("<th></th>");
                                out.print("<th</th>");
                                
                            out.print("</tr>");
                        out.print("</tfoot>");
                    out.print("</table>");
                   
                    
                                %>
                </div>	
            </div>
        </fieldset>
    </div>
</div>
