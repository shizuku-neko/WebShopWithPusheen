package dao;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    // 管理员账户登录
    Integer LoginAdmin(@Param("aId") String var1, @Param("aPwd") String var2);
}
