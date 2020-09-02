package dao;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    Integer LoginAdmin(@Param("aId") String var1, @Param("aPwd") String var2);
}
