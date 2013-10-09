<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" class="_parent"><span></span>Libros mas prestados</a>
        <ul>
            <li><a href="#" onclick="clkEsp(0);" >Todos</a></li>
                <%@ include file="../especialidad.jsp" %>

        </ul>

    </div>
    <script>
                //mostrando los libros por especialidad////////////////////////////////////////
                function clkEsp(espcialidad)
                {
                    espselect = "esp=" + espcialidad;

                    if (espcialidad.toString() == '0')  //si ha seleccionado buscar por autor o titulo
                    {
                        $("#OptionSeach").show();
                        $("#llamadaId").html('');
                    }
                    else
                    {
                        $("#frmSugerencias").hide();

                        $.ajax({
                            url: 'CuerposUsuarioEapiis/SelectLibroEspecialidad.jsp',
                            data: espselect,
                            type: 'POST',
                            success: function(result)
                            {

                                $("#llamadaId").html(result);
                            }


                        });
                    }
                }
                
                
                function envia_formulario()
                {                  
                    
                    
                   $("#frmSuggest")[0].reset();
                   alert("SUGERIENCIA ENVIADA CORRECTAMENTE..:)");
                    window.location.reload(true);
                }
    </script>
    <div id="Catalogo">
        <div id="frmSugerencias">
            <form class="registro_form" action="#" method="post" name="contact_form" id="frmSuggest" >
                <ul>
                    <li>
                        <h2>Formulario de Sugerencias</h2>
                        <span class="required_notification">* Campos Obligatorios</span>
                    </li>
                    <li>
                        <label for="name">Codigo Usuario:</label>
                        <input type="number" name="usuario" placeholder="082133" title="Se necesita Un Código Usu.. y de 6 Digitos" pattern="|^\d{6}$|" autofocus required />

                    </li>
                    <li>
                        <label for="NombreUsuario">Nombre Usuario:</label>
                        <input type="text" id="itNombre" name="NombreUsuario" class="campo" placeholder="Juan" title="El nombre debe estar formado únicamente por letras:" pattern="|^[a-zA-Z ñÑáéíóúüç]*$|"    required />
                    </li>
                    <li>
                        <label for="Email">Correo Electronico:</label>
                        <input type="email" name="Email" placeholder="Eapiis@unamba.com" title="Su Correo debe contener  dígitos,letras,@ y .:" required />
                        <span class="form_hint">Ingrese su Correo Electronico Ejm: "Eapiis@unamba.com"</span>
                    </li>
                    <li>
                        <label for="mensaje">Escriba su Mensaje:</label>
                        <p><textarea cols="50" rows="5" maxlength="200" placeholder="Aqui puedes poner tus comentarios.....!! 200 Caracteres" title="si tienes algun comentario lo puedes escribir aqui" required></textarea></p>

                    <li>
                        <button class="submit" type="button" id="bEnviar" onclick="envia_formulario()">Enviar</button>
                        <button class="reset" type="reset">Limpiar el Formulario</button>
                    </li>
                </ul>
            </form>
        </div>
        <!llamda de por titulos y autores-->
        <div id="llamadaId" >
        </div>   

        <div id="Tablainforme">
        </div>
    </div>
</div>

</div>