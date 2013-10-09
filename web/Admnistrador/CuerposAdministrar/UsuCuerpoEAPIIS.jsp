<%@page import="java.util.List"%>
<%@page import="Modelo.CUsuario"%>
    
 <script type="text/javascript" >
               
             /*Muestra el contenido del Servelht*/  
                $(document).ready(function() 
                  {  
                  $.post("CuerposAdministrar/LstUsersEapiis.jsp",function(data) //../SselectUsuarios
                        {
                                       
			$("#Tablainforme").html(data);
                                               
	            }); 
            
});
      function EditarAdmin(codigo)
            {
                                var cod="codigo="+codigo;                               
                                $.ajax
                                        (
                                        {
                                            url:'CuerposAdministrar/Edicion_usuario.jsp',
                                            data:cod,
                                            type:'POST',
                                            success:function(data)
                                                   {
                                                      $("#specialBox").html(data);
                                    
                                                     var overlay = document.getElementById('overlay');
            	                             overlay.style.opacity = .8;
                                                      if(overlay.style.display == "block")
                                                      {
                                                      
                                                            specialBox.style.display = "none";
                                                         } 
                                                      else {
                                                           overlay.style.display = "block";
                                                            specialBox.style.display = "block";
                                                         }  
                                                        
                                               }
                                        }
                                        );
                
            }
      //funcion para habiltara o deshabilitara al usuario      
            function Habilitar(checked,codouser)
         {
             $("#"+codouser).html("<img id='imglogin'  src='../Imagenes/habilitar.gif' />");
             var valor=checked.value;
               if(valor=="true")
                {
                     valor="false";
                }
                else
                    {
                        valor="true";
                    }
                    
                $.post("../Stusuario",{option:1,codigo:codouser,estado:valor}, function(data)
                {
         
                    $("#"+codouser).html(data);
      
                 })       
                 
         }
         
         
         //Eliminar usuario
         
         
       function Eliminar_usuario(codouser)
         {
             if (window.confirm("Desea realmente eliminar!")) 
             {
                 $.post("../Stusuario",{option:8,codigo:codouser}, 
                 function(data)
                     {
         
                       alert(data);
                       $.post("CuerposAdministrar/LstUsersEapiis.jsp",function(data) //../SselectUsuarios
                        {
                                       
			$("#Tablainforme").html(data);
      
                        });
    
                      });
          }
         }
                    
                
         
              
            
      //***************************************************************//      
      function verchebox(dato)
      {
          var valor=dato.value;
          alert("hola:"+valor);
          
          
      }
            
            </script>
            
<div id="Contenido">
    <div id="MenuLateral">
       <a href="index.php" class="_parent"><span></span>Busqueda de libros por</a>
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
        </div> 
        <div id="Tablainforme">       
            
        </div>
        <div id="AdministrarDatos">
  
                 
        </div>
    </div>
</div>
            
        