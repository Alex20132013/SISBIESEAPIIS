             function devolver_formulario()
             {
                 if(validar()==false)
                     {
                         alert("falta datos");
                     }
                     else
                         {
                              // $("#specialBox").html("<img src='/Imagenes/sql/ajax-loader.gif' />");
                                              
                 
                    var overlay = document.getElementById('overlay');
                    var specialBox = document.getElementById('specialBox');
                    overlay.style.opacity = .8;
                    if(overlay.style.display == "block")
                    {
                     
                    overlay.style.display = "none";
                    specialBox.style.display = "none";
                    } 
                    else 
                    {
                        
                   /*var datos=$("#frmDtsLbro").serialize();
                     
                      $.ajax({
                              url:'../Admnistrador/CuerposAdministrar/regnuevoLibro.jsp',
                              data:datos,
                              type:'POST',                          
                              success: function(result)
                               {
                                 $("#specialBox").html(result);

                               } 
                            
                            
                              }); */
                              
                        $.post("../SinsertLibro", $("#frmDtsLbro").serialize(), function(data) 
                                    {
				//alert(data);
				$("#specialBox").html(data);
			});      
                              
                    
                    overlay.style.display = "block";
                    specialBox.style.display = "block";
                    }
                    
                             
                }
                
                    
             }
 
             function validar()
             {
                 var isb=$("#isbn").val();
                 
                 if(isb=="" )
                 {
                     alert("hola");
                     return false;
                 }
                 return true;
             }
             
             $(document).ready(function(){
        function validar_nombre(valor)
        {
            var filter=/^[a-zA-Z ñÑáéíóúüç]*$/;
            if(filter.test(valor))
                return true;
            else
                return false;
        }
	function validar_email(valor)
	{
		// creamos nuestra regla con expresiones regulares.
		var filter = /[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
		// utilizamos test para comprobar si el parametro valor cumple la regla
		if(filter.test(valor))
			return true;
		else
			return false;
	}
        function validar_numero()
        {
            
        }
	// cuando presionamos el boton verificar
//	$("#verificar").click(function()
//	{
//		if($("#email").val() == '')
//		{
//			alert("Ingrese un email");
//		}else if(validar_email($("#email").val()))
//		{
//			alert("Email valido");
//		}else
//		{
//			alert("El email no es valido");
//		}
//	});

});