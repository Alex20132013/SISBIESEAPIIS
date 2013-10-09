<%@page import="java.util.List"%>
<%@page import="Modelo.CTipo_user"%>
<!--Llamadas de los Java Script por tener confilto aparte-->

<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" class="_parent"><span></span>Tipo de usuarios</a>
        <ul>
            
            <%
                
              
              try
                {
                CTipo_user tipo_user=new CTipo_user();
                List<Object[]>lisTipo=tipo_user.Select_tipoUser();

                  for(int i=0;i<lisTipo.size();i++)
                 {
                      Object[]registro=lisTipo.get(i);
                     out.print("<li>");
                     out.print("<a href='#' target='_parent' onclick='ListTipo("+registro[0].toString()+")'><span></span>"+registro[1].toString()+"</a>");

                     out.print("</li>");


                 }
                 

                }

              catch(Exception ex)
                {
                out.print(ex.getMessage());

                }



            %>
            
            
        </ul>

    </div>
    <div id="Catalogo">
        
            <!--<form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
                <ul>
                    <li>
                        <h2>Formulario Manteniminento Usuario EAPIIS</h2>
                    </li>
                    <ul>
                        <i><a onclick="HabilitarUsuarioCuerpo()" class="cursor">Habilitar Usuario EAPIIS</a></i>
                        <i><a onclick="PrestamoRevistasCuerpo()" class="cursor">Ver Usuarios EAPIIS</a></i>
                        <i><a onclick="PrestamoTesisCuerpo()" class="cursor">Permisos</a></i></ul>
                </ul>
            </form>-->
            <script type="text/javascript">
                        $(document).ready(function() 
                   {
                      
                      $.post("CuerposBibliotecario/LstUsersEapiis.jsp",{parametro:'0'}, 
                                function(data)
                                {
                                    
                                    $("#demo").html(data);
                                    
                                    
                                });
                  
                   
            
                  
                     });
                     
                 function  ListTipo(parametro)
                 {
              
                    $.post("CuerposBibliotecario/LstUsersEapiis.jsp",{parametro:parametro}, 
                                function(data)
                                {
                                    
                                    $("#demo").html(data);
                                    
                                    
                                });  
                     
                   //alert("hola mundo")  
                     
                 }
            </script>
            
            
            <div id="container">
                <div id="demo">
                    
                </div>	
            </div>
        
    </div>
</div>