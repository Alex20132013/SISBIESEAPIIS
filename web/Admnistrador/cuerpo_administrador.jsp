<div id="Contenido">
    <div id="MenuLateral">
        
        <%@ include file="../UsuarioEapiis/especialidad.jsp" %>
        
    </div>
            <script type="text/javascript" >

        function clkEsp(espcialidad)
        {

            espselect = "esp=" + espcialidad;


            $.ajax({
                url: '../Bibliotecario/CuerposBibliotecario/SelectLibroEspecialidad.jsp',
                data: espselect,
                type: 'POST',
                success: function(result)
                {

                    $("#demo").html(result);
                }
            });
        }

    </script>   
    <div id="Catalogo">Inicio Pagina Administradorr
            
   <div id="container">
                <div id="demo">
                </div>	
            </div>

    </div>

</div>
