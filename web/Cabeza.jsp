<script>
      var usuario;
    var paswuser;

    function Loaderajax( )
    {

        $.post("Session.jsp", {username: usuario, password: paswuser},
        function(data)
        {

            $("#dvlogin").html(data);
            $("#loadsession").html("<input id='signin_submit' value='Iniciar' tabindex='6' type='button' onclick='Login()'>");
        });

    }

    function Login()
    {
        usuario = $("#username").val();
        paswuser = $("#password").val();

        $("#loadsession").html("<img src='Imagenes/377.gif' />");
        window.setTimeout(function()
        {

            Loaderajax();
        }, 1000);


    }
</script>
<div id="Principal">
    <div id="Cabeza">
        <div id="Portada">
        </div>
        <div id="Precentacion">
            <div class="pikachoose">
                <ul id="pikame" >
                    <li><a href="#"><img src="Imagenes/imagenesPortada/1.png"/></a><span>Biblioteca especializada</span></li>
                    <li><a href="#"><img src="Imagenes/imagenesPortada/2.png"/></a><span>Seguridad en los prestamos</span></li>
                    <li><a href="#"><img src="Imagenes/imagenesPortada/3.png"/></a><span>Gestion de prestamos</span></li>
                    <li><a href="#"><img src="Imagenes/imagenesPortada/4.png"/></a><span>Sistema integrado a las bibliotecas mas conocidas</span></li>
                    <li><a href="#"><img src="Imagenes/imagenesPortada/5.png"/></a><span>UNAMBA</span></li>
                </ul>
            </div>
        </div>
    </div>



    <div id="MenuCabeza">
        <div id="Barra"></div>
        <div id="Menuss">
            <div id="menus"> 
                <ul id="menu">
                    <li><a onclick="inicioIndex()" class="cursor">Inicio</a></li>

                    <li><a onclick="organigrama()" class="cursor">Organigrama</a>

                    <li><a onclick="documentaciones()" class="cursor">Documentaciones</a>

                    </li>
                    <li><a onclick="referencias()" class="cursor">Referencias</a>

                    </li>

                    <li><a onclick="contactos()" class="cursor">Contactos</a>

                    </li>

                    <li><a href="#">Ayuda</a>
                        <ul>
                            <li><a onclick="AcercaBibliotecaCuerpop()" class="cursor">Acerca de Biblioteca</a></li>
                            <li><a onclick="AcercaDesarrolladoresCuerpop()" class="cursor">Hacerca de Desarrolladores</a></li>
                        </ul>	
                    </li>
                </ul>
            </div>
            <div id="Seccion">
                <div id="topnav" class="topnav"><a href="login" class="signin"><span>Iniciar Sesion</span></a> </div>
                <div id="containerlogin">
                    <fieldset id="signin_menu">
                        <form id="signin" action="Ssesion" method="POST" >

                            <div id="dvlogin">
                                <label for="username">Email</label>
                                <input  id="username" value="" title="username" tabindex="4" type="email" required>

                                <p>
                                    <label for="password">Contraseña</label>
                                    <input  id="password" value="" title="password" tabindex="5" type="password" required autocomplete="off">
                                </p>
                            </div>

                            <p class="remember">
                            <div id="loadsession">
                                <input id="signin_submit" value="Iniciar" tabindex="6" type="button" onclick="Login()">
                            </div>

                            <input id="remember" name="remember_me" value="1" tabindex="7" type="checkbox">
                            <label for="remember">Recordar usuario</label>
                            </p>
                            <p class="forgot"> <a onclick="frmRegistroUsuarioCuerpo()" class="cursor" id="resend_password_link">Registrarse</a> </p>
                            <p class="forgot-username"> <a id='forgot_username_link' title="para recuperar su contraseña debe hacer click aqui o comunicarse con el administrador" onclick="frmRecuperarContrasena()" class="cursor">olvidaste contraseña?</a> </p>     
                        </form>
                    </fieldset>

                </div>
            </div>
        </div>
    </div>

