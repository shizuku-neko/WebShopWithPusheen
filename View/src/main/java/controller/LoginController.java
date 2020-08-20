//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package controller;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.Account;
import service.AccountService;

import javax.annotation.Resource;
import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

@Controller
public class LoginController {
    private final String KEY_MAC = "HmacMD5";
    @Resource
    AccountService accountService;

    public LoginController() {
    }

    @RequestMapping({"loginPage"})
    public String loginPage() {
        return "loginPage/index";
    }

    @RequestMapping({"verify"})
    public String Verify(String verifyCode) {
        int num = this.accountService.SelectConfigVerifyCode(verifyCode);
        return num != 0 ? "loginPage/configReg" : "loginPage/configError";
    }

    @RequestMapping({"reg"})
    public String Reg(Account account, HttpServletRequest request) throws NoSuchAlgorithmException, InvalidKeyException {
        String uName = account.getuName();
        String uEmail = account.getuEmail();
        String uPwd = account.getuPwd();
        int result = this.accountService.InsertRegUser(uName, uEmail, uPwd);
        if (result != 0) {
            request.setAttribute("msg", "Registration is successful, please confirm the email to complete the last step of registration");
            return "index";
        } else {
            request.setAttribute("msg", "Error, please contact the webmaster");
            return "loginPage/index";
        }
    }

    @RequestMapping({"login"})
    public String loginIn(Account account, HttpServletRequest request) {
        String uEmail = account.getuEmail();
        String uPwd = account.getuPwd();
        int result = this.accountService.SelectLoginUser(uEmail, uPwd);
        if (result != 0) {
            request.setAttribute("msg", "Successful login, redirecting");
            return "index";
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
