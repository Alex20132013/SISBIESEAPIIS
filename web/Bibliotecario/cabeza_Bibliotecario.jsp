
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
            <%
                HttpSession usuario = request.getSession(true);
                Object[] user;
                if(usuario.getAttribute("USER")!=null)
                 {
                     user = (Object[]) usuario.getAttribute("USER");
                      out.println(user[1].toString());
                  }
                else
                 {
                   user=null;
                    response.sendRedirect("../index.jsp");
                  }

            %>
        </div>
        <div id="Menuss">
            <div id="menus">
                <ul id="menu">
                    <li><a onclick="Inicio_Bibliotecario()" class="cursor">Inicio</a></li>
                    <li><a href="#">Administracion</a>
                        <ul>
                            <li><a href="#" class="cursor">Prestamos</a>
                                <ul>
                                    <li><a onclick="PrestamosValidados()" class="cursor">Prestamos Validados</a></li>
                                    <li><a onclick="PrestamosNoValidados()" class="cursor">Prestamos no Validados</a></li>
                                    <!--<li><a onclick="biPrestamoTesisCuerpo()">Prestamo de Tesis</a></li>-->
                                </ul>
                            </li>
                            <li><a onclick="DevolucionesCuerpo()" class="cursor">Devoluciones   </a>
                               <!-- <ul>
                                    <li><a onclick="DevolucionLibrosCuerpo()">Devolucion de Libros</a></li>
                                    <li><a onclick="DevolucionRevistasCuerpo()">Devolucion de Revistas</a></li>
                                    <li><a onclick="DevolucionTesisCuerpo()">Devolucion de Tesis</a></li>
                                </ul>-->
                            </li>
                            <!--<li><a onclick="ConfiguracionFeriadosCuerpo()" class="cursor">Configuracion de Feriados</a></li>
                            <li><a onclick="ConfiguracionHoraCuerpo()" class="cursor">Configuracion de Hora</a></li>-->
                        </ul>
                    </li>
                    <li><a href="#">Libros</a>
                        <ul>
                            <li><a onclick="LibrosCuerpo()" class="cursor">Ver todos los Libros</a></li>
                            <li><a onclick="LibrosObservadosCuerpo()" class="cursor">Libros Observados</a></li>
                           <!-- <li><a onclick="LibrosAdquiridosCuerpo()" class="cursor">Libros Adquiridos</a></li>-->
                            <li><a onclick="LibrosPrestadosCuerpo()" class="cursor">Libros Prestados</a></li>
                        <!--    <li><a onclick="LibrosDevueltosCuerpo()" class="cursor">Libros Devueltos</a></li>-->

                        </ul>
                    </li>

                    <li><a href="#">Usuarios</a>
                        <ul>
                           <!-- <li><a onclick="HabilitarUsuarioCuerpo()"  class="cursor">Habilitar Usuario</a></li>
                            <li><a onclick="PagoUsuarioCuerpo()" class="cursor">Pago Usuario</a></li>-->
                            <li><a onclick="MantenimientoUsuarioCuerpo()" class="cursor">Mantenimiento Usuario</a></li>
                        </ul>
                    </li>
                     <li><a href="#">Reportes</a>
                        <ul>
                            <li><a onclick="InformeLibrosCuerpo()" class="cursor">Reportes de Libros</a></li>
                            <li><a onclick="InformeRevistasCuerpo()" class="cursor">Reportes de Revistas</a></li>
                            <li><a onclick="InformeTesisCuerpo()" class="cursor">Reportes de Tesis</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Ayuda</a>
                        <ul>
                            <li><a onclick="biAcercaBibliotecaCuerpo()" class="cursor">Acerca de Biblioteca</a></li>
                            <li><a onclick="biAcercaDesarrolladoresCuerpo()" class="cursor">Hacerca de Desarrolladores</a></li>
                            <li><a onclick="biManualUsuarioCuerpo()" class="cursor">Manual de Usuario</a></li>
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
                                <input id="remember" name="remember_me" value="1" tabindex="7" type="checkbox">

                                <!-- <label for="remember">Recordar usuario</label>-->
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
