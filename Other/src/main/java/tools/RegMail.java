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

public class RegMail {
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
            jedis = new Jedis(info);
            int time = 60 * 60 * 24;
            jedis.set(uEmail, verifyCode, "NX", "EX", time);
            System.err.println(jedis.get(uEmail) + "jedis");

//            // 5. 创建图片“节点”
//            MimeBodyPart image = new MimeBodyPart();
//            DataHandler dh = new DataHandler(new FileDataSource("D:\\java_project\\Other\\WebShop\\View\\src\\main\\webapp\\static\\image\\partner2.gif")); // 读取本地文件
//            image.setDataHandler(dh);		            // 将图片数据添加到“节点”
//            image.setContentID("image_fairy_tail");	    // 为“节点”设置一个唯一编号（在文本“节点”将引用该ID）
//
//            // 6. 创建文本“节点”
//            MimeBodyPart text = new MimeBodyPart();
//            //    这里添加图片的方式是将整个图片包含到邮件内容中, 实际上也可以以 http 链接的形式添加网络图片
//            text.setContent("<br/><img src='cid:image_fairy_tail'/>", "text/html;charset=UTF-8");
//
//            // 7. （文本+图片）设置 文本 和 图片 “节点”的关系（将 文本 和 图片 “节点”合成一个混合“节点”）
//            MimeMultipart mm_text_image = new MimeMultipart();
//            mm_text_image.addBodyPart(text);
//            mm_text_image.addBodyPart(image);
//            mm_text_image.setSubType("related");	// 关联关系
//
//            message.setContent(mm_text_image);

            message.setContent("\n\n Please click below to activate your account and complete your sign up process." +
                    "\n\n http://localhost:8080/verify?verifyCode=" + verifyCode + "&verifyEmail=" + uEmail +
                    "\n\n Hurry up! Your activation link expires in 72 hours!", "text/html;charset=UTF-8");

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
