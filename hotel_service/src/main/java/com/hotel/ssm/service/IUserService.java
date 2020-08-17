package com.hotel.ssm.service;

import com.hotel.ssm.domain.Role;
import com.hotel.ssm.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    //查询所有用户
    List<UserInfo> findAll() throws Exception;

    //保存用户
    void save(UserInfo userInfo) throws Exception;

    //根据id查询用户详情
    UserInfo findById(String id) throws Exception;

    //查询用户未有的角色
    List<Role> findOtherRoles(String userid) throws Exception;

    //给用户添加角色
    void addRoleToUser(String userId, String[] roleIds) throws Exception;
}
