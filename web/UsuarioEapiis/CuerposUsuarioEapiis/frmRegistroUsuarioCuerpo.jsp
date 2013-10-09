    <div id="Catalogo"> 
       <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
    <ul>
        <li>
             <h2>Formulario de Registro</h2>
             <span class="required_notification">* Campos Obligatorios</span>
        </li>
        <li>
            <label for="name">Codigo Usuario:</label>
            <input type="number" name="usuario" placeholder="082133" title="Se necesita Un C�digo Usu.. y de 6 Digitos" pattern="|^\d{6}$|" autofocus required />
            
        </li>
        <li>
            <label for="Id_tipoUsuario">Id Tipo Usuario:</label>
            <input type="text" name="Id_Titpousuario" placeholder="123432221" title="Se necesita Id_Tipo Usu.." required />
            <span class="form_hint">Ingrese su Id de Tipo Usuario Ejem:"234556567"</span>
        </li>
        <li>
            <label for="Id_tipoUsuario">Huella Digital:</label>
            <input type="text" name="HuellaDigital" placeholder="00010101010" />
        </li>
         
        <li>
            <label for="NombreUsuario">Nombre Usuario:</label>
            <input type="text" id="itNombre" name="NombreUsuario" class="campo" placeholder="Juan" title="El nombre debe estar formado �nicamente por letras:" pattern="|^[a-zA-Z ���������]*$|"    required />
            <div id="mensaje1" class="errores">Nombre no puede Tener <3 a Digitos.</div>
        </li>
        
        <li>
            <label for="ApellidoUsuario">Apellido Usuario:</label>
            <input type="text" id="itApellido" name="ApellidoUsuario" class="campo" placeholder="Ancco Arias" title="El Apellido debe estar formado �nicamente por letras:" pattern="|^[a-zA-Z ���������]*$|" maxlength="60" required />
            <div id="mensaje2" class="errores">Ape. no puede Tener <3 a Digitos.</div>
        </li>
        
        <li>
            <label for="Direcion">Direcion:</label>
            <input type="text" name="Direccion" placeholder="Jr. Lima N�123" title="La direcci�n debe conetener �nicamente d�gitos y letras:" pattern="|^([a-zA-Z���������0-9]+\s*)+$" required />
            <span class="form_hint">Ingrese su Direccion Ejm: "Jr. Lima N�123"</span>
        </li>
        <li>
            <label for="Email">Correo Electronico:</label>
            <input type="email" name="Email" placeholder="Eapiis@unamba.com" title="Su Correo debe contener  d�gitos,letras,@ y .:" required />
            <span class="form_hint">Ingrese su Correo Electronico Ejm: "Eapiis@unamba.com"</span>
        </li>
        <li>
            <label for="password">Contrase�a:</label>
            <input type="password" name="password" placeholder="*******" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Ingrese una Contrase�a con Seguridad al menos una letra may�scula y un N�mero Ejem:'Mario123'" required />
            <span class="form_hint">La Contrase�a al menos debe contener una letra may�scula y un N�mero"</span>;
           </li>
         <li>
            <label for="repassword">Repita Contrase�a:</label>
            <input type="password" name="repassword" placeholder="*******" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" title="Ingrese una Contrase�a con Seguridad al menos una letra may�scula y un N�mero Ejem:'Mario123'" required />
           </li>
        <li>
            <button class="submit" type="submit" id="bEnviar" onclick="envia_formulario()">Registrarse</button>
                <button class="reset" type="reset">Limpiar el Formulario</button>
        </li>
    </ul>
</form>
    </div>