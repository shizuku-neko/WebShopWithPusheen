package tools;

import org.apache.commons.lang3.RandomStringUtils;
import service.AccountService;

import javax.annotation.Resource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MailTo2 {
    @Resource
    AccountService accountService;

    public void EmailTo(String uEmail) {

        final String username = "Shizukunekos@gmail.com";
        final String password = "zaq1056519523";

        Properties prop = System.getProperties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS
        //proxy
        prop.put("proxySet", "true");
        prop.put("socksProxyHost", "127.0.0.1");
        prop.put("socksProxyPort", "10808");

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(uEmail) /// uEmail
            );
//            message.setSubject("Testing Gmail TLS");
//            message.setText("Dear Mail Crawler,"
//                    + "\n\n Please do not spam my email!");
            message.setSubject("Verify Email");
            message.setContent("请点击下方链接以验证您的邮箱,如果不是您本人注册,请忽略.", "text/html;charset=UTF-8");
            String verifyCode = RandomStringUtils.randomAlphanumeric(20);
            // 存入redis缓存

            message.setContent("" +
                    "\n http://localhost:8080/verify/verifyCode?" + verifyCode, "text/html;charset=UTF-8");
            message.setSentDate(new Date());


            Transport.send(message);

            System.err.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}