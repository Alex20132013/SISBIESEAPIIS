<div id="Catalogo"> 
    <form class="registro_form" action="#" method="post" name="contact_form" onsubmit="return comprobar(this)">
        <ul>
            <li>
                <h2>Recuperar su Contrase�a</h2>
                <span class="required_notification">* ""</span>
            </li>
            <li>
                <label for="name">Codigo Usuario:</label>
                <input type="number" name="usuario" placeholder="082133" title="Se necesita Un C�digo Usu.. y de 6 Digitos" pattern="|^\d{6}$|" autofocus required />
            </li>
            <li>
                <label for="Email">Correo Electronico:</label>
                <input type="email" name="Email" placeholder="Eapiis@unamba.com" title="Su Correo debe contener  d�gitos,letras,@ y .:" required />
                <span class="form_hint">Ingrese su Correo Electronico Ejm: "Eapiis@unamba.com"</span>
            </li>
            <li>
                <button class="submit" type="submit" id="bEnviar" onclick="envia_formulario()">Enviar</button>
                <button class="reset" type="reset">Limpiar el Formulario</button>
            </li>
        </ul>
    </form>
</div>