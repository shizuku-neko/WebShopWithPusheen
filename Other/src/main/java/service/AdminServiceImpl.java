package service;

import dao.AdminMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    AdminMapper adminMapper;

    @Override
    public Integer LoginAdmin(String var1, String var2) {
        return adminMapper.LoginAdmin(var1, var2);
    }
}
