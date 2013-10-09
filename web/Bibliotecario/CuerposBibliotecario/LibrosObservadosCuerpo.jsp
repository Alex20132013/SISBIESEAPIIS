<!--Llamadas de los Java Script por tener confilto aparte-->
<%@include file="../../llamadajsTablas.jsp" %>
<div id="Contenido">
      <div id="MenuLateral">
        <a href="#" class=""><span></span>Libros mas prestados</a>
        <ul>
            <%@ include file="../../UsuarioEapiis/especialidad.jsp" %>
        </ul>

    </div>
 

    <div id="Catalogo">
        <fieldset>
            <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
                <ul>
                    <li>
                        <h2>Formulario Libros Observados</h2>
                    </li>
                    <!-- <ul>
                        <i><a onclick="LibrosCuerpo()" class="cursor">Todos los Libros</a></i> 
                        <i><a onclick="LibrosAdquiridosCuerpo()" class="cursor">Libros Adquiridos</a></i>
                        <i><a onclick="LibrosDevueltosCuerpo()" class="cursor">Libros Devueltos</a></i>
                        <i><a onclick="LibrosPrestadosCuerpo()" class="cursor">Libros Prestados</a></i>     
                    </ul>-->
                </ul>
            </form>
              
              
           
             <div id="containerw">
                <div id="demow">
                    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
                        <thead>
                            <tr>
                                <th>Codigo Usuario</th>
                                <th>Nombres Usurio</th>
                                <th>Titulo Libro</th>
                                <th>Autor Libro</th>
                                <th>Código Dewey Libro</th>
                                <th>Lugar Prestamo</th>
                                <th>Fecha Observación</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="gradeX">
                                <td>082114</td>
                                <td>
                                    Juan Mamany Ancco
                                </td>
                                <td>Sistemas Operativos I</td>
                                <td class="center">4</td>
                                <td>3323233</td>
                                <td class="center">X</td>
                                <td class="center">2013-03-12</td>
                                
                            </tr>
                            <tr class="gradeC">
                                <td>082114</td>
                                <td>Juan Mamany Ancco</td>
                                <td>Sistemas Operativos I</td>
                                <td class="center">Venegas</td>
                                <td>3323233</td>
                                <td class="center">C</td>
                                <td class="center">2013-03-12</td>
                                
                            </tr>
                            <tr class="gradeA">
                                <td>082114</td>
                                <td>Juan Mamany Ancco</td>
                                <td>Sistemas Operativos I</td>
                                <td class="center">Venegas</td>
                                <td>3323233</td>
                                <td class="center">A</td>
                                <td class="center">2013-03-12</td>
                                
                            </tr>
                            <tr class="gradeA">
                                <td>082114</td>
                                <td>Juan Mamany Ancco</td>
                                <td>Sistemas Operativos I</td>
                                <td class="center">Venegas</td>
                                <td>3323233</td>
                                <td class="center">A</td>
                                <td class="center">2013-03-12</td>
                                
                            </tr>
                            <tr class="gradeA">
                                <td>091232</td>
                                <td>Juan Mamany Ancco Explorer 7</td>
                                <td>Sistemas Operativos ISP2+</td>
                                <td class="center">Venegas</td>
                                <td>3323233</td>
                                <td class="center">A</td>
                                <td class="center">2013-03-12</td>
                                
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Código Usuario</th>
                                <th>Nombres Usurio</th>
                                <th>Título Libro</th>
                                <th>Autor Libro</th>
                                <th>Código Dewey Libro</th>
                                <th>Lugar Prestamo</th>
                                <th>Fecha Observacion</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>	
            </div>
        </fieldset>
    </div>
        
        <div id="container">
                <div id="demo">
              </div>
                </div>
       <script>
             $(document).ready(function()
                   {

                      $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                                function(data)
                                {

                                    $("#catalogo").html(data);
                                });
                     });

        </script>
        
</div>