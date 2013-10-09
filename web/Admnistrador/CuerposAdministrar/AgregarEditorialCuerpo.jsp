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
            <h2>Pagina Editorial</h2>
              <table cellspacing="0" cellpadding="0">
                  <thead>
                    <tr>
                            <th>Nombre Editorial</th>
                            <th>Web Editorial</th>
                            <th>Pais </th>
                            <th>Editar</th>
                            <th>Eliminar </th>
                            <th>Egregar</th>
                    <tr>
                 </thead>
                 <tbody  id="edtLista">
                           
                    
                  </tbody>     
                </table>
            
            <script type="text/javascript">
                
                $(document).ready(function() 
                                    {
                                    
                                    
                                     $.post("../Sselect_editorial",function(data) 
                                      {
                                       
			     $("#edtLista").html(data);
                                           $("#frmEditar").hide();     
	                          });
                
                                        $("#frmEditorial").submit(function() 
                                        {
                                          var x = $("#btnRegEdit").val();
                                            if (x=="envio") 
                                            {       
                                              
                                                                                 
                                               
                                               $.post("../Sreg_editorial",$("#frmEditorial").serialize(),function(data) 
                                                 {
                                       
                                                         alert(data);
                                                         $.post("../Sselect_editorial",function(data) 
                                                           {
                                       
			                          $("#edtLista").html(data);//actualizando la tabla editorial
                                               
	                                               });
                                                       $("#frmEditorial")[0].reset();
                                                       
                                                       
                                               
                                                  }); 
                                                return false;
                                                
                                            } 
                                            else
                                                return true;
                                        });
    
               
                                    });
                                    
               function Editar_editorial(id_editorial)
               {
                             /*
                              * Modo Antiguio para mostrar debajo no en DIALOG
                              *     $("#frmEditorial").hide();
                                alert(id_editorial);
                              
                                
                                $.post("../Sselect_editorial", {codigo:id_editorial}, 
                                function(data)
                                {
                                    $("#frmEditar").html(data);
                                    $("#frmEditar").show();
                                    
                                });*/
                                $("#nuevoAditorial")[0].reset();//limpiando formulario
                                $("#nuevoAditorial").show();
                                $('#AdministrarEditorial').dialog({
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
                                $('#llamarEditorial').click(function()
                                {
                                    $('#AdministrarEditorial').dialog('open');
                                });
              }    
              function nuevoEditorial()
              {
                                $("#nuevoAditorial")[0].reset();//limpiando formulario
                                $("#nuevoAditorial").show();
                                $('#AdministrarEditorial').dialog({
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
                                $('#llamarEditorial').click(function()
                                {
                                    $('#AdministrarEditorial').dialog('open');
                                });
              }
              
              function GuardarEditado()
            {
                if (confirm("Realmente desea modificar?")) 
                {
                    
                  // alert($("#frmEditar").serialize()); 
                    $.post("../Sreg_editorial",$("#frmEditar").serialize(),function(data) 
                                   {
			
                                     alert(data);
                                        $.post("../Sselect_editorial",function(data) 
                                        {
                                       
			     $("#edtLista").html(data);
                                         $("#frmEditorial").show();//activado formulario registro
                                         $("#frmEditar").html('');//limpiando frm editable
                                               
	                            });
			}); 
                          
                }
            }
                
            </script>   
        </div>
        <div id="AdministrarEditorial" title="Registro de Nuevo Editorial">
            <form class="contact_form" action="#" method="post" name="nuevoAditorial" id="nuevoAditorial" style="display:none;">
                <ul>  
                   <!-- <li>
                         <h2>Registrar Editorial</h2>
                         <span class="required_notification">* Datos Requeridos</span>
                    </li>-->
                    <li>
                        <label for="name">Nombre Edicion</label>
                        <input type="text"  placeholder="Mosera" name="txtNombre" title="Nombre Edición Solo texto>3 Digitos" pattern="[A-Za-z]{3,30}" required/>
                      
                    </li>
                    <li>
                        <label for="name">Pagina web </label>
                        <input type="url"  placeholder="htpp://www.portaltutoriales.com" name="txtURL"/>                   
                    </li>
                    <li>
                        <label for="name">Pais</label>
                        <input type="text"  placeholder="Perú" required name="txtPais"  title="Nombre País Solo texto>3 Digitos" pattern="[A-Za-z]{3,30}" />
                    </li>
                    <li>
                        <button  class="submit" type="submit" id="btnRegEdit" value="envio" >Agregar Nuevo</button>
                        <button  class="submit" type="reset">Restablecer</button>
                    </li>
                </ul>
            </form>
             <form id="frmEditar" >
                
              </form>
        </div>
    </div>
    
     
</div>
