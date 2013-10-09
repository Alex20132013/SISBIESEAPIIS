<!--JS y CSS PARA MOSTRAR LOS DIALOG POR EJEMPLO. EDICION-->
<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>


<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" class="_parent"><span></span>Busqueda de libros por</a>
        <ul>
            <li><a href="#" class="_parent"><span></span>ISBN </a></li>
            <li><a href="#" target="_parent"><span></span>Titulo</a></li>
            <li><a href="#" target="_parent"><span></span>Especialidad</a></li>
            <li><a href="#" target="_parent"><span></span>Autor</a></li>
        </ul>
    </div>
    <div id="Catalogo">
        <div id="overlay">
        </div>
        <div id="specialBox">
            <!--<button onmousedown="devolver_formulario()">editar</button>-->
        </div>
        <div id="RegistroLibro">
            <form class="contact_form" id="frmDtsLbro"  name="contact_form" metod="post" autocomplete="off">
                <ul>
                    <li>
                        <h2>Registro Libros</h2>
                        <span class="required_notification">* Datos Requeridos</span>
                    </li>
                    <li>
                        <label for="name">Isbn Libro:</label>

                        <input type="text" id="isbnLibro" name="isbnLibro" title="El nombre debe estar formado únicamente por letras 13 Caractres:" pattern="[A-Za-z0-9]{5,13}" class="regLibros" placeholder="9788483224111" required  onchange="VerlibroExiste(this.value, 0)" onfocus/>
                        <span class="form_hint">"Ingrese el Isbn LIbro "</span>
                    </li>
                    <li>
                        <label for="name">Titulo Libro</label>
                        <input type="text" name="titloLibro"  title="El Título del libro debe estar formado únicamente por letras>5 Caracteres:" pattern="[A-Z a-z0-9ñáéíóú.,+%#¿?]{4,100}" class="regLibros" placeholder="Matematica Basica" required/>
                        <span class="form_hint">"Ingrese  el nombre del libro "</span>
                    </li>
                    <li>
                        <label for="name">Especialidad</label>
                        <select NAME="selComboEsp" SIZE=1 >
                            <%@include  file="/Admnistrador/CuerposAdministrar/Especialidad.jsp" %>
                        </select>

                        <span class="form_hint">"Seleccione Especialidad"</span>
                    </li>
                    <li>
                        <label for="email">Editorial</label>
                        <select NAME="selComboEtrial" SIZE=1 onChange="">
                            <%@include  file="/Admnistrador/CuerposAdministrar/Editorial.jsp" %>
                        </select>

                        <span class="form_hint">"Seleccione especialidad"</span>
                    </li>
                    <li>
                        <label for="name">Edicion_Libro</label>
                        <input type="text" name="edcnLibro"  title="Nombre Autor solo Caracteres >3" pattern="[A-Za-z0-9.]{3,30}" class="regLibros" required />
                        <span class="form_hint">"Ingrese la Edcion del Libro:"</span>
                    </li>

                    <li>
                        <label for="name">Total Libro:</label>
                        <input type="number" name="totlLibro" title="Total Libros tipo entero:" class="regLibros" pattern="[0-9]{1,2}" required />
                    </li>
                    <li>
                        <label for="name">Codigo Dewey:</label>
                        <input type="text" name="codDewey"  title="Ingrese el Código Dewey del Libro:" pattern="[A-Za-z0-9.]{2,10}" class="regLibros" required />
                    </li>
                    <li>
                        <label for="name">Notacio Malaga:</label>
                        <input type="text" name="txtNotacion"  title="Ingrese ntacion Malaga:" pattern="[A-Z0-9]{2,4}" class="regLibros" required />
                    </li>
                    <li>
                        <label for="name">Año de Publicacion:</label>
                        <input type="number" name="txtAnPublic"  title="Ingrese año de publicacion:" pattern="[0-9]{4,4}" class="regLibros" required />
                    </li>
                    <li>
                        <label for="name">Precio Libro:</label>
                        <input type="number" name="prcLibro" title="precio del libro" class="regLibros" placeholder="50.5" pattern="[0-9]{1,2}" />
                    </li>
                    <li>
                        <label for="name">Nro de Paginas:</label>
                        <input type="number" name="NroPag" title="Nro de paginas de libro" class="regLibros" pattern="[0-9]{2,4}" required />
                    </li>
                     <li>
                        <label for="name">Habilitar Vol/Tomo:</label>
                        <!--<input type="checkbox"  name="chkTmVl"/>
                        <input type="text" name="txtTomoVol"  title="Ingrese Volumen y/o tomo:" class="regLibros" placeholder="V. I/T. II ó Deshabilete" />-->
                        <input type="checkbox"  name="check">
                        <input type="text" name="txtTomoVol" placeholder="V. I/T. II ó Deshabilete"  title="Ingrese Volumen y/o tomo:" class="regLibros" onFocus="controlT(this, 0)">

                    </li>

                    <li>
                        <p>
                            <label for="name">Descripcion Libro</label>
                            <textarea name="txtDescp" placeholder="El libros es de una Donacion"></textarea>
                        </p>
                    </li>
                    <li>
                        <label for="name">Agregar auto(es):</label>
                        <button  class="submit" type="button" onClick="encenderAutor()">Agregar Autor</button>
                    </li>
                    <li>
                        <button  class="submit" type="submit" id="btnguardarLibro" value="envio">Registrar Libro</button>
                    </li>
                </ul>
            </form>
            <a href="#" onclick="IndiceRegistroCuerpo()">Subir Indice del Libro</a>
            <div id="dvMessage">

            </div>


        </div>
        <div id="Autor">
            <div id="Agregado">
                <div id="LibroAutor">
                    <form class="contact_form1"  method="post" name="contact_form" autocomplete="off">
                        <ul>
                            <li>
                                <h2>Agregar Autor</h2>
                                <span class="required_notification">* Datos Requeridos</span>
                            </li>
                            <li>
                                <label for="name">Isbn Libro</label>
                                <input type="text" id="isbnCopia" placeholder="John Doe" required />
                                <span class="form_hint">"Ingrese el Isbn Libro "</span>
                            </li>
                            <li>
                                <label for="name">Autor</label>
                                <script type="text/javascript" >
                            /*========Check para habilitar desabilitar Tomod  del libro==========*/
                            function controlT(ctl)
                            {
                                if (!ctl.form.check.checked)
                                    ctl.blur()
                            }

     /*==================================funcion para buscar el autor==========*/
                            function Buscar(evento,txtBusqueda)
                            {
                                var dato = txtBusqueda.value;
                                var keycodigo=evento.keyCode.toString();
                                var key = "valuekey=" + dato;

                                if (dato.length>=2)
                                {
                                    if (keycodigo=='40' || keycodigo=='13')
                                    {


                                    $.ajax({
                                        url: 'CuerposAdministrar/BuscarAutor.jsp',
                                        data: key,
                                        type: 'POST',
                                        //  url:'usuarios.php',
                                        success: function(result)
                                        {
                                            $("#dvAutores").html(result);

                                        }


                                       });

                                    }

                                }
                                else
                                {

                                    $("#dvAutores").html('no encontrado');
                                }
                            }

