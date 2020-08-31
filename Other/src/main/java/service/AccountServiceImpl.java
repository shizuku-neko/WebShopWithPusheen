//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package service;

import dao.AccountMapper;
import org.springframework.stereotype.Service;
import pojo.Account;

import javax.annotation.Resource;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
    @Resource
    AccountMapper accountMapper;

    public AccountServiceImpl() {
    }

    public int InsertRegUser(String uName, String uEmail, String uPwd) {
        return this.accountMapper.InsertRegUser(uName, uEmail, uPwd);
    }

    public Integer SelectLoginUser(String uEmail, String uPwd) {
        return this.accountMapper.SelectLoginUser(uEmail, uPwd);
    }

    @Override
    public Integer UpdateVerifyUser(String var1) {
        return this.accountMapper.UpdateVerifyUser(var1);
    }

    @Override
    public Integer InsertUserCreditCard(String var1, String var2) {
        return this.accountMapper.InsertUserCreditCard(var1, var2);
    }

    @Override
    public Integer InsertUserAddress(String var1, String var2) {
        return this.accountMapper.InsertUserAddress(var1, var2);
    }

    @Override
    public Account SelectSessionUser(String var1) {
        return this.accountMapper.SelectSessionUser(var1);
    }
}
