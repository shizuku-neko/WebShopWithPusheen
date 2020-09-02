//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Account;

public interface AccountMapper {
    // 新增用户/用户注册,默认账户需要邮箱验证码验证
    int InsertRegUser(@Param("uName") String var1, @Param("uEmail") String var2, @Param("uPwd") String var3);

    // 用户登录
    Integer SelectLoginUser(@Param("uEmail") String var1, @Param("uPwd") String var2);

    // 邮箱点击链接验证后,修改验证标识为已验证
    Integer UpdateVerifyUser(@Param("uEmail") String var1);

    // 新增用户信用卡/支付方式
    Integer InsertUserCreditCard(@Param("uEmail") String var1, @Param("uCreditCard") String var2);

    // 新增用户地址
    Integer InsertUserAddress(@Param("uEmail") String var1, @Param("uAddress") String var2);

    // ????
    Account SelectSessionUser(@Param("uEmail") String var1);
}
