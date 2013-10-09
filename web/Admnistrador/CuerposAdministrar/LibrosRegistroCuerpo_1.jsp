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
    <div id="Catalogo">
        <div id="RegistroLibro">
             <form class="contact_form" action="#" method="post" name="contact_form">
                <ul>  
                    <li>
                         <h2>Registro Libros</h2>
                         <span class="required_notification">* Datos Requeridos</span>
                    </li>
                    <li>
                        <label for="name">Isbn Libro</label>
                        <input type="text"  placeholder="John Doe" required />
                        <span class="form_hint">"Ingrese el Isbn LIbro "</span>
                    </li>
                    <li>
                        <label for="name">Titulo Libro</label>
                        <input type="text"  placeholder="John Doe" required />
                        <span class="form_hint">"Ingrese solo Letras"</span>
                    </li>
                    <li>
                        <label for="name">Id_Especialidad</label>
                        <select NAME="selCombo" SIZE=1 onChange=""> 
                            <option VALUE="link pagina 1">Sistemas Operativos</option>
                            <option VALUE="link pagina 2">Redes Y telecomunicaciones</option>
                            <option VALUE="link pagina 3">opcion3</option>
                            <option VALUE="link pagina 4">opcion4</option> 
                         </select>
                        <span class="form_hint">"Seleccione Especialidad"</span>
                    </li>
                    <li>
                        <label for="email">Id_Editorial</label>
                            <select NAME="selCombo" SIZE=1 onChange=""> 
                            <option VALUE="link pagina 1">Santa Marta</option>
                            <option VALUE="link pagina 2">Clautory</option>
                            <option VALUE="link pagina 3">Bruño</option>
                            <option VALUE="link pagina 4">opcion4</option> 
                            </select>
                       
                        <span class="form_hint">"Seleccione especialidad"</span>
                    </li>
                    <li>
                        <label for="name">Edicion_Libro</label>
                        <input type="text"  placeholder="John Doe" required />
                        <span class="form_hint">"Ingrese contraseña"</span>
                    </li>
                    <li>
                        <label for="name">Volumen Libro:</label>
                        <input type="text"  placeholder="John Doe" required />
                    </li>
                    <li>
                        <label for="name">Indice Libro:</label>
                        <input type="text"  placeholder="John Doe" required />
                    </li>
                    <li>
                        <label for="name">Total Libro:</label>
                        <input type="text"  placeholder="John Doe" required />
                    </li>
                    <li>
                        <label for="name">Codigo Dewey:</label>
                        <input type="text"  placeholder="John Doe" required />
                    </li>
                    <li>
                        <label for="name">Stock:</label>
                        <input type="text"  placeholder="John Doe" required />
                    </li>
                    <li>
                        <label for="name">Agregar auto(es):</label>
                        <button  class="submit" type="submit" onClick="encenderAutor()">Agregar Autor</button>
                    </li>
                    <li>
                        <button  class="submit" type="submit">Agregar Nuevo</button>
                    </li>
                </ul>
            </form>

        </div>
        <div id="Autor">
            <div id="Agregado">
                <div id="LibroAutor">
                 <form class="contact_form1" action="#" method="post" name="contact_form">
                <ul>  
                    <li>
                         <h2>Agregar Autor</h2>
                         <span class="required_notification">* Datos Requeridos</span>
                    </li>
                    <li>
                        <label for="name">Isbn Libro</label>
                        <input type="text"  placeholder="John Doe" required />
                        <span class="form_hint">"Ingrese el Isbn LIbro "</span>
                    </li>
                    <li>
                        <label for="name">Autor</label>
                        <select NAME="selCombo" SIZE=1 onChange="" class="textosLibroAutor"> 
                                <option VALUE="link pagina 1">Juan Jose de la fuente;FIsico</option>
                                <option VALUE="link pagina 2">Clautory</option>
                                <option VALUE="link pagina 3">Bruño</option>
                                <option VALUE="link pagina 4">opcion4</option> 
                        </select>
                        <span class="form_hint">"Ingrese el Isbn LIbro "</span>
                    </li>
                    <li>
                        <button  class="submit" type="submit">Agregar</button>
                        <button  class="submit" type="submit">Crear</button>
                    </li>
                </ul> 
              </form>
            </div>
            <div id="NuevoLibro">
                <h2>Nuevo Autor</h2>
                <table>
                    <tr>
                        <td><label>IdAutor</label></td>
                        <td><input type="text" class="textosLibroAutor"/></td>
                    </tr>
                    <tr>
                        <td><label>Nombre</label></td>
                        <td><input type="text" class="textosLibroAutor"/></td>
                    </tr>
                    <tr>
                        <td><label>Apellidos</label></td>
                        <td><input type="text" class="textosLibroAutor"/></td>
                    </tr>
                    <tr>
                        <td><label>ESpecialidad</label></td>
                        <td><input type="text" class="textosLibroAutor"/></td>
                    </tr>
                </table>
                <input value="Ingresar Autor" type="submit"/>
            </div>
           </div>

            <div id="TablaAgregar">
                
                <table cellspacing="0" cellpadding="0">
                    <tr>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Especialidad</th>					
                    </tr>
                    <tr>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>				
                    </tr>			
                    <tr>
                            <td>Data</td>
                            <td>Data</td>
                            <td>Data</td>				
                    </tr>		
                </table>
                <input value="Ingresar Autores" type="submit" onClick="apagarAutor()"/>
            </div>
        </div>
       
    </div>

</div>