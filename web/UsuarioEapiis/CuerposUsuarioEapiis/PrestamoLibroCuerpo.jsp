<link href="../Css/cssDivFlotante/jquery-ui-1.8.23.custom.css" rel="stylesheet" media="screen">
<link href="../Css/cssDivFlotante/estiloDialogo.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery-ui-1.8.23.custom.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.validate.min.js"></script>
<script type="text/javascript" src="../javascripts/jsDivFlotante/jquery.metadata.js"></script>
<!--Para mostrar estilos de los autocompletables--> 
<link href="../Css/style_1.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="../javascripts/jsActualizarPrestamosDiv/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="../javascripts/jsActualizarPrestamosDiv/jsDivFlotante.js"></script> 

<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" ><span></span>Todos</a>
        <ul>
            <li><a href="#" class="_parent" onclick="clkEsp(0);" >Todos</a></li>
                <%@ include file="../especialidad.jsp" %>

        </ul>
    </div>      
    <div id="Catalogo">
        <!-- <form id="form" action="#" method="POST" class="">
             <fieldset>
                  <legend>Busqueda Libros:</legend>
                  <ul >
                      <a onclick="PrestamoLibroCuerpo()" class="cursor" >Buqueda Libros</a>
                  <a onclick="PrestamoRevistasCuerpo()" class="cursor">Busqueda Revistas</a>
                  <a onclick="PrestamoTesisCuerpo()" class="cursor">Busqueda Tesis</a></ul>
                 <div class="biblio_buscador_fila"><label>
                     <input checked="checked" onclick="output('au')" name="libro" value="au" type="radio"> Autor</label>
                     <label> <input onclick="output('ti')" name="libroa" value="ti" type="radio"> Titulo</label>
                     <label> <input onclick="output('su')" name="librod" value="su" type="radio"> Materia</label> 
                     <label> <input onclick="output('per')" name="librod" value="per" type="radio"> Titulo de Libro</label> 
                     <label> <input onclick="output('default')" name="libroh" value="default" type="radio"> Todos</label></div>
                 <div class="biblio_buscador_fila">
                     <input id="qry" class="bbuscar" name="buscador" size="50" type="text"> 
                     <input class="buscar" name="enviador" value="Buscar" type="submit">
                 </div>
                  <ul >
                  <a onclick="busquedaAbanzadaLibro()" class="cursor">Busqueda Abanzada</a>
                  <a onclick="ayudabusqueda()" class="cursor">Ayuda</a></ul>
                 </fieldset>
         </form>-->
        <div id="OptionSeach">
            <fieldset>
                <legend>Busquedas:</legend>
                <ul id="rBusquedas">
                    <!--  <label>Busqueda:<input type="search"  id="txtBuscar" class="bbuscar" name="busquedas" class="input_text" onkeyup="Buscar(this)"/></label>-->
                    <div class="autocomplete"> 
                        <input checked="checked" id="rdOptio1" onclick="Option_Busqueda(this)" name="busquedas" value="titulo" type="radio" />Título</label> 
                        <label><input id="rdOptio2" onclick="Option_Busqueda(this)" name="busquedas" value="autor" type="radio" />Autor</label> 
                        <!--<label> <input id="rdOptio3" onclick="" name="busquedas" value="contenido" type="radio"> Contenido</label>
                        <label> <input onclick="" name="busquedas" value="busquedas" type="radio"> Todos</label>--></br>
                        <input id="txtBuscar" name="busquedas" class="bbuscar"  size="45" height="100%" type="search" onkeyup="Buscar(event, this)" placeholder="Buscar Ejem:Fundamentos de Programacion" autocomplete="off" onclick="javascript: limpia(this);"/>     
                    </div>     
                    <div id="divAutocprtable">
                    </div>     
                </ul>   
            </fieldset>
        </div> 
    </div>
    <!llamda de por titulos y autores-->
    <div id="llamadaId" >
    </div>   

    <div id="Tablainforme">
    </div>
    <!--FORMUALARIO DE DIV FLOTANTE-->
    <div id="dialogoFormulario" title="Ventana detalles de Libro" style="display:none;">
        <form action="" method="post" id="formAjax" name="formAjax">
            <fieldset id="datosContacto">
                <label for="rg_nombre">Codigo de Usuario</label>
                <span></span>
                <input type="text" id="rg_nombre" name="codigo_user" class="{required:true}"/>
                <label for="rg_apellidos">Seleccione</label>
                <span></span>

                <select name="opcion_select" id="idselect" onchange="ValidarPedido(this)">
                    <option value="0">En Sala</option>
                    <option value="1">A Domicilio</option>
                </select>
                <!--<input type="text" id="rg_apellidos" name="rg_apellidos" class="{required:true}"/>-->
                <label for="rg_correoE">Isbn de Libro</label>
                <span></span>
                <input type="text" id="rg_correoE" name="isbn_libro" class="{required:true,number:true}" dis/>

            </fieldset>
            <fieldset id="botonera" style="border:none; text-align: center;">
                <input id="envioFormulario" class="boton" type="submit" value="Continuar" name="envioFormulario"/>
            </fieldset>
        </form>
    </div>
</div>