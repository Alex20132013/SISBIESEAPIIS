<!--Llamadas de los Java Script por tener confilto aparte-->
<% request.getRequestDispatcher("../../llamadajsTablas.jsp").include(request, response);%>
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

        <fieldset>
            <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
                <ul>
                    <li>
                        <h2>Formulario Libros Debueltos</h2>
                    </li>
                    <!--<ul>
                        <u><a onclick="LibrosCuerpo()" class="cursor">Todos los Libros</a></u>
                        <u><a onclick="LibrosAdquiridosCuerpo()" class="cursor">Libros Adquiridos</a></u>
                        <u><a onclick="LibrosObservadosCuerpo()" class="cursor">Libros Observados</a></u>
                        <u><a onclick="LibrosPrestadosCuerpo()" class="cursor">Libros Prestados</a></u>
                        <u><a onclick="RegistroLibrosCuerpo()" class="cursor">Registro Libros</a></u>
                    </ul>-->
                </ul>
            </form>
            <div id="container">
                <div id="demo">
                    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
                        <thead>
                            <tr>
                                <th>Codigo Usuario</th>
                                <th>Nombres Usurio</th>
                                <th>Titulo Libro</th>
                                <th>Autor Libro</th>
                                <th>Código Dewey Libro</th>
                                <th>Lugar Prestamo</th>
                                <th>Fecha Devolución</th>
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
                                <th>Codigo Usuario</th>
                                <th>Nombres Usurio</th>
                                <th>Titulo Libro</th>
                                <th>Autor</th>
                                <th>Código Dewey Libro</th>
                                <th>Lugar Prestamo</th>
                                <th>Fecha Devolución</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>	
            </div>
        </fieldset>
    </div>

</div>