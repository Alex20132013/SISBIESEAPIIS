<div id="Contenido">
    <div id="MenuLateral">
        <a href="#" class="_parent"><span></span>Libros mas prestados</a>
              <ul>
            <%@ include file="../../UsuarioEapiis/especialidad.jsp" %>
             </ul>

    </div>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $("#frmdevolucion").submit(function()
            {

                var x = $("#btnEnviar").val();
                if (x =="Consultar")
                {
                    var fecha = new Date();

                    $("#idhdfecha").val(fecha.getFullYear() + '-' + (fecha.getMonth() + 1) + '-' + fecha.getDate() + ' ' + fecha.getHours() + ':' + fecha.getMinutes() + ':00');


                    $.post("../Stprestamo", $("#frmdevolucion").serialize(), function(data)
                    {
                        
                        alert(data);
                        $("#dvdetallePrestamos").html(data);

                        $("#frmdevolucion")[0].reset();



                    });
                    return false;

                }
                else
                    return true;
            });


        });


        function ConfirmDevolucion(codBarra)
        {
            var fecha = new Date();
            var fecha_dev = fecha.getFullYear() + '-' + (fecha.getMonth() + 1) + '-' + fecha.getDate() + ' ' + fecha.getHours() + ':' + fecha.getMinutes();
            //alert(fecha_dev);
            $.post("../Stprestamo", {barraCode: codBarra, option: '3', fecha_devuelto: fecha_dev},
            function(data)
            {

                $("#dvdetallePrestamos").html('');
                alert(data);
            });
        }
    </script>
    <div id="Catalogo" class="registro_form">
        <ul>
            <li>
                <h2> Formulario de Devoluciones:</h2>
            </li>
        </ul>
        <fieldset>
            <legend>Devoluciones:</legend>
            <ul>
                <!--<u><a onclick="PrestamosValidados()" class="cursor" >Prestamos</a></u>-->
                 <a  class="cursor" onclick="PrestamosValidados();">Prestamos</a>
              <!--  <u><a onclick="DevolucionesCuerpo()" class="cursor" >Devoluciones</a></u>-->
                <!--<u><a onclick="BusquedaLibros()" class="cursor" >Busquedas</a></u>-->
            </ul>
            <div id="prestamoLibro" class="prestamos">
                <p class="tip">Codigo de barra libro</p>
                <form action="" id="frmdevolucion" method="post">
                    <div id="devoluciones" class="devoluciones">
                        <input autocomplete="off" name="txtCodigo"  type="text" title="Ingrese aqui su codigo" required/> 
                        <input type="hidden" value="2" name="option" />
                        <input type="hidden"  name="fecha_actual"  id="idhdfecha" />

                        <button  class="submit" type="submit" id="btnEnviar" value="Consultar" >Consultar</button>
                    </div>
                </form>
               <div id="dvdetallePrestamos" >

                </div>
            </div>
        </fieldset>  
            <!--Mostrar por especialidad-->
             <!--<div id="recargado">
                <div id="container">
                    <div id="demo">

                    </div>	
                </div>
               </div>-->
    </div>
</div>