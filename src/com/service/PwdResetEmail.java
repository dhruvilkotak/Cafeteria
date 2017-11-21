package com.service;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;
public class PwdResetEmail {

	public PwdResetEmail(String MailID, String security_code){
  //  public static void main(String args[]){
        try{
            String host ="smtp.gmail.com" ;
            String user = "sunycafeteria@gmail.com";
            String pass = "Gokul123";
            String to = MailID;
            String from = "donotreply@cafeteria.com";
            String subject = "Password Reset";
            String messageText = "Please enter the security code below to reset password. Security Code : "+security_code+" ";
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
            msg.setText(messageText);

           Transport transport=mailSession.getTransport("smtp");
           transport.connect(host, user, pass);
           transport.sendMessage(msg, msg.getAllRecipients());
           transport.close();
           System.out.println("message sent successfully");
        }catch(Exception ex)
        {
            System.out.println(ex);
        }

    }
	//}
}
