<div id="Contenido">
    <meta charset="UTF-8">
    <div id="MenuLateral">
        <a href="index.php" class="_parent"><span></span>Libros mas prestados</a>
        <ul>
            <li><a href="#" class="_parent"><span></span>Aplizacion web </a></li>
            <li><a href="#" target="_parent"><span></span>Circuitos</a></li>
            <li><a href="#" target="_parent"><span></span>Ingenieria de Software</a></li>
            <li><a href="#" target="_parent"><span></span>Programacion</a></li>
            <li><a href="#" target="_parent"><span></span>Seguridad</a></li>
        </ul>
    </div>
    <div id="Catalogo">
       <script type="text/javascript" >
          
                            /*========Check para habilitar desabilitar Tomod  del libro==========*/
                            function controlT(ctl)
                            {
                                if (!ctl.form.check.checked)
                                    ctl.blur()
                            }
                          
                            function Submite()
                                {
                                   
                                    var coduser=document.getElementById("codUser").value;
                                    var nombre=document.getElementById("idNombre").value;
                                    var apellidos=document.getElementById("idApellido").value;
                                    var correo=document.getElementById("Emailuser").value; 
                                    var estado=document.getElementById("cbxEstuser").value;
                                    var huella=document.getElementById("HuellaDigital").value;                                     
                                    var datos="codigo="+coduser+"&option=4&nombre="+nombre+"&apellidos="+apellidos+"&correo="+correo+"&estado="+estado+"&huella_digital="+huella;
                                     $.ajax({
                                        url: '../Stusuario',
                                        data: datos,
                                        type: 'POST',
                                        //  url:'usuarios.php',
                                        success: function(result)
                                        {
                                            alert(result);         
                                            document.getElementById("dvUsuario").innerHTML="";            
                                            
                                        }


                                       }); 
                                  
                                
                                  
                                        return false;

                                    
                                }
                            
                            
                            
      function CargarUsuario()
                           {                         
                             
                                 var datos="codigo="+document.getElementById("codUser").value+"&option=3";
                                 //var datos="codigo=&option=3";
                                
                               $.ajax({
                                        url: '../Stusuario',
                                        data: datos,
                                        type: 'POST',
                                        //  url:'usuarios.php',
                                        success: function(result)
                                        {
                                            //$("#dvAutores").html(result);
                                           
                                            document.getElementById("dvUsuario").innerHTML=result;
                                        }


                                       });         
                                        
                                        
                                        
                              
                                
                                
                            }
       ///funcion para activar al usuario
       
       function ActivarEstado(elemento)
       {
           var valorestado=elemento.value.toString();
           
           if (valorestado=='ON') 
           {
               
               document.getElementById("cbxEstuser").value="OFF";
               document.getElementById("lbEstadoUser").innerHTML='Usuario:Inhabilidado';
               
               document.getElementById("lbEstadoUser").style.color='red';
           }
           else
            {
                
                
             document.getElementById("cbxEstuser").value="ON";
             document.getElementById("lbEstadoUser").innerHTML='Usuario:Habilitado';
             document.getElementById("lbEstadoUser").style.color='blue';
                
            }
           
           
          
           
       }
                            
                            
        </script>
        <form class="registro_form" id="cidHabilitarUser" method="post" name="contact_form" onsubmit=" return Submite();">
            <ul>
                <li>
                    <h2>Formulario Habilitar Usuario</h2>
                </li>
                <ul>
                    
                    <li>
                        <label for="name">Codigo Usuario:</label>
                        <input type="number" name="usuario" id="codUser" placeholder="082133" title="Se necesita Un Código Usu.. y de 6 Digitos" pattern="|^\d{6}$|" autofocus required/>
                        <button type="button" class="submit" onclick="CargarUsuario();"  >Cargar Usuario </button>
                    </li>
                    
                    <div id="dvUsuario">
                    
                    </div> 
                    
                   
                                       
                </ul>
        </form>

    </div>

</div>
