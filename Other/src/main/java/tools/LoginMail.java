package tools;

import org.apache.commons.lang3.RandomStringUtils;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisShardInfo;
import service.AccountService;

import javax.annotation.Resource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class LoginMail {
    @Resource
    AccountService accountService;

    private Jedis jedis;

    private JedisShardInfo info = new JedisShardInfo("127.0.0.1", 6379);

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
                new Authenticator() {
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
            message.setSubject("Verify Email");
            message.setContent("请点击下方链接以登录您的邮箱,如果不是您本人操作,请忽略.", "text/html;charset=UTF-8");
            String verifyCode = RandomStringUtils.randomAlphanumeric(20);

            // 存入redis缓存
            jedis = new Jedis(info);
            int time = 60 * 15;
            jedis.set(uEmail, verifyCode, "NX", "EX", time);
            System.err.println(jedis.get(uEmail) + "jedis");

            message.setContent("\n\n Please click below to activate your account and complete your sign up process." +
                    "\n\n http://localhost:8080/loginVerify?verifyCode=" + verifyCode + "&verifyEmail=" + uEmail +
                    "\n\n Hurry up! Your activation link expires in 15min!", "text/html;charset=UTF-8");

            // 12. 设置发件时间
            message.setSentDate(new Date());

            // 13. 保存上面的所有设置
            message.saveChanges();

            Transport.send(message);

            System.err.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
