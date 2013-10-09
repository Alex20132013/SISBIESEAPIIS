<!--Js. para llamar para el DIALOG Como para procesar el prestamo-->
<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>
<!--ESTO ES POR SI EL HTML5 NO FUNCIONA-->
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>


<!--Llamadas de los Java Script por tener confilto aparte PARECE QUE NO SIRVE

<script language="javascript" src="../javascripts/jsActualizarPrestamosDiv/jquery-1.2.6.min.js"></script>
<script language="javascript" src="../javascripts/jsActualizarPrestamosDiv/llamadaTiempo.js"></script>
-->


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

            $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                    function(data)
                    {

                        $("#demo").html(data);


                    });

        });

        window.setInterval(function() 
        {
            ListarPedidos();
        }, 600000);
        
        function ListarPedidos()
        {
            var loader = "<img src='../Imagenes/images/ajax-loader.gif' />";
            //$("#tbContenido").html(loader);
            //window.setTimeout(function(){}, 5000);
            $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
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
                    $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                            function(data)
                            {

                                $("#demo").html(data);
                            });

                });

            }
        }
        //funciona para procesar el prestamo

        function  Procesar_pedido(codigo, lugar)
        {



            $("#formAjax")[0].reset();  //limpiando el formularion dialog 

            $("#inptHdoption").val("1");
            $("#inptHdlg").val(lugar);


            // Formateamos el botón Diálogo sencillo
            $('#hrDialog').button();

            //opteniendo fecha actual del sistema
            var fecha = new Date();
            $("#reg_fechaPrt").val(fecha.getFullYear() + '-' + (fecha.getMonth() + 1) + '-' + fecha.getDate() + ' ' + fecha.getHours() + ':' + fecha.getMinutes());

            $("#rg_coduser").val(codigo);
            // Damos formato a la Ventana de Diálogo
            $('#dialogoProcesamiento').dialog(
                    {
                        // Indica si la ventana se abre de forma automática
                        autoOpen: true,
                        // Indica si la ventana es modal
                        modal: true,
                        // Largo
                        width: 350,
                        // Alto
                        height: 'auto'
                    });
            
           // Mostrar Diálogo Sencillo
            $('#hrDialog').click(function()
            {
                $('#dialogoProcesamiento').dialog('open');
            });



            // Validamos el formulario

            $('#formAjax').validate({
                submitHandler: function()
                {

                   
                    $.post("../Stprestamo", $("#formAjax").serialize(),
                            function(data)
                            {
                                $('#dialogoProcesamiento').dialog('close');
                                alert(data);   
                                
                                                            //Actualizando tabla
                               $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                               function(data)
                               {

                                $("#demo").html(data);


                                });

                            });
                            
                    


                },
                errorPlacement: function(error, element) {
                    error.appendTo(element.prev("span").append());
                }
            });



        }




    </script>

    <div id="Catalogo">
        <fieldset>
            <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
                <ul>
                    <li>
                        <h2>Formulario de Prestamos Validados</h2>
                    </li>
                    <ul>
                        <!--     <u><a onclick="PrestamosCuerpo()" class="cursor" >Prestamos</a></u>-->
                        <!--<u><a onclick="DevolucionesCuerpo()" class="cursor" >Devoluciones</a></u>-->
                        <a  class="cursor"  onclick="DevolucionesCuerpo();">Devoluciones</a>
                       <button  class="cursor" type="button" onclick="ListarPedidos();" >Actualizar</button>
                        
                        <!--<u><a onclick="BusquedaLibros()" class="cursor" >Busquedas</a></u>-->
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
    <!--FORMULARIO DE DIV FLOTANTE PROCESAR PRESTAMOS-->
    <div id="dialogoProcesamiento" title="Ventana detalles de Prestamo Libro" style="display:none;">
        <form action="" method="post" id="formAjax" name="formAjax">
            <fieldset id="datosContacto">
                <label for="rg_nombre">Huella Digital</label>
                <span></span>
                <input type="text" id="rg_coduser" name="codigo_user" class="{required:true}" required/>
                <span></span>
                <label for="rg_fecha">Fecha de Prestamo</label>
                <input type="text" id="reg_fechaPrt" name="fechaPrstmo" class="{required:true}" />
                <label for="cod_barra">Codigo de barra</label>
                <span></span>
                <input type="text" id="rg_codbarra" name="codbarra_libro" class="{required:true,number:false}" required/>
                <input type='hidden' name='option' id="inptHdoption" />
                <input type='hidden' name='lgPrestamo' id="inptHdlg" />
            </fieldset>
            <fieldset id="botonera" style="border:none; text-align: center;">
                <input id="envioFormulario" class="submit" type="submit" value="Continuar" name="envioFormulario">
            </fieldset>
        </form>
    </div>


</div>

</div>




