<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
    <link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
    <script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
    <script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>
    <script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>
    <!--Para mostrar estilos de los autocompletables -->
    <link href="../Css/style_1.css" rel="stylesheet" media="screen">
    <!--<script type="text/javascript" src="../javascripts/jsActualizarPrestamosDiv/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="../javascripts/jsActualizarPrestamosDiv/jsDivFlotante.js"></script> -->
    <!--<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="jquery.autocomplete.js"></script>
    <<script type="text/javascript" src="../javascripts/jQueryV-2.0.3.min.js"></script>-->
    
    <div id="Contenido">
        <div id="MenuLateral">

            <a href="#">Ranking  de Libros</a>
            <ul>
                <li><a href="#" class="_parent" onclick="clkEsp(0);" >Todos</a></li>
                    <%@ include file="especialidad.jsp" %>

            </ul>

        </div>     
        <script type="text/javascript" >

                    var opcion = "titulo";
                    var espselect = 0;//varaiable para buscar las especialidades
                    var insbn_libro = 0;

                    function Buscar(evento, txtBusqueda)
                    {

                        var code = evento.keyCode.toString();
                        var dato = txtBusqueda.value;
                       

                         //(code == '13'

                        if (dato.length >= 3 &&  code != '8')
                        {
                            //alert("listo para enviar peticion");

                            var key = "valuekey=" + dato + "&myopcion=" + opcion;



                            $.ajax({
                                url: 'CuerposUsuarioEapiis/BuscarAutor.jsp',
                                data: key,
                                type: 'POST',
                                success: function(result)
                                {
                                    $("#divAutocprtable").html(result);
                                    $("#divAutocprtable").show();

                                }


                            });


                        }

                        else
                        {
                            $("#divAutocprtable").html('');

                        }
                    }


                    //busque por nombre del autor//////////////////////////////////////////////////
                    function  Codigo_autor(id_autor, nombre)
                    {


                        $.post("../Sselect_Libro", {txtFind: id_autor, ursOption: opcion},
                        function(data)
                        {
                            $("#llamadaId").html(data);
                            $("#divAutocprtable").hide();
                            $("#txtBuscar").val(nombre);

                        });

                    }

                    /////////////////BUSQUEDA POR EL TITULO Q EL USUARIO AHA SELECCIONADO/////////////////
                    function  Titulo_libro(titulo)
                    {
                        $.post("../Sselect_Libro", {txtFind: titulo, ursOption: opcion},
                        function(data)
                        {

                            $("#llamadaId").html(data);
                            $("#divAutocprtable").hide();
                            $("#txtBuscar").val(titulo);
                        });
                    }
                    //mostrando los libros por especialidad////////////////////////////////////////
                    function clkEsp(espcialidad)
                    {
                        espselect = "esp=" + espcialidad;

                        if (espcialidad.toString()=='0')  //si ha seleccionado buscar por autor o titulo
                        {
                            $("#OptionSeach").show();
                            $("#llamadaId").html('');
                        }
                        else
                        {
                            $("#OptionSeach").hide();
                            $("#frmPresentacion").hide();
                            
                            $.ajax({
                                url: 'CuerposUsuarioEapiis/SelectLibroEspecialidad.jsp',
                                data: espselect,
                                type: 'POST',
                                success: function(result)
                                {

                                    $("#llamadaId").html(result);
                                }


                            });
                        }
                    }
                    //funcion para ver los indices de los libros//////////////////////////////////// 
                    function  Indice_libro(indice_isbn)
                    {

                        window.open("CuerposUsuarioEapiis/ViewIndiceLibro.jsp?directorio=" + indice_isbn);

                    }
                    ///funcion para enviar peticion de prestamo al bibliotecario////////////////////

                    function  Funcion_Prestamo(codigo, diponibles)
                    {
                        insbn_libro = codigo;
                        $("#formAjax")[0].reset();//limpiando formulario

                        $(document).ready(function()
                        {
                            //  alert("llegado hasta aqui");
                            //limpiando el formularion dialog   
                            // Formateamos el botón Diálogo sencillo

                            $('#dialogoSencillo').button();

                            $("#rg_correoE").val(insbn_libro);

                            // Damos formato a la Ventana de Diálogo
                            $('#dialogoFormulario').dialog(
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
                            $('#dialogoSencillo').click(function()
                            {
                                $('#dialogoFormulario').dialog('open');
                            });



                            // Validamos el formulario
                            $('#formAjax').validate({
                                submitHandler: function()
                                {
                                    $.post("../Spedido_libro", $("#formAjax").serialize(),
                                            function(data)
                                            {
                                                $('#dialogoFormulario').dialog('close');
                                                alert(data);
                                            });
                                },
                                errorPlacement: function(error, element)
                                {
                                    error.appendTo(element.prev("span").append());
                                }
                            });
                        });


                    }

                    function ValidarPedido(select)
                    {

                        if ($("#" + insbn_libro).val() == "1")//si el numero de libros es uno
                        {
                            $("#idselect").html("<option value='0'>Disponible para Sala</option>")
                        }


                    }

                    //////opcion de busqueda///////////////////////////////////////////////////

                    function Option_Busqueda(slect)
                    {
                        opcion = slect.value;
                        // alert(opcion);

                    }
                    function limpia(elemento)
                    {
                        elemento.value = "";
                    }
                    
           ////Busquedas de por Autor
/* //$(document).ready(function()
{
var indexTecla=-1;

$("#txtBuscar").keyup(function(event)
{
switch(event.which)
{
case 13:
$("#divAutocprtable").find("a").each(function(index, object)
{
if($(object).css("background-color")=="rgb(224, 255, 255)")
{

document.all.txtBuscar.value=$(object).html();

}
});
break;
case 38:
//alert("arriba");
if(indexTecla!=0 && indexTecla!=-1)
{
indexTecla--;
}
if(indexTecla==-1)
{
indexTecla++;
}
$("#divAutocprtable").find("a").each(function(index, object)
{
if(index==indexTecla)
{
$(object).css("background-color", "LightCyan");
}
else
{
$(object).css("background-color", "white");
}
});
break;
case 40:
//alert("abajo");
if(indexTecla<$("#divAutocprtable").find("a").length-1 && indexTecla!=-1)
{
indexTecla++;
}
if(indexTecla==-1)
{
indexTecla++;
}
$("#divAutocprtable").find("a").each(function(index, object)
{
if(index==indexTecla)
{
$(object).css("background-color", "LightCyan");
}
else
{
$(object).css("background-color", "white");
}
});
break;
}
});
});     */
        </script>        





        <div id="Catalogo">

            <div id="OptionSeach">
                <fieldset>
                    <legend>Busquedas:</legend>
                    <ul id="rBusquedas">
                        <!--  <label>Busqueda:<input type="search"  id="txtBuscar" class="bbuscar" name="busquedas" class="input_text" onkeyup="Buscar(this)"/></label>-->
                        <div class="autocomplete"> 
                            <input checked="checked" id="rdOptio1" onclick="Option_Busqueda(this)" name="busquedas" value="titulo" type="radio" />Título</label> 
                            <label><input id="rdOptio2" onclick="Option_Busqueda(this)" name="busquedas" value="autor" type="radio" />Autor</label> 
                            <!--<label> <input id="rdOptio3" onclick="" name="busquedas" value="contenido" type="radio"> Contenido</label>
                            <label> <input onclick="" name="busquedas" value="busquedas" type="radio"> Todos</label>--></br>
                            <input id="txtBuscar" name="busquedas" class="bbuscar"  size="45" height="100%" type="search" onkeyup="Buscar(event, this)" placeholder="Buscar Ejem:Fundamentos de Programacion" autocomplete="off" onclick="javascript: limpia(this);"/>     
                        </div>     
                        <div id="divAutocprtable">
                        </div>     
                    </ul>   
                </fieldset>
            </div>   
            <!llamda de por titulos y autores-->
            <div id="llamadaId" >
            </div>   

            <div id="Tablainforme">
            </div>

            <!--FORMUALARIO DE DIV FLOTANTE-->
            <div id="dialogoFormulario" title="Ventana detalles de Libro" style="display:none;">
                <form action="" method="post" id="formAjax" name="formAjax">
                    <fieldset id="datosContacto">
                        <label for="rg_nombre">Codigo de Usuario</label>
                        <span></span>
                        <input type="text" id="rg_nombre" name="codigo_user" required/>
                        <label for="rg_apellidos">Seleccione</label>
                        <span></span>

                        <select name="opcion_select" id="idselect" onchange="ValidarPedido(this)">
                            <option value="0">En Sala</option>
                            <option value="1">A Domicilio</option>
                        </select>
                        <!--<input type="text" id="rg_apellidos" name="rg_apellidos" class="{required:true}"/>-->
                        <label for="rg_correoE">Isbn de Libro</label>
                        <span></span>
                        <input type="text" id="rg_correoE" name="isbn_libro" required/>

                    </fieldset>
                    <fieldset id="botonera" style="border:none; text-align: center;">
                        <input id="envioFormulario" class="boton" type="submit" value="Continuar" name="envioFormulario"/>
                    </fieldset>
                </form>
            </div>
         
        </div>

    </div>



