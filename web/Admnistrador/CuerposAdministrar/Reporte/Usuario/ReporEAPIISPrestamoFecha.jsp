<div id="Contenido">
    <div id="MenuLateral">
       <a href="index.php" class="_parent"><span></span>Reportes Usuario EAPIIS</a>
        <ul>
            <li><a onclick="ReporEAPIISPrestamoFecha()" class="cursor"><span></span>Prestamos Por Fecha</a></li>
            <li><a onclick="ReporteEAPIISDevolucionFecha()" class="cursor"><span></span>Devoluciones Por Fecha</a></li>
            <li><a onclick="ReporEAPIISObservados()" class="cursor"><span></span>Usuarios Observados</a></li>
            <li><a onclick="ReporEAPIISSancionados()" class="cursor"><span></span>Usuarios Sancionados</a></li>
            <li><a onclick="ReporEAPIISRankingPrestamos()" class="cursor"><span></span>Ranking de Prestamos Estrellas</a></li>
        </ul>
    </div>
    <div id="Catalogo">Reportesss prestamoooooooooo fechasssssssssss
          <form  method="post" name="reporte" action="IRPrestamoEAPIISPorFecha.jsp" target="_blank">
            <label for="lblNombre">Ingrese Fecha: </label>
            <input name="fechaInicial" type="date" class="form" id="fechaInicial" size="25" /><br>
            <label for="lblNombre">Ingrese Fecha: </label>
            <input name="fechaFinal" type="date" class="form" id="fechaFinal" size="25" /><br>
            <input type="submit" name="GRABAR" value="agregar reporte" id="GRABAR" >
        </form>
    </div>

</div>