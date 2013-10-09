<!--Llamadas de los Java Script por tener confilto aparte-->
<%// request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>

<%// request.getRequestDispatcher("../../llamaajsTablas.jsp").include(request, response);%>
<div id="Contenido">
    <div id="MenuLateral">
        <a href="index.php" class="_parent"><span></span>Lista de Libros</a>
        <ul>
            <%@ include file="../../UsuarioEapiis/especialidad.jsp" %>
            <% //request.getRequestDispatcher("../../UsuarioEapiis/especialidad.jsp").include(request, response);%>
        </ul>
    </div>
    <script type="text/javascript" >

        function clkEsp(espcialidad)
        {

            espselect = "esp=" + espcialidad;


            $.ajax({
                url: 'CuerposBibliotecario/SelectLibroEspecialidad.jsp',
                data: espselect,
                type: 'POST',
                success: function(result)
                {

                    $("#demo").html(result);
                }
            });
        }

    </script>    


    <div id="Catalogo">

        <fieldset>
            <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
                <ul>
                    <li>
                        <h2>Registro de Libros Disponibles EAPIIS</h2>
                    </li>
                    <!--<ul>
                        <i><a onclick="LibrosAdquiridosCuerpo();" class="cursor">Libros Adquiridos</a></i>
                        <i><a onclick="LibrosDevueltosCuerpo();" class="cursor">Libros Devueltos</a></i>
                        <i><a onclick="LibrosObservadosCuerpo();" class="cursor">Libros Observados</a></i>
                        <i><a onclick="LibrosPrestadosCuerpo();" class="cursor">Libros Prestados</a></i>
                    </ul>-->
                </ul>
            </form>

            <div id="container">
                <div id="demo">
                </div>	
            </div>
        </fieldset> 
    </div>

</div>
