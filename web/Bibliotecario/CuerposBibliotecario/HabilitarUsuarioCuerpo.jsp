<div id="Contenido">
     <div id="MenuLateral">
        <a href="#" class=""><span></span>Libros mas prestados</a>
        <ul>
            <%@ include file="../../UsuarioEapiis/especialidad.jsp" %>
        </ul>

    </div>
        <script>
             $(document).ready(function()
                   {

                      $.post("CuerposBibliotecario/ListPedidoUsers.jsp",
                                function(data)
                                {

                                    $("#Catalogo").html(data);
                                });
                     });

        </script>

    <div id="Catalogo">
        <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
            <ul>
                <li>
                    <h2>Formulario Habilitar Usuario EAPIIS</h2>
                </li>
                <ul>
                    <i><a onclick="HabilitarUsuarioCuerpo()" class="cursor">Habilitar Usuario EAPIIS</a></i>
                    <i><a onclick="MantenimientoUsuarioCuerpo()" class="cursor">Ver Usuarios EAPIIS</a></i>
                    <i><a onclick="PrestamoTesisCuerpo()" class="cursor">Permisos</a></i></ul>
                <li>
                    <label for="name"></label> 
                    <input type="button" class="cargarCOdUsu"  value="Cargar Rolando" />
                </li>
                <li>
                    <label for="name">Codigo Usuario:</label>
                    <input type="number" name="usuario" placeholder="082133" title="Se necesita Un Código Usu.. y de 6 Digitos" pattern="|^\d{6}$|" autofocus required/>
                </li> 

                <li>
                    <label for="Id_tipoUsuario">Huella Digital:</label>
                    <input type="text" name="HuellaDigital" placeholder="00010101010" />
                </li>

                <li>
                    <label for="NombreUsuario">Nombre Usuario:</label>
                    <input type="text" id="itNombre" name="NombreUsuario" class="campo" placeholder="Juan" title="El nombre debe estar formado únicamente por letras:" pattern="|^[a-zA-Z ñÑáéíóúüç]*$|"    required />
                </li>

                <li>
                    <label for="ApellidoUsuario">Apellido Usuario:</label>
                    <input type="text" id="itApellido" name="ApellidoUsuario" class="campo" placeholder="Ancco Arias" title="El Apellido debe estar formado únicamente por letras:" pattern="|^[a-zA-Z ñÑáéíóúüç]*$|" maxlength="60" required />
                </li>
                <li>
                    <label for="Email">Correo Electronico:</label>
                    <input type="email" name="Email" placeholder="Eapiis@unamba.com" title="Su Correo debe contener  dígitos,letras,@ y .:" required />
                    <span class="form_hint">Ingrese su Correo Electronico Ejm: "Eapiis@unamba.com"</span>
                </li>
                <fieldset>
                    <legend>Estado Usurio</legend>
                    <input type="radio" name="estadoUsuario" value="habilitado" checked="checked" required>Habilitado<br>
                    <input type="radio" name="estadoUsuario" value="desabilitado" required="">Desabilitado
                </fieldset>     

                <button class="submit" type="submit" id="bEnviar" onclick="envia_formulario()">Actualizar</button>
                <button class="reset" type="reset">Limpiar el Formulario</button>
                </li>
            </ul>
        </form>

    </div>

</div>