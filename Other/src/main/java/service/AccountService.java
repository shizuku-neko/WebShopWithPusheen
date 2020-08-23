//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package service;

import org.apache.ibatis.annotations.Param;

public interface AccountService {
    void InsertVerifyCode(String var1, String var2);

    int SelectConfigVerifyCode(String var1);

    int InsertRegUser(@Param("uName") String var1, @Param("uEmail") String var2, @Param("uPwd") String var3);

    Integer SelectLoginUser(@Param("uEmail") String var1, @Param("uPwd") String var2);
}
