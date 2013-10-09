<% request.getRequestDispatcher("../llamdasDIVDFlotante.jsp").include(request, response);%>

<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>



      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../Css/estilosGeneral.css" rel="stylesheet" type="text/css"/>     
        <link href="../Css/estilomenu.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
        <link href="../Css/CssAdministrador/RegistroAdm.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/CssAdministrador/RegistroLibros.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/CssAdministrador/estiloRegistro.css" rel="stylesheet" type="text/css"/>
        <link href="../Css/CssAdministrador/estiloRegistro_1.css" rel="stylesheet" type="text/css"/>
        
        
       
        <script src="../javascripts/eventologin.js" type="text/javascript"></script>
       <script src="../javascripts/jquery.tipsy.js" type="text/javascript"></script>
        <script src="../javascripts/eventologin2.js" type="text/javascript"></script>
        <script src="../javascripts/jquery.pop.js" type="text/javascript"></script>
        <script src="../javascripts/validacionContrasena.js" type="text/javascript"></script>
        
        
        <!--importacion de Modernazr para ver la compativilidad de los navegadores-->
        <script src="../javascripts/modernizr.custom.js" type="text/javascript"></script>
        
        
        <script src="../javascripts/FuncionesDivFlotantes.js" type="text/javascript"></script>
        <!--<script id="estilo" src="*" type="text/javascript"></script>
         Para la tabla -->
        <link href="../Css/CssAdministrador/EstiloTabla1.css" rel="stylesheet" type="text/css" media="screen" />
        <script type="text/javascript" src="../javascripts/TablaClock.js"></script>
        <!--  -->
        <script src="../javascripts/ContenidoAjax.js" type="text/javascript"></script>
        <!-- carrucel portada -->
       <link type="text/css" href="../Css/CssAdministrador/estiloImagenesPortada.css" rel="stylesheet" />
        
        <script type="text/javascript" src="../javascripts/jqueryImagenesPortada/jquery.pikachoose.js"></script>
        <script type="text/javascript" src="../javascripts/jqueryImagenesPortada/funn.js"></script>
        <!--Div Flotante-->
        <script type="text/javascript" language="javascript" src="../javascripts/dialogos.js"></script>
        <link href="../Css/dialogo.css" rel="stylesheet" type="text/css"/>    
         

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="btnModal">Mostrar</div>
       <div id="dialogoFormulario" title="Ventana detalles de Libro" style="display:none;">
            <form action="" method="post" id="formAjax" name="formAjax">
                <fieldset id="datosContacto">
                    <label for="rg_nombre">Codigo de Usuario</label>
                    <span></span>
                    <input type="text" id="rg_nombre" name="codigo_user" class="{required:true}"/>
                    <label for="rg_apellidos">Seleccione</label>
                    <span></span>
                    <select name="opcion_select" id="idselect" onchange="ValidarPedido(this)">
                        <option value="0">En Sala</option>
                        <option value="1">A Domicilio</option>
                    </select>
                    <!--<input type="text" id="rg_apellidos" name="rg_apellidos" class="{required:true}"/>-->
                    <label for="rg_correoE">Codigo de barra</label>
                    <span></span>
                    <input type="text" id="rg_correoE" name="isbn_libro" class="{required:true,number:true}"/>

                </fieldset>
                <fieldset id="botonera" style="border:none; text-align: center;">
                    <input id="envioFormulario" class="boton" type="submit" value="Continuar" name="envioFormulario">
                </fieldset>
            </form>
        </div>
  <!--FORMULARIO DE INDECE LIBROS -->
        <div id="dialogModal" title="Ventana de Diálogo Imagenes" style="display:none;">
            <p> Hola este mensaje es de Prueba
                EN ESTAS PARTE IRA LOS INDICES DE CADA LIBRO COMO TIPO GALERIA
            </p>

        </div>
    </body>
    <script type="text/javascript">
         
                    $("#formAjax")[0].reset();//limpiando formulario
                    $(document).ready(function()
                    {

                        //limpiando el formularion dialog   
                        // Formateamos el botón Diálogo sencillo
                        $('#btnModal').button();
                     
        $("#rg_correoE").val();
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
                        $('#btnModal').click(function() {
                            $('#dialogoFormulario').dialog('open');
                        });

                        //insertadando el codigo de barra

                        // Validamos el formulario
                        $('#formAjax').validate({
                            submitHandler: function()
                            {


                                $.post($("#formAjax").serialize(),
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
    </script>
</html>
