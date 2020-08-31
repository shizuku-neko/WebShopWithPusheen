//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package dao;

import org.apache.ibatis.annotations.Param;
import pojo.Account;

public interface AccountMapper {
    int InsertRegUser(@Param("uName") String var1, @Param("uEmail") String var2, @Param("uPwd") String var3);

    Integer SelectLoginUser(@Param("uEmail") String var1, @Param("uPwd") String var2);

    Integer UpdateVerifyUser(@Param("uEmail") String var1);

    Integer InsertUserCreditCard(@Param("uEmail") String var1, @Param("uCreditCard") String var2);

    Integer InsertUserAddress(@Param("uEmail") String var1, @Param("uAddress") String var2);

    Account SelectSessionUser(@Param("uEmail") String var1);
}
