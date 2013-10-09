<script  type="text/javascript">

    $(document).ready(function()
    {

        //bloqueando el envio del formulario al index->ingesandp nuevo administrador
        

        $("#frmRegUser").submit(function()
        {
            var x = $("#bEnviar").val();
             if (x=="enviar" )
            {
               

               
                     $("#idOperator").hide();
                     $('#loading').html('<img src="Imagenes/ajax-loader.gif" "><br/> espere...procesando');
          
                    $.post("Sregistro_usuario", $("#frmRegUser").serialize(),
                            function(data)
                            {
                                alert(data);
                               location.reload(true);
                            });

                  

                 return false;
            }
            else
                return true;
        });


    });
    
    function compararPass(passre) 
    {
         var pass = document.contact_form.contrasenna.value;
                
        //alert(pass);
        
        if (passre==pass) 
        {
           $("#bEnviar").removeAttr('disabled'); 
           $("#reapetPws").attr('style',"color: #111");
           //alert(passre);
        }
        else
            {
                $("#bEnviar").attr('disabled',true);
                
                 $("#reapetPws").attr('style',"color: #af3737");
            }
        

    }
</script>
<div id="Catalogo">
 
    <form class="registro_form" action="#" method="post" name="contact_form" id="frmRegUser" >
        <ul>
            <li>
                <h2>Formulario de Registro</h2>
                <span class="required_notification">* Campos Obligatorios</span>
            </li>
            <li>
                <label for="name">Codigo Usuario:</label>
                <input type="number" name="cod_usuario" placeholder="082000" title="Se necesita Un C�digo Usu.. y de 6 Digitos" pattern="|^\d{6}$|" autofocus required autocomplete="off"/>

            </li>
            <li>
                <label for="Id_tipoUsuario">Tipo Usuario:</label>
                <select name="Id_Titpousuario" placeholder="123432221" title="Se necesita Id_Tipo Usu.."     >
                    <%@include file="tipo_user.jsp" %>
                </select>
                <!--<input type="text" name="Id_Titpousuario" placeholder="123432221" title="Se necesita Id_Tipo Usu.." required />-->
                <span class="form_hint">Seleccione su Tipo de Usuario</span>
            </li>
           

            <li>
                <label for="NombreUsuario">Nombre Usuario:</label>
                <input type="text" id="itNombre" name="NombreUsuario" class="campo" placeholder="Juan" title="El nombre debe estar formado �nicamente por letras:" pattern="|^[a-zA-Z ���������]*$|" autocomplete="off"   required />

            </li>

            <li>
                <label for="ApellidoUsuario">Apellido Usuario:</label>
                <input type="text" id="itApellido" name="ApellidoUsuario" class="campo" placeholder="Ancco Arias" title="El Apellido debe estar formado �nicamente por letras:" pattern="|^[a-zA-Z ���������]*$|" maxlength="60" autocomplete="off" required />

            </li>

            <li>
                <label for="Direcion">Direcion:</label>
                <input type="text" name="Direccion" placeholder="Jr. Lima N�123" title="La direcci�n debe conetener �nicamente d�gitos y letras:" pattern="|^([a-zA-Z���������0-9.]+\s*)+$" autocomplete="off" required />
                <span class="form_hint">Ingrese su Direccion Ejm: "Jr. Lima N�123"</span>
            </li>
            <li>
                <label for="Email">Correo Electronico:</label>
                <input type="email" name="correo_user" placeholder="Eapiis@unamba.com" title="Su Correo debe contener  d�gitos,letras,@ y .:" required  autocomplete="off"/>
                <span class="form_hint">Ingrese su Correo Electronico Ejm: "Eapiis@unamba.com"</span>
            </li>
            <li>
                <label for="password">Contrase�a:</label>
                <input type="password" name="contrasenna" autocomplete="off" placeholder="*******" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Ingrese una Contrase�a >7 Digitos, al menos una letra may�scula y un N�mero Ejem:'Eapiis123'" required />
                <span class="form_hint">La Contrase�a >7 Digitos y al menos debe contener una letra may�scula y un N�mero"</span>
            </li>
            <li>
                <label for="repassword">Repita Contrase�a:</label>
                <input type="password" name="repassword" id="reapetPws" autocomplete="off" placeholder="*******" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Ingrese una Contrase�a >7 Digitos, al menos una letra may�scula y un N�mero Ejem:'Eapiis123'" required onkeyup="compararPass(this.value)" />
                <span class="form_hint">La Contrase�a >7 Digitos y al menos debe contener una letra may�scula y un N�mero"</span>
            </li
            </li>
            <li id="idOperator">
                <button class="submit" type="submit" id="bEnviar" value="enviar" disabled="true"   >Registrarse</button>
                <button class="reset" type="reset">Limpiar el Formulario</button>
            </li>
            
            <li id="loading" >
                
            </li>
        </ul>
                
                
    </form>
</div>
                
                
                