<div id="Catalogo"> 
    <script type="text/javascript">
        
          function Submite()
                  {
                     
                   var codigo_user=document.getElementById("idCodigo").value;                      
                   var nombre=document.getElementById("idNombre").value;
                   var apellidos=document.getElementById("idApellido").value;
                   var tipo_usuario=document.getElementById("Id_Titpousuario").value;
                   var direccion=document.getElementById("idDireccion").value;                   
                   var correo=document.getElementById("idCorreo").value;                   
                   var password_nuevo=document.getElementById("idNuevo_pw").value;                                   
                   var datos="codigo="+codigo_user+"&option=6&nombre="+nombre+"&apellidos="+apellidos+"&correo="+correo+"&tipo_user="+tipo_usuario+"&password="+password_nuevo+"&direccion="+direccion;
                              
                   //alert(datos);
                  $.ajax({
                                        url: '../Stusuario',
                                        data: datos,
                                        type: 'POST',
                                        
                                        success: function(result)
                                        {
                                            alert(result);         
                                            document.getElementById("dvEditar").innerHTML="";            
                                            document.getElementById("liValidacion").innerHTML="";
                                            
                                        }


                                       }); 
                                  
                                
                                  
                                        return false;

                                    
                                }
       
       
       
       
       
        function Verificar_Validez(dato) 
        {
            var correo=document.getElementById("idCorreo").value;
            var codigo_user=document.getElementById("idCodigo").value;
            var password=dato.value;
            var datos="codigo="+codigo_user+"&correo="+correo+"&password="+password+"&option=5";
            
            
             $.ajax({
                      url: '../Stusuario',
                      data: datos,
                      type: 'POST',
                      success: function(result)
                        {
                                          // alert(result);         
                                            document.getElementById("liValidacion").innerHTML=result;            
                                            
                        }


                      });
            
            
        }
        
        function Cargar_datos()
        {
            var datos="codigo="+document.getElementById("idCodigo").value+"&option=7";
            document.getElementById("liValidacion").innerHTML=""; 
            $.ajax({
                      url: '../Stusuario',
                      data: datos,
                      type: 'POST',
                      success: function(result)
                        {
                                          // alert(result);         
                                            document.getElementById("dvEditar").innerHTML=result;            
                                            
                        }


                      });
            
           
        }
    </script>
    
        
    
    <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return Submite()">
        <ul>
            <li>
                <h2>Formulario Edicion Perfil</h2>
                <span class="required_notification">* Campos Obligatorios</span>
            </li>
            <li>
                <label for="name">Codigo Usuario:</label>
                <input type="number" id="idCodigo"  name="usuario" placeholder="082133" title="Se necesita Un Código Usu.. y de 6 Digitos" pattern="|^\d{6}$|" autofocus required />
                <button class='submit' type='button' id='bEnviar' onclick='Cargar_datos()'>Cargar datos </button>
            </li>
            <div id="dvEditar">    
                
                
           </div>
                    
            <li id="liValidacion">
                
            </li>
        </ul>
    </form>
</div>