//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package dao;

import org.apache.ibatis.annotations.Param;

public interface AccountMapper {
    int InsertRegUser(@Param("uName") String var1, @Param("uEmail") String var2, @Param("uPwd") String var3);

    Integer SelectLoginUser(@Param("uEmail") String var1, @Param("uPwd") String var2);
}
