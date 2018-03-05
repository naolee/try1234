package notification;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;

public class EmailSend {

    public static void main(String args[]){
        try{
            String host ="smtp.gmail.com" ;
            String user = "toocheekymaxie@gmail.com";
            String pass = "imeem.com";
            String to = "nadiahfazlii@gmail.com";
            String from = "toocheekymaxie@gmail.com";
            String subject = "taik";
            String messageText = "<!DOCTYPE html>\n" +
"<html>\n" +
"<head>\n" +
"  <style>\n" +
"    table, th, td {\n" +
"      border: 1px solid #A9A9A9;\n" +
"      border-collapse: collapse;\n" +
"      text-align:left;\n" +
"    }\n" +
"    th{\n" +
"      width:35%;\n" +
"      height:35px;\n" +
"    }\n" +
"    img{\n" +
"    	vertical-align:middle;\n" +
"  		\n" +
"    }\n" +
"    #div1{\n" +
"    	text-align:center;\n" +
"        border: 2px solid #A9A9A9;\n" +
"    	border-radius: 10px;\n" +
"    }\n" +
"    p{\n" +
"    	line-height: 150%;\n" +
"    }\n" +
"  </style>\n" +
"</head>\n" +
"<body>\n" +
"\n" +
"  <div id=\"div1\" style=\"background-image: url(https://image.ibb.co/eGxrkm/header_2.jpg);text-align: center;border: 2px solid #A9A9A9;border-radius: 10px;\">\n" +
"    <img class=\"img-fluid style\" src=\"https://image.ibb.co/mS7kBR/Webp_net_resizeimage_1.png\" style=\"vertical-align: middle;\">\n" +
"    PROPOSAL DEFENSE MANAGEMENT SYSTEM </div>\n" +
"  \n" +
"  <h1>Hi, Maxie</h1>\n" +
"  <p style=\"line-height: 150%;\">This is to inform that your student, Nurul Nadiah Binti Mohd Fazli has successfully submitted their proposal on 17-Oct-2017 at 8.48pm. The following is the details of your student submission;</p>\n" +
"  <table style=\"width: 100%;border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">\n" +
"    <tr>\n" +
"	<th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Name</th>\n" +
"        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;Nurul Nadiah Binti Mohd Fazli</td>\n" +
"    </tr>\n" +
"    <tr>\n" +
"	<th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Matric ID</th>\n" +
"        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;CB14032</td>\n" +
"    </tr>\n" +
"    <tr>\n" +
"	<th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Project Title</th>\n" +
"        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;Proposal Defense Management System</td>\n" +
"    </tr>\n" +
"    <tr>\n" +
"        <th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Submission date</th>\n" +
"        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;17-Oct-2017</td>\n" +
"    </tr>\n" +
"    <tr>\n" +
"        <th style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;width: 35%;height: 35px;\">&nbsp;Submission time</th>\n" +
"        <td style=\"border: 1px solid #A9A9A9;border-collapse: collapse;text-align: left;\">&nbsp;9.00pm</td>\n" +
"    </tr>\n" +
"  </table>  \n" +
"</body></html>";
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject); msg.setSentDate(new Date());
            //msg.setText(messageText);
            msg.setContent(messageText,"text/html" );  
            //msg.

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message send successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }

    }
}
