<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Java Mail</title>
    </head>
    <body>
        <form action="sendMail.jsp" method="POST">
            <table border="0" align="center" cellpadding="5">
                <tbody>
                    <thead><tr> <td colspan="3" align="center">
                    <b> Envio de Mensaje </b> </td> </tr> </thead>
                    <tr>
                        <td> A: </td> <td> : </td>
                        <td> <input type="text" name="correo_user" value="" /> </td>
                    </tr>
                    <tr>
                        <td> Asunto </td> <td> : </td>
                        <td> <input type="text" name="asunto" value="" /> </td>
                    </tr>
                    <tr>
                        <td> Mensaje </td> <td> : </td>
                        <td> <textarea name="mensaje" rows="8" cols="30">
                        </textarea></td>
                    </tr>
                       
                    <tr>
                        <td> contrseña </td> <td> : </td>
                        <td> <input type="password" name="contrasenna" >
                        </textarea></td>
                    </tr>
                    <tr>
                        <td colspan="3" align="center">
                        <input type="submit" value="Enviar Correo" />

                        <input type="reset" value="Restablecer" />
                        <td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>