<div id="Contenido">
       <div id="MenuLateral">
        <a href="#" class=""><span></span>Libros mas prestados</a>
        <ul>
            <%@ include file="../../UsuarioEapiis/especialidad.jsp" %>
        </ul>

    </div>
        <script>
             $(document).ready(function()
                   {

                      $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                                function(data)
                                {

                                    $("#Catalogo").html(data);
                                });
                     });

        </script>

    <div id="Catalogo">Acerca de Biblioteca
        
    </div>

</div>
