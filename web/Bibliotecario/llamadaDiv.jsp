<% request.getRequestDispatcher("../llamadajsTablas.jsp").include(request, response);%>
<!doctype html>
<html lang="en">
<head>
     <!--Llamadas Js.para recargar prestamo automaticamente-->
       
	<meta charset="UTF-8">
	<title>Llamda del Div</title>
</head>
<body>
    	<div id="container">
                <div id="demo">
                    <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
                        <thead>
                            <tr>
                                <th>Nombres Usuario</th>
                                <th>Titulo Libro</th>
                                <th>Autor</th>
                                <th>Código Dewey</th>
                                <th>Lugar Prestamo</th>
                                <th> </th>
                                <th></th>

                            </tr>
                        </thead>
                        <tbody>
                            <tr class="gradeX">
                                <td>Juan Mamany Ancco</td>
                                <td>Sistemas Operativos I</td>
                                <td class="center">4</td>
                                <td>3323233</td>
                                <td class="center">X</td>
                                <td><a href="#">Prestar</a></td>
                                <td><a href="#">Eliminar()</a></td>
                            </tr>
                            <tr class="gradeA">
                                <td>Juan Mamany Ancco</td>
                                <td>Sistemas Operativos I</td>
                                <td class="center">Venegas</td>
                                <td>3323233</td>
                                <td class="center">A</td>
                                <td><a href="#">Prestar</a></td>
                                <td><a href="#">Eliminar()</a></td>
                            </tr>
                            <tr class="gradeA">
                                <td>Juan Mamany Ancco Explorer 7</td>
                                <td>Sistemas Operativos ISP2+</td>
                                <td class="center">Venegas</td>
                                <td>3323233</td>
                                <td class="center">A</td>
                                <td><a href="#">Prestar</a></td>
                                <td><a href="#">Eliminar()</a></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>

                                <th>Nombres Usurio</th>
                                <th>Titulo Libro</th>
                                <th>Autor</th>
                                <th>Código Dewey</th>
                                <th>Lugar Prestamo</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </tfoot>
                    </table>
                </div>	
            </div>
       
</body>
</html>