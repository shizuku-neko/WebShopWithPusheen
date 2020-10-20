//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package tools;

import org.apache.commons.lang3.RandomStringUtils;
import service.AccountService;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import java.util.Date;
import java.util.Properties;

public class MailTo {
    @Resource
    AccountService accountService;

    public MailTo() {
    }

    private MimeMessage Mail(Session session, String ToUserEmail, String UName) {
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress("mailName@gmail.com", "Shizuku_neko", "UTF-8"));
            message.setRecipient(RecipientType.TO, new InternetAddress(ToUserEmail, UName, "UTF-8"));
            message.setSubject("邮箱验证", "UTF-8");
            message.setContent("请点击下方链接以验证您的邮箱,如果不是您本人注册,请忽略.", "text/html;charset=UTF-8");
            String verifyCode = RandomStringUtils.randomAlphanumeric(20);
            System.err.println(verifyCode);
            System.err.println(ToUserEmail);
//            this.accountService.InsertVerifyCode(verifyCode, ToUserEmail);
            message.setContent("http://localhost:8080/verify/verifyCode?" + verifyCode, "text/html;charset=UTF-8");
            message.setSentDate(new Date());
            message.saveChanges();
        } catch (Exception var6) {
            var6.printStackTrace();
        }

        return message;
    }

    public void Email(String ToUserEmail, String UName) {
        try {
            String myEmailAccount = "mailName@gmail.com";
            String myEmailPassword = "MailPwd";
            String myEmailSMTPHost = "smtp.gmail.com";
            Properties props = System.getProperties();
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.host", myEmailSMTPHost);
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("proxySet", "true");
            props.setProperty("socksProxyHost", "127.0.0.1");
            props.setProperty("socksProxyPort", "10808");
            Session session = Session.getInstance(props);
            session.setDebug(true);
            MimeMessage message = this.Mail(session, ToUserEmail, UName);
            Transport transport = session.getTransport();
            transport.connect(myEmailSMTPHost, myEmailAccount, myEmailPassword);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception var10) {
            var10.printStackTrace();
        }

    }
}
