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
        <div id="Tablainforme">
            <h2>lista de Bibliotecario</h2>
            <table cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>Codigo</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Estado</th>                         
                        <th>Categoria</th>
                        <th>Fecha Registro</th>
                        <th>Fecha Vencimiento</th>
                        <th>Editar</th>
                        <th>Eliminar</th>  
                        <th>Nuevo Bibliotecario</th>  
                        
                    </tr>
                </thead>
                <tbody id="tbodyadm">

                </tbody>		
            </table>
        </div>

       <script type="text/javascript" >
            /*=========================================================================*/
            $(document).ready(function()
            {
                $.post("../Stadministrador", {option:"0",cat: 'B'}, function(data)
                {

                    $("#tbodyadm").html(data);

                });
                //bloqueando el envio del formulario al index->ingesandp nuevo administrador

                $("#frmRegistrar").submit(function() {
                    var x = $("#Rolo4545").val();
                    if (x =="enviar")
                    {
                        //alert($("#frmRegistrar").serialize());

                            $.post("../Stadministrador", $("#frmRegistrar").serialize(),
                                function(data)
                                {
                                      alert(data);
                                      $('#AdministrarDatos').dialog('close');
                                    //actualizado la vista de administradores
                                    $.post("../Stadministrador", { option:'0', cat: 'B'}, function(data)
                                    {

                                        $("#tbodyadm").html(data);
                                        $("#frmRegistrar")[0].reset();
                                         
                                        
                                    });


                                });
                        return false;
                    }
                    else
                        return true;
                });


            });

            /*=========================================================================*/
            function EditarAdmin(codigouser)
            {

                  //$("#frmRegistrar").hide();
                 
                 $cod=codigouser;
                 
                 $.post("../SselectAdmin", {codigo:$cod}, 
                 function(data)
                 {
                 $("#frmEditar").html(data);
                 $("#frmEditar").show();
                 
                 });
                 
                 /*insbn_libro=codigouser;
                 // $("#formAjax")[0].reset();//limpiando formulario
                 
                 $(function() {
                 // Ventana Modal
                 $("#dialogModal").dialog({
                 autoOpen: false,
                 modal: true
                 });
                 
                 $('#btnModal').on('click', function() {
                 $("#dialogModal").dialog('open');
                 return false;
                 });
                 });*/

                insbn_libro = codigouser;
                $("#frmEditar")[0].reset();//limpiando formulario
                $(document).ready(function()
                {

                    //limpiando el formularion dialog   
                    // Formateamos el botón Diálogo sencillo
                    $('#btnModal').button();

                    $("#rg_correoE").val(insbn_libro);
                    // Damos formato a la Ventana de Diálogo
                    $('#dialogoFormulario').dialog({
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
                    $('#btnModal').click(function() 
                    {
                        $('#dialogoFormulario').dialog('open');
                    });

                    //insertadando el codigo de barra

                    // Validamos el formulario
                    $('#frmEditar').validate({
                        submitHandler: function()
                        {


                            $.post($("#frmEditar").serialize(),
                                    function(data)
                                    {

                                        alert(data);
                                        $('#dialogoFormulario').dialog('close');
                                    });



                        },
                        errorPlacement: function(error, element) {
                            error.appendTo(element.prev("span").append());
                        }
                    });
                });


            }
            /*=========================================================================*/
            function DeteleAdmin(codigo)
            {

                if (confirm("Realmente desea eliminar?"))
                {


                    /* $.ajax
                     ({
                     url:'detele.jsp',                       
                     data :cod,
                     type:'POST',
                     success : function(respuesta)
                     {
                     //$("#datos").html(respuesta);
                     alert(respuesta);
                     location.reload(true);
                     }
                     
                     });    */

                    $cod = codigo;

                    $.post("../Stadministrador", {option:'3', cod_admin: $cod},
                    function(data)
                    {
                        alert(data);
                        //actualizado la vista de administradores despues de eliminar
                        $.post("../Stadministrador", {option:'0',cat: 'B'}, function(data)
                        {

                            $("#tbodyadm").html(data);

                        });


                    });
                }

            }
            /*=========================================================================*/
            function GuardarEditado()
            {
                if (confirm("Realmente desea modificar?"))
                {

                    // alert($("#frmEditar").serialize()); 
                    $.post("../Sguardar_editado", $("#frmEditar").serialize(), function(data)
                    {

                        alert(data);
                        $.post("../SselectAdmin", {cat: 'A'}, function(data)
                        {

                            $("#tbodyadm").html(data);
                            $("#frmRegistrar").show();//activado formulario registro
                            $("#frmEditar").html('');//limpiando frm editable

                        });
                    });

                }
            }
            /*=========================================================================*/
            function CancelarEditado()
            {
                if (confirm("Realmente desea calcelar?"))
                {


                    $("#frmEditar").hide();
                    $("#frmRegistrar").show();

                }
            }
            /*=========================================================================*/
            function Habilitarpassword()
            {

                $("#pwdHabilitar").removeAttr('disabled');
            }
            /*==========================================================================*/
            function HabilitarEstado(parametro)
            {
                var valor = parametro.value;
                $("#estadoAdm").val(valor);
            }
            /*==========================================================================*/

            function AgregarNuevoAdmin(e)
            {

                if (!(window.confirm("Do you want to submit the form?")))
                    e.returnValue = false;
            }

            /*============================================================================*/
            
            function nuevoAdmin()
            {
                $("#frmRegistrar")[0].reset();//limpiando formulario
                                $("#frmRegistrar").show();
                                $('#AdministrarDatos').dialog({
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
                                $('#llamarNuevoAdmin').click(function()
                                {
                                    $('#AdministrarDatos').dialog('open');
                                });

            }

        </script>

        <div id="AdministrarDatos" title="Ventana Bibliotecario">
            <form class="contact_form" action="#" method="post" name="contact_form" id="frmRegistrar" onsubmit="return comprobar(this)" style="display: none;">
                <ul>  
                   <!-- <li>
                        <h2>Registro Bibliotecario</h2>
                        <span class="required_notification">* Datos Requeridos</span>
                    </li>-->
                    <li>
                        <label for="name">CodigoAdm:</label>
                        <input type="number" name="txtCod"   placeholder="021152" required title="Código Admin. Solo Numerco:" pattern="[0-9]{3,12}"  />
                        <span class="form_hint">"Codigo administrador"</span>
                    </li>
                    <li>
                        <label for="name">Nombre:</label>
                        <input type="text" name="txtNombre" placeholder="juan" title="Nombre Usuario solo Caracteres >3" pattern="[A-Za-z ñÑáéíóúüç]{3,30}" required />
                        <span class="form_hint">"Ingrese solo Letras"</span>
                    </li>
                    <li>
                        <label for="name">Apellidos:</label>
                        <input type="text" name="txtApellidos" placeholder="Huaman Serrano" pattern="[A-Za-z ñÑáéíóúüç]{3,30}" required />
                        <span class="form_hint">"Ingrese solo letras"</span>
                    </li>
                    <li>
                        <label for="email">Correo:</label>
                        <input type="email" name="correo" placeholder="john_doe@example.com" required />
                        <span class="form_hint">"Forma de ingresar "nombre@ejemplo.com"</span>
                    </li>
                    <li>
                        <label for="name">contraseña:</label>
                        <input type="password"  name="txtPwd"   pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required />
                        <span class="form_hint">La Contraseña al menos debe contener una letra mayúscula y un Número"</span>
                    <li>
                        <label for="name">RepitaContraseña:</label>
                        <input type="password"  pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required />
                        <span class="form_hint">La Contraseña al menos debe contener una letra mayúscula y un Número"</span>
                        <fieldset>
                            <legend>Estado Usurio</legend>
                            <input type="radio" name="estadoAdmi" value="habilitado" checked="checked" required>Habilitado<br>
                            <input type="radio" name="estadoAdmi" value="desabilitado" required="">Desabilitado
                            <input type="hidden" id="estadoAdm" value="habilitado" />
                        </fieldset>     
                        <input type="hidden" name="dlsCate" value="B"/>
                    <li>
                        <label for="name">Fecha Registro:</label>
                        <input type="datetime" name="dateVen" placeholder="2012/04/01" required />
                    </li>
                    <li>
                        <button  class="submit" type="submit" id="Rolo4545" value="enviar">Agregar Nuevo</button>
                        <button  class="submit" type="reset">Restablecer</button>
                    </li>
                </ul>
            </form>
            <form id="frmEditar" >

            </form>
        </div>

        <!--FORMUALARIO DE DIV FLOTANTE-->
        <div id="dialogoFormulario" title="Ventana Bibliotecario" style="display:none;">
            <form action="" method="post" id="formAjax" name="formAjax">
                <fieldset id="datosContacto">
                    Codigo:<input type="text" name="txtCod" value="" requiered/><p></p> 
                    Nombre:<input type="text" id="rg_correoE"  name="txtNombre" value="" class="{required:true}"/><p></p>
                    Apellidos:<input type="text" name="txtApellidos" value="" requiered/><p></p>
                    Correo:<input type="email" name="correo" value="" requiered/><p></p>
                    Estado:<input type="checkbox" name="chbxEstado" checked="true"/>Habilitado<p></p>
                    Cambiar Password:<input type="checkbox" name="chbxPass" checked="false" onclick="Habilitarpassword()" />
                    <input type="password" name="txtPass" id="pwdHabilitar" disabled="false" /><p></p>
                    <input type="hidden" name="hdnCat" value=""/>
                    Fecha reg:<input type="date" name="dateIni" value="" requiered/><p></p>
                    Fecha ven:<input type="date" name="dateVen" value="" requiered/><p></p>
                </fieldset>
                <fieldset id="botonera" style="border:none; text-align: center;">
                    <input type="button" value="Guardar" onclick="GuardarEditado()" />
                    <input type="button" id="envioFormulario" value="Cancelar" onclick="CancelarEditado()" />
                    <input type="hidden" class="boton" name="txtEditar" value="editar" /><p></p>
                </fieldset>
            </form>
        </div>
    </div>

</div>
