<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>

<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" class=""><span></span>Libros mas prestados</a>
        <ul>
            <%@ include file="../UsuarioEapiis/especialidad.jsp" %>
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

        //window.setInterval( function(){ListarPedidos();}  ,30000);
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

                    alert(data);
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
            // alert("he llegado hasta qui");
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

                            });
                    //Actualizando tabla
                    $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                            function(data)
                            {

                                $("#demo").html(data);


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
                        <h2>Formulario de Prestamos</h2>
                    </li>
                    <ul>
                        <!--<u><a onclick="PrestamosCuerpo()" class="cursor" >Prestamos</a></u>
                        <u><a onclick="DevolucionesCuerpo()" class="cursor" >Devoluciones</a></u>-->
                            <a  class="cursor" type="button" onclick="DevolucionesCuerpo();">Devoluciones</a>
                        <!--<u><a onclick="BusquedaLibros()" class="cursor" >Busquedas</a></u>-->
                    </ul>
                </ul>
            </form>

            <%//@include file="CuerposBibliotecario/PrestamosCuerpo.jsp" %>
             <div id="container">
                <div id="demo">
              </div>
                </div> 
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
                   
                    //document.getElementById("Catalogo").innerHTML=" ";

                    $("#demo").html(result);



                }


            });


        }
        function detalle_Libro(holas)
        {
            var sdsd = holas;
            // $("#contact_form")[0].reset();//limpiando formulario
            $("#formAjax").show();
            $('#dialogoFormulario').dialog({
                // Indica si la ventana se abre de forma automática
                autoOpen: true,
                // Indica si la ventana es modal
                modal: true,
                // Largo
                width: 'auto',
                // Alto
                height: 'auto'
            });

            // Mostrar Diálogo Sencillo
            $('#detalleLibro').click(function()
            {
                $('#dialogoFormulario').dialog('open');
            });

        }
        function estado_Libro()
        {
            // $("#contact_form")[0].reset();//limpiando formulario
            $("#formAjax").show();
            $('#dialogoFormulario').dialog({
                // Indica si la ventana se abre de forma automática
                autoOpen: true,
                // Indica si la ventana es modal
                modal: true,
                // Largo
                width: 'auto',
                // Alto
                height: 'auto'
            });

            // Mostrar Diálogo Sencillo
            $('#detalleLibro').click(function()
            {
                $('#dialogoFormulario').dialog('open');
            });

        }
    </script>


    <!--FORMULARIO DETALLES LIBRO EN FLOTANTE-->
    <div id="dialogoFormulario" title="Ventana Registro Nuevo Autor" style="display:none;">
        <form  method="post" action="" id="formAjax"  class="contact_form" name="contact_form">
            <table>
                <!--<tr>
                    <td><label>IdAutor</label></td>
                    <td><input type="text" class="textosLibroAutor"/></td>
                </tr>-->
                <tr>
                    <td><label>Nombre</label></td>
                    <!--<td><input type="text" name="txtNombre" class="textosLibroAutor" title="Nombre Autor solo Caracteres >3" pattern="[A-Za-z]{3,30}" required/></td>
                </tr>-->
                    <td><input type="text" name="txtNombre" title="Nombre Autor solo Caractere >3" pattern="^[a-z A-Zñáéíóú.,]{3,60}$" required/></td>
                </tr>

                <tr>
                    <td><label>Apellidos</label></td>
                    <td><input type="text" name="txtApellidos" class="textosLibroAutor" title="Apellidos solo Caracteres >3" pattern="^[a-z A-Z][a-z A-Zñáéíóú,.-]{3,}$" required/></td>
                </tr>
                <tr>
                    <td><label>Especialidad</label></td>
                    <td><input type="text" name="txtEspecialidad" class="textosLibroAutor" title="Especialidad Solo Caracres >3" pattern="[a-z A-Zñáéíóú.,-0-9+]{3,65}" required/></td>
                </tr>
            </table>
            <button  class="submit" type="submit" id="btnguardar" value="enviar">Guardar</button>
            <button  class="submit" type="reset">Restablecer</button>

        </form>

    </div>
    <!--FORMULARIO ESTADO LIBRO-->
    <div id="dialogoFormulario" title="Ventana Registro Nuevo Autor" style="display:none;">
        <form  method="post" action="" id="formAjax"  class="contact_form" name="contact_form">
            <table>
                <!--<tr>
                    <td><label>IdAutor</label></td>
                    <td><input type="text" class="textosLibroAutor"/></td>
                </tr>-->
                <tr>
                    <td><label>Nombre</label></td>
                    <!--<td><input type="text" name="txtNombre" class="textosLibroAutor" title="Nombre Autor solo Caracteres >3" pattern="[A-Za-z]{3,30}" required/></td>
                </tr>-->
                    <td><input type="text" name="txtNombre" title="Nombre Autor solo Caractere >3" pattern="^[a-z A-Zñáéíóú.,]{3,60}$" required/></td>
                </tr>

                <tr>
                    <td><label>Apellidos</label></td>
                    <td><input type="text" name="txtApellidos" class="textosLibroAutor" title="Apellidos solo Caracteres >3" pattern="^[a-z A-Z][a-z A-Zñáéíóú,.-]{3,}$" required/></td>
                </tr>
                <tr>
                    <td><label>Especialidad</label></td>
                    <td><input type="text" name="txtEspecialidad" class="textosLibroAutor" title="Especialidad Solo Caracres >3" pattern="[a-z A-Zñáéíóú.,-0-9+]{3,65}" required/></td>
                </tr>
            </table>
            <button  class="submit" type="submit" id="btnguardar" value="enviar">Guardar</button>
            <button  class="submit" type="reset">Restablecer</button>

        </form>

    </div>

</div>
