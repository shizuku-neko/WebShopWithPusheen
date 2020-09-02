package service;

import org.apache.ibatis.annotations.Param;

public interface AdminService {
    Integer LoginAdmin(@Param("aId") String var1, @Param("aPwd") String var2);
}