/*==========================Registro de Nuevos libros===============================*/
                            $(document).ready(function()
                            {


                                $("#frmDtsLbro").submit(function()
                                {
                                    var x = $("#btnguardarLibro").val();

                                    if (x=="envio")
                                    {
                                        $.post("../SinsertLibro", $("#frmDtsLbro").serialize(), function(data)
                                        {
                                            $("#dvMessage").html(data);
                                            $("#isbnLibro").focus();
                                            //$("#Autor").hide();


                                        });
                                        return false;

                                    }
                                    else
                                        return true;
                                });


                            });



/*======================Registro de Nuevo Autor===============================*/
                            $(document).ready(function()
                            {

                                $("#formAjax").submit(
                                   function()
                                   {

                                    var x = $("#btnguardar").val();

                                    if (x=="enviar")
                                    {
                                        var datos = $("#formAjax").serialize();

                                        $.ajax(
                                                {
                                                            url: 'CuerposAdministrar/RegistrarAutor.jsp',
                                                            data: datos,
                                                            type: 'POST',
                                                            success: function(respuesta)
                                                            {
                                                                alert(respuesta);

                                                                $("#formAjax").hide();
                                                                $("#formAjax")[0].reset();
                                                                $('#dialogoFormulario').dialog('close');//cerrando ventana de registro de autor

                                                            }
                                                        }
                                                );
                                        return false;
                                    }
                                    else
                                        return true;
                                });


                            });

                            ////////////////////////////////////////////
                            function AddCodigoI(codigo)
                            {
                                var cod = "codigo=" + codigo + "&isbn=" + $("#isbnCopia").val();


                                $.ajax({
                                    url: 'CuerposAdministrar/Autor_Libro.jsp',
                                    data: cod,
                                    type: 'POST',
                                    success: function(result)
                                    {

                                        //$("#tcontenido").append(result);
                                        $("#tcontenido").html(result);
                                        $("#bsqAutor").val('');
                                        $("#bsqAutor").focus();
                                        $("#dvAutores").html('');
                                    }


                                });




                            }
