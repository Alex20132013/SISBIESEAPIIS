<!--Llamadas de los Java Script por tener confilto aparte-->
<%@include file="../../llamadajsTablas.jsp" %>
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
                        <h2>Formulario Libros Adquiridos</h2>
                        <ul>
                            <i><a onclick="LibrosCuerpo()" class="cursor">Todos los Libros</a></i> 
                            <i><a onclick="LibrosDevueltosCuerpo()" class="cursor">Libros Devueltos</a></i>
                            <i><a onclick="LibrosObservadosCuerpo()" class="cursor">Libros Observados</a></i>
                            <i><a onclick="LibrosPrestadosCuerpo()" class="cursor">Libros Prestados</a></i>
                        </ul>

                        </form>

                        <div id="container">
                            <div id="demo">
                                <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
                                    <thead>
                                        <tr>
                                            <th>ISBN Libro</th>
                                            <th>Edición</th>
                                            <th>Autor Libro</th>
                                            <th>Stock</th>
                                            <th>Volumen</th>
                                            <th>Fecha Adquisición</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="gradeX">
                                            <td>Trident</td>
                                            <td>Internet Explorer 4.0</td>
                                            <td>Win 95+</td>
                                            <td class="center">4</td>
                                            <td class="center">X</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeC">
                                            <td>Trident</td>
                                            <td>InternetExplorer 5.0</td>
                                            <td>Win 95+</td>
                                            <td class="center">5</td>
                                            <td class="center">C</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Trident</td>
                                            <td>Internet Explorer 5.5</td>
                                            <td>Win 95+</td>
                                            <td class="center">5.5</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Trident</td>
                                            <td>Internet
                                                Explorer 6</td>
                                            <td>Win 98+</td>
                                            <td class="center">6</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Gecko</td>
                                            <td>Epiphany 2.20</td>
                                            <td>Gnome</td>
                                            <td class="center">1.8</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Webkit</td>
                                            <td>Safari 1.2</td>
                                            <td>OSX.3</td>
                                            <td class="center">125.5</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Webkit</td>
                                            <td>Safari 1.3</td>
                                            <td>OSX.3</td>
                                            <td class="center">312.8</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Webkit</td>
                                            <td>Safari 2.0</td>
                                            <td>OSX.4+</td>
                                            <td class="center">419.3</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Webkit</td>
                                            <td>Safari 3.0</td>
                                            <td>OSX.4+</td>
                                            <td class="center">522.1</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                        <tr class="gradeA">
                                            <td>Webkit</td>
                                            <td>OmniWeb 5.5</td>
                                            <td>OSX.4+</td>
                                            <td class="center">420</td>
                                            <td class="center">A</td>
                                            <td class="center">2013-03-12</td>
                                        </tr>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>ISBN Libro</th>
                                            <th>Edición</th>
                                            <th>Autor Libro</th>
                                            <th>Stock</th>
                                            <th>Volumen</th>
                                            <th>Fecha Adquisición</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>	
                        </div>
                        </fieldset>
                        </div>

                        </div>