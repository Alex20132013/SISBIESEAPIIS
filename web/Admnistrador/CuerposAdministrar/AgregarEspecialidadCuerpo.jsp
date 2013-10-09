<!--Js. para llamar para el DIALOG Como para procesar el prestamo-->
<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>

<div id="Contenido">
  
    <div id="MenuLateral">
        <a href="#" class="_parent"><span></span>Libros mas prestados</a>
        <ul>
            <li><a href="#" class="_parent"><span></span>Aplizacion web </a></li>
            <li><a href="#" target="_parent"><span></span>Circuitos</a></li>
            <li><a href="#" target="_parent"><span></span>Ingenieria de Software</a></li>
            <li><a href="#" target="_parent"><span></span>Programacion</a></li>
            <li><a href="#" target="_parent"><span></span>Seguridad</a></li>
        </ul>
        
    </div>
     <div id="Catalogo">
        <div id="Tablainforme">
            <h2>lista de Especialidad</h2>
              <table cellspacing="0" cellpadding="0">
                  <thead>
                    <tr>
                            <th>nombre Especialidad</th>
                            <th>Descripcion</th>
                            <th>Editar</th>
                            <th>Eliminar</th>
                            <th>Nuevo Especilidad </th>
                            
                    <tr>
                 </thead>
                 <tbody  id="espLista">
                           
                    
                  </tbody>  
                  <tfoot>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                  </tfoot>
                </table>
        </div>
         
         <script type="text/javascript">
                
                $(document).ready(function() 
                                    {
                                      
                                    
                                     $.post("Especialidad/ListarEspecilaidad.jsp",function(data) 
                                      {
                                       
			       $("#espLista").html(data);
                                           $("#frmEditar").hide();     
	                          });
                
                                        $("#frmEspecialidad").submit(function() 
                                        {
                                            $("#frmEspecialidad").append("<input type='hidden' value='1' name='option' />");
                                          var x = $("#btnRegEsp").val();
                                            if (x=="envio") 
                                            {       
                                              
                                              // alert($("#frmEspecialidad").serialize());                                    
                                               
                                               $.post("../Stespecialidad",$("#frmEspecialidad").serialize(),function(data) 
                                                 {
                                       
                                                         alert(data);//mensaje dretorno de agrgado
                                                         $.post("Especialidad/ListarEspecilaidad.jsp",function(data) 
                                                           {
                                       
			                          $("#espLista").html(data);//actualizando la tabla especialidad
                                               
	                                               });
                                                       $("#frmEspecialidad")[0].reset();
                                                       
                                                       
                                               
                                                  }); 
                                                return false;
                                                
                                            } 
                                            else
                                                return true;
                                        });
    
               
                                    });
                                    
               function Editar_esp(id_especialidad)
               {
                             /*  $("#frmEspecialidad").hide();
                                
                              
                                
                                $.post("Especialidad/ListarEspecilaidad.jsp", {codigo:id_especialidad}, 
                                function(data)
                                {
                                    $("#frmEditar").html(data);
                                    $("#frmEditar").show();
                                    
                                });*/
                                            
                               $("#frmEspecialidad")[0].reset();//limpiando formulario
                                $("#frmEspecialidad").show();
                                $('#AdministrarEspecialidad').dialog({
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
                                $('#llamarNuevoEspecialidad').click(function()
                                {
                                    $('#AdministrarEspecialidad').dialog('open');
                                });   
                
                
              }    
              
              
              function GuardarEditado()
            {
                if (confirm("Realmente desea modificar?")) 
                {
                    
                   $("#frmEditar").append("<input type='hidden' value='2' name='option' />");
                   alert($("#frmEditar").serialize());
                    $.post("../Stespecialidad",$("#frmEditar").serialize(),function(data) 
                                   {
			
                                     alert(data);
                                        $.post("Especialidad/ListarEspecilaidad.jsp",function(data) 
                                        {
                                       
			     $("#espLista").html(data);
                                         $("#frmEspecialidad").show();//activado formulario registro
                                         $("#frmEditar").html('');//limpiando frm editable
                                               
	                            });
			}); 
                          
                }
            }
            
            function Eliminar_esp(id_esp)
            {
                var opcion=3;
                alert(id_esp);
                $.post("../Stespecialidad",{option:opcion,id_especialidad:id_esp},function(data) 
                                   {
			
                                     alert(data);
                                        $.post("Especialidad/ListarEspecilaidad.jsp",function(data) 
                                        {
                                       
			     $("#espLista").html(data);
                                         $("#frmEspecialidad").show();//activado formulario registro
                                         $("#frmEditar").html('');//limpiando frm editable
                                               
	                            });
			});
                
                
            }
            
            function nuevoEspecialidad()
            {
                 $("#frmEspecialidad")[0].reset();//limpiando formulario
                                $("#frmEspecialidad").show();
                                $('#AdministrarEspecialidad').dialog({
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
                                $('#llamarNuevoEspecialidad').click(function()
                                {
                                    $('#AdministrarEspecialidad').dialog('open');
                                });
            }
                
            </script>
            <div id="AdministrarEspecialidad" title="Formulario Nuevo Especialidad">
            <form class="contact_form" id="frmEspecialidad" action="#" method="post" name="contact_form" style="display: none;">
                <ul>  
                    <li>
                        <!-- <h2>Registrar Especialidad</h2>
                         <span class="required_notification">* Datos Requeridos</span>-->
                    </li>
                    <li>
                        <label for="name">Nombre Especialidad</label>
                        <input type="text" name="txtEsp"  placeholder="John Doe" required />
                    </li>
                    <li>
                        <label for="name">Ingrese descripcion:</label>                   
                        <p><textarea cols="50" name="txaDescp" rows="5" maxlength="200" placeholder="Aqui puedes poner tus comentarios.....!! 200 Caracteres" title="si tienes algun comentario lo puedes escribir aqui" required></textarea></p>
                    </li>
                   
                    <li>
                        <button  class="submit" type="submit" id="btnRegEsp" value="envio" >Guardar</button>
                        <button  class="submit" type="reset">Restablecer</button>
                    </li>
                </ul>
            </form>
            <form id="frmEditar" >
                
              </form>
        </div>
    </div>
</div>

