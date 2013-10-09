                                                                   
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
                Object[] user = (Object[]) usuario.getAttribute("USER");
                out.println(user[2].toString());
            %>
        </div>
        <div id="Menuss">
            <div id="menus"> 
                <ul id="menu">
                    <li><a onclick="cuerpo_UsuarioEapiis()" class="cursor">Inicio</a></li>
                    <li>
                   <!--     <a href="#">Prestamos</a>
                        <ul>

                            <li><a onclick="PrestamoLibroCuerpo()" class="cursor">Prestamo de Libros</a></li>
                            <li><a onclick="PrestamoRevistasCuerpo()" class="cursor">Prestamo de Revistas</a></li>
                            <li><a onclick="PrestamoTesisCuerpo()" class="cursor">Prestamo de Tesis</a></li>
                        </ul>-->
                    </li> 
                    <li><a onclick="SugerenciasCuerpo()" class="cursor">Sugerencias</a> </li>
                    <li><a href="#">Ayuda</a>
                        <ul>
                            <li><a onclick="AcercaBibliotecaCuerpo()" class="cursor">Acerca de Biblioteca</a></li>
                            <li><a onclick="AcercaDesarrolladoresCuerpo()" class="cursor">Hacerca de Desarrolladores</a></li>
                            <li><a onclick="ManualUsuarioCuerpo()" class="cursor">Manual Usuario</a></li>
                        </ul>	
                    </li>
                </ul>
            </div>
            <div id="Seccion">
                <div id="topnav" class="topnav"><a href="login" class="signin"><span>Bienvenido:<% out.println(user[1].toString());%></span></a> </div>
                <div id="containerlogin">
                    <fieldset id="signin_menu">
                         <form method="post" id="signin" action="#">
                            <p class="remember">
                                 <a onclick="editarPerfilCuerpo()" id="signin_submit" class="cursor">Editar Perfil </a>
                              </p>
                        </form>
                        <form method="post" id="signin" action="../Ssesion">
                                <input type="submit" id="signin_submit" value="Cerrar Sesion">
                        </form>
                         
                    </fieldset>
                </div>


            </div>
        </div>
    </div>
