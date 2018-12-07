/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import modelo.vo.Correo;
import modelo.vo.Usuario;

/**
 *
 * @author carmen
 */
public class EnvioCorreos {
    Correo c = new Correo();

    public boolean enviarCorreos(Usuario vo) {
        try {
            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.setProperty("mail.smtp.starttls.enable", "true");
            p.setProperty("mail.smtp.port", "587");
            p.setProperty("mail.smtp.user", "pluggerssi@gmail.com");
            p.setProperty("mail.smtp.auth", "true");

            Session s = Session.getDefaultInstance(p, null);
            BodyPart texto = new MimeBodyPart();
            texto.setText("<html><head><title>correo</title><meta charset=\"UTF-8\">"
                    + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"></head><body><header>"
                    + "<div class=\"container-fluid\" id=\"fondo\"><div class=\"row\"><div class=\"col-md-5 rectangulo2\" id=\"degrade2\">"
                    + "</div><div><center><div class=\"nombre\" id=\"nombre\"><label>PLUGGERS</label></div> </center><center>"
                    + "<div class=\" \"><img src=\"imagenes/LogoLinkers.PNG\" class=\"mx-auto d-block img-responsive\"></div>"
                    + "</center></div></div></div></header><form method=\"POST\"><center><div  class=\"header\"><label id=\"saludo\" for=\"saludo\" >Buen día:</label><br/><br/></div><div>"
                    + "<label id=\"clic\" for=\"clic\" >Gracias por elegir Pluggers.Haz clic sobre el link http://localhost:8080/Pluggers/vista/mensajeconfirmacion.jsp para acceder a tu cuenta</label>"
                    + "</div><div class=\"row\"><div id=\"mensaje\"><div class=\"footer\" ><label id=\"texto\">Incrementa la búsqueda de empleo efectiva.</label>"
                    + "<label id=\"contacto\">Contactanos: pluggerssi@gmail.com<br/>Linea telefonica: 9075648</label>"
                    + "<label id=\"firma\">Pluggers</label></div></div></div></center></form><style>#mensaje{background-color: #ED9C69;}</style></body></html>" );
            BodyPart adjunto = new MimeBodyPart();

            MimeMultipart m = new MimeMultipart();
            m.addBodyPart(texto);

            MimeMessage mensaje = new MimeMessage(s);
            mensaje.setFrom(new InternetAddress(vo.getCorreo()));
            mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(vo.getCorreo()));//("penacarmen999@gmail.com")
            mensaje.setSubject("Validacion Correo");
            mensaje.setContent(m,"text/html; charset=uth-8");

            Transport t = s.getTransport("smtp");
            t.connect("pluggerssi@gmail.com", "bolsadeempleo");
            t.sendMessage(mensaje, mensaje.getAllRecipients());
            t.close();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error" + e);
            return false;
        }

    }
}
