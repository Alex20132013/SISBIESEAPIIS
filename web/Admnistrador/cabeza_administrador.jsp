
<div id="Principal">
<div id="Cabeza">
    <div id="Portada">
    </div>
    <div id="Precentacion">
        <div class="pikachoose">
	<ul id="pikame" >
            <li><a href="#"><img src="../Imagenes/imagenesPortada/1.png"/></a><span>Biblioteca especializada</span></li>
            <li><a href="#"><img src="../Imagenes/imagenesPortada/2.png"/></a><span>Seguridad en los prestamos</span></li>
            <li><a href="#"><img src="../Imagenes/imagenesPortada/3.png"/></a><span>Gestion de prestamos</span></li>
            <li><a href="#"><img src="../Imagenes/imagenesPortada/4.png"/></a><span>Sistema integrado a las bibliotecas mas conocidas</span></li>
            <li><a href="#"><img src="../Imagenes/imagenesPortada/5.png"/></a><span>UNAMBA</span></li>
	</ul>
        </div>
    </div>
</div>
<div id="MenuCabeza">
     <div id="Barra">
         <%HttpSession usuario = request.getSession(true);
                Object[] user = (Object[]) usuario.getAttribute("USER");
                out.println(user[1].toString()); %>
                
     </div>
     <div id="Menuss">
        <div id="menus"> 
            <ul id="menu">
                <li><a onclick="Inicio()" class="cursor">Inicio</a></li>
                  <li><a href="#">administracion</a>
                    <!--<ul>
                        <li><a onclick="AdmPrestamoLibroCuerpo()" class="cursor">Prestamo de Libros</a></li>
                        <li><a onclick="AdmDevolucionLibroCuerpo()" class="cursor">Devolucion  de Libros</a></li>
                    </ul>	-->
                </li>
                <li><a href="#">Libros</a>
                    <ul>
                        <li><a onclick="LibrosRegistroCuerpo()"class="cursor"> Registro libros</a></li>
                        <li><a onclick="IndiceRegistroCuerpo()"class="cursor"> Registro Indices Libros</a></li>
                        <li><a onclick="LibrosTodosCuerpo()" class="cursor"> Ver todos los libros</a></li>
                        <li><a onclick="AgregarEditorialCuerpo()" class="cursor">Agregar Editorial </a></li>
                        <li><a onclick="AgregarEspecialidadCuerpo()" class="cursor">Agregar Especialidad</a></li>
                        <li><a onclick="LibrosObsevadosCuerpo()" class="cursor">libros Observados</a></li>
                    </ul>
                </li>
                <li><a onclick="impCodigoBarra()" class="cursor">Etiquetacion</a>
                    <ul>
                        <!--<li><a onclick="impCodigoBarra()" class="cursor">Imprimir Codigo barra</a></li>
			<li><a onclick="impCodigoDewey()" class="cursor">Imprimir Codigo Dewey</a></li>-->
			
                    </ul>	
                </li>

                <li><a href="#">Usuarios</a>
                    <ul>
                        <li><a onclick="UsuCuerpoAdm()" class="cursor" >Administrador</a></li>
                        <li><a  onclick="UsuCuerpoBibliotecario()" class="cursor">Bibliotecario</a></li>
                        <li><a onclick="UsuCuerpoEAPIIS()" class="cursor">Usuario EAPIIS</a></li>
                        <li><a onclick="HabilitarUsuarioCuerpo()" class="cursor">Habilitar Usuario</a></li>
                        
                    </ul>
                </li>
                <li><a href="#">Reportes</a>
                    <ul>
			<li><a href="#">Usuarios</a>
                            <ul>
                                <li><a href="CuerposAdministrar/Reporte/Usuario/ReporAdministradorCuerpo.jsp" target="_blank">Administrador</a></li>
                                <li><a href="CuerposAdministrar/Reporte/Usuario/ReporBibliotecarioCuerpo.jsp" target="_blank">Bibliotecario</a></li>
                                <li><a onclick="ReporEAPIISCuerpo()" class="cursor">Usuario EAPIIS</a></li>
                                
                            </ul>
                         </li>   
			<li><a href="#">Observaciones </a>
                            <ul>
                                <li><a onclick="ReporLibroDaniado()" class="cursor">Libros dañados</a></li>
                                <li><a onclick="ReporObsUsuario()" class="cursor">Usuarios Observados</a></li>
                                <li><a onclick="ReporObsLibrosDevueltos()" class="cursor">Libros devueltos</a></li>
                                <li><a onclick="ReporObsLibros()" class="cursor">Libros Observados</a></li>
                            </ul>
                         </li> 
				
                    </ul>	
                </li>

                <li><a href="#">Ayuda</a>
                    <ul>
                        <li><a onclick="ayudacuerpo()" class="cursor">Acerca de Biblioteca</a></li>
			<li><a href="#">Hacerca de Desarrolladores</a></li>
                    </ul>	
                </li>
            </ul>
        </div>
        <div id="Seccion">
                <div id="topnav" class="topnav"><a href="login" class="signin"><span>Bienvenido:<% out.println(user[2].toString());%></span></a> </div>
                <div id="containerlogin">
                    <fieldset id="signin_menu">
                        <form method="post" id="signin" action="../Ssesion">

                            <!-- <label for="username">Email</label>
                             <input id="username" name="username" value="" title="username" tabindex="4" type="text">
                                
                        <p>
                          <label for="password">Contraseña</label>
                          <input id="password" name="password" value="" title="password" tabindex="5" type="password">
                        </p>-->
                            <p class="remember">
                                <input id="signin_submit" value="Cerrar Sesion" tabindex="6" type="submit">
                                <!-- <input id="remember" name="remember_me" value="1" tabindex="7" type="checkbox">
                                <label for="remember">Recordar usuario</label>-->
                            </p>
                            <!--<p class="forgot"> <a onclick="frmRegistroUsuarioCuerpo()" class="cursor" id="resend_password_link">Registrarse</a> </p>
                            <p class="forgot-username"> <A id=forgot_username_link 
                                    title="para recuperar su contraseña debe hacer click aqui o comunicarse con el administrador" 
                                    onclick="frmRecuperarContrasena()" class="cursor">olvidaste contraseña?</A> </p>-->
                        </form>
                    </fieldset>
                </div>


            </div>
     </div>
</div>
