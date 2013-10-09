

<div id="Contenido">
    <div id="MenuLateral">
       <a href="index.php" class="_parent"><span></span>Busqueda de libros por</a>
        <ul>
            <li><a href="index.php" class="_parent"><span></span>ISBN </a></li>
            <li><a href="encabezadoquienessomos.php" target="_parent"><span></span>Titulo</a></li>
            <li><a href="encabezadoContactanos.php" target="_parent"><span></span>Especialidad</a></li>
            <li><a href="comprar_producto.php" target="_parent"><span></span>Autor</a></li>

        </ul>
    </div>
    <script type="text/javascript">
        
        $("#btnAddBarra").click
        (
           function()
           {
              
            
               dato="isbn_libro="+$("#isbn_libro").val()+"&bar_code=";
               
               $.post("../SprintDeweyBarra", dato,
               function(data)
               {
                    
                  $("#reg_barra").html(data);
                  $("#isbn_libro").val('');
                  $("#isbn_libro").focus();          
               }
               );
               
              
             }
    
              );
       //mostrado codigos de barra       
       function Imprimir_barra()
       {
               
             
             

               
             
        
                     
               
              if(window.confirm(" Desea realmente imprimir"))
                  {
                      
                      //mostraando los codigos de barra para imprimie    
                     url = "../SprintPagina";
                     window.open(url, '_blank');
                      $("#reg_barra").html(''); 
                   /*$.post("../prueba",{parametro:"eliminar",delete:$("#txtUrl").val()},
                    function(data)
                  {
                   
                                    
                   
                   
                  }
               
               );   */
                             
                  }
             
           
            
           
       };
              
              
        function   Anular_Libro(codigo_barra)
        {
            var cod_barra=codigo_barra; 
            dato="isbn_libro="+"&bar_code="+cod_barra;
               alert(dato);
               $.post("../SprintDeweyBarra", dato,
               function(data)
               {
                   
                 $("#reg_barra").html(data);
            
               }
               );
            
        }
        
    </script>
            
    <div id="Catalogo">
        
        <label>ISBN:</label><input type="search" id="isbn_libro" onfocus/> <input type="button" value="Agregar"  id="btnAddBarra" /><a   href="#" onclick="Imprimir_barra()" >Imprimir Cod. Barra</a><br/>
        <a   target="_blank" href="../Sprintbarra"  >Imprimir Cod. Dewey</a>
        <br/>
        <div>
            <table border="0" cellpadding="0" cellspacing="0" >
                <thead>
                    <tr>
                    <th>Cod. Barra</th>
                    <th>Titulo</th>
                    <th>Ejemplar</th>
                    <th>Isbn</th>
                    <th></th>
                    </tr>
                </thead>
                <tbody  id="reg_barra">
                
                    
                </tbody>
                <tfoot>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>    
                </tfoot>
            </table>
        </div>
        <input type="hidden" value='<%out.print(application.getRealPath("Reportes")); %>' id="txtUrl" /> 
    </div>
    
    <div id="pruebaOpon">
        <h1>hola mundo</h1>
    </div>
    

</div>
