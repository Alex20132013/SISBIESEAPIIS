<!--Js. para llamar para el DIALOG Como para procesar el prestamo-->
<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>
<!--ESTO ES POR SI EL HTML5 NO FUNCIONA-->
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>


<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" ><span></span>Libros mas prestados</a>
        <ul>
            <%@ include file="../../UsuarioEapiis/especialidad.jsp" %>
        </ul>
    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {

            $.post("CuerposBibliotecario/ListPedidoUsersNoValidado.jsp",
                    function(data)
                    {

                        $("#demo").html(data);


                    });

        });

        /*  window.setInterval(function() 
         {
         ListarPedidos();
         }, 30000);*/
        function ListarPedidos()
        {
            var loader = "<img src='../Imagenes/images/ajax-loader.gif' />";
            //$("#tbContenido").html(loader);
            //window.setTimeout(function(){}, 5000);
            $.post("CuerposBibliotecario/ListPedidoUsersNoValidado.jsp",
                    function(data)
                    {

                        $("#demo").html(data);


                    });

        }
        function Eliminar_Prestamo(codigo_usuario)
        {
            //se esta agrengado un cero al inicio por precaucion
            if (window.confirm("Desea realmente cancelar?"))

            {


                $.post("../Stprestamo", {option: 0, codigousuario: codigo_usuario},
                function(data)
                {

                    // alert(data);
                    $.post("CuerposBibliotecario/ListPedidoUsersNoValidado.jsp",
                            function(data)
                            {

                                $("#demo").html(data);
                            });

                });

            }
        }





    </script>

    <div id="Catalogo">
        <fieldset>
            <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
                <ul>
                    <li>
                        <h2>Formulario de Prestamos no Validados </h2>
                    </li>
                    <ul>
                        <!--     <u><a onclick="PrestamosCuerpo()" class="cursor" >Prestamos</a></u>-->
                        <!--<u><a onclick="DevolucionesCuerpo()" class="cursor" >Devoluciones</a></u>-->
                        <a class="cursor"  onclick="DevolucionesCuerpo();">Prestamos Validos  </a>
                        <button  class="cursor" type="button" onclick="ListarPedidos();" >Actualizar</button>
                    </ul>
                </ul>
            </form>
            <div id="recargado">
                <div id="container">
                    <div id="demo">

                    </div>	
                </div>
            </div>
        </fieldset>
    </div>

</form>
</div>


</div>

</div>




