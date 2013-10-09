<%@page import="Modelo.CLibro"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CAutor"%>
<%

    HttpSession sesion = request.getSession(true);
    String query = request.getParameter("valuekey");
    String myopcion = request.getParameter("myopcion");


    try {

        if (sesion.getAttribute("USER") == null) {
            sesion.invalidate();

%>
<script type="text/javascript">
    alert("Sorry!..sesion Expirada")
    window.location = "../index.jsp";
</script>

<%


} else {
    if (myopcion.equals("autor")) {
        CAutor autor = new CAutor();
        List<Object[]> autors = autor.NombreAutor(query);


        if (autors.size() != 0) {
            Iterator<Object[]> iterator = autors.iterator();

            while (iterator.hasNext()) {
                Object[] dato = iterator.next();
%>
<ul id="listaResultados">
    <li><a class="autocomplete-jquery-item" href="#" onclick="Codigo_autor('<%=dato[0].toString()%>', '<%=dato[1].toString()%>')"><%=dato[1].toString()%></a></li></ul>
        <%

            }
        } else {

        %>
<li><a class="autocomplete-jquery-item" href="#" >No existe.. </a>  </li> </ul>
    <%             }
    } else {
        CLibro libros = new CLibro();
        List<String> libros_seach = libros.List_LibrosTitulo(query.toUpperCase());

        if (libros_seach.size() != 0) {


            Iterator<String> iterator = libros_seach.iterator();
            while (iterator.hasNext()) {
                String dato = iterator.next();
    %>
<ul id="listaResultados" >
    <li><a class="autocomplete-jquery-item" href="#" onclick="Titulo_libro('<%=dato%>')"><%=dato%></a></li></ul>
        <%

            }
        } else {
        %>
<li><a class="autocomplete-jquery-item" href="#" >No hay resultados...</a></li></ul>     
    <%                       }
                }
            }

            // out.println(query);

        } catch (Exception ex) {

            out.println(ex.getMessage());

        } finally {
            out.close();
            // this.destroy();
        }


    %>

