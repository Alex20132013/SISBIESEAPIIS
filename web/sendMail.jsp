<%@page import="jMail.Mail"%>
<%@page import="javax.tools.JavaFileManager.Location"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Mail</title>
    </head>
    <body>
        <jsp:useBean id="mail" scope="session" class="jMail.Mail"/>
        <jsp:setProperty name="mail" property="to" param="correo_user" />
        <jsp:setProperty name="mail" property="from"  value="smaple@gmail.com" />
        <jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />
        <jsp:setProperty name="mail" property="contrasena" param="contrasenna" />

        <%
            String to = mail.getTo();

            int result;
            result = mail.sendMail();
            if (result == 0) {
                out.println(" Su correo se Envio Correctamente a:" + to);

            } else {
                out.println(" No se  Pudo Enviar a:" + to);
            }

            
            Mail mail=new Mail(to, from, smtpServ, contrasena);
            mail.sendMail();
          
        %>
    
   
</body>
</html>