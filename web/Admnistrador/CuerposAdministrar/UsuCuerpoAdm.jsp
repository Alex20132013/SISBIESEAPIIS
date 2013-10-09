<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>
        <script type="text/javascript" >
            /*=========================================================================*/
            $(document).ready(function()
            {
                $.post("../Stadministrador", {option:"0",cat: 'A'}, function(data)
                {

                    $("#tbodyadm").html(data);

                });
                //bloqueando el envio del formulario al index->ingesandp nuevo administrador

                $("#frmRegistrar").submit(function() 
                {
                    var x = $("#Rolo4545").val();
                    if (x=="enviar")
                    {
                        //alert($("#frmRegistrar").serialize());

                            $.post("../Stadministrador", $("#frmRegistrar").serialize(),
                                function(data)
                                {
                                      alert(data);
                                      $('#AdministrarDatos').dialog('close');
                                    //actualizado la vista de administradores
                                    $.post("../Stadministrador", { option:'0', cat: 'A'}, function(data)
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
                 $('#frmEditar').html('');
                                 
                 $.post("../Stadministrador", {option:'2',codigo:codigouser}, 
                 function(data)
                 {
                   $("#frmEditar").html(data);
                 //$("#frmEditar").show();
                 });         
                 

                insbn_libro = codigouser;
               // $("#frmEditar")[0].reset();//limpiando formulario
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
                    /*$('#frmEditar').validate({
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
                    });*/
                });


            }
            /*=========================================================================*/
            function DeteleAdmin(codigo)
            {

                if (confirm("Realmente desea eliminar?"))
                {           

                    $cod = codigo;

                    $.post("../Stadministrador", {option:'3', cod_admin: $cod},
                    function(data)
                    {
                        alert(data);
                        //actualizado la vista de administradores despues de eliminar
                        $.post("../Stadministrador", {option:'0',cat: 'A'}, function(data)
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
                        $.post("../Sguardar_editado", {option:'0',cat: 'A'}, function(data)
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
            
            
            ///GUARDANDO LA EDICION DE DATIOS DEL ADMINISTRADOR
            
            $("#frmEditar").submit(function() 
                {
                    var x = $("#idSaveEdit").val();
                    if (x=="enviar")
                    {
                        //alert($("#frmEditar").serialize());

                            $.post("../Stadministrador", $("#frmEditar").serialize(),
                                function(data)
                                {
                                      alert(data);
                                      $('#dialogoFormulario').dialog('close');
                                    //actualizado la vista de administradores
                                    $.post("../Stadministrador", { option:'0', cat: 'A'}, function(data)
                                    {
                                        $("#tbodyadm").html(data);
                                        $("#frmRegistrar")[0].reset();                                         
                                        $("#frmEditar").html('');//limpiando frm editable     
                                    });


                                });
                        return false;
                    }
                    else
                        return true;
                });

        </script>



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
        </table>
        <div id="Tablainforme">
            <p>lista de administradores</p>
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
                        <th>Nuevo Administrador</th> 
                        
                    </tr>
                </thead>
                <tbody id="tbodyadm">

                </tbody>
            </table>




        </div>
        <div id="AdministrarDatos" title="Pagina de Administrador" > 
            <form class="contact_form" action="#" method="post" name="contact_form"  id="frmRegistrar" onsubmit="return comprobar(this)" style="display: none;">
                <ul>  
                    <li>
                     <!--   <h2>Registro Administrador</h2>-->
                        <span class="required_notification">* Datos Requeridos</span>
                    </li>
                    <li>
                        <label for="name">CodigoAdm:</label>
                        <input type="number" name="txtCod" placeholder="025255" pattern="[0-9]{3,12}" required />
                        <span class="form_hint">"Codigo administrador"</span>
                    </li>
                    <li>
                        <label for="name">Nombre:</label>
                        <input type="text" name="txtNombre" placeholder="Juan" pattern="[A-Za-z ñÑáéíóúüç]{3,30}" required />
                        <span class="form_hint">"Ingrese solo Letras>3 dígitos"</span>
                    </li>
                    <li>
                        <label for="name">Apellidos:</label>
                        <input type="text" name="txtApellidos" placeholder="Soto Inca"  pattern="[A-Za-z ñÑáéíóúüç]{3,30}" required />
                        <span class="form_hint">"Ingrese solo letras>3 a 3 Dígitos"</span>
                    </li>
                    <li>
                        <label for="email">Correo:</label>
                        <input type="email" name="correo" placeholder="john_doe@example.com" required />
                        <span class="form_hint">"Forma de ingresar "nombre@ejemplo.com"</span>
                    </li>
                    <li>
                        <label for="name">contraseña:</label>
                        <input type="password" name="txtPwd"  pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required />
                        <span class="form_hint">"Contraseña por lo menes un numero un una Letra Mayuscula"</span>
                    </li>
                    <li>
                        <label for="name">RepitaContraseña:</label>
                        <input type="password" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required />
                        <span class="form_hint">"Repita su contraseña"</span>
                    </li>
                    <fieldset>
                        <legend>Estado Administrador</legend>
                        <input type="radio" name="estadoAdmi" value="habilitado" checked="checked" required onclick="HabilitarEstado(this)" />Habilitado<br>
                        <input type="radio" name="estadoAdmi" value="desabilitado" required="" onclick="HabilitarEstado(this)"/>Desabilitado
                        <input type="hidden" id="estadoAdm" value="habilitado" />
                    </fieldset>  
                    <li>

                        <input type="hidden" name="dlsCate" value="A"/>
                        <input type="hidden" name="option" value="1"/>  
                    </li>

                    <li>
                        <label for="name">Fecha Registro:</label>
                        <input type="datetime"  name="dateVen" placeholder="2013/01/03" required />
                    </li>
                    <li>
                        <button  class="submit" type="submit" id="Rolo4545" value="enviar" >Enviar</button>
                        <button  class="submit" type="reset">Restablecer</button>
                    </li>
                </ul>
            </form>

            

        </div>

        <!--fFORMULARIO DE DETALLE ADMINISTRADOR EN FLOTANTE-->
        <div id="dialogoFormulario" title="Ventana Edicion Administrador" style="display:none;">
            <form action="" method="post" id="frmEditar" name="formAjax">
                
            </form>
            
        </div>
        
    </div>
</div>
