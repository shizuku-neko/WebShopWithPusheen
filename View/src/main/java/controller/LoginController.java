//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisShardInfo;
import service.AccountService;
import tools.LoginMail;
import tools.RegMail;

import javax.annotation.Resource;
import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {
    private final String KEY_MAC = "HmacMD5";
    @Resource
    AccountService accountService;

    private Jedis jedis;

    private JedisShardInfo info = new JedisShardInfo("127.0.0.1", 6379);

    public LoginController() {
    }

    @RequestMapping({"loginPage"})
    public String loginPage(Integer gId) {
        return "loginPage/index";
    }

    @RequestMapping({"verify"})
    public String Verify(String verifyCode, String verifyEmail) {
        jedis = new Jedis(info);
        jedis.select(0);
        String verifyInRedis = jedis.get(verifyEmail);
        if (verifyCode.equals(verifyInRedis)) {
            jedis.del(verifyEmail);
            accountService.UpdateVerifyUser(verifyEmail);
            return "loginPage/configReg";
        } else {
            return "loginPage/configError";
        }
    }

    @RequestMapping({"loginVerify"})
    public String LoginVerify(String verifyCode, String verifyEmail, HttpSession session, HttpServletRequest request) {
        jedis = new Jedis(info);
        jedis.select(0);
        String verifyInRedis = jedis.get(verifyEmail);
        if (verifyCode.equals(verifyInRedis)) {
            jedis.del(verifyEmail);
            session.setAttribute("uEmail", verifyEmail);
            request.setAttribute("msg", "Successful login, redirecting");
            return "main/index";
        } else {
            request.setAttribute("msg", "Login failed, wrong email or password");
            return "loginPage/configError";
        }
    }

    @RequestMapping({"sendLoginMail"})
    public Object SendLoginMail(String verifyEmail) {
        LoginMail loginMail = new LoginMail();
        loginMail.EmailTo(verifyEmail);
        Map<Object, Object> data = new HashMap<>();
        data.put("msg", "邮件发送成功");
        return data;
    }

    @RequestMapping({"reg"})
    public String Reg(String RName, String REmail, String RPwd, HttpServletRequest request, HttpSession session) {
        int result = this.accountService.InsertRegUser(RName, REmail, RPwd);
        if (result != 0) {
            session.setAttribute("uEmail", REmail);
            RegMail regMail = new RegMail();
            regMail.EmailTo(REmail);
            request.setAttribute("msg", "Registration is successful, please confirm the email to complete the last step of registration");
            return "redirect:/index";
        } else {
            request.setAttribute("msg", "Error, please contact the webmaster");
            return "loginPage/index";
        }
    }

    @RequestMapping({"login"})
    public String loginIn(String LEmail, String LPwd, HttpServletRequest request, HttpSession session) {
        int result = this.accountService.SelectLoginUser(LEmail, LPwd);
        if (result != 0) {
            session.setAttribute("uEmail", LEmail);
            request.setAttribute("msg", "Successful login, redirecting");
            return "redirect:/index";
        } else {
            request.setAttribute("msg", "Login failed, wrong email or password");
            return "loginPage/index";
        }
    }

    private byte[] decryptBASE64(byte[] dest) {
        return dest == null ? null : Base64.decodeBase64(dest);
    }

    private byte[] encryptBASE64(byte[] origin) {
        return origin == null ? null : Base64.encodeBase64(origin);
    }

    private String initMacKey() throws NoSuchAlgorithmException {
        KeyGenerator keyGenerator = KeyGenerator.getInstance("HmacMD5");
        SecretKey secretKey = keyGenerator.generateKey();
        return new String(this.encryptBASE64(secretKey.getEncoded()));
    }

    private byte[] encryptHMAC(byte[] data, String key) throws NoSuchAlgorithmException, InvalidKeyException {
        SecretKey secretKey = new SecretKeySpec(this.decryptBASE64(key.getBytes()), "HmacMD5");
        Mac mac = Mac.getInstance(secretKey.getAlgorithm());
        mac.init(secretKey);
        return mac.doFinal(data);
    }
}
