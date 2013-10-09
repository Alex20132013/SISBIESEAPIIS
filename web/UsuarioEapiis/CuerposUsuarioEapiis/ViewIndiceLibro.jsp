<%-- 
    Document   : ViewIndiceLibro
    Created on : 21-jun-2013, 4:42:09
    Author     : eapiis_server
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.CEspLibro"%>
<!--Para mostrar todos sobre los indices de Libros--> 
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
        <link rel="stylesheet" href="../../Css/CssIndicesLibros/flexslider.css" type="text/css" media="screen" />
	<script src="../../javascripts/JsIndicesLibros/jquery.min.js"></script>
	<script src="../../javascripts/JsIndicesLibros/jquery.flexslider-min.js"></script>
	<link rel="stylesheet" href="../../Css/CssIndicesLibros/demo.css" type="text/css" media="screen" />
<script type="text/javascript">
		$(window).load(function() {
			$('.flexslider').flexslider();
		});
	</script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Presentacion Indices Libros SISBIES-ESPIIS-2013</title>
    </head>
    <body>
        <div id="container">
		<h2>Presentación de los Indices de Libros </h2>
		<div class="flexslider">
	    <ul class="slides">	
           <%
               //int especialidad=Integer.parseInt(request.getParameter("Programacion"));   
   CEspLibro   libros_especialidad=new CEspLibro();
       List<Object[]> Libros=libros_especialidad.SelectLibroEspecialidad(1);
   Iterator<Object[]> listar_libros=Libros.iterator();
     Object[] libro=listar_libros.next();
   
            
              String directorio=request.getParameter("directorio");
               File dirIndice=new File("/home/Eapiis_Server/INDICESLIBROS/"+directorio);
               String[]listafotos=dirIndice.list();
               
               if (dirIndice.isDirectory()) 
               {
                   for(int i=0; i<listafotos.length;i++)
                   {
                       out.print("<li>");
                      String nombreIndice=listafotos[i];
                   %>
                   <p class="flex-caption"><% out.print("INDICES DEL LIBRO:"+libro[1].toString()); %></p>   
                   <img src="../../Sreaderfile?dir=<% out.print(directorio); %>&option=<% out.print(nombreIndice);%>"  /><br/>
                      <%
                    out.print("</li>");
                   }
               }
               else
               {
               
               out.print("Aun en Proceso ...Disculpe las molestias");
               }            
            %>
            </ul>
            </div>
        </div>    
    </body>
</html>