/*============FUNCION PARA LISTAR AUTORES PAR EL LIBRO==========================*/
                            function deleteAutor(codigo)
                            {
                                var cod = "codigo=" + codigo;
                                $.ajax({
                                    url: 'CuerposAdministrar/Delete_Autor.jsp',
                                    data: cod,
                                    type: 'POST',
                                    success: function(result)
                                    {
                                        $("#tcontenido").html(result);
                                    }


                                });
                            }

//=============funcion para verificara si el  libro ya esta en la base de dato=======//

                            function VerlibroExiste(isbn, option)
                              {
                                switch (option)
                                {

                                    case 0:

                                        $.post("../Stlibro", {option: '4', isbn: isbn}, function(data)
                                        {
                                            $("#dvMessage").html(data);
                                            // alert(data);
                                            // $("#frmDtsLbro")[0].reset();
                                            // $("#Autor").hide();


                                        });

                                        break;
                                    case 1:
                                        $("#dvMessage").html('');
                                        $.post("../Stlibro", {option: '2', isbn: isbn}, function(data)
                                        {
                                            $("#dvMessage").html(data);
                                            // alert(data);
                                            // $("#frmDtsLbro")[0].reset();
                                            // $("#Autor").hide();


                                        });

                                        break;
                                    case 2:
                                        $("#dvMessage").html('');//limpiando el message
                                        $('#frmDtsLbro')[0].reset();
                                        $('#frmDtsLbro').show();//activando el formulario
                                        break;



                                }




                            }
                            // registro de nuevo autor
                            function encenderNuevoAutor()
                            {

                                $("#formAjax")[0].reset();//limpiando formulario
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
                                $('#formAjax').click(function()
                                {
                                    $('#dialogoFormulario').dialog('open');
                                });


                               /* $('#formAjax').validate({
                                    submitHandler: function()
                                    {



                                    },
                                    errorPlacement: function(error, element)
                                    {
                                        error.appendTo(element.prev("span").append());
                                    }
                                });*/
                                // });

                            }
                            </script>

                                <input type="text" id="bsqAutor" name="txtAutor"  onkeyup="Buscar(event,this)"/>

                                <div id="dvAutores">

                                </div>

                                <span class="form_hint">"Ingrese el Isbn LIbro "</span>
                            </li>
                            <li>
                                <!--  <button  class="submit" type="button" onclick="encenderNuevoAutor()" id="rNuevoAutor">Nuevo Autor</button>-->
                                <a href='#' class="submit" onclick="encenderNuevoAutor()" id="rNuevoAutor">Registrar Nuevo Autor</a>

                            </li>
                        </ul>
                    </form>
                </div>
            </div>

            <div id="TablaAgregar">

                <table cellspacing="0" cellpadding="0">
                    <thead>
                        <tr>
                            <th>nombre</th>
                            <th>apellidos</th>
                            <th>Especialidad</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody id="tcontenido">


                    </tbody>
                </table>

            </div>
        </div>



    </div>


    <!--FORMULARIO NUEVO AUTOR EN FLOTANTE-->
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