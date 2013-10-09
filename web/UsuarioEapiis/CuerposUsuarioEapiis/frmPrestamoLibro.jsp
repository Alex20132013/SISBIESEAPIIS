<div id="Catalogo"> 


    <form id="form" action="javascript:ejecutarbusqueda()" method="POST"> <input name="query_screen" value="Home.html" type="hidden"> <input name="UnicornBrowseType" value="TERM" type="hidden"> <input name="setting_key" value="Bello" type="hidden"> <input name="location_group_filter" value="all" type="hidden"> <input name="servers" value="1home" type="hidden">
        <div class="biblio_buscador_fila"><label> <input checked="checked" onclick="output('au')" name="index" value="au" type="radio"> Autor</label> 
            <label> <input onclick="output('ti')" name="index" value="ti" type="radio"> Titulo</label> 
            <label> <input onclick="output('su')" name="index" value="su" type="radio"> Materia</label>
            <label> <input onclick="output('per')" name="index" value="per" type="radio"> Titulo de revista</label>
            <label> <input onclick="output('default')" name="index" value="default" type="radio"> Todos</label>
        </div>
        <div class="biblio_buscador_fila"><input id="qry" class="biblioteca_textbox biblio_text" name="query" size="50" type="text"> 
            <input class="buscar" name="enviador" value="Buscar" type="submit"></div>
    </form>


</div>