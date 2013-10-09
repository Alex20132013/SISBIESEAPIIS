package jMail;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class Mail {
    private String to;
    private String from;
    private String smtpServ;
    private String contrasena;

    public Mail(String to, String from, String smtpServ, String contrasena) {
        this.to = to;
        this.from = from;
        this.smtpServ = smtpServ;
        this.contrasena = contrasena;
    }


    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }
  
    
    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }


    public String getSmtpServ() {
        return smtpServ;
    }
    public void setSmtpServ(String smtpServ) {
        this.smtpServ = smtpServ;
    }
    
    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
public int sendMail(){
        try
        {
            Properties props = System.getProperties();
              // -- Attaching to default Session, or we could start a new one --
              props.put("mail.transport.protocol", "smtp" );
              props.put("mail.smtp.starttls.enable","true" );
              props.put("mail.smtp.host",smtpServ);
              props.put("mail.smtp.auth", "true" );
              Authenticator auth = new SMTPAuthenticator();
              Session session = Session.getInstance(props, auth);
              // -- Create a new message --
              Message msg = new MimeMessage(session);
              // -- Set the FROM and TO fields --
              msg.setFrom(new InternetAddress(from));
              msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
              msg.setSubject("Registro Biblioteca Especializada EAPIIS");
              msg.setText("Gracias por ser parte de la biblioteca especializa EAPIIS, para poder completar su"
                      + "registro usted deberá de acercarse a la Biblioteca Especializada para que sea habilitad@ Mediante su Autenticacon de Huella Digital"
                      + "con los responsables la cual le permitirá el uso de los libros"
                      + "SUS DATOS SON: "
                      + ""
                      + "\n CORREO:'"+to+"'"
                      + "\n CONTRASEÑA:'"+contrasena+"'"
                      + ""
                      + "\nGracias Equipo de Desarrolladores: Alejandro & Rolando"
                      + "<a href='https://www.facebook.com/groups/102715203137986/'>EAPIIS-2013</a> "
                      + "");
              // -- Set some other header information --
              msg.setHeader("MyMail", "Mr. XYZ" );
              msg.setSentDate(new Date());
              // -- Send the message --
              Transport.send(msg);
              System.out.println("Message sent to"+to+" OK." );
              return 0;
        }
        catch (Exception ex)
        {
          ex.printStackTrace();
          System.out.println("Exception "+ex);
          return -1;
        }
  }

// Also include an inner class that is used for authentication purposes

private class SMTPAuthenticator extends javax.mail.Authenticator 
{
        @Override
  public PasswordAuthentication getPasswordAuthentication() 
        {
         String username =  "biblioteca@portaltutoriales.com";           // specify your email id here (sender's email id)
         String password = "biblio2030";                             // specify your password here
        return new PasswordAuthentication(username, password);
     }
  }

}

