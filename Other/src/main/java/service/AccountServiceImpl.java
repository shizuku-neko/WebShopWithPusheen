//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package service;

import dao.AccountMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Resource
    AccountMapper accountMapper;

    public AccountServiceImpl() {
    }

    public void InsertVerifyCode(String VerifyCode, String uEmail) {
        this.accountMapper.InsertVerifyCode(VerifyCode, uEmail);
    }

    public int SelectConfigVerifyCode(String VerifyCode) {
        return this.accountMapper.SelectConfigVerifyCode(VerifyCode);
    }

    public int InsertRegUser(String uName, String uEmail, String uPwd) {
        return this.accountMapper.InsertRegUser(uName, uEmail, uPwd);
    }

    public int SelectLoginUser(String uEmail, String uPwd) {
        return this.accountMapper.SelectLoginUser(uEmail, uPwd);
    }
}
