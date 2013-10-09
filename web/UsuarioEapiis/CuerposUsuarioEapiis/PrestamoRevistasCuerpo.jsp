<div id="Contenido">
    <div id="MenuLateral">
        <a href="index.php" class="_parent"><span></span>Todos</a>
        <ul>
            <li><a href="#"  onclick="clkEsp(0);" >Todos</a></li>
                <%@ include file="../especialidad.jsp" %>
        </ul>

    </div>
    <div id="Catalogo">
        <form id="form" action="#" method="POST" class="">
            <fieldset>
                <legend>Busqueda Revistas:</legend>
                <ul >
                    <a onclick="PrestamoLibroCuerpo()" class="cursor">Buqueda Libros</a>
                    <a onclick="PrestamoRevistasCuerpo()" class="cursor">Busqueda Revistas</a>
                    <a onclick="PrestamoTesisCuerpo()" class="cursor">Busqueda Tesis</a></ul>
                <div class="biblio_buscador_fila"><label>
                        <input checked="checked" onclick="" name="revista" value="au" type="radio"> Autor</label>
                    <label> <input onclick="output('ti')" name="revista" value="ti" type="radio"> Titulo Revista</label>
                    <div class="biblio_buscador_fila">
                        <input id="qry" class="bbuscar" name="buscador" size="50" type="text"> 
                        <input class="buscar" name="enviador" value="Buscar" type="submit">
                    </div>s
                    <ul >
                        <a onclick="busquedaAbanzadaRevistas()" class="cursor">Busqueda Abanzada</a>
                        <a onclick="ayudabusqueda()" class="cursor">Ayuda</a>

                        </fieldset>

                        </form>
                        <!llamda de por titulos y autores-->
                        <div id="llamadaId" >
                        </div>   

                        <div id="Tablainforme">
                        </div>
                </div>
                </div>

                </div>

